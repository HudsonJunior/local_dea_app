import 'package:flutter/material.dart';
import 'package:local_dea_app/widgets/dea_guide/text_step_guide_rich.dart';

class GuideStep3 extends StatelessWidget {
  const GuideStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3° COMECE A RESSUSCITAÇÃO CARDIOPULMONAR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 24),
        const TextStepGuideRich(
          title: TextSpan(
            text: 'Comprima o tórax',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.redAccent,
            ),
            children: [
              TextSpan(
                style: TextStyle(color: Colors.black),
                text: ' com FORÇA e RAPIDEZ. Sempre com os braços estendidos.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const TextStepGuideRich(
          title: TextSpan(
            text: 'Mínimo de',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            children: [
              TextSpan(
                style: TextStyle(color: Colors.redAccent),
                text: ' 100 compressões',
              ),
              TextSpan(
                text: ' por minuto, a uma profundidade de 5 cm.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(child: Image.asset('assets/step3.png')),
      ],
    );
  }
}
