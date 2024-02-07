import 'package:flutter/material.dart';

class RemoteLockButton extends StatelessWidget {
  const RemoteLockButton({super.key, required this.labelText, this.onTap});
  final String labelText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      width: MediaQuery.sizeOf(context).width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blueGrey,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          labelText,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
