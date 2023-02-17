class StatusResponse{
  final int statusCode;
  final String message;
  final dynamic errors;
  final List<Map<String, dynamic>> data;

  StatusResponse({this.statusCode = 0, this.message = '', this.errors, this.data = const []});

  factory StatusResponse.fromJson(Map json){
    return StatusResponse(
        statusCode: json['statusCode'],
        message: json['message'],
        errors: json['errors'],
        data: json['data']
    );
  }

  Map<String, dynamic> toJson(StatusResponse response){
    return {
      "statusCode" : response.statusCode,
      "message" : response.message,
      "errors" : response.errors,
      "data" : response.data
    };
  }
}