import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inora/appbar.dart';
import 'package:inora/drawer.dart';
import 'package:inora/firebase/firestore.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/styles.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Scaffold(
      drawer: ratioVertical ? const InoraDrawer() : null,
      backgroundColor: kBlack,
      appBar: const InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const InoraHeader(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth * 0.2,
                  vertical: responsiveHeight * 0.1,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                          '${AppLocalizations.of(context).entreemcontato}!',
                          style: ratioVertical
                              ? kTextStyleTitleOrangeVertical
                              : kTextStyleTitleOrange,
                        ),
                      ),
                    ),
                    Center(
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
                                fillColor: kWhite,
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'nome deve ser preenchido';
                                } else if (value.isEmpty) {
                                  return "nome inválido";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
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
                                  fillColor: kWhite,
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'telefone deve ser preenchido';
                                  } else if (value.isEmpty ||
                                      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                          .hasMatch(value)) {
                                    return "telefone inválido";
                                  }
                                  return null;
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
                                fillColor: kWhite,
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'e-mail deve ser preenchido';
                                } else if (value.isEmpty) {
                                  return "e-mail inválido";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: descricaoController,
                              decoration: InputDecoration(
                                fillColor: kWhite,
                                filled: true,
                                hintText: 'idéia, sugestão, crítica, etc',
                                hintStyle: kTextHintContact,
                                label: const Icon(
                                  Icons.star,
                                ),
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
                                fillColor: kWhite,
                                filled: true,
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 20,
                                    duration: Duration(seconds: 3),
                                    content: SelectableText(
                                      AppLocalizations.of(context)
                                          .enviandomensagem,
                                    ),
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
                                      title: SelectableText(
                                        AppLocalizations.of(context)
                                            .mensagemenviada,
                                      ),
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
                                  AppLocalizations.of(context).enviar,
                                  style: kTextStyleTitleOrange,
                                ),
                              ),
                            ),
                          )
                        ],
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
