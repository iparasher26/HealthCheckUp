import 'package:flutter/material.dart';
import 'package:happyhealth_diagnostics/style.dart';

class SelectDateCube extends StatefulWidget {
  final double h;
  final double w;
  const SelectDateCube({
    required this.w,
    required this.h,
});

  @override
  State<SelectDateCube> createState() => _SelectDateCubeState();
}

class _SelectDateCubeState extends State<SelectDateCube> {

  DateTime _dateTime = DateTime.now();
  String displayDate='date';

  void _showDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030) //till 2030 you can book
    ).then((value) {
      setState(() {
        _dateTime=value!;
        displayDate=("${_dateTime.day}-${_dateTime.month}-${_dateTime.year}");
        debugPrint(displayDate);
      });
    });
  }

  TimeOfDay _timeOfDay = TimeOfDay.now();
  void _showTimePicker()  {}

  TimeOfDay _selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10), //outside the main container
      child: Container(
        decoration: MyCartStyle.kMyCartBoxDecoration,
        width: widget.w,
        height: widget.h,
        child: Padding(
          padding: const EdgeInsets.all(10.0),  //over-all content padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month_rounded, color: AppColours().kCardDarkBlue, size: 60,),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),  //date-time display container
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: MyCartStyle.kMyCartBoxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      _showDatePicker();
                                      setState(() {});
                                    },
                                    child: Text( displayDate, style: SelectDateCubeStyle.kBlueText,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: MyCartStyle.kMyCartBoxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      _selectTime(context);
                                      setState(() {});
                                    },
                                    child: Text( _selectedTime.toString(), style: SelectDateCubeStyle.kBlueText,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
