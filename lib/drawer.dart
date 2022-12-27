import 'package:flutter/material.dart';
import 'package:inora/styles.dart';

class InoraDrawer extends StatelessWidget {
  const InoraDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          ListTile(
            title: Text('Contato'),
            onTap: () {
              Navigator.pushNamed(context, '/contato');
            },
          ),
          ListTile(
            title: Text('Parceiros'),
            onTap: () {
              Navigator.pushNamed(context, '/parceiros');
            },
          ),
          ListTile(
            title: Text('Trabalhe Conosco'),
            onTap: () {
              Navigator.pushNamed(context, '/trabalhe_conosco');
            },
          ),
        ],
      ),
    );
  }
}
