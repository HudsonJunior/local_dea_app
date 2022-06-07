import 'package:flutter/material.dart';
import 'package:local_dea_app/view/widgets/dea_guide/text_step_guide.dart';

class GuideStep2 extends StatelessWidget {
  const GuideStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '2º LIGUE PARA O 192 OU 193',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 24),
        const TextStepGuide(
          title: 'Solicite um Desfibrilador Externo Automático (DEA).',
        ),
        const SizedBox(height: 12),
        Expanded(child: Image.asset('assets/step2.png')),
      ],
    );
  }
}
