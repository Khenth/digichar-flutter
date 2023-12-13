import 'package:digichar/services/services.dart';
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
    // return Form(
    //     // key: registerForm.formKey,
    //     child: Column(
    //       children: [
    //         TextFormField(
    //           // onChanged: (value) => registerForm.username = value,
    //           decoration: const InputDecoration(label: Text('Username')),
    //         ),
    //         TextFormField(
    //           // onChanged: (value) => registerForm.email = value,
    //           decoration: const InputDecoration(label: Text('Email')),
    //         ),
    //        DropdownButtonFormField(
    //         decoration: InputDecoration(label: Text('Genre')),
            
    //         items: [], onChanged: (v)=>{}),
    //         TextFormField(
    //           decoration: const InputDecoration(label: Text('Date Naissance')),
    //           // onChanged: (value) => registerForm.image = value,
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         ExpandedButtom(
    //           // loading: registerForm.isLoading,
    //           text: 'REGISTER',
    //           marginhorizontal: 0,
    //           onTap: () async {
    //             FocusScope.of(context).unfocus();
          
    //           },
    //         ),
    //       ],
    //     ));

  final user = Provider.of<AuthService>(context).user;

    return  Column(
      children: [
        
        Labels(label: 'Username', value: user!.username),
       const SizedBox(height: 20,),
        Labels(label: 'Email', value: user.email),
      ],
    );
  }
}

class Labels extends StatelessWidget {

 final String label;
 final String value;
  
  const Labels({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {

    final texts = Theme.of(context).textTheme;

    return Container(child: 
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text('$label:', style: texts.titleMedium,),
      Text(value, style: texts.titleMedium),
    ],),);
  }
}