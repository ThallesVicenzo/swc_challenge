import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swc_challenge/view-model/providers/grills_rent_view_model.dart';
import 'package:swc_challenge/view/grill_rent/widgets/grill_preview.dart';

class GrillRent extends StatefulWidget {
  const GrillRent({super.key});

  @override
  State<GrillRent> createState() => _GrillRentState();
}

class _GrillRentState extends State<GrillRent> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GrillRentViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        automaticallyImplyLeading: viewModel.implyLeading,
        title: Text(
          'SWC Challenge',
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
      ),
      body: FutureBuilder(
        future: viewModel.returnData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).splashColor,
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    itemCount: viewModel.grillsModel.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    itemBuilder: (context, index) {
                      return GrillPreview(
                        grillsModel: viewModel.grillsModel[index],
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
