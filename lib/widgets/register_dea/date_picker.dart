import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:local_dea_app/widgets/field.dart';

class CustomHourPicker extends StatefulWidget {
  final String label;
  final Function(TimeOfDay) onSelectedHour;

  const CustomHourPicker({
    required this.label,
    required this.onSelectedHour,
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

    selectedHour = TimeOfDay.now();

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
    if (hourPicked != null && hourPicked != selectedHour) {
      widget.onSelectedHour(hourPicked);
      selectedHour = hourPicked;
      dateController.value = TextEditingValue(
        text: '${selectedHour.hour}:${selectedHour.minute}',
      );
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: _selectDate,
        child: AbsorbPointer(
          child: CustomFormField(
            label: widget.label,
            icon: FontAwesomeIcons.clock,
            controller: dateController,
          ),
        ),
      );
}
