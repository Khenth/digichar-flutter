import 'package:flutter/material.dart';

class ExpandedButtom extends StatelessWidget {
  final String text;
  final bool loading;
  final void Function()? onTap;
  final double marginhorizontal;
  final double borderRadius;
  final Color? color;
  final Color? textcolor;
  final double elevation;
  final double padding;

  const ExpandedButtom(
      {super.key,
      required this.text,
      this.onTap,
      this.loading = false,
      this.marginhorizontal = 25.0,
      this.borderRadius = 5,
      this.color,
      this.textcolor,
      this.elevation = 0.0,
      this.padding = 16.0});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginhorizontal),
      child: Material(
        elevation: elevation,
        color: onTap != null
            ? color ?? colors.primary
            : color != null
                ? color?.withOpacity(0.8)
                : colors.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: !loading ? onTap : null,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Center(
              child: loading
                  ? CircularProgressIndicator(
                      color: color ?? colors.onPrimary,
                    )
                  : Text(
                      text,
                      style: texts.titleMedium
                          ?.copyWith(color: textcolor ?? colors.onPrimary),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
