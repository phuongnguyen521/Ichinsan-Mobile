import 'package:flutter/material.dart';

import '../../constants/Theme.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);
  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker>{
  DateTime datetime = DateTime(2022, 18, 6);
  String text = "DD/MM/YY";
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:  MaterialStateProperty.all<Color>(NowUIColors.white),
          ),
            child: Text(text,
              style: TextStyle(
                  color: NowUIColors.text,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          onPressed: () async{
            final date = await pickDate();
            if(date == null) return;
            setState(() => datetime = date);
            text = "${datetime.day}/${datetime.month}/${datetime.year}";
          },
        ),
      ),

    );
  }
  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: datetime,
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),
  );
}


