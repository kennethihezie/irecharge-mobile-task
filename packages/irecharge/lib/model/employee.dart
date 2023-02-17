import 'package:json_annotation/json_annotation.dart';
part 'employee.g.dart';

@JsonSerializable()
class Employee {
  num? id, level, productivity_score, employment_status;
  String? first_name, last_name, designation, current_salary;

  Employee(
      {this.id,
      this.first_name,
      this.last_name,
      this.designation,
      this.level,
      this.productivity_score,
      this.current_salary,
      this.employment_status});

  @override
  String toString() {
    return 'Employee{id: $id, first_name: $first_name, last_name: $last_name, designation: $designation, level: $level, productivity_score: $productivity_score, current_salary: $current_salary, employment_status: $employment_status}';
  }

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toMap(Employee employee){
    return _$EmployeeToJson(employee);
  }
}
