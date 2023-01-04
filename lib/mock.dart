var parceiros = [
  [
    'canguru',
    imagens['canguru'],
    Uri.http(
      'cuidadorescanguru.com.br',
    )
  ],
  [
    'idea',
    imagens['idea1'],
    Uri.http(
      'www.instagram.com',
      'ideafilmes',
    )
  ],
  [
    'gama',
    imagens['gama'],
    Uri.http(
      'www.instagram.com',
      '_gamadigital',
    )
  ],
  [
    'apple',
    imagens['apple'],
    Uri.http(
      'www.apple.com',
    )
  ],
  [
    'firebase',
    imagens['firebase'],
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
  'diego': 'images/diego.jpg',
  'inora_white': 'images/inora_white.png',
  'inora_black': 'images/inora_black.png',
  'inora_logo_white': 'images/inora_logo_white.png',
  'inora_logo_black': 'images/inora_logo_black.png',
  'gama': 'images/gama.png',
};

List<Map<String, dynamic>> atividades = [
  {
    'nome': 'APLICATIVOS MÓVEIS',
    'imagem': 'images/app.png',
    'topicos': [
      'Desenvolvimento de aplicativos sob demanda.',
      'Leve e rápido.',
      'Integrado com outros sistemas.',
      'Interface intuitiva.',
      'Disponibilidade para Android e IOS.',
    ]
  },
  {
    'nome': 'WEBSITES',
    'imagem': 'images/website.png',
    'topicos': [
      'Desenvolvimento de websites sob demanda.',
      'Responsivo para dispositivos móveis.',
      'Interface intuitiva.',
      'Integrado com sistemas.',
    ]
  },
  {
    'nome': 'PROTHEUS',
    'imagem': 'images/protheus.png',
    'topicos': [
      'Soluções customizadas para o ERP Protheus.',
      'Integração com outros sistemas.',
      'Automação de processos.',
      'Infraestrutura.',
    ]
  },
];
