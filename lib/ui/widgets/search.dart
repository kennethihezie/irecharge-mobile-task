import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_assessment/ui/widgets/typography.dart';
import '../bottom_sheets/filter_bottom_sheet.dart';
import '../utils/color.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  Function(String)? onChange;
  Function(String)? callback;
  Function? removeFilter;
  String? filter;

  CustomSearchBar(
      {Key? key,
      required this.controller,
      this.onChange,
      this.callback,
        this.filter,
      this.removeFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: MobileAssessmentColors.lightGrey, width: 1.0),
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(0.0),
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 6.0, bottom: 6.0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          onChanged: onChange,
                          keyboardType: filter == 'Level'
                              ? TextInputType.number
                              : TextInputType.text,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Employee...",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                        ),
                      ),
                      if (filter != null)
                        InkWell(
                          onTap: () => {removeFilter?.call()},
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.green),
                            child: Row(
                              children: [
                                textMiniMiniMedium(filter ?? '', Colors.white),
                                const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      const Padding(padding: EdgeInsets.only(right: 16.0)),
                      SvgPicture.asset(
                        "assets/search.svg",
                        color: MobileAssessmentColors.lightGrey,
                        height: 20,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 16.0)),
                      InkWell(
                        onTap: () async {
                          await showFilterBottomSheet(context, callback!).then(
                              (value) => FocusScope.of(context).unfocus());
                        },
                        child: SvgPicture.asset('assets/switch.svg',
                            color: Colors.blue, height: 20),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 8.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
