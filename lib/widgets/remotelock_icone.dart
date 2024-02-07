import 'package:flutter/cupertino.dart';

class RemoteLockIcone extends StatelessWidget {
  const RemoteLockIcone(
      {super.key, this.iconPath, this.size, this.color, this.isIcon = true, required this.iconPathData});
  final String? iconPath;
  final IconData iconPathData;
  final double? size;
  final Color? color;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isIcon
          ? Icon(
              iconPathData,
              size: size,
              color: color,
            )
          : Image.asset(
              iconPath!,
              width: size,
              height: size,
              color: color,
            ),
    );
  }
}
