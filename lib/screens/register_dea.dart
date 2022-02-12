import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/models/emergency_service_type.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';
import 'package:local_dea_app/widgets/field.dart';
import 'package:local_dea_app/widgets/register_dea/category_dea.dart';
import 'package:local_dea_app/widgets/register_dea/hour_range.dart';
import 'package:local_dea_app/widgets/register_dea/image_picker.dart';
import 'package:local_dea_app/widgets/register_dea/private_service_checkbox.dart';
import 'package:local_dea_app/widgets/register_dea/register_button.dart';

class RegisterDeaScreen extends StatefulWidget {
  const RegisterDeaScreen({Key? key}) : super(key: key);

  @override
  _RegisterDeaScreenState createState() => _RegisterDeaScreenState();
}

class _RegisterDeaScreenState extends State<RegisterDeaScreen> {
  EmergencyServiceType selectedCategoryDea = EmergencyServiceType.dea;
  bool _isChecked = false;

  void _onSelectedDeaCategory(EmergencyServiceType? type) {
    setState(() {
      selectedCategoryDea = type ?? EmergencyServiceType.dea;
    });
  }

  void _onCheckedCheckbox(bool? isChecked) {
    setState(() {
      _isChecked = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.primary,
        title: const AppBarContent(
          title: 'Cadastrar Serviço',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 18.0,
        ),
        child: Form(
          child: ListView(
            children: [
              CustomFormField(
                label: 'Nome do serviço',
                icon: Icons.medical_services,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16.0),
              CustomFormField(
                label: 'Endereço',
                icon: Icons.location_pin,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      label: 'Número',
                      icon: Icons.house,
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomFormField(
                      label: 'Complemento',
                      icon: Icons.article,
                      controller: TextEditingController(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              CustomFormField(
                keyboardType: TextInputType.phone,
                label: 'Telefone de contato',
                icon: Icons.contact_phone,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16.0),
              CustomFormField(
                label: 'Descrição',
                icon: Icons.description_rounded,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16.0),
              const HourRangeWidget(),
              const SizedBox(height: 16.0),
              CategoryDeaSelector(
                selected: selectedCategoryDea,
                onSelected: _onSelectedDeaCategory,
              ),
              const SizedBox(height: 16.0),
              PrivateServiceCheckbox(
                isChecked: _isChecked,
                onChecked: _onCheckedCheckbox,
              ),
              const SizedBox(height: 16.0),
              const CustomImagePicker(),
              const SizedBox(height: 32.0),
              const RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
