import 'package:flutter/material.dart';

class SnackBarCustom extends StatelessWidget {
  const SnackBarCustom({super.key, required this.textContent});
  final String textContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SnackBar(
      content: Text(textContent),
      backgroundColor: Colors.red,
    )

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        );
  }
}
