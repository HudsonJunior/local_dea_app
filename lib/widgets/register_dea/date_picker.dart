import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:local_dea_app/widgets/field.dart';

class CustomHourPicker extends StatefulWidget {
  final String label;
  final Function(TimeOfDay) onSelectedHour;
  final TimeOfDay? selectedHour;
  final bool isEndDate;
  final TimeOfDay? referenceDate;

  const CustomHourPicker({
    required this.label,
    required this.onSelectedHour,
    this.selectedHour,
    this.isEndDate = false,
    this.referenceDate,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomHourPicker> {
  late TextEditingController dateController;
  late TimeOfDay selectedHour;

  @override
  void initState() {
    super.initState();

    selectedHour = widget.selectedHour ?? TimeOfDay.now();

    dateController = TextEditingController(
      text: '',
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    FocusScope.of(context).unfocus();
    final hourPicked = await showTimePicker(
      context: context,
      initialTime: selectedHour,
    );
    if (hourPicked != null) {
      widget.onSelectedHour(hourPicked);
      selectedHour = hourPicked;
      dateController.value = TextEditingValue(
        text: selectedHour.format(context),
      );
    }
  }

  String? validInitialDate() {
    if (widget.referenceDate != null) {
      if (widget.referenceDate!.toDouble! < selectedHour.toDouble!) {
        return 'Horário inicial deve ser maior que horário final!';
      }
    }
    return null;
  }

  String? validEndDate() {
    if (widget.referenceDate != null) {
      if (widget.referenceDate!.toDouble! > selectedHour.toDouble!) {
        return 'Horário final deve ser maior que horário inicial!';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: _selectDate,
        child: AbsorbPointer(
          child: CustomFormField(
            label: widget.label,
            icon: FontAwesomeIcons.clock,
            controller: dateController,
            isRequired: false,
            validator: widget.isEndDate ? validEndDate : validInitialDate,
          ),
        ),
      );
}

extension TimeOfDayExt on TimeOfDay? {
  double? get toDouble =>
      this != null ? this!.hour + this!.minute / 60.0 : null;
}
