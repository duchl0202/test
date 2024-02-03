import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormValidators {
  static Map<String, dynamic>? required(AbstractControl<dynamic> control) {
    return Validators.required(control);
  }
}
