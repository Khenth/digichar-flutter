import 'dart:developer';

import 'package:digichar/config/global/global.dart';
import 'package:digichar/screens/auth/widgets/widgets.dart';
import 'package:digichar/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: AuthBackground(
      children: [
        Text(
          'Register',
          style: texts.headlineMedium,
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterFormProvider(),
          child: const _RegisterForm(),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            child: Text('Already have an account?', style: texts.bodyMedium)),
      ],
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    // final colors = Theme.of(context).colorScheme;
    // final texts = Theme.of(context).textTheme;
    return Form(
        key: registerForm.formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => registerForm.username = value,
              decoration: const InputDecoration(label: Text('Username')),
            ),
            TextFormField(
              onChanged: (value) => registerForm.email = value,
              decoration: const InputDecoration(label: Text('Email')),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Password')),
              onChanged: (value) => registerForm.password = value,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(label: Text('Confirm password')),
              onChanged: (value) => registerForm.confirmPassword = value,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Image')),
              onChanged: (value) => registerForm.image = value,
            ),
            const SizedBox(
              height: 20,
            ),
            ExpandedButtom(
              loading: registerForm.isLoading,
              text: 'REGISTER',
              marginhorizontal: 0,
              onTap: () async {
                FocusScope.of(context).unfocus();
                final authServices =
                    Provider.of<AuthService>(context, listen: false);
                if (!registerForm.isValidForm()) return;
                registerForm.isLoading = true;

                await authServices
                    .createUser(registerForm.username, registerForm.email,
                        registerForm.password)
                    .then((value) {
                  if (value == null) {
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    NotificationsServices.sucessIndicator(context: context, color: Colors.red, icon: Icons.error_outline_outlined, title: value );
                  }
                });

                registerForm.isLoading = false;
              },
            ),
          ],
        ));
  }
}
