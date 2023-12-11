import 'package:digichar/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/server_api.dart';
import 'config/config.dart';
import 'providers/providers.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environments.initEnvironmet();
  await Preferences.configurePrefs();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      initialRoute: 'login',
       scaffoldMessengerKey: NotificationsServices.messegerkey,
      theme: AppThemes.appThemeData[
          themeMode.darkTheme ? AppTheme.darkTheme : AppTheme.lightTheme],
      routes: {
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'forgot': (_) => const ForgotPasswordScreen(),
        'home': (_) => const HomeScreen(),
      },
    );
  }
}
