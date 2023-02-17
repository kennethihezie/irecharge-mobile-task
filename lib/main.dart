import 'package:flutter/cupertino.dart';
import 'package:irecharge/database/database_helper.dart';
import 'package:mobile_assessment/app/app.dart';

import 'app/router.dart';
import 'di/di.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DiContainer.setUpDi();

  await DatabaseHelper.openDataBase();

  runApp(MobileAssessmentApp(router: MobileAssessmentRouter.router));
}
