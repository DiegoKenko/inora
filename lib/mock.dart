var parceiros = [
  [
    'Canguru',
    'images/canguru.png',
    Uri.http(
      'cuidadorescanguru.com.br',
    )
  ],
  [
    'Idea',
    'images/idea1.png',
    Uri.http(
      'www.instagram.com',
      'ideafilmes',
    )
  ],
  [
    'Apple',
    'images/apple.png',
    Uri.http(
      'www.apple.com',
    )
  ],
  [
    'Firebase',
    'images/firebase.png',
    Uri.http('firebase.google.com'),
  ],
];

Map<String, String> imagens = {
  'appTrans': 'images/appTrans.gif',
  'develop1': 'images/develop1.gif',
  'develop2': 'images/develop2.gif',
  'app': 'images/app.png',
  'apple': 'images/apple.png',
  'canguru': 'images/canguru.png',
  'digital_wave': 'images/digital_wave.png',
  'firebase': 'images/firebase.png',
  'idea1': 'images/idea1.png',
  'idea2': 'images/idea2.png',
  'mobile_database': 'images/mobile_database.png',
  'website': 'images/website.png',
  'world_web': 'images/world_web.png',
  'prothues': 'images/prothues.png',
};

List<Map<String, dynamic>> atividades = [
  {
    'nome': 'APLICATIVOS MÓVEIS',
    'imagem': 'images/app.png',
    'topicos': [
      'Desenvolvimento de aplicativos sob demanda',
      'Leve e rápido',
      'Integrado com sistemas ERP da sua empresa',
      'Interface intuitiva',
      'Disponibilidade para Android e IOS',
    ]
  },
  {
    'nome': 'WEBSITES',
    'imagem': 'images/website.png',
    'topicos': [
      'Desenvolvimento de websites sob demanda',
      'Responsivo para dispositivos móveis',
      'Interface intuitiva',
      'Integrado com sistemas ERP da sua empresa',
    ]
  },
  {
    'nome': 'PROTHEUS',
    'imagem': 'images/protheus.png',
    'topicos': [
      'Soluções customizadas para o ERP Protheus',
      'Integração com sistemas de terceiros',
      'Automação de processos',
      'Infraestrutura',
    ]
  },
];
