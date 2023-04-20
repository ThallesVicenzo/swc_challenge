import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swc_challenge/view-model/providers/calendar_view_model.dart';
import 'package:swc_challenge/view-model/routes/args/calendar_args.dart';
import 'package:swc_challenge/view/calendar/widgets/custom_alert_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
  });

  @override
  CalendarState createState() => CalendarState();
}

CalendarViewModel calendarViewModel = CalendarViewModel();

class CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    final calendarViewModel = Provider.of<CalendarViewModel>(context);
    final args = ModalRoute.of(context)!.settings.arguments as CalendarArgs;

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          final data = await calendarViewModel.getData(
            'grills',
            args.grillsModel.name,
            CalendarViewModel.formatedDate,
          );
          if (data.size == 0) {
            // ignore: use_build_context_synchronously
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  return CustomAlertDialog(
                    args: args,
                    calendarViewModel: calendarViewModel,
                  );
                });
          } else {
            // ignore: use_build_context_synchronously
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text(
                      'This date is already rented!',
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'OK',
                          style: Theme.of(context).primaryTextTheme.bodySmall,
                        ),
                      ),
                    ],
                  );
                });
          }
        },
        child: Text(
          'OK',
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
      ),
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Text(
          'SWC Challenge',
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
      ),
      body: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        firstDay: CalendarViewModel.startDay,
        lastDay: CalendarViewModel.lastDay,
        focusedDay: CalendarViewModel.today,
        selectedDayPredicate: (day) => isSameDay(day, CalendarViewModel.today),
        onDaySelected: (selectedDay, focusedDay) {
          calendarViewModel.updateDay(selectedDay, focusedDay);
        },
      ),
    );
  }
}
