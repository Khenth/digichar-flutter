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
    ProfileView()
  ];

  void _onItemTapped(int index) {
    final authServices = Provider.of<AuthService>(context, listen: false);
    switch (index) {
      case 3:
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
    final colors = Theme.of(context).colorScheme;
    final chariryService = Provider.of<CharityService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(actions: [
      if(currentPageIndex == 1)  IconButton(
            onPressed: () => chariryService.getCharities(),
            icon: const Icon(Icons.refresh_rounded)),
        IconButton(
            onPressed: () => themeMode.darkTheme = !themeMode.darkTheme,
            icon: Icon(themeMode.darkTheme
                ? Icons.light_mode
                : Icons.mode_night_outlined)),
      ]),
      body: Center(
        child: _widgetOptions.elementAt(currentPageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: currentPageIndex,
          onTap: _onItemTapped,
          fixedColor: colors.primary,
          unselectedItemColor: colors.onBackground.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.reduce_capacity_rounded),
              label: 'Les charities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_sharp),
              label: 'Mes charities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Exit',
            ),
          ]),
    );
  }
}
