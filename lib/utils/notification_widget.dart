import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NotificationDialogWidget extends StatefulWidget {
  final  title,body;
  const NotificationDialogWidget({super.key, required this.title, required this.body});

  @override
  State<NotificationDialogWidget> createState() => _NotificationDialogWidgetState();
}

class _NotificationDialogWidgetState extends State<NotificationDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title.toString()),
      actions: [
        OutlinedButton.icon(onPressed: (){
        Navigator.of(context).pop();
        }, label: Text("Close"),
        icon: Icon(Icons.close),
        ),
      ],
      content: Column(children: [Text(widget.body)],),
    );
  }
}
