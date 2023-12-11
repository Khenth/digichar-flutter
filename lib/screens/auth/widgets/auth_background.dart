import 'package:digichar/screens/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final List<Widget> children;
  const AuthBackground({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  ListView(children: [
        const SizedBox(height: 40,),
        const LogoDigiChart(),
        const SizedBox(height: 40,),
        CardContainer(
          child: Column(children: [...children]),
        ),
      ]),
    );
  }
}