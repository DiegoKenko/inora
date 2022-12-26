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
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    TextEditingController _nomeController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _telefoneController = TextEditingController();
    TextEditingController _descricaoController = TextEditingController();
    TextEditingController _areaController = TextEditingController();
    return Scaffold(
      backgroundColor: kWhite,
      appBar: InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InoraHeader(),
              Container(
                height: ratioVertical
                    ? responsiveHeight * 0.9
                    : responsiveHeight * 0.8,
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
                          'Entre em contato conosoco',
                          style: kTextStyleTitleBlack,
                        ),
                      ),
                    ),
                    Center(
                      child: Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _nomeController,
                                decoration: InputDecoration(
                                  hintText: 'nome',
                                  hintStyle: kTextHintContact,
                                  label: Icon(
                                    Icons.person,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'e-mail',
                                  hintStyle: kTextHintContact,
                                  label: Icon(
                                    Icons.mail,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _descricaoController,
                                decoration: InputDecoration(
                                  hintText: 'idéia, sugestão, crítica, etc',
                                  hintStyle: kTextHintContact,
                                  label: Icon(
                                    Icons.star,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _areaController,
                                decoration: InputDecoration(
                                  hintText: 'area de atuação',
                                  hintStyle: kTextHintContact,
                                  label: Icon(
                                    Icons.work,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
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
                                onTap: () {},
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
              InoraFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
