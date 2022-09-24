import 'package:devstravel/src/shared/app_colors.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_mediaquerry.dart';
import 'package:flutter/material.dart';

class DsTextField extends StatelessWidget {
  const DsTextField({
    Key? key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.minLines,
    this.maxLines,
    this.onChanged,
    required this.icon,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String hintText;
  final int? minLines;
  final int? maxLines;
  final Function(String)? onChanged;
  final Widget icon;
  final double left;
  final double right;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenSize(context).width * left,
          right: screenSize(context).width * right,
          top: screenSize(context).height * top,
          bottom: screenSize(context).height * bottom),
      child: TextField(
        style: const TextStyle(color: blackColor),
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            suffixIcon: icon,
            labelText: labelText,
            hintText: hintText,
            alignLabelWithHint: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: grey, width: 1),
                borderRadius: BorderRadius.circular(12)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: strokeDisable, width: 1),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(12))),
        // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      ),
    );
  }
}
