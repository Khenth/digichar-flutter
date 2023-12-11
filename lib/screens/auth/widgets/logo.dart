import 'package:flutter/material.dart';

import '../../../config/global/global.dart';

class LogoDigiChart extends StatelessWidget {
  const LogoDigiChart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Image(image: Constants.logoApp, width: size.width * 0.35,height: size.width * 0.35,);
  }
}