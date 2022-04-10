const frequentlyQuestionsData = [
  {
    "O que é o DEA?":
        "Um DEA é um dispositivo que pode salvar a vida de uma pessoa em Parada Cardiorrespiratória (PCR), porque analisa automaticamente os ritmos cardíacos e aconselha o leigo em uso do dispositivo a aplicar um choque se o coração estiver em um ritmo cardíaco fatal. O DEA é projetado para uso por pessoas sem treinamento (leigos), é seguro e não pode machucar a vítima."
  },
  {
    "O que é PCR?":
        "A PCR é uma emergência com risco de morte que ocorre quando o coração para de bater de repente e atinge pessoas de todas as idades. Uma vítima de PCR colapsa, desmaia e não responde nem respira normalmente (pode ofegar ou tremer). Se nada for feito, a chance de sobreviver a uma PCR diminui 10% a cada minuto! A sobrevivência depende das pessoas próximas ligarem para o 192 ou 193, iniciarem a RCP e usarem um DEA (se disponível) o mais rápido possível."
  },
  {
    "O que é RCP?":
        "A RCP, ou ressuscitação cardiopulmonar, é uma manobra em que se empurra o centro do tórax (entre os mamilos) com força e rapidez (100-120 bombeamentos por minuto) para fazer o coração circular o sangue oxigenado já existente no corpo para o cérebro e outros órgãos. A RCP pode salvar uma pessoa em Parada Cardiorrespiratória."
  },
  {
    "Como um socorrista leigo (pessoa que vê vítima de PCR) pode ajudar a salvar uma vida ameaçada pela Parada Cardiorrespiratória?":
        "As chances de sobrevivência da PCR aumentam consideravelmente se a vítima receber RCP imediata e tratamento com um DEA. Os DEAs são projetados para uso por leigos e fornecem avisos visuais e de voz, assim somente chocarão o coração se os choques forem necessários para restaurar um batimento cardíaco saudável. A taxa de sobrevivência pode chegar a 50% se os socorristas leigos usarem o DEA antes da chegada da equipe médica de emergência."
  },
  {
    "O que causa a PCR?":
        "A PCR pode ter causas cardíacas (anormalidades do músculo cardíaco ou do sistema elétrico do coração), causas externas (afogamento, trauma, asfixia, eletrocussão, overdose de drogas, pancadas no peito) e outras causas médicas, como inflamação do músculo cardíaco por infecção. A maioria das PCRs é causada por um ritmo cardíaco anormal (arritmia), sendo a Taquicardia Ventricular Sem Pulso e a Fibrilação Ventricular, presentes em mais ou menos 70% a 80% dos casos de PCR. Quando isso ocorre, o coração é incapaz de bombear sangue e a morte ocorre em poucos minutos se não for tratada. Ataques cardíacos também podem levar à PCR."
  },
  {
    "Como reconhecer uma PCR?":
        "Em geral, o primeiro sinal é a perda de consciência (desmaio), a pessoa entra em colapso e não responde ou respira normalmente. A pessoa pode ofegar ou tremer como se estivesse tendo uma convulsão."
  },
  {
    "Parada Cardiorrespiratória é igual a infarto?":
        "Não. A PCR é um problema elétrico no coração, a pessoa não está acordada, seu coração não está batendo e ela não consegue se comunicar. Os sintomas da PCR incluem perda súbita de capacidade de resposta e ausência de respiração normal. Já o infarto é um problema circulatório no coração. A pessoa está acordada, seu coração está batendo e ela consegue se comunicar. Os sintomas de infarto podem incluir desconforto no peito; dor ou desconforto em um ou ambos os braços, costas, pescoço, mandíbula ou estômago; falta de ar; sudorese; náusea; e tontura. Infartos podem levar à PCR, mas também existem diversas outras causas."
  },
  {
    "Posso ferir acidentalmente a vítima com um DEA?":
        "Não. A maioria das vítimas de PCR morrerá se não for tratada imediatamente. A ação de um socorrista leigo só ajudará. Ademais, os DEAs são projetados para somente chocarem as vítimas que precisam disso!"
  },
  {
    "Posso me machucar ou machucar outras pessoas com um DEA?":
        "Não, se usado de forma correta. Precauções básicas, como não tocar na vítima durante o choque, garantem a segurança dos socorristas."
  },
  {
    "O DEA pode ser usado com segurança se a vítima estiver em uma superfície de metal (p. ex. arquibancada ou maca)?":
        "Sim. Os DEAs podem ser usados ​​com segurança, desde que os eletrodos não entrem em contato com a superfície metálica."
  },
  {
    "Há algum cuidado especial ao colocar eletrodos em uma vítima do sexo feminino?":
        "Se a vítima estiver usando sutiã, remova-o antes de colocar os eletrodos."
  },
  {
    "O que fazer caso a vítima tenha um adesivo de medicação, como nitroglicerina?":
        "Nunca coloque os eletrodos do DEA diretamente sobre os adesivos de medicação. Se o adesivo estiver no caminho dos eletrodos do DEA, use a camisa da vítima para removê-lo e limpar a área. Não toque no adesivo diretamente com a pele, use a camisa da vítima. Em seguida, aplique os eletrodos na pele limpa e nua."
  },
  {
    "O que fazer caso a vítima tenha um marca-passo ou desfibrilador implantável?":
        "Observe na região abaixo da clavícula, geralmente do lado esquerdo, se há um abaulamento rígido sob a pele. Se houver esse nódulo, pode ser um marca-passo ou desfibrilador implantável com bateria, então evite colocar o eletrodo diretamente em cima do dispositivo médico implantado."
  },
  {
    "Os DEAs sempre ajudam as vítimas de PCR?":
        "DEAs são projetados para tratar vítimas em PCR com um ritmo cardíaco irregular: Fibrilação Ventricular e Taquicardia Ventricular Sem Pulso. Os DEAs funcionam melhor nessas vítimas se forem usados ​​rapidamente e se a vítima tiver recebido ressuscitação cardiopulmonar (RCP)."
  },
  {
    "Onde os DEAs devem ser localizados?":
        "Locais estratégicos para colocação de DEA incluem locais com grande circulação de pessoas, como aeroportos, terminais rodoviários, estádios, clínicas de saúde, academias de ginástica, shoppings, supermercados, teatros, escolas, igrejas e asilos. A ampla disponibilidade de DEAs é relevante, pois mais de 95% das mortes súbitas ocorrem fora do ambiente hospitalar."
  },
  {
    "Os DEAs substituem o uso de RCP?":
        "Não. A RCP é fundamental até que o DEA chegue ao local. Após cada choque reinicie as compressões da RCP até a chegada da equipe médica de emergência. A RCP de alta qualidade pode melhorar muito as chances de sobrevivência."
  },
  {
    "É importante ter um DEA em minha casa?":
        "As pessoas que estão em risco de PCR podem querer ter um DEA em casa. O maior risco de PCR está em pessoas com fatores de risco para arritmias letais que são portadores de doenças cardíacas, histórico familiar ou antecedente de PCR. Considerando isso e o fato de que 7 em cada 10 PCRs ocorrem em domicílio, colocar DEAs em residências pode salvar muitas vidas."
  },
  {
    "Após a ressuscitação, o sobrevivente poderá retomar uma vida normal?":
        "Após o atendimento pela equipe de emergência (SAMU) e encaminhamento para hospital, a maioria das pessoas que sobrevivem à PCR pode retornar à sua capacidade funcional anterior. Após o evento da PCR, todos os sobreviventes precisam de acompanhamento com médicos cardiologistas e eletrofisiologistas."
  },
  {
    "Como prevenir a PCR?":
        "Um estilo de vida saudável (prática regular de exercícios físicos, alimentação saudável, manutenção de peso saudável e evitar fumar) pode ajudar a prevenir a PCR. Monitorar e controlar a pressão arterial, níveis de colesterol e diabetes também é importante. Se houver história familiar de PCR, é importante ser avaliado por um cardiologista ou eletrofisiologista. Se forem detectados ritmos cardíacos anormais (arritmias), eles podem ser tratados por meio de um cardioversor desfibrilador implantável e uso de medicamentos específicos."
  },
  {
    "Como a Parada Cardiorrespiratória deve ser tratada?":
        "A PCR é tratável na maioria das vezes, desde que seja tratada rapidamente com a RCP e, se disponível, o DEA. Este tratamento deve ser fornecido imediatamente para ser eficaz, idealmente dentro de 3 a 5 minutos após o colapso.Mesmo os serviços médicos de emergência mais rápidos podem não conseguir chegar a uma vítima tão rapidamente. Assim, a ação imediata dos socorristas leigos é fundamental e por isso é tão importante que mais leigos aprendam RCP e como usar um DEA. Os leigos devem estar preparados para reconhecer a emergência (se a vítima não responde e não respira normalmente, suspeitar de PCR), ligar para o 192 ou 193, fazer RCP e usar o DEA mais próximo. Após a chegada da equipe de emergência, serão realizados outros tratamentos avançados de suporte cardíaco de vida."
  }
];
