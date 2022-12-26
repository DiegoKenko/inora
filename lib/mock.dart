import 'package:flutter/cupertino.dart';

var parceiros = [
  [
    'Canguru',
    'canguru.png',
    Uri.http(
      'cuidadorescanguru.com.br',
    )
  ],
  [
    'Idea',
    'idea1.png',
    Uri.http(
      'www.instagram.com',
      'ideafilmes',
    )
  ],
  [
    'Apple',
    'apple.png',
    Uri.http(
      'www.apple.com',
    )
  ],
  ['Firebase', 'firebase.png', Uri.http('firebase.google.com')],
];

var imagens = {
  'appTrans': 'appTrans.gif',
  'develop1': 'develop1.gif',
  'develop2': 'develop2.gif',
  'app': 'app.png',
  'apple': 'apple.png',
  'canguru': 'canguru.png',
  'digital_wave': 'digital_wave.png',
  'firebase': 'firebase.png',
  'idea1': 'idea1.png',
  'idea2': 'idea2.png',
  'mobile_database': 'mobile_database.png',
  'website': 'website.png',
  'world_web': 'world_web.png',
  'prothues': 'prothues.png',
};

List<Map<String, dynamic>> atividades = [
  {
    'nome': 'APLICATIVOS MÓVEIS',
    'imagem': 'assets/app.png',
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
    'imagem': 'assets/website.png',
    'topicos': [
      'Desenvolvimento de websites sob demanda',
      'Responsivo para dispositivos móveis',
      'Interface intuitiva',
      'Integrado com sistemas ERP da sua empresa',
    ]
  },
  {
    'nome': 'PROTHEUS',
    'imagem': 'assets/protheus.png',
    'topicos': [
      'Soluções customizadas para o ERP Protheus',
      'Integração com sistemas de terceiros',
      'Automação de processos',
      'Infraestrutura',
    ]
  },
];
