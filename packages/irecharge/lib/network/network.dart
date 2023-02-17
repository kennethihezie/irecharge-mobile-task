import 'package:irecharge/data/data.dart';
import 'package:irecharge/model/employee.dart';
import '../model/response.dart';


class NetworkService{
  Future<List<Employee>?> getAllEmployees() async {
    final response =  StatusResponse.fromJson(Api.successResponse);
    if(response.statusCode == 200 && response.message == 'Successful!'){
      List<Employee> employees = [];
      employees.addAll(response.data.map((e) =>  Employee.fromJson(e)));
      return employees;
      // return List<Employee>.from(response.data.map((data) { Employee.fromJson(data); }));
    }
    return null;
  }
}