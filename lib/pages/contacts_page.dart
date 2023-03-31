import 'package:flutter/material.dart';
import 'package:rail_bottom_navigation_flutter/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rail_bottom_navigation_flutter/utils.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void menuset() async {
    setState(() {
      _scaffoldKey.currentState!.openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.iconName3.tr()),
        actions: languageFlag(context, () {
          setState(() {});
        }),
      ),
      backgroundColor: Colors.red,
      bottomNavigationBar:
          MyBottomNavigationBar(menu: true, functionmenu: () => menuset()),
      key: _scaffoldKey,
      drawer: MyNavigationRail(),
      body: Container(
        color: Colors.purple.shade100,
        alignment: Alignment.center,
        child: Text(
          LocaleKeys.iconName3.tr(),
          // 'Contacts',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
