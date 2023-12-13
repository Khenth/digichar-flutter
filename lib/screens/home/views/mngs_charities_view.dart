import 'package:digichar/models/models.dart';
import 'package:digichar/screens/home/widgets/modal/charities_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';
import '../../../services/services.dart';
import '../widgets/widgets.dart';

class MngsCharitiesView extends StatefulWidget {
  const MngsCharitiesView({super.key});

  @override
  State<MngsCharitiesView> createState() => _MngsCharitiesViewState();
}

class _MngsCharitiesViewState extends State<MngsCharitiesView> {

  @override
  void initState() {
    Provider.of<CharityService>(context, listen: false).getCharities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
      final charityService = Provider.of<CharityService>(context);
    return Scaffold(
      body: ListView.builder(
              itemCount: charityService.charities.length,
              itemBuilder: (BuildContext context, int index) {
                    final charity = charityService.charities[index];
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
              onDelete: ()=>charityService.deleteCharity(charity),
              onEdit: ()=> showModalCharitiesForm(context, charity),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Charity charity = Charity(nomInterviewee: '', nomInterviewer: '',question: '',reponse: ''); 
            showModalCharitiesForm(context, charity);
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
