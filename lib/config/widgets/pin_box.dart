import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class PinBox extends StatefulWidget {
  const PinBox({
    super.key,
    required this.onChanged,
    this.length = 4,
    this.controller,
    this.onCompleted,
  });

  final ValueChanged onChanged;
  final int? length;
  final TextEditingController? controller;
  final Function(String)? onCompleted;

  @override
  State<PinBox> createState() => _PinBoxState();
}

class _PinBoxState extends State<PinBox> {
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: widget.length ?? 4,
      obscureText: false,
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      defaultPinTheme: PinTheme(
        width: 60,
        textStyle: AppTextStyles.heading2.copyWith(fontWeight: FontWeight.w400),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
