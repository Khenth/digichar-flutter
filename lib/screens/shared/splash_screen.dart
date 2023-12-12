import 'dart:async';
import 'dart:developer';
import 'package:digichar/config/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/services.dart';
import '../auth/auth.dart';
import '../screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final _splashDelay = 2000;
  late AnimationController _animationController;

  bool finishAnimation = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.forward();
    super.initState();
    _loadWidget();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _loadWidget() async {
    var duration = Duration(milliseconds: _splashDelay);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    setState(() {
      finishAnimation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: authServices.refreshToken(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!finishAnimation) {
                  return _LogoSplash(
                    animationController: _animationController,
                  );
                }

                if (!snapshot.hasData && finishAnimation) {
                  return _LogoSplash(
                    animationController: _animationController,
                  );
                }

                if (snapshot.data != '' && finishAnimation) {
                  Future.microtask(() {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const LoginScreen(),
                            transitionDuration: const Duration(seconds: 0)));
                  });
                } else if (snapshot.data == '' && finishAnimation) {
                  Future.microtask(() {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const HomeScreen(),
                            transitionDuration: const Duration(seconds: 0)));
                  });
                }

                return _LogoSplash(
                  animationController: _animationController,
                );
              }),
        ],
      ),
    );
  }
}

class _LogoSplash extends StatefulWidget {
  final AnimationController animationController;
  const _LogoSplash({required this.animationController});

  @override
  State<_LogoSplash> createState() => __LogoSplashState();
}

class __LogoSplashState extends State<_LogoSplash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 300,
        ),
        child: Center(
          child: ScaleTransition(
            scale: widget.animationController,
            child: const Image(image: Constants.logoApp),
          ),
        ),
      ),
    );
  }
}
