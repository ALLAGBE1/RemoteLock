import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:remotelock/widgets/remotelock_icone.dart';

class RemoteLockSocialButton extends StatelessWidget {
  const RemoteLockSocialButton({super.key, required this.labelText, this.iconPathData});
  final String labelText;
  final IconData? iconPathData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: MediaQuery.sizeOf(context).width * 0.40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white, strokeAlign: BorderSide.strokeAlignCenter)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPathData != null) ...[
            RemoteLockIcone(
              iconPathData: iconPathData!,
              color: Colors.blue,
            ),
            const Gap(8),
          ],
          Text(
            labelText,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
