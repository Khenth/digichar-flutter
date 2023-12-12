import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth/auth.dart';
import '../../../widgets/widgets.dart';
import '../widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileBackground(
      children: [_ProfileForm()],
    );
  }
}

class _ProfileForm extends StatelessWidget {
  const _ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final registerForm = Provider.of<RegisterFormProvider>(context);
    // final colors = Theme.of(context).colorScheme;
    // final texts = Theme.of(context).textTheme;
    return Form(
        // key: registerForm.formKey,
        child: Column(
          children: [
            TextFormField(
              // onChanged: (value) => registerForm.username = value,
              decoration: const InputDecoration(label: Text('Username')),
            ),
            TextFormField(
              // onChanged: (value) => registerForm.email = value,
              decoration: const InputDecoration(label: Text('Email')),
            ),
           DropdownButtonFormField(
            decoration: InputDecoration(label: Text('Genre')),
            
            items: [], onChanged: (v)=>{}),
            TextFormField(
              decoration: const InputDecoration(label: Text('Date Naissance')),
              // onChanged: (value) => registerForm.image = value,
            ),
            const SizedBox(
              height: 20,
            ),
            ExpandedButtom(
              // loading: registerForm.isLoading,
              text: 'REGISTER',
              marginhorizontal: 0,
              onTap: () async {
                FocusScope.of(context).unfocus();
                // final authServices =
                //     Provider.of<AuthService>(context, listen: false);
                // if (!registerForm.isValidForm()) return;
                // registerForm.isLoading = true;

                // await authServices
                //     .createUser(registerForm.username, registerForm.email,
                //         registerForm.password)
                //     .then((value) {
                //   if (value == null) {
                //     Navigator.pushReplacementNamed(context, 'home');
                //   } else {
                //     NotificationsServices.sucessIndicator(context: context, color: Colors.red, icon: Icons.error_outline_outlined, title: value );
                //   }
                // });

                // registerForm.isLoading = false;
              },
            ),
          ],
        ));
  }
}
