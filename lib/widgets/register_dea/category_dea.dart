import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/models/emergency_service_type.dart';

class CategoryDeaSelector extends StatelessWidget {
  final EmergencyServiceType selected;
  final Function(EmergencyServiceType?) onSelected;

  const CategoryDeaSelector({
    Key? key,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Categoria do serviço',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<EmergencyServiceType>(
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            underline: const SizedBox.shrink(),
            iconEnabledColor: Palette.primary,
            isExpanded: true,
            items: EmergencyServiceType.values
                .map(
                  (type) => DropdownMenuItem<EmergencyServiceType>(
                    value: type,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          type.icon,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          type.stringValue,
                          style: const TextStyle(
                            color: Palette.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            onChanged: onSelected,
            value: selected,
          ),
        )
      ],
    );
  }
}
