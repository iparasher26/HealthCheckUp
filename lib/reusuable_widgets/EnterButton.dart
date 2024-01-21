import 'package:flutter/material.dart';

import '../style.dart';

class EnterButton extends StatefulWidget {
  final double h;
  final double w;
  final String text;
  final VoidCallback function;
  const EnterButton({
    required this.h,
    required this.w,
    required this.text,
    required this.function,
});

  @override
  State<EnterButton> createState() => _EnterButtonState();
}

class _EnterButtonState extends State<EnterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: widget.function,
        child: Container(
          decoration: MyCartStyle.kScheduleButtonStyle,
          width: widget.w,
          height: widget.h,
          child: Center(child: Text(widget.text, style: MyCartStyle.kScheduleText),
        ),
      ),
     ),
    );
  }
}
