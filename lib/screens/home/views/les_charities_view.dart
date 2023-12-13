import 'package:digichar/config/config.dart';
import 'package:digichar/screens/home/widgets/widgets.dart';
import 'package:digichar/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LesCharitiesView extends StatefulWidget {
  const LesCharitiesView({super.key});

  @override
  State<LesCharitiesView> createState() => _LesCharitiesViewState();
}

class _LesCharitiesViewState extends State<LesCharitiesView> {

  @override
  void initState() {
     Provider.of<CharityService>(context, listen: false).getSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final charityService = Provider.of<CharityService>(context);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SearchBar(
            controller: TextEditingController(text: charityService.query ),
            hintText: 'Search....',
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(const EdgeInsets.symmetric(horizontal: 15)),
            trailing: [
              IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {
                  charityService.getSearch();
                  charityService.query = '';
                },
              ),
            ],
            onChanged: (String value) {
              charityService.query = value;
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: charityService.charitiesResult.length,
              itemBuilder: (BuildContext context, int index) {
                final charity = charityService.charitiesResult[index];
                return CustomCard(
                  charityName:
                      charity.nomInterviewer,
                  image: Constants.logoMeet,
                  contactInformation:
                      charity.nomInterviewee,
                  missionStatement:
                      charity.question,
                  payementInfos:
                      charity.reponse,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
