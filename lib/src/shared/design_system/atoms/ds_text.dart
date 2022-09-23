import 'package:devstravel/src/shared/styles.dart';
import 'package:flutter/material.dart';

class DsText extends StatelessWidget {
  const DsText({
    required this.text,
    this.maxLines,
    this.style = textSimple,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    super.key,
  });

  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
