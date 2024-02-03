import 'package:flutter/material.dart';

class AppScaFold extends StatelessWidget {
  const AppScaFold({
    required this.body,
    this.hideKeyboardWhenTouchOutside = true,
    this.appBar,
    this.backgroundColor,
    super.key,
  });

  final Widget body;
  final bool hideKeyboardWhenTouchOutside;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;

  void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          if (hideKeyboardWhenTouchOutside) {
            hideKeyboard(context);
          }
        },
        child: body,
      ),
    );
  }
}
