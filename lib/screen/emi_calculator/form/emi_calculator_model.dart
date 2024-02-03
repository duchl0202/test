import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'emi_calculator_model.freezed.dart';
part 'emi_calculator_model.g.dart';
part 'emi_calculator_model.gform.dart';

@freezed
@ReactiveFormAnnotation()
class EmiCalculatorModel with _$EmiCalculatorModel {
  const factory EmiCalculatorModel({
    @FormControlAnnotation(
      validators: [RequiredValidator()],
    )
    required String amount,
    @FormControlAnnotation(
      validators: [RequiredValidator()],
    )
    required double interest,
    @FormControlAnnotation(
      validators: [RequiredValidator()],
    )
    required int period,
  }) = _EmiCalculatorModel;

  factory EmiCalculatorModel.fromJson(Map<String, dynamic> json) =>
      _$EmiCalculatorModelFromJson(json);
}
