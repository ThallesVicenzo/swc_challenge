import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swc_challenge/model/grills.dart';
import 'package:swc_challenge/view/grill_rent/widgets/custom_bottom_sheet.dart';

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
                    return CustomBottomSheet(grillsModel: grillsModel);
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
