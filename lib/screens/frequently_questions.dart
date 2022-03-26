import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';
import 'package:local_dea_app/widgets/question.dart';

class FrequentlyQuestionsScreen extends StatefulWidget {
  const FrequentlyQuestionsScreen({Key? key}) : super(key: key);

  @override
  _FrequentlyQuestionsScreenState createState() =>
      _FrequentlyQuestionsScreenState();
}

const questions = [
  {
    "O que é o DEA?":
        "O DEA é um dispositivo que pode salvar uma pessoa em Parada Cardiorrespiratória (PCR), pois analisa automaticamente os ritmos cardíacos e aconselha o operador a aplicar um choque se o coração estiver em um ritmo cardíaco fatal. O DEA é projetado para uso por pessoas sem treinamento (leigos), é seguro e não pode machucar a vítima.",
  },
  {
    "O que é PCR?":
        "A PCR (Parada Cardiorrespiratória) é uma emergência com risco de vida que ocorre quando o coração para de bater de repente. Atinge pessoas de todas as idades. Quando a PCR acontece, a pessoa colapsa, desmaia e não responde nem respira normalmente (pode ofegar ou tremer). A PCR leva à morte em minutos se a pessoa não receber ajuda imediatamente. A sobrevivência depende das pessoas próximas ligarem para o 192 ou 193, iniciarem a RCP e usarem um DEA (se disponível) o mais rápido possível."
  },
  {
    "O que causa a PCR?":
        "A PCR pode resultar de causas cardíacas (anormalidades do músculo cardíaco ou do sistema elétrico do coração), causas externas (afogamento, trauma, asfixia, eletrocussão, overdose de drogas, pancadas no peito) e outras causas médicas, como inflamação do músculo cardíaco devido à infecção. A maioria das PCRs é causada por um ritmo cardíaco anormal (arritmia). A arritmia com risco de vida mais comum é a fibrilação ventricular, que é um disparo errôneo e desorganizado de impulsos dos ventrículos (as câmaras inferiores do coração). Quando isso ocorre, o coração é incapaz de bombear sangue e a morte ocorre em poucos minutos se não for tratada. Ataques cardíacos também podem levar à PCR."
  },
  {
    "O que é RCP?":
        "A RCP, ou ressuscitação cardiopulmonar, é uma manobra em que se empurra o centro do tórax (entre os mamilos) com força e rapidez (100-120 bombeamentos por minuto) para fazer o coração circular o sangue oxigenado já existente no corpo para o cérebro e outros órgãos. A RCP pode salvar uma pessoa em Parada Cardiorrespiratória."
  },
  {
    "Como reconhecer uma PCR?":
        "Em geral, o primeiro sinal é a perda de consciência (desmaio), a pessoa entra em colapso e não responde ou respira normalmente. A pessoa pode ofegar ou tremer como se estivesse tendo uma convulsão."
  },
  {
    "PCR é o mesmo que infarto?":
        "Não. A PCR é um problema elétrico no coração, a pessoa não está acordada, seu coração não está batendo e ela não consegue se comunicar. Os sintomas da PCR incluem perda súbita de capacidade de resposta e ausência de respiração normal. Já o infarto é um problema circulatório no coração. A pessoa está acordada, seu coração está batendo e consegue se comunicar. Os sintomas de infarto podem incluir desconforto no peito; dor ou desconforto em um ou ambos os braços, costas, pescoço, mandíbula ou estômago; falta de ar; sudorese; náusea; e tontura. Infartos podem levar à PCR, mas também existem muitas outras causas."
  },
  {
    "Como prevenir a PCR?":
        "Um estilo de vida saudável (praticar exercícios regularmente, comer alimentos saudáveis, manter um peso saudável e evitar fumar) pode ajudar a prevenir a PCR. Monitorar e controlar a pressão arterial, níveis de colesterol e diabetes também é importante. Se houver história familiar de PCR, é importante ser avaliado por um cardiologista ou eletrofisiologista. Se forem detectados ritmos cardíacos anormais (arritmias), eles podem ser tratados por meio de um cardioversor desfibrilador implantável e uso de medicamentos específicos. "
  },
  {
    "Posso ferir acidentalmente a vítima com um DEA?":
        "Não. A maioria das vítimas de PCR morrerá se não for tratada imediatamente. A ação de um espectador só ajudará. Os DEAs são projetados para apenas chocarem as vítimas que precisam ser eletrocutadas."
  },
  {
    "Posso me machucar ou machucar outras pessoas com um DEA?":
        "Não, não se você usá-lo corretamente. O choque elétrico é programado para passar de um eletrodo a outro através do peito da vítima. Precauções básicas, como não tocar na vítima durante o choque, garantem a segurança dos socorristas e espectadores."
  },
  {
    "Os DEAs sempre ajudam as vítimas de PCR?":
        "DEAs são projetados para tratar vítimas em SCA com um ritmo cardíaco irregular chamado fibrilação ventricular. Os DEAs funcionam melhor nessas vítimas se forem usados ​​rapidamente e se a vítima tiver recebido ressuscitação cardiopulmonar (RCP)."
  }
];

class _FrequentlyQuestionsScreenState extends State<FrequentlyQuestionsScreen> {
  int? questionSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.primary,
        title: const AppBarContent(
          title: 'Perguntas Frequentes',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemCount: questions.length,
          itemBuilder: (_, index) {
            final question = questions[index];
            return QuestionWidget(
              isSelected: questionSelected == index,
              title: question.entries.elementAt(0).key,
              answer: question.entries.elementAt(0).value,
              onTap: () {
                setState(() {
                  if (questionSelected == index) {
                    questionSelected = null;
                  } else {
                    questionSelected = index;
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }
}
