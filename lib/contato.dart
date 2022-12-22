import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inora/appbar.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/styles.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InoraContato extends StatefulWidget {
  InoraContato({Key? key}) : super(key: key);

  @override
  State<InoraContato> createState() => _InoraContatoState();
}

class _InoraContatoState extends State<InoraContato> {
  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    TextEditingController _nomeController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _telefoneController = TextEditingController();
    TextEditingController _mensagemController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Entre em contato!',
                        style: kTextStyleTitleBlack,
                      ),
                      SizedBox(
                        height: responsiveHeight * 0.025,
                      ),
                      TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          labelStyle: kTextLabelContact,
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
                              inputFormatters: <TextInputFormatter>[],
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'e-mail',
                                labelStyle: kTextLabelContact,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
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
                                      mask: ' +55 (##)#####-####',
                                      filter: {
                                        "#": RegExp(r'[0-9]'),
                                      }),
                                ],
                                decoration: InputDecoration(
                                  labelText: 'telefone',
                                  labelStyle: kTextLabelContact,
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
                      SizedBox(
                        height: responsiveHeight * 0.025,
                      ),
                      TextFormField(
                        controller: _mensagemController,
                        decoration: InputDecoration(
                          labelText: 'Mensagem',
                          labelStyle: kTextLabelContact,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: responsiveHeight * 0.025,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kBlack,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: responsiveHeight * 0.025,
                            ),
                            child: Center(
                              child: Text(
                                'ENVIAR',
                                style: kTextStyleTitleOrangeLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InoraFooter()
            ],
          ),
        ),
      ),
    );
  }
}
