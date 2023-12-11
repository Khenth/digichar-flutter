import 'package:digichar/screens/home/views/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentPageIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
   LesCharitiesView(),
   MngsCharitiesView(),
  ];

  void _onItemTapped(int index) {
     final authServices =
                    Provider.of<AuthService>(context, listen: false);

    switch (index) {
      case 2:
      authServices.logout();
      Navigator.of(context).pushReplacementNamed('login');
        break;
      default:
       setState(() {
      currentPageIndex = index;
    });
    }

   
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () =>themeMode.darkTheme = !themeMode.darkTheme,
            icon: Icon(themeMode.darkTheme
                ? Icons.light_mode
                : Icons.mode_night_outlined))
      ]),
      body: Center(
        child:_widgetOptions.elementAt(currentPageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: currentPageIndex,
        onTap: _onItemTapped,
        items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.reduce_capacity_rounded),
          label: 'Les charities',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_sharp),
          label: 'Mes charities',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app),
          label: 'Exit',
        ),
      ]),
    );
  }
}
