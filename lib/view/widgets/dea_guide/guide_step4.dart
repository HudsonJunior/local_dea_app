import 'package:flutter/material.dart';
import 'package:local_dea_app/view/widgets/dea_guide/text_step_guide_rich.dart';

class GuideStep4 extends StatelessWidget {
  const GuideStep4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4° DESFIBRILAR COM O DEA',
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
            text: 'Posicione as pás do ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            children: [
              TextSpan(
                style: TextStyle(color: Colors.redAccent),
                text: 'desfibrilador no tórax e aplique o choque',
              ),
              TextSpan(
                text: ', se indicado pelo aparelho.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const TextStepGuideRich(
          title: TextSpan(
            text: 'Após cada choque, ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            children: [
              TextSpan(
                style: TextStyle(color: Colors.redAccent),
                text: 'reinicie as compressões torácicas ',
              ),
              TextSpan(
                text: 'até a chegada dos socorristas profissionais.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(child: Image.asset('assets/step4.png')),
      ],
    );
  }
}
