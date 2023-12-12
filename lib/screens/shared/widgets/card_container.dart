import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        // height: size.height * 0.3,
        padding:const EdgeInsets.all(20),
        decoration: _createCardShape(context),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return BoxDecoration(
      color: colors.background,
      boxShadow: [
        BoxShadow(color: colors.onBackground.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 5))
      ]
    );
  }
}