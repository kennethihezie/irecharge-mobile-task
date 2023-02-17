part of 'home_cubit.dart';

enum HomeStateStatus{ initial, loading, success, failure }

extension HomeStateStatusX on HomeStateStatus {
  bool get initial => this == HomeStateStatus.initial;
  bool get loading => this == HomeStateStatus.loading;
  bool get success => this == HomeStateStatus.success;
  bool get failure => this == HomeStateStatus.failure;
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<Employee>? employees;

  const HomeState({this.status = HomeStateStatus.initial, this.employees});

  HomeState copyWith({HomeStateStatus? status, List<Employee>? employees}) {
    return HomeState(status: status ?? this.status, employees: employees);
  }

  @override
  List<Object?> get props => [status, employees];
}
