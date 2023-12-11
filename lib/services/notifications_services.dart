import 'package:flutter/material.dart';

class NotificationsServices {
  static GlobalKey<ScaffoldMessengerState> messegerkey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnapbarError(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red.withOpacity(0.5),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));

    messegerkey.currentState!.showSnackBar(snackBar);
  }

  static showSnapbar(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.green.withOpacity(0.5),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));

    messegerkey.currentState!.showSnackBar(snackBar);
  }

  static showBusyIndicator(BuildContext context) {
    const AlertDialog dialog = AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }

  static sucessIndicator(
      {required BuildContext context,
      required String title,
      String? subtitle,
      required Color color,
      required IconData icon}) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    final AlertDialog dialog = AlertDialog(
      //shape: Border.all(color: color,),
      icon: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(
          icon,
          size: 60,
          color: colors.background,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            label: Text(
              'Close',
              style: text.bodyLarge?.copyWith(color: color),
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(color),
                side: MaterialStateProperty.all(BorderSide(
                    color: color,
                    width: 1.0,
                    style: BorderStyle.solid)),
                iconColor: MaterialStateProperty.all(color)),
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
