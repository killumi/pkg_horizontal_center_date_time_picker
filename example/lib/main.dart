import 'package:flutter/material.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import 'package:horizontal_center_date_picker/date_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  DatePickerController _datePickerController = DatePickerController();

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    DateTime startDate = now.subtract(Duration(days: 14));
    DateTime endDate = now.add(Duration(days: 7));
    print('startDate = $startDate ; endDate = $endDate');
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              color: Colors.red,
            ),
          ),
          HorizontalDatePickerWidget(
            locale: 'ja_JP',
            startDate: startDate,
            dateItemComponentList: [DateItem.Day],
            endDate: endDate,
            selectedDate: now,
            itemMargin: 6,
            width: 42,
            height: 30,
            widgetWidth: 294,
            datePickerController: _datePickerController,
            radius: 10,
            onValueSelected: (date) {
              print('selected = ${date.toIso8601String()}');
            },
          ),
          Expanded(
            child: Container(
              height: 40,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
