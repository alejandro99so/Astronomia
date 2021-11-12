import 'package:astronomycalculator/theme.dart';
import 'package:flutter/material.dart';

class ButtonSelectWidget extends StatelessWidget {
  final Size size;
  final String text;
  final Function pressed;
  final int type;
  ButtonSelectWidget(
      {@required this.size,
      @required this.text,
      @required this.pressed,
      @required this.type});

  @override
  Widget build(BuildContext context) {
    return Container( 
      child: TextButton(
        onPressed: pressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: type==1 ? Colors.white: Colors.black),
          ),
        ),
      ),
      height: 50,
      width: 0.9 * size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: type == 1 ? appTheme.buttonColor : appTheme.hintColor,
      ),
    );
  }
}
