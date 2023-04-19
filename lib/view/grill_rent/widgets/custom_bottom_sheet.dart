import 'package:flutter/material.dart';
import 'package:swc_challenge/model/grills.dart';
import 'package:swc_challenge/view-model/routes/args/calendar_args.dart';
import 'package:swc_challenge/view/calendar/calendar.dart';

import '../../../view-model/routes/named_routes.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.grillsModel});

  final GrillsModel grillsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).splashColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                grillsModel.image,
                scale: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    grillsModel.description.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).highlightColor,
                  width: 2,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    NamedRoutes.calendar,
                    arguments: CalendarArgs(grillsModel: grillsModel),
                  );
                },
                child: Text(
                  'Alugar',
                  style: Theme.of(context).primaryTextTheme.bodyLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
