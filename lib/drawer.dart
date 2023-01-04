import 'package:flutter/material.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InoraDrawer extends StatelessWidget {
  const InoraDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBlack,
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
              trailing: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Image.asset(
                  fit: BoxFit.contain,
                  imagens['inora_logo_white']!,
                ),
              ),
              leading: const Icon(
                Icons.home,
                color: kWhite,
              ),
              textColor: kWhite,
              title: Text(
                AppLocalizations.of(context).inicio,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              selectedColor: kPrimaryColor,
            ),
            ListTile(
              leading: const Icon(
                Icons.insert_comment_sharp,
                color: kWhite,
              ),
              textColor: kWhite,
              title: Text(
                AppLocalizations.of(context).contato,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/contato');
              },
              selectedColor: kPrimaryColor,
            ),
            ListTile(
              leading: const Icon(
                Icons.work,
                color: kWhite,
              ),
              textColor: kWhite,
              title: Text(
                AppLocalizations.of(context).trabalheconosco,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/trabalhe_conosco');
              },
              selectedColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
