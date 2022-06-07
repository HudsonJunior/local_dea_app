import 'package:flutter/material.dart';
import 'package:local_dea_app/view/widgets/register_dea/date_picker.dart';

class HourRangeWidget extends StatelessWidget {
  const HourRangeWidget({
    Key? key,
    required this.onSelectOpenHour,
    required this.onSelectEndHour,
    this.openHour,
    this.endHour,
  }) : super(key: key);

  final ValueSetter<TimeOfDay> onSelectOpenHour;
  final ValueSetter<TimeOfDay> onSelectEndHour;
  final TimeOfDay? openHour;
  final TimeOfDay? endHour;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomHourPicker(
            label: 'Abertura',
            onSelectedHour: onSelectOpenHour,
            selectedHour: openHour,
            referenceDate: endHour,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: CustomHourPicker(
            label: 'Fechamento',
            onSelectedHour: onSelectEndHour,
            selectedHour: endHour,
            isEndDate: true,
            referenceDate: openHour,
          ),
        ),
      ],
    );
  }
}
