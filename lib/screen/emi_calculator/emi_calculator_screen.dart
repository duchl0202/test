import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:emi_calculator/core/extensions/theme_extension.dart';
import 'package:emi_calculator/i18n/strings.g.dart';
import 'package:emi_calculator/screen/emi_calculator/form/emi_calculator_model.dart';
import 'package:emi_calculator/screen/widget/app_scaffold.dart';
import 'package:emi_calculator/screen/widget/input_field/custom_reactive_text_field.dart';
import 'package:emi_calculator/screen/widget/layout_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

@RoutePage()
class EmiCalculatorScreen extends StatefulWidget {
  const EmiCalculatorScreen({super.key});

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  bool isCalculator = false;
  @override
  Widget build(BuildContext context) {
    return AppScaFold(
      appBar: AppBar(
        title: Text(t.core.emi_calculator),
      ),
      body: LayoutContent(
        child: Column(
          children: <Widget>[
            EmiCalculatorModelFormBuilder(
              builder: (context, formModel, child) {
                return Column(
                  children: [
                    CustomReactiveTextField<String>(
                      formControl: formModel.amountControl,
                      labelText: t.core.amount,
                      hintText: 'Ex: 1000000',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validatorMessage: {
                        ValidationMessage.required: (value) =>
                            t.core.is_required(field: t.core.amount),
                      },
                    ),
                    CustomReactiveTextField<double>(
                      formControl: formModel.interestControl,
                      labelText: '${t.core.interest} %',
                      hintText: 'Ex: 8.5',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*$')),
                      ],
                      validatorMessage: {
                        ValidationMessage.required: (value) =>
                            t.core.is_required(field: t.core.interest)
                      },
                    ),
                    CustomReactiveTextField<int>(
                      formControl: formModel.periodControl,
                      labelText: '${t.core.period} (${t.core.month})',
                      hintText: 'Ex: 120',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.phone,
                      validatorMessage: {
                        ValidationMessage.required: (value) =>
                            t.core.is_required(field: t.core.period),
                      },
                    ),
                    SizedBox(height: 16.w),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  formModel.form.reset();
                                  setState(() {
                                    isCalculator = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 8.w),
                                  side: BorderSide(
                                      color: context.colorScheme.primary,
                                      width: 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(
                                  t.core.reset,
                                  style: context.textTheme.labelLarge?.copyWith(
                                      color: context.colorScheme.primary),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ))),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: context.colorScheme.primary,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: OutlinedButton(
                                onPressed: () {
                                  if (formModel.form.invalid) {
                                    formModel.form.markAllAsTouched();
                                  } else {
                                    setState(() {
                                      isCalculator = true;
                                    });
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 8.w),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                ),
                                child: Text(
                                  t.core.calculate,
                                  style: context.textTheme.labelLarge?.copyWith(
                                      color: context.colorScheme.surface),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                        ),
                        if (isCalculator)
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: OutlinedButton(
                                        onPressed: () {
                                          if (formModel.form.invalid) {
                                            formModel.form.markAllAsTouched();
                                          }
                                        },
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor:
                                              context.colorScheme.tertiary,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.h, horizontal: 8.w),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          side: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                        ),
                                        child: Text(
                                          t.core.details,
                                          style: context.textTheme.labelLarge
                                              ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          const SizedBox.shrink()
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
