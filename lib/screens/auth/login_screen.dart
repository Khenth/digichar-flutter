import 'package:digichar/config/global/global.dart';
import 'package:digichar/screens/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: AuthBackground(
      children: [
        Text(
          'Sign In',
          style: texts.headlineMedium,
        ),
        ChangeNotifierProvider(
          create: (_) => LoginFormProvider(),
          child: const _LoginForm(),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'register'),
            child: Text(
              'Register',
              style: texts.titleLarge?.copyWith(
                  color: colors.primary, fontWeight: FontWeight.w500),
            )),
        const SizedBox(
          height: 10,
        ),
        Text('or sign in with',
            style: texts.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 10,
        ),
        Material(
          child: InkWell(
            onTap: () {},
            child: Image(image: Constants.logoGoogle, width: size.width * 0.15),
          ),
        )
      ],
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    // final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    return Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => loginForm.email = value,
              decoration: const InputDecoration(label: Text('Username')),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Password')),
              onChanged: (value) => loginForm.password = value,
            ),
            TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'forgot'),
                child: Text('Forgot password?', style: texts.bodyMedium)),
            const SizedBox(
              height: 10,
            ),
            ExpandedButtom(
              loading: loginForm.isLoading,
              text: 'LOGIN',
              marginhorizontal: 0,
              onTap: () async {
                FocusScope.of(context).unfocus();
                final authServices =
                    Provider.of<AuthService>(context, listen: false);
                if (!loginForm.isValidForm()) return;
                loginForm.isLoading = true;
                await authServices
                    .login(loginForm.email, loginForm.password)
                    .then((value) {
                  if (value == null) {
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    NotificationsServices.sucessIndicator(
                        context: context,
                        color: Colors.red,
                        icon: Icons.error_outline_outlined,
                        title: value);
                  }
                });
                loginForm.isLoading = false;
              },
            ),
          ],
        ));
  }
}
