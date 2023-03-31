import 'package:flutter/material.dart';
import 'package:rail_bottom_navigation_flutter/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rail_bottom_navigation_flutter/utils.dart';

class NewsPage extends StatefulWidget {
  NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
        title: Text(LocaleKeys.viconName1.tr()),
        actions: languageFlag(context, () {
          setState(() {});
        }),
      ),
      bottomNavigationBar:
          MyBottomNavigationBar(menu: true, functionmenu: () => menuset()),
      key: _scaffoldKey,
      drawer: MyNavigationRail(),
      body: Container(
        color: Color.fromARGB(255, 75, 3, 241),
        alignment: Alignment.center,
        child: Text(
          LocaleKeys.viconName1.tr(),
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
