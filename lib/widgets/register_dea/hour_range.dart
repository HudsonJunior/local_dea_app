import 'package:flutter/material.dart';
import 'package:local_dea_app/widgets/register_dea/date_picker.dart';

class HourRangeWidget extends StatelessWidget {
  const HourRangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomHourPicker(
            label: 'Abertura',
            onSelectedHour: (a) {},
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: CustomHourPicker(
            label: 'Fechamento',
            onSelectedHour: (a) {},
          ),
        ),
      ],
    );
  }
}
