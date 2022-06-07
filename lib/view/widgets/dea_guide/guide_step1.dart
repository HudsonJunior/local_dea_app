import 'package:flutter/material.dart';
import 'package:local_dea_app/view/widgets/dea_guide/text_step_guide.dart';

class GuideStep1 extends StatelessWidget {
  const GuideStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1º - RECONHEÇA A PCR',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 24),
        const TextStepGuide(title: 'Toque e chame a pessoa.'),
        const SizedBox(height: 12),
        const TextStepGuide(title: 'Veja se a mesma responde.'),
        const SizedBox(height: 12),
        const TextStepGuide(title: 'Verifique se há movimento de respiração.'),
        Expanded(child: Image.asset('assets/step1.png')),
      ],
    );
  }
}
