import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_dea_app/blocs/map/map.dart';
import 'package:local_dea_app/blocs/register_dea/register_dea.dart';
import 'package:local_dea_app/datasources/discover_place_remote_datasource.dart';
import 'package:local_dea_app/datasources/register_dea_remote_datasource.dart';
import 'package:local_dea_app/repositories/discover_place_repository.dart';
import 'package:local_dea_app/repositories/register_dea_repository.dart';
import 'package:local_dea_app/resources/geocode_api.dart';
import 'package:local_dea_app/resources/siga_api.dart';
import 'package:local_dea_app/screens/map.dart';
import 'package:local_dea_app/usecase/discover_place_usecase.dart';
import 'package:local_dea_app/usecase/register_dea_usecase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapCubit>(
          create: (_) => MapCubit(),
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
                registerDeaRemoteDatasource: RegisterDeaRemoteDatasource(
                  api: SigaApi.instance,
                ),
              ),
            ),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MapScreen(),
      ),
    );
  }
}
