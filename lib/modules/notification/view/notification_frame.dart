import 'package:flutter/material.dart';

class NotificationFrame extends StatelessWidget {
  NotificationFrame({Key? key}) : super(key: key);
  TimeOfDay time = const TimeOfDay(hour: 8, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimeOfDay.now() == time
            ? const Card(
                child: ListTile(
                  trailing: Icon(Icons.notifications),
                  title: Text('Class TIme'),
                ),
              )
            : Container(),
      ],
    );
  }
}
