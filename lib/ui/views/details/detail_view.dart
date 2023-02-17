import 'package:flutter/material.dart';
import 'package:irecharge/model/employee.dart';
import 'package:mobile_assessment/ui/utils/color.dart';
import '../../utils/constants.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/typography.dart';

class DetailsView extends StatefulWidget {
  DetailsView({Key? key, this.bundle}) : super(key: key);
  Map<String, dynamic>? bundle;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  Employee? employee;
  Color? color;

  @override
  void initState() {
    employee = widget.bundle?['employee'];
    color = widget.bundle?['color'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobileAssessmentColors.background,
      appBar: customAppBar(
        title: "Employee Details",
        isActionEnabled: true,
      ),

      body: Container(
        padding: EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(minRadius: 50.0, backgroundColor: color, child: textHeading4("${employee?.first_name?.substring(0, 1)}${employee?.last_name?.substring(0, 1)}", Colors.white),),

                    Padding(padding: EdgeInsets.all(24)),

                    textHeading3("${employee?.first_name} ${employee?.last_name}", MobileAssessmentColors.A181212),

                    Padding(padding: EdgeInsets.all(6)),

                    textMiniMiniMedium("${employee?.designation}", MobileAssessmentColors.A181212),

                    Padding(padding: EdgeInsets.all(16)),
                  ],
                ),

                const Padding(padding: EdgeInsets.all(16)),

                textHeading3("Basic Information", MobileAssessmentColors.A181212),

                const Padding(padding: EdgeInsets.all(4)),

                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textMiniTextRegular("Designation", MobileAssessmentColors.A181212),

                            textSemiBold("${employee?.designation}", MobileAssessmentColors.A181212),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textMiniTextRegular("Level", MobileAssessmentColors.A181212),

                            textSemiBold("${employee?.level}", MobileAssessmentColors.A181212),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textMiniTextRegular("Productivity Score", MobileAssessmentColors.A181212),

                            textSemiBold("${employee?.productivity_score}", MobileAssessmentColors.A181212),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textMiniTextRegular("Current Salary", MobileAssessmentColors.A181212),

                            textSemiBold("\$${employee?.current_salary}", MobileAssessmentColors.A181212),
                          ],
                        ),
                      )
                    ],
                  ),
                ),


                const Padding(padding: EdgeInsets.all(4)),

                _showBtn(employee!.productivity_score!)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _showBtn(num score){
     if(score > 80){
       return CustomButton(title: Constants.promote, color: Colors.green, callback: (){},);
     } else if(score < 80 && score > 50){
       return CustomButton(title: Constants.noChange, color: Colors.blue, callback: (){},);
     } else if(score < 49 && score > 40){
       return CustomButton(title: Constants.demote, color: Colors.purple, callback: (){},);
     } else {
       return CustomButton(title: Constants.terminate, color: Colors.red, callback: (){},);
     }
  }
}