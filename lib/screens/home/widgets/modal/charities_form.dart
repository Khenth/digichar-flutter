import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';
import '../custom_text_field.dart';

Future<dynamic> showModalCharitiesForm(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const CharitiesForm();
      });
}

class CharitiesForm extends StatelessWidget {
  const CharitiesForm({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Charity',
                style: texts.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Charity Name',
                label: 'Charity Name',
              ),
              CustomTextField(
                hintText: 'Mission statement',
                label: 'Mission statement',
              ),
              CustomTextField(
                hintText: 'Contact information',
                label: 'Contact information',
              ),
              CustomTextField(
                hintText: 'Payement infos',
                label: 'Payement infos',
              ),
              const SizedBox(
                height: 15,
              ),
              ExpandedButtom(
                text: 'Guardar',
                marginhorizontal: 0,
                onTap: () {
                  // inspectionForm.touchEveryField();
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
