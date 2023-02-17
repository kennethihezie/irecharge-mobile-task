import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assessment/ui/utils/color.dart';
import 'package:mobile_assessment/ui/widgets/typography.dart';

class CustomButton extends StatelessWidget {
  final String title;
  Function callback;
  Color color;
  CustomButton({Key? key, required this.title, required this.callback, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color
      ),

      child: Builder(
          builder: (context) {
            return InkWell(
              onTap: () => callback.call(),

              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(child: textHeading3(title, Colors.white)),
              ),
            );
          }
      ),
    );
  }
}
