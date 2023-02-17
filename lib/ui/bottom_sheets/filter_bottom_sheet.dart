import 'package:flutter/material.dart';

import '../widgets/filter_view.dart';

Future<void> showFilterBottomSheet(BuildContext context, Function(String) callback) async {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      builder: (builder) {
        return FractionallySizedBox(heightFactor: 0.2,child: FilterView(callback: callback,),);
      });
}
