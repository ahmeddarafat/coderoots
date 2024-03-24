
import 'package:flutter/material.dart';

class PublicText extends StatelessWidget {
  final String text;
  final bool? under;
  final Color? color;
  final double? size;
  final int? max;
  final FontWeight? fw;
  final TextAlign? align;

  const PublicText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.under,
    this.align,
    this.max,
    this.fw,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: max ?? 2,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 16,
        fontWeight: fw ?? FontWeight.normal,
        overflow: TextOverflow.ellipsis,
        decorationColor: color ?? Colors.black,
        decoration:
            under == true ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
