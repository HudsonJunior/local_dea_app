import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_dea_app/blocs/register_dea/register_dea.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/models/emergency_service_type.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';
import 'package:local_dea_app/widgets/custom_snackbar.dart';
import 'package:local_dea_app/widgets/field.dart';
import 'package:local_dea_app/widgets/register_dea/category_dea.dart';
import 'package:local_dea_app/widgets/register_dea/hour_range.dart';
import 'package:local_dea_app/widgets/register_dea/image_picker.dart';
import 'package:local_dea_app/widgets/register_dea/private_service_checkbox.dart';
import 'package:local_dea_app/widgets/register_dea/register_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterDeaScreen extends StatefulWidget {
  const RegisterDeaScreen({Key? key}) : super(key: key);

  @override
  _RegisterDeaScreenState createState() => _RegisterDeaScreenState();
}

class _RegisterDeaScreenState extends State<RegisterDeaScreen> {
  late final RegisterDeaCubit registerDeaCubit;
  late final TextEditingController nameController;
  late final TextEditingController streetController;
  late final TextEditingController numberController;
  late final TextEditingController complementController;
  late final TextEditingController contactNumberController;
  late final TextEditingController descriptionController;

  EmergencyServiceType selectedCategoryDea = EmergencyServiceType.dea;
  bool _isPrivateServiceChecked = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TimeOfDay? selectedOpenHour;
  TimeOfDay? selectedEndHour;

  void _onSelectOpenHour(TimeOfDay? selectedHour) {
    setState(() {
      selectedOpenHour = selectedHour;
    });
  }

  void _onSelectEndHour(TimeOfDay? selectedHour) {
    setState(() {
      selectedEndHour = selectedHour;
    });
  }

  @override
  void initState() {
    super.initState();

    registerDeaCubit = BlocProvider.of<RegisterDeaCubit>(context);
    nameController = TextEditingController();
    streetController = TextEditingController();
    numberController = TextEditingController();
    complementController = TextEditingController();
    contactNumberController = TextEditingController();
    descriptionController = TextEditingController();
  }

  void _onSelectedDeaCategory(EmergencyServiceType? type) {
    setState(() {
      selectedCategoryDea = type ?? EmergencyServiceType.dea;
    });
  }

  void _onCheckedPrivateService(bool? isChecked) {
    setState(() {
      _isPrivateServiceChecked = isChecked ?? false;
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
      body: BlocListener<RegisterDeaCubit, RegisterDeaState>(
        listenWhen: (_, state) => state is! RegisterDeaLoadingState,
        listener: (context, state) {
          if (state is RegisterDeaSuccessState) {
            CustomSnackBar.show(context, 'Serviço criado com sucesso!');
            return Navigator.of(context).pop();
          }
          if (state is RegisterDeaFailState) {
            CustomSnackBar.show(
              context,
              'Não foi possível criar o serviço!',
              success: false,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 18.0,
          ),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                CustomFormField(
                  label: 'Nome do serviço',
                  icon: Icons.medical_services,
                  controller: nameController,
                ),
                const SizedBox(height: 16.0),
                CustomFormField(
                  label: 'Endereço',
                  icon: Icons.location_pin,
                  controller: streetController,
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        label: 'Número',
                        icon: Icons.house,
                        keyboardType: TextInputType.number,
                        controller: numberController,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: CustomFormField(
                        label: 'Bairro',
                        icon: Icons.article,
                        isRequired: false,
                        controller: complementController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                CustomFormField(
                  keyboardType: TextInputType.phone,
                  label: 'Telefone de contato',
                  isRequired: false,
                  icon: Icons.contact_phone,
                  controller: contactNumberController,
                  formatters: [
                    MaskTextInputFormatter(
                      mask: '(##) # ####-####',
                      type: MaskAutoCompletionType.lazy,
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                CustomFormField(
                  label: 'Descrição',
                  icon: Icons.description_rounded,
                  isRequired: false,
                  controller: descriptionController,
                ),
                const SizedBox(height: 16.0),
                HourRangeWidget(
                  onSelectEndHour: _onSelectEndHour,
                  onSelectOpenHour: _onSelectOpenHour,
                  openHour: selectedOpenHour,
                  endHour: selectedEndHour,
                ),
                const SizedBox(height: 16.0),
                CategoryDeaSelector(
                  selected: selectedCategoryDea,
                  onSelected: _onSelectedDeaCategory,
                ),
                const SizedBox(height: 16.0),
                PrivateServiceCheckbox(
                  isChecked: _isPrivateServiceChecked,
                  onChecked: _onCheckedPrivateService,
                ),
                const SizedBox(height: 16.0),
                const CustomImagePicker(),
                const SizedBox(height: 32.0),
                BlocBuilder<RegisterDeaCubit, RegisterDeaState>(
                    builder: (context, state) {
                  return RegisterButton(
                    isLoading: state is RegisterDeaLoadingState,
                    onRegisterDea: () {
                      if (formKey.currentState?.validate() ?? false) {
                        registerDeaCubit.registerDea(
                          street: streetController.text,
                          houseNumber: numberController.text,
                          privateService: _isPrivateServiceChecked,
                          serviceName: nameController.text,
                          serviceType: selectedCategoryDea,
                          openHour: selectedOpenHour?.format(context),
                          endHour: selectedEndHour?.format(context),
                          description: descriptionController.text,
                          contactNumber: contactNumberController.text,
                          complement: complementController.text,
                        );
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
