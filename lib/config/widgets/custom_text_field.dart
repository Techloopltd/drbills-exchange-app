import 'package:amicons/amicons.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String? label;
  final String? initialValue;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool readOnly;
  final String hint;
  final String? errorText;

  const CustomTextField({
    super.key,
    this.text = '',
    this.hint = '',
    this.label,
    this.initialValue,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.prefixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: drGap(1.2, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: drGap(1, context),
        children: [
          Visibility(
            visible: text.isNotEmpty,
            child: Text(
              text,
              style: AppTextStyles.heading1.copyWith(fontSize: 14),
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            readOnly: readOnly,
            keyboardType: keyboardType,
            autocorrect: false,
            maxLines: null,
            initialValue: initialValue,
            onChanged: onChanged,
            onTap: onTap,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 14),
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              errorText: errorText,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.border),
              ),
              labelStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.black.withValues(alpha: .4),
                fontSize: 15,
              ),
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.black.withValues(alpha: .4),
                fontSize: 15,
              ),
              errorStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.error.withValues(alpha: .6),
                fontSize: 12,
              ),
              isDense: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}

class PassTextField extends StatefulWidget {
  final String text;
  final String? label;
  final TextEditingController? controller;

  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final String? hint;

  const PassTextField({
    super.key,
    this.text = '',
    this.label,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.hint,
  });

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: drGap(1.2, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: drGap(1, context),
        children: [
          Visibility(
            visible: widget.text.isNotEmpty,
            child: Text(
              widget.text,
              style: AppTextStyles.heading1.copyWith(fontSize: 14),
            ),
          ),
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            validator: widget.validator,
            readOnly: widget.readOnly,
            style: AppTextStyles.heading2.copyWith(fontSize: 14),
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.border),
              ),
              labelStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.black.withValues(alpha: .4),
                fontSize: 15,
              ),
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.black.withValues(alpha: .4),
                fontSize: 15,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Amicons.vuesax_eye_slash : Amicons.vuesax_eye,
                  color: AppColors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrDropdown extends StatefulWidget {
  const DrDropdown({
    super.key,
    required this.items,
    required this.text,
    this.onChanged,
    this.controller,
    this.hint,
    this.validator,
    this.initialValue,
  });

  final List<String> items;
  final String text;
  final String? hint;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<DrDropdown> createState() => _DrDropdownState();
}

class _DrDropdownState extends State<DrDropdown> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          text: widget.text,
          controller: widget.controller,
          onChanged: widget.onChanged,
          hint: widget.hint ?? '',
          initialValue: widget.initialValue,
          readOnly: true,
          validator: widget.validator,
          onTap: () => setState(() {
            open = !open;
          }),
          suffixIcon: Icon(
            Amicons.lucide_chevron_down,
            size: 16,
            color: AppColors.black.withValues(alpha: .4),
          ),
        ),
        Visibility(
          visible: open,
          replacement: const SizedBox.shrink(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: drWidth(context),
            constraints: BoxConstraints(maxHeight: drHeight(context) * .3),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  widget.onChanged!(widget.items[index]);
                  widget.controller?.text = widget.items[index];
                  setState(() {
                    open = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.items[index],
                    style: AppTextStyles.bodyMedium,
                  ),
                ),
              ),
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 8),
              itemCount: widget.items.length,
            ),
          ),
        ),
      ],
    );
  }
}
