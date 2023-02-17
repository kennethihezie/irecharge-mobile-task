import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:irecharge/data/data.dart';
import 'package:irecharge/model/employee.dart';
import 'package:irecharge/model/error_model.dart';
import 'package:irecharge/repository/repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RepositoryService _repositoryService;
  HomeCubit(this._repositoryService) : super(HomeState());

  Future<void> getAllEmployees(bool isFirst) async {
    if(isFirst){
      emit(state.copyWith(status: HomeStateStatus.failure, error: ErrorModel.fromMap(randError())));
    } else {
      emit(state.copyWith(status: HomeStateStatus.loading));

      final employees = await _repositoryService.getAllEmployees();
      if (employees != null && employees.isNotEmpty) {
        emit(state.copyWith(
            status: HomeStateStatus.success, employees: employees));
      } else {
        emit(state.copyWith(status: HomeStateStatus.failure));
      }
    }
  }

  Future<void> searchEmployees(String query, {String? filter}) async {
    final employees = await _repositoryService.getAllEmployees();

    if (query.isEmpty) {
      if (employees != null && employees.isNotEmpty) {
        emit(state.copyWith(
            status: HomeStateStatus.success, employees: employees));
        return;
      }
    }

    switch (filter) {
      case 'Name':
        emit(state.copyWith(
            status: HomeStateStatus.success,
            employees: employees!
                .where((element) => element.first_name!.toLowerCase().contains(query.toLowerCase()))
                .toList()));
        break;

      case 'Designation':
        emit(state.copyWith(
            status: HomeStateStatus.success,
            employees: employees!
                .where((element) => element.designation!.toLowerCase().contains(query.toLowerCase()))
                .toList()));
        break;

      case 'Level':
        emit(state.copyWith(
            status: HomeStateStatus.success,
            employees: employees!
                .where((element) => element.level! == int.tryParse(query))
                .toList()));
        break;

      default:
        emit(state.copyWith(
            status: HomeStateStatus.success,
            employees: employees!
                .where((element) => element.first_name!.toLowerCase().contains(query.toLowerCase()))
                .toList()));
        break;
    }
  }

  Map<String, dynamic> randError() {
    final errorRes = Api.errorResponse['errors'] as List;
    final random = Random();

    return errorRes[random.nextInt(errorRes.length)];
  }
}
