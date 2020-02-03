import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  DateTimeDemo({Key key}) : super(key: key);

  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  @override
  Widget build(BuildContext context) {
    _selectDate() async {
      final DateTime date = await showDatePicker(
          context: context,
          initialDate: selectDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100));

      if (date == null) return;

      setState(() {
        selectDate = date;
      });
    }

    _selectTime() async {
      final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );

      if (time == null) return;

      setState(() {
        selectedTime = time;
      });
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DateTimeDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: _selectDate,
                child: Row(
                  children: <Widget>[
                    Text(DateFormat.yMd().format(selectDate)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              InkWell(
                onTap: _selectTime,
                child: Row(
                  children: <Widget>[
                    Text(selectedTime.format(context)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
