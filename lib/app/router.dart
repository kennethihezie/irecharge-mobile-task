import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:irecharge/model/employee.dart';
import 'package:mobile_assessment/app/routes.dart';
import 'package:mobile_assessment/ui/views/home/home_view.dart';
import '../di/di.dart';
import '../ui/bloc/home_cubit/home_cubit.dart';
import '../ui/views/details/detail_view.dart';


class MobileAssessmentRouter{
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: MobileAssessmentRoutes.home,
      builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(DiContainer.getIt.get()),
          child: const HomeView())
    ),

    GoRoute(
      path: MobileAssessmentRoutes.detailsView,
      builder: (context, state) => DetailsView(bundle: state.extra as Map<String, dynamic>?,),
    ),
  ]);
}