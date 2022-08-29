import 'package:flutter/material.dart';
import 'package:local_dea_app/domain/models/emergency_service_type.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Categoria do serviço',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: DropdownButton<EmergencyServiceType>(
              dropdownColor: Colors.white,
              focusColor: Colors.white,
              iconEnabledColor: Colors.black87,
              underline: const SizedBox.shrink(),
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
                            filterQuality: FilterQuality.high,
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            type.stringValue,
                            style: const TextStyle(
                              color: Colors.black87,
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
          ),
          const Divider(color: Colors.black87)
        ],
      ),
    );
  }
}
