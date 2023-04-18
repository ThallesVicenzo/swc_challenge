import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swc_challenge/model/grills.dart';
import 'package:swc_challenge/view-model/routes/named_routes.dart';
import 'package:swc_challenge/view/calendar.dart';

import '../../../view-model/providers/grills_rent_view_model.dart';

class GrillPreview extends StatelessWidget {
  const GrillPreview({super.key, required this.grillsModel});

  final GrillsModel grillsModel;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GrillRentViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Theme.of(context).splashColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                grillsModel.image,
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ),
            TextButton(
              onPressed: () {
                viewModel.changeLeading();
                Scaffold.of(context).showBottomSheet<void>(
                  (BuildContext context) {
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
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
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
                                  );
                                },
                                child: Text(
                                  'Alugar',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyLarge,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    'Ver mais informações',
                    style: Theme.of(context).primaryTextTheme.bodySmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
