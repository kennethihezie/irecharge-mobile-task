import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:irecharge/model/employee.dart';
import 'package:mobile_assessment/app/routes.dart';
import 'package:mobile_assessment/ui/utils/color.dart';
import 'package:mobile_assessment/ui/widgets/typography.dart';

class EmployeeModel extends StatelessWidget {
  final Employee? employee;
  final Color color;
  const EmployeeModel({Key? key, this.employee, required this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.push(MobileAssessmentRoutes.detailsView, extra: {'employee': employee, 'color': color });
      },

      child: Container(
        margin: EdgeInsets.only(bottom: 12.0, top: 16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CircleAvatar(minRadius: 25.0, backgroundColor: color, child: textHeading3("${employee?.first_name?.substring(0, 1)}${employee?.last_name?.substring(0, 1)}", Colors.white),),

                const Padding(padding: EdgeInsets.only(left: 8.0)),

                Expanded(child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    textMiniMiniMedium("${employee?.first_name} ${employee?.last_name}", MobileAssessmentColors.A181212),

                    const Padding(padding: EdgeInsets.all(2.0)),

                    textMiniTextRegular("${employee?.designation}", MobileAssessmentColors.A181212),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
