import 'package:digichar/providers/charities/charity_form_provider.dart';
import 'package:digichar/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/models.dart';
import '../../../../widgets/widgets.dart';
import '../custom_text_field.dart';

Future<dynamic> showModalCharitiesForm(BuildContext context, Charity charity) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(create: (_)=>CharityFormProvider(charity), child: const CharitiesForm(),);
        
        
      });
}

class CharitiesForm extends StatelessWidget {
  const CharitiesForm({super.key});
  @override
  Widget build(BuildContext context) {
  final chariryFormProvider = Provider.of<CharityFormProvider>(context);
    final chariryService = Provider.of<CharityService>(context, listen: false);
    final texts = Theme.of(context).textTheme;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: chariryFormProvider.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
               chariryFormProvider.charity.id == null ? 'Add Charity' : 'Update Charity',
                style: texts.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Charity Name',
                label: 'Charity Name',
                initialValue: chariryFormProvider.charity.nomInterviewer,
                onChanged: (v)=> chariryFormProvider.charity.nomInterviewer = v,
              ),
              CustomTextField(
                hintText: 'Mission statement',
                label: 'Mission statement',
                initialValue: chariryFormProvider.charity.nomInterviewee,
                onChanged: (v)=> chariryFormProvider.charity.nomInterviewee = v
              ),
              CustomTextField(
                hintText: 'Contact information',
                label: 'Contact information',
                initialValue: chariryFormProvider.charity.question,
                onChanged: (v)=> chariryFormProvider.charity.question = v
              ),
              CustomTextField(
                hintText: 'Payement infos',
                label: 'Payement infos',
                initialValue: chariryFormProvider.charity.reponse,
                onChanged: (v)=> chariryFormProvider.charity.reponse = v
              ),
              const SizedBox(
                height: 15,
              ),
              ExpandedButtom(
                text: chariryFormProvider.charity.id == null ? 'Save' : 'Update',
                marginhorizontal: 0,
                onTap: () async{
                if( chariryFormProvider.isValidForm()){
                 await chariryService.submitCharity(chariryFormProvider.charity).then((value) {
                  if(value != null) Navigator.pop(context);
                 });
                } 
                  // if (inspectionFormState.isValid) context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
