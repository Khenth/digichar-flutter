import 'package:digichar/config/config.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String charityName;
  final String missionStatement;
  final String contactInformation;
  final String payementInfos;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const CustomCard(
      {super.key,
      required this.image,
      required this.charityName,
      required this.missionStatement,
      required this.contactInformation,
      required this.payementInfos,
      this.onEdit,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Stack(children: [
      Card(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                  image: Constants.logoMeet,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              // color: Colors.red,
              width: size.width * .61,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Charity Name:',
                    style: text.titleSmall,
                  ),
                  Text(
                    charityName,
                    style: text.titleSmall,
                  ),
                  Text(
                    'Mission statement:',
                    style: text.titleSmall,
                  ),
                  Text(
                    missionStatement,
                    style: text.bodyMedium,
                  ),
                  Text(
                    'Contact information:',
                    style: text.titleSmall,
                  ),
                  Text(
                    contactInformation,
                    style: text.bodyMedium?.copyWith(color: colors.tertiary),
                  ),
                  Text(
                    'Payement infos:',
                    style: text.titleSmall,
                  ),
                  Text(
                    payementInfos,
                    style: text.bodyMedium?.copyWith(color: colors.tertiary),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
 if(onEdit != null)     Positioned(
          top: 0,
          right: 0,
          child: IconButton.filled(
              onPressed: onEdit, icon: const Icon(Icons.edit_outlined))),
 if(onDelete != null)     Positioned(
          top: 0,
          right: 40,
          child: IconButton.filled(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(colors.error)),
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_forever_outlined,
                // color: colors.error,
              ))),
    ]);
  }
}
