import 'package:freezed_annotation/freezed_annotation.dart';

part 'emi_calculator.freezed.dart';
part 'emi_calculator.g.dart';

@freezed
class EmiCalculator with _$EmiCalculator {
  const factory EmiCalculator({
    required double amount,
    required double interest,
    required int period,
  }) = _EmiCalculator;

  factory EmiCalculator.fromJson(Map<String, dynamic> json) =>
      _$EmiCalculatorFromJson(json);
}
