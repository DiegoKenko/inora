import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ContatoFirestore {
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<void> addMensagem({
    required String nome,
    required String email,
    required String telefone,
    required String descricao,
    String? area,
  }) async {
    await instance.collection('mensagem').add({
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'area': area ?? '',
      'descricao': descricao,
    });
  }
}
