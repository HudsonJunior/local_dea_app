import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_dea_app/domain/usecase/auth_usecase.dart';
import 'package:local_dea_app/domain/usecase/discover_place_usecase.dart';
import 'package:local_dea_app/domain/usecase/register_dea_usecase.dart';
import 'package:local_dea_app/domain/usecase/routing_usecase.dart';
import 'package:local_dea_app/infra/datasources/auth/auth_remote_datasource.dart';
import 'package:local_dea_app/infra/datasources/dea_remote_datasource.dart';
import 'package:local_dea_app/infra/datasources/discover_place_remote_datasource.dart';
import 'package:local_dea_app/infra/datasources/routing_remote_datasource.dart';
import 'package:local_dea_app/infra/repositories/auth_repository.dart';
import 'package:local_dea_app/infra/repositories/discover_place_repository.dart';
import 'package:local_dea_app/infra/repositories/register_dea_repository.dart';
import 'package:local_dea_app/infra/repositories/routing_repository.dart';
import 'package:local_dea_app/infra/resources/geocode_api.dart';
import 'package:local_dea_app/infra/resources/matrix_api.dart';
import 'package:local_dea_app/infra/resources/route_api.dart';
import 'package:local_dea_app/infra/resources/siga_api.dart';
import 'package:local_dea_app/view/blocs/auth/auth.dart';
import 'package:local_dea_app/view/blocs/map/map.dart';
import 'package:local_dea_app/view/blocs/register_dea/register_dea.dart';
import 'package:local_dea_app/view/blocs/route_method_cubit.dart';
import 'package:local_dea_app/view/blocs/routing/routing.dart';
import 'package:local_dea_app/view/screens/map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (error, stack) {
      FirebaseCrashlytics.instance.log(error.toString());
      FirebaseCrashlytics.instance.recordError(error, stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RouteMethodCubit()),
        BlocProvider<MapCubit>(
          create: (_) => MapCubit(),
        ),
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (_) => AuthBloc(
            AuthLoginUseCase(
              AuthLoginRepository(
                AuthLoginRemoteDataSource(SigaApi.instance),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => RoutingCubit(
            RoutingUseCase(
              RoutingRepository(
                routingRemoteDatasource: RoutingRemoteDatasource(
                  routingApi: RouteApi.instance,
                  matrixApi: MatrixApi.instance,
                ),
              ),
            ),
          ),
        ),
        BlocProvider<RegisterDeaCubit>(
          create: (_) => RegisterDeaCubit(
            DiscoverPlaceUsecase(
              DiscoverPlaceRepository(
                discoverPlaceRemoteDataSource:
                    DiscoverPlaceRemoteDataSource(api: GeocodeApi.instance),
              ),
            ),
            RegisterDeaUseCase(
              RegisterDeaRepository(
                registerDeaRemoteDatasource: DeaRemoteDatasource(
                  api: SigaApi.instance,
                ),
              ),
            ),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Local DEA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MapScreen(),
      ),
    );
  }
}
