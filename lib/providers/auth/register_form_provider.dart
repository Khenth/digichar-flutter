import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username    = '';
  String email    = '';
  String password = '';
  String confirmPassword = '';
  String image = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  
  bool isValidForm() {

    print(formKey.currentState?.validate());

    print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }

}