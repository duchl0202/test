import 'dart:async';

import 'package:emi_calculator/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField<T> extends StatefulWidget {
  const CustomReactiveTextField({
    required this.formControl,
    this.hintText,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.suffixIcon,
    this.suffix,
    this.labelText,
    this.keyboardType = TextInputType.multiline,
    this.textInputAction,
    this.maxLength,
    this.minLines,
    this.isRequired,
    this.inputFormatters,
    this.validatorMessage,
    this.decoration,
    this.contentPadding,
    this.obscureText = false,
    super.key,
    this.maxLines,
  });

  final FormControl<T> formControl;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final ReactiveFormFieldCallback<T>? onChanged;
  final ReactiveFormFieldCallback<T>? onSubmitted;
  final ReactiveFormFieldCallback<T>? onTap;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? isRequired;
  final List<TextInputFormatter>? inputFormatters;
  final Map<String, ValidationMessageFunction>? validatorMessage;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final bool obscureText;

  @override
  State<CustomReactiveTextField<T>> createState() =>
      _CustomReactiveTextFieldState<T>();
}

String formatNumber(String s) {
  final NumberFormat formatter = NumberFormat('#,##0', 'en_US');
  return formatter.format(int.tryParse(s) ?? 0);
}

class _CustomReactiveTextFieldState<T>
    extends State<CustomReactiveTextField<T>> {
  late StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = widget.formControl.valueChanges.listen((value) {
      if (value != null && value != '') {
        final text = value.toString();
        final number = formatNumber(text);
        widget.formControl.updateValue(number as T, emitEvent: false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          widget.labelText ?? '',
          style: theme.textTheme.titleMedium,
        ),
        ReactiveTextField<T>(
          validationMessages: widget.validatorMessage,
          maxLength: widget.maxLength,
          formControl: widget.formControl,
          minLines: widget.minLines,
          readOnly: widget.readOnly,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          onChanged: (value) => widget.onChanged?.call(value),
          onSubmitted: (value) => widget.onSubmitted?.call(value),
          onTap: (value) => widget.onTap?.call(value),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: widget.textAlign,
          decoration: InputDecoration(
            fillColor: context.colorScheme.primary.withOpacity(0.2),
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            suffixIcon: widget.suffixIcon,
            suffix: widget.suffix,
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
