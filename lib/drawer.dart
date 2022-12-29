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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Text(''),
          ),
          ListTile(
            title: const Text('Página inicial'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: const Text('Contato'),
            onTap: () {
              Navigator.pushNamed(context, '/contato');
            },
          ),
          ListTile(
            title: const Text('Parceiros'),
            onTap: () {
              Navigator.pushNamed(context, '/parceiros');
            },
          ),
          ListTile(
            title: const Text('Trabalhe Conosco'),
            onTap: () {
              Navigator.pushNamed(context, '/trabalhe_conosco');
            },
          ),
        ],
      ),
    );
  }
}
