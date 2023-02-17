import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assessment/ui/widgets/typography.dart';
import '../utils/color.dart';

PreferredSizeWidget customAppBar({required String title, required bool isActionEnabled}) {
  return AppBar(
    title: textSemiBold(title, MobileAssessmentColors.A181212),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
    actions: isActionEnabled ? const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.more_vert),
      )
    ] : null,
    actionsIconTheme: const IconThemeData(color: MobileAssessmentColors.A181212),
    iconTheme: const IconThemeData(color: MobileAssessmentColors.A181212),
  );
}

//
