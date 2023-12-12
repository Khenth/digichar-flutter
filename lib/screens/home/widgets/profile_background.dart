import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import 'profile_image.dart';

class ProfileBackground extends StatelessWidget {
  final List<Widget> children;
  const ProfileBackground({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
        const ProfileImage(),
        const SizedBox(height: 40,),
        CardContainer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [...children]),
        ),
      ]),
    );
  }
}