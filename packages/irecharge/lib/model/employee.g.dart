// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as num?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      designation: json['designation'] as String?,
      level: json['level'] as num?,
      productivity_score: json['productivity_score'] as num?,
      current_salary: json['current_salary'] as String?,
      employment_status: json['employment_status'] as num?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'productivity_score': instance.productivity_score,
      'employment_status': instance.employment_status,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'designation': instance.designation,
      'current_salary': instance.current_salary,
    };
