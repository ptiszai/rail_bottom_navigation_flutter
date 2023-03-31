import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rail_bottom_navigation_flutter/l10n/locale_keys.g.dart';
import 'package:rail_bottom_navigation_flutter/l10n/language.dart';
import 'package:rail_bottom_navigation_flutter/main.dart';
import 'package:rail_bottom_navigation_flutter/l10n/l10.dart';

List<Widget> languageFlag(BuildContext context, Function function_a) {
  Function function = function_a;
  //final BuildContext _context = context;
  return <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<Language>(
        underline: SizedBox(),
        icon: Icon(
          Icons.language,
          color: Colors.white,
        ),
        onChanged: (Language? value) async {
          await context.setLocale(L10n.all[value!.id - 1]);
          language = value;
          function();
          //debugPrint("Ti:language!.id:${language.id}");
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(e.flag),
                    Text(
                      e.name,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(e.name)
                  ],
                ),
              ),
            )
            .toList(),
      ),
    ),
    Image.asset(language.flag),
  ];
}

class MyBottomNavigationBar extends StatefulWidget {
  final bool? menu;
  final Function? functionmenu;
  MyBottomNavigationBar({this.menu, required this.functionmenu, Key? key})
      : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, size: 30),
            label: LocaleKeys.iconName1.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: LocaleKeys.iconName2.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quick_contacts_mail_outlined, size: 30),
            label: LocaleKeys.iconName3.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login, size: 30),
            label: LocaleKeys.iconName4.tr(),
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 255, 2, 2),
        elevation: 5.0,
        unselectedItemColor: Colors.green[900],
        currentIndex: selectedPage,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            if (index == 0) {
              widget.functionmenu!();
            } else {
              selectedPage = index;
              // debugPrint("Ti: selectedPage:$selectedPage");
              switch (selectedPage) {
                case 0:
                  break;
                case 1:
                  Navigator.of(context).pushReplacementNamed('/');
                  break;
                case 2:
                  Navigator.of(context).pushReplacementNamed('/contacts');
                  break;
                case 3:
                  Navigator.of(context).pushReplacementNamed('/account');
                  break;
              }
            }
          });
        });
  }
}

//--------------------
class MyNavigationRail extends StatefulWidget {
  const MyNavigationRail({super.key});
  @override
  State<MyNavigationRail> createState() => _MyNavigationRailState();
}

class _MyNavigationRailState extends State<MyNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntrinsicWidth(
            stepHeight: 0.2,
            child: NavigationRail(
              selectedIndex: selectedMenuIndex,
              extended: menuextended_global,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedMenuIndex = index;
                  setState(() {});
                  switch (selectedMenuIndex) {
                    case 0:
                      break;
                    case 1:
                      Navigator.of(context).pushReplacementNamed('/news');
                      break;
                    case 2:
                      Navigator.of(context).pushReplacementNamed('/programs');
                      break;
                    case 3:
                      Navigator.of(context).pushReplacementNamed('/something');
                      break;
                    case 4:
                      Navigator.of(context).pushReplacementNamed('/qrcode');
                      break;
                    case 5:
                      Navigator.of(context).pushReplacementNamed('/about');
                      break;
                  }
                  setState(() {});
                  //debugPrint("Ti:_selectedMenuIndex:$selectedMenuIndex");
                });
              },
              labelType: menuextended_global
                  ? NavigationRailLabelType.none
                  : NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 1, 1),
              ),
              leading: Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              destinations: [
                NavigationRailDestination(
                  icon: InkWell(
                    onTap: () {
                      setState(
                          () => menuextended_global = !menuextended_global);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(menuextended_global
                            ? Icons.arrow_right
                            : Icons.arrow_left)
                      ],
                    ),
                  ),
                  label: Container(
                    width: 0,
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.newspaper),
                  label: Text(
                    LocaleKeys.viconName1.tr(),
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  label: Text(LocaleKeys.viconName2.tr()),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.logout),
                  label: Text(LocaleKeys.viconName3.tr()),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.qr_code_2_outlined),
                  label: Text(LocaleKeys.viconName4.tr()),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.roundabout_left),
                  label: Text(LocaleKeys.viconName5.tr()),
                ),
              ],
            )));
  }
}
