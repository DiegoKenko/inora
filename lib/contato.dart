import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inora/appbar.dart';
import 'package:inora/drawer.dart';
import 'package:inora/firestore/firestore.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/styles.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InoraContato extends StatefulWidget {
  const InoraContato({Key? key}) : super(key: key);

  @override
  State<InoraContato> createState() => _InoraContatoState();
}

class _InoraContatoState extends State<InoraContato> {
  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();
    TextEditingController areaController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      drawer: ratioVertical ? InoraDrawer() : null,
      backgroundColor: kWhite,
      appBar: const InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const InoraHeader(),
              Container(
                height: ratioVertical
                    ? responsiveHeight * 0.9
                    : responsiveHeight * 0.9,
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth * 0.2,
                  vertical: responsiveHeight * 0.1,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Entre em contato com a gente!',
                          style: kTextStyleTitleBlack,
                        ),
                      ),
                    ),
                    Center(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nomeController,
                                decoration: InputDecoration(
                                  hintText: 'nome',
                                  hintStyle: kTextHintContact,
                                  label: const Icon(
                                    Icons.person,
                                  ),
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'nome deve ser preenchido';
                                  } else if (value.isEmpty) {
                                    return "nome inválido";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: telefoneController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    MaskTextInputFormatter(
                                        mask: '(##) #####-####',
                                        filter: {
                                          "#": RegExp(r'[0-9]'),
                                        }),
                                  ],
                                  style: kTextLabelContact,
                                  decoration: InputDecoration(
                                    hintText: 'telefone',
                                    label: const Icon(
                                      Icons.phone,
                                    ),
                                    hintStyle: kTextHintContact,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'telefone deve ser preenchido';
                                    } else if (value.isEmpty ||
                                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                            .hasMatch(value)) {
                                      return "telefone inválido";
                                    } else {
                                      return null;
                                    }
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'e-mail',
                                  hintStyle: kTextHintContact,
                                  label: const Icon(
                                    Icons.mail,
                                  ),
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'e-mail deve ser preenchido';
                                  } else if (value.isEmpty) {
                                    return "e-mail inválido";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: descricaoController,
                                decoration: InputDecoration(
                                  hintText: 'idéia, sugestão, crítica, etc',
                                  hintStyle: kTextHintContact,
                                  label: const Icon(
                                    Icons.star,
                                  ),
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return ' deve ser preenchido';
                                  } else if (value.isEmpty) {
                                    return " inválido";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: areaController,
                                decoration: InputDecoration(
                                  hintText: 'area de atuação',
                                  hintStyle: kTextHintContact,
                                  label: const Icon(
                                    Icons.work,
                                  ),
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'área de atuação deve ser preenchida';
                                  } else if (value.isEmpty) {
                                    return "área inválida";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: responsiveHeight * 0.025,
                                horizontal: responsiveWidth * 0.1,
                              ),
                              width: double.infinity,
                              height: responsiveHeight * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kBlack,
                                  width: 2,
                                ),
                                color: kWhite,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      elevation: 20,
                                      duration: Duration(seconds: 3),
                                      content: Text('Enviando mensagem...'),
                                    ),
                                  );
                                  await ContatoFirestore().addMensagem(
                                    nome: nomeController.text,
                                    email: emailController.text,
                                    telefone: telefoneController.text,
                                    descricao: descricaoController.text,
                                    area: areaController.text,
                                  );
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Mensagem enviada com sucesso!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  nomeController.clear();
                                  emailController.clear();
                                  telefoneController.clear();
                                  descricaoController.clear();
                                  areaController.clear();
                                },
                                child: Center(
                                  child: Text(
                                    'ENVIAR',
                                    style: kTextStyleTitleOrange,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const InoraFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
