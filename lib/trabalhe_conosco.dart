import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inora/appbar.dart';
import 'package:inora/firestore/firestore.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/styles.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InoraTrabalheConosco extends StatefulWidget {
  InoraTrabalheConosco({Key? key}) : super(key: key);

  @override
  State<InoraTrabalheConosco> createState() => _InoraTrabalheConoscoState();
}

class _InoraTrabalheConoscoState extends State<InoraTrabalheConosco> {
  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    TextEditingController _nomeController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _telefoneController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: kWhite,
      appBar: InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InoraHeader(),
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
                color: kWhite,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Faça parte da equipe!',
                        style: ratioVertical
                            ? kTextStyleTitleBlackVertical
                            : kTextStyleTitleBlack,
                      ),
                      SizedBox(
                        height: responsiveHeight * 0.025,
                      ),
                      TextFormField(
                        controller: _nomeController,
                        style: kTextLabelContact,
                        decoration: InputDecoration(
                          hintText: 'Nome',
                          hintStyle: kTextHintContact,
                          label: Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'nome não pode ser vazio';
                          } else {
                            if (value.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              //allow upper and lower case alphabets and space
                              return "nome inválido";
                            } else {
                              return null;
                            }
                          }
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
                                inputFormatters: <TextInputFormatter>[],
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'e-mail',
                                  hintStyle: kTextHintContact,
                                  label: Icon(
                                    Icons.mail,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                                controller: _telefoneController,
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
                                  label: Icon(
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
                          color: kWhite,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: InkWell(
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) {
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
                              nome: _nomeController.text,
                              email: _emailController.text,
                              telefone: _telefoneController.text,
                              descricao: ' trabalhe conosco',
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Mensagem enviada com sucesso!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            _nomeController.clear();
                            _emailController.clear();
                            _telefoneController.clear();
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
              InoraFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
