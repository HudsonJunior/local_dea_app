import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/domain/models/emergency_service_model.dart';
import 'package:local_dea_app/domain/models/emergency_service_type.dart';
import 'package:local_dea_app/view/blocs/routing/routing.dart';
import 'package:local_dea_app/view/widgets/map/info_window_label.dart';
import 'package:local_dea_app/view/widgets/search_dea_button.dart';

class EmergencyInfoWindow extends StatelessWidget {
  const EmergencyInfoWindow({
    Key? key,
    required this.model,
    required this.onCalculateRoute,
  }) : super(key: key);

  final EmergencyServiceModel model;
  final VoidCallback onCalculateRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              model.categoria.icon,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(height: 4.0),
          Center(
            child: Text(
              model.nome,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          const Divider(color: Colors.white, thickness: 0.5),
          const SizedBox(height: 16.0),
          InfoWindowLabel(
            icon: Icons.location_pin,
            label: '${model.rua}, ${model.numero ?? 'SN'}, ${model.bairro}',
          ),
          const SizedBox(height: 18),
          if (model.numContato?.isNotEmpty ?? false) ...[
            InfoWindowLabel(
              icon: Icons.contact_phone,
              label: model.numContato ?? '',
              showButton: true,
            ),
            const SizedBox(height: 18),
          ],
          if (model.descricao?.isNotEmpty ?? false) ...[
            InfoWindowLabel(
              icon: Icons.description_rounded,
              label: model.descricao ?? '',
            ),
            const SizedBox(height: 18),
          ],
          if ((model.horarioAbertura?.isNotEmpty ?? false) &&
              (model.horarioFechamento?.isNotEmpty ?? false))
            InfoWindowLabel(
              icon: FontAwesomeIcons.clock,
              label: '${model.horarioAbertura} até ${model.horarioFechamento}',
            ),
          if (model.isPrivado) ...[
            const SizedBox(height: 24.0),
            const InfoWindowLabel(
              icon: Icons.warning,
              label: 'Este é um lugar privado!',
              iconColor: Palette.secondary,
            ),
          ],
          const Spacer(),
          BlocBuilder<RoutingCubit, RoutingState>(
            builder: (context, state) {
              return LocalDeaButton(
                label: 'CALCULAR ROTA',
                onPress: onCalculateRoute,
                isLoading: state is LoadingRouteState,
                icon: Icons.search_outlined,
              );
            },
          ),
        ],
      ),
    );
  }
}
