import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irecharge/model/error_model.dart';
import 'package:mobile_assessment/ui/utils/color.dart';
import 'package:mobile_assessment/ui/widgets/typography.dart';

class FailedState extends StatelessWidget {
  const FailedState({Key? key, this.error}) : super(key: key);
  final ErrorModel? error;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_outlined, size: 50, color: Colors.red,),

          const Padding(padding: EdgeInsets.all(16)),

          textHeading3(error?.errorCode ?? '', MobileAssessmentColors.A181212),

          const Padding(padding: EdgeInsets.all(2)),

          textSemiBold(error?.message ?? '', MobileAssessmentColors.A181212),

          const Padding(padding: EdgeInsets.all(16)),

          const CircularProgressIndicator(),

          const Padding(padding: EdgeInsets.all(4)),

          textMiniTextRegular("Retrying.....", MobileAssessmentColors.A181212)
        ],
      ),
    );
  }
}
