import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inora/appbar.dart';
import 'package:inora/drawer.dart';
import 'package:inora/firebase/firestore.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/styles.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InoraTrabalheConosco extends StatefulWidget {
  const InoraTrabalheConosco({Key? key}) : super(key: key);

  @override
  State<InoraTrabalheConosco> createState() => _InoraTrabalheConoscoState();
}

class _InoraTrabalheConoscoState extends State<InoraTrabalheConosco> {
  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();

    return Scaffold(
      drawer: ratioVertical ? const InoraDrawer() : null,
      backgroundColor: kBlack,
      appBar: const InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const InoraHeader(),
              Container(
                padding: ratioVertical
                    ? EdgeInsets.symmetric(
                        horizontal: responsiveWidth * 0.1,
                        vertical: responsiveHeight * 0.05)
                    : EdgeInsets.symmetric(
                        horizontal: responsiveWidth * 0.25,
                        vertical: responsiveHeight * 0.05,
                      ),
                width: double.infinity,
                height: responsiveHeight * 0.7,
                color: kBlack,
                child: Column(
                  children: [
                    SelectableText(
                      'Faça parte da equipe!',
                      style: ratioVertical
                          ? kTextStyleTitleOrangeVertical
                          : kTextStyleTitleOrange,
                    ),
                    SizedBox(
                      height: responsiveHeight * 0.025,
                    ),
                    TextFormField(
                      controller: nomeController,
                      style: kTextLabelContact,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        hintStyle: kTextHintContact,
                        label: const Icon(
                          Icons.person,
                        ),
                        fillColor: kWhite,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'nome não pode ser vazio';
                        } else {
                          if (value.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //allow upper and lower case alphabets and space
                            return "nome inválido";
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: responsiveHeight * 0.025,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                              style: kTextLabelContact,
                              inputFormatters: const <TextInputFormatter>[],
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
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
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        SizedBox(
                          width: responsiveWidth * 0.025,
                        ),
                        Flexible(
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
                                hintText: 'Telefone',
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
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ],
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
                        color: kBlack,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              elevation: 20,
                              duration: Duration(seconds: 3),
                              content: SelectableText('Enviando mensagem...'),
                            ),
                          );
                          await ContatoFirestore().addMensagem(
                            nome: nomeController.text,
                            email: emailController.text,
                            telefone: telefoneController.text,
                            descricao: 'Trabalhe conosco',
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const SelectableText(
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
                        },
                        child: Center(
                          child: Text(
                            'ENVIAR',
                            style: kTextButtonTitle,
                          ),
                        ),
                      ),
                    )
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
