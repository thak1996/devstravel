import 'package:devstravel/src/shared/atyles.dart';
import 'package:flutter/material.dart';

class DsText extends StatelessWidget {
  const DsText({
    required this.text,
    this.maxLines,
    this.style = textSimple,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });

  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: style,
      maxLines: maxLines,
    );
  }
}
