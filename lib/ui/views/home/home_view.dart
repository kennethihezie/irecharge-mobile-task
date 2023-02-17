import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/home_cubit/home_cubit.dart';
import '../../utils/color.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/employee_model.dart';
import '../../widgets/failed_state.dart';
import '../../widgets/search.dart';
import '../../widgets/typography.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _searchController = TextEditingController();
  String? filter;

  @override
  void initState() {
    context.read<HomeCubit>().getAllEmployees(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Employee Directory",
        isActionEnabled: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchBar(
              controller: _searchController,
              filter: filter,
              onChange: (query) async {
                await context.read<HomeCubit>().searchEmployees(query, filter: filter);
              },
              callback: (value) {
                setState(() {
                  filter = value;
                });
              },
              removeFilter: () {
                setState(() {
                  filter = null;
                });
              },
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.status) {
                  case HomeStateStatus.loading:
                    return const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Center(child: CircularProgressIndicator()),
                    );

                  case HomeStateStatus.success:
                    return Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => EmployeeModel(
                        color: _pickRandomColor(),
                        employee: state.employees?[index],
                      ),
                      itemCount: state.employees?.length,
                    ));

                  case HomeStateStatus.failure:
                    Future.delayed(const Duration(milliseconds: 3000), () async {
                      context.read<HomeCubit>().getAllEmployees(false);
                    });
                    return  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                      child: FailedState(error: state.error,),
                    );

                  default:
                    return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Color _pickRandomColor() {
    final list = [
      MobileAssessmentColors.A55AEFF,
      MobileAssessmentColors.DF8A5A,
      MobileAssessmentColors.C3835E,
      MobileAssessmentColors.C16666,
      MobileAssessmentColors.A2B99FF,
      MobileAssessmentColors.A0085FF,
      MobileAssessmentColors.A27AE60
    ];

    final random = Random();

    return list[random.nextInt(list.length)];
  }
}
