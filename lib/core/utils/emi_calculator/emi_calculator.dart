import 'dart:math';

import 'package:emi_calculator/data/model/emi_calculator/emi_info.dart';

class EmiCalculator {
  double principal;
  double annualInterestRate;
  int loanTermInMonths;

  EmiCalculator({
    required this.principal,
    required this.annualInterestRate,
    required this.loanTermInMonths,
  });

  double calculateEMI() {
    final double monthlyInterestRate = annualInterestRate / 12 / 100;
    final double emi = principal *
        (monthlyInterestRate * pow(1 + monthlyInterestRate, loanTermInMonths)) /
        (pow(1 + monthlyInterestRate, loanTermInMonths) - 1);
    return emi;
  }

  double calculateTotalInterest() {
    final double emi = calculateEMI();
    final double totalInterest = (emi * loanTermInMonths) - principal;
    return totalInterest;
  }

  double calculateTotalPayment() {
    final double emi = calculateEMI();
    final double totalPayment = emi * loanTermInMonths;
    return totalPayment;
  }

  List<EmiInfo> calculateEMIDetails(
      double principal, double annualInterestRate, int loanTermInMonths) {
    final List<EmiInfo> emiDetails = [];

    final double monthlyInterestRate = annualInterestRate / 12 / 100;
    final double emi = principal *
        (monthlyInterestRate * pow(1 + monthlyInterestRate, loanTermInMonths)) /
        (pow(1 + monthlyInterestRate, loanTermInMonths) - 1);

    double remainingBalance = principal;

    for (int i = 1; i <= loanTermInMonths; i++) {
      final double interestPayment = remainingBalance * monthlyInterestRate;
      final double principalPayment = emi - interestPayment;

      remainingBalance -= principalPayment;

      final EmiInfo emiInfo = EmiInfo(
        month: i,
        principal: principalPayment,
        interest: interestPayment,
        balance: remainingBalance,
      );

      emiDetails.add(emiInfo);
    }

    return emiDetails;
  }
}
