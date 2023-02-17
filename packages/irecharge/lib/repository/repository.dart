import 'package:irecharge/database/database_helper.dart';
import '../database/db_constants.dart';
import '../model/employee.dart';
import '../network/network.dart';

class RepositoryService{
  final NetworkService _networkService;
  RepositoryService(this._networkService);


  Future<List<Employee>?> getAllEmployees() async {
    final localEmployees = await DatabaseHelper.getAllModel(DBConstants.employeeTableName);
    if(localEmployees != null && localEmployees.isNotEmpty){
      List<Employee> employees = [];
      employees.addAll(localEmployees.map((e) =>  Employee.fromJson(e)));
      return employees;
      // return List<Employee>.from(employees.map((data) { Employee.fromJson(data); }));
    }

    final networkEmployees = await _networkService.getAllEmployees();
    if(networkEmployees != null){
      await DatabaseHelper.insertModelBatch(DBConstants.employeeTableName, networkEmployees.map((e) => e.toMap(e)).toList());
      return networkEmployees;
    }

    return null;
  }
}