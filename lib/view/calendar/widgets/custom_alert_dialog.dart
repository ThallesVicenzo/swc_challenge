import 'package:flutter/material.dart';
import 'package:swc_challenge/view-model/providers/calendar_view_model.dart';
import 'package:swc_challenge/view-model/routes/args/calendar_args.dart';
import 'package:swc_challenge/view-model/routes/named_routes.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key, required this.args, required this.calendarViewModel});

  final CalendarArgs args;
  final CalendarViewModel calendarViewModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure you want to rent on the chosen date?',
        style: Theme.of(context)
            .primaryTextTheme
            .bodySmall!
            .copyWith(fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await calendarViewModel.setData(
              'grills',
              args.grillsModel.name,
              CalendarViewModel.formatedDate,
            );
            // ignore: use_build_context_synchronously
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text(
                      'Success!',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall!
                          .copyWith(fontSize: 20),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, NamedRoutes.grill);
                        },
                        child: Text('Go back to the start',
                            style:
                                Theme.of(context).primaryTextTheme.bodySmall!),
                      ),
                    ],
                  );
                });
          },
          child: Text(
            'Confirm',
            style: Theme.of(context).primaryTextTheme.bodySmall,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: Theme.of(context).primaryTextTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
