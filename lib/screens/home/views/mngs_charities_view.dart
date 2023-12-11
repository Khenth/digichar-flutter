import 'package:digichar/screens/home/widgets/modal/charities_form.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../widgets/widgets.dart';

class MngsCharitiesView extends StatelessWidget {
  const MngsCharitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return CustomCard(
                  charityName:
                      'Excepteur officia Lorem veniam nostrud non Lorem ea.',
                  image: Constants.logoMeet,
                  contactInformation:
                      'Excepteur officia Lorem veniam nostrud non Lorem ea.',
                  missionStatement:
                      'Excepteur officia Lorem veniam nostrud non Lorem ea.',
                  payementInfos:
                      'Excepteur officia Lorem veniam nostrud non Lorem ea.',
              onDelete: (){},
              onEdit: (){},
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalCharitiesForm(context);
          },
          backgroundColor: colors.primary,
          shape: const CircleBorder(),
          child:  Icon(
            Icons.add,
            color: colors.onPrimary,
          )),
    );
  }
}
