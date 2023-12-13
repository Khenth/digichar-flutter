import 'dart:developer';

import 'package:digichar/models/models.dart';
import 'package:flutter/material.dart';

class CharityFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Charity charity;

  CharityFormProvider(this.charity);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
