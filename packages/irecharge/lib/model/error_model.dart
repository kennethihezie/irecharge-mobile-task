class ErrorModel {
  String? errorCode, message;

  ErrorModel({this.errorCode, this.message});

  factory ErrorModel.fromMap(Map<String, dynamic> map){
    return ErrorModel(errorCode: map['errorCode'], message: map['message']);
  }
}
