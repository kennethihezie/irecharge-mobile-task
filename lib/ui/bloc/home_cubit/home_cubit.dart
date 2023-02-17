import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:irecharge/model/employee.dart';
import 'package:irecharge/repository/repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RepositoryService _repositoryService;
  HomeCubit(this._repositoryService) : super(const HomeState());

  Future<void> getAllEmployees() async {
    emit(state.copyWith(status: HomeStateStatus.loading));

    final employees = await _repositoryService.getAllEmployees();
    if (employees != null && employees.isNotEmpty) {
      emit(state.copyWith(
          status: HomeStateStatus.success, employees: employees));
    } else {
      emit(state.copyWith(status: HomeStateStatus.failure));
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
}
