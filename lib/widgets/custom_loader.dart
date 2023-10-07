import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  Color color;
  double size;
  double width;
  CustomLoader({this.color = Colors.blue, this.size = 16, this.width = 2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          strokeWidth: width,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}