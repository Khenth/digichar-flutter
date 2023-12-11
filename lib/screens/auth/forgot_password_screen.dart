import 'package:digichar/config/global/global.dart';
import 'package:digichar/screens/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: AuthBackground(
      children: [
        Text(
          'Reset Password',
          style: texts.headlineMedium,
        ),
        const SizedBox(
          height: 15,
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordFormProvider(),
          child: const _ForgotPasswordForm(),
        ),
        const SizedBox(
          height: 10,
        ),
        
           TextButton(
                onPressed: () =>Navigator.pushReplacementNamed(context, 'login'),
                child: Text('Already have an account?', style: texts.bodyMedium)),
      ],
    ));
  }
}

class _ForgotPasswordForm extends StatelessWidget {
  const _ForgotPasswordForm();

  @override
  Widget build(BuildContext context) {
    final forgotPasswordFormProvider = Provider.of<ForgotPasswordFormProvider>(context);
    // final colors = Theme.of(context).colorScheme;
    // final texts = Theme.of(context).textTheme;
    return Form(
        key: forgotPasswordFormProvider.formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => forgotPasswordFormProvider.email = value,
              decoration: const InputDecoration(label: Text('Email')),
            ),
        
            const SizedBox(
              height: 20,
            ),
            ExpandedButtom(
              loading: forgotPasswordFormProvider.isLoading,
              text: 'RESET',
              marginhorizontal: 0,
              onTap: ()async {
               FocusScope.of(context).unfocus();
                if(!forgotPasswordFormProvider.isValidForm()) return;
                forgotPasswordFormProvider.isLoading = true;

               await Future.delayed(Duration(seconds: 2));

                forgotPasswordFormProvider.isLoading = false;

                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ));
  }
}
