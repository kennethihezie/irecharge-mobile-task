import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileAssessmentApp extends StatelessWidget {
  final GoRouter router;
  const MobileAssessmentApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Irecharge',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
