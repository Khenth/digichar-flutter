import 'package:flutter/material.dart';

import '../../../config/global/global.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image(
        fit: BoxFit.cover,
        image: Constants.profileImg, width: size.width * 0.35,height: size.width * 0.35,),
    );
  }
}