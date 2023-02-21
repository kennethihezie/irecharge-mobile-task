import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assessment/ui/utils/color.dart';
import 'package:mobile_assessment/ui/widgets/typography.dart';

class FilterView extends StatefulWidget {
  FilterView({Key? key, this.callback}) : super(key: key);
  Function(String)? callback;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool nameFilter = false;
  bool designationFilter = false;
  bool level = false;
  Function(String)? callback;


  @override
  void initState() {
    callback = widget.callback;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSemiBold(
                "Filter Employees By: ", MobileAssessmentColors.A181212),
            const Padding(padding: EdgeInsets.only(top: 16.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => {
                    setState(() {
                      nameFilter = true;
                      designationFilter = false;
                      level = false;
                    }),

                    callback?.call("Name"),
                    Navigator.pop(context)
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: nameFilter
                            ? null
                            : Border.all(color: Colors.blue, width: 2),
                        color: nameFilter ? Colors.green : null),
                    child: Center(
                        child: textMiniMiniMedium(
                            "Name",
                            nameFilter
                                ? Colors.white
                                : MobileAssessmentColors.A181212)),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 16.0)),
                InkWell(
                  onTap: () => {
                    setState(() {
                      nameFilter = false;
                      designationFilter = true;
                      level = false;
                    }),

                    callback?.call("Designation"),
                    Navigator.pop(context)
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: designationFilter
                            ? null
                            : Border.all(color: Colors.blue, width: 2),
                        color: designationFilter ? Colors.green : null),
                    child: Center(
                        child: textMiniMiniMedium(
                            "Designation",
                            designationFilter
                                ? Colors.white
                                : MobileAssessmentColors.A181212)),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 16.0)),
                InkWell(
                  onTap: () => {
                    setState(() {
                      nameFilter = false;
                      designationFilter = false;
                      level = true;
                    }),

                    callback?.call("Level"),
                    Navigator.pop(context)
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: level
                            ? null
                            : Border.all(color: Colors.blue, width: 2),
                        color: level ? Colors.green : null),
                    child: Center(
                        child: textMiniMiniMedium(
                            "Level",
                            level
                                ? Colors.white
                                : MobileAssessmentColors.A181212)),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
