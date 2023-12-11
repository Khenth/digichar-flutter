import 'package:digichar/config/config.dart';
import 'package:digichar/screens/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LesCharitiesView extends StatelessWidget {
  const LesCharitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SearchBar(
            hintText: 'Search....',
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.symmetric(horizontal: 15)),
            trailing: [
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {
                  print('Use voice command');
                },
              ),
            ],
            onChanged: (String value) {
              print('value: $value');
            },
          ),
          Expanded(
            child: ListView.builder(
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
  
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
