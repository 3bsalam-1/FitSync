class ResponseModel {
  final String? token;
  final String? message;
  final String? status;

  ResponseModel({
    required this.token, 
    required this.message,
    required this.status,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    token: json['token'] ?? '',
    message: json['message'] ?? '',
    status: json['status'] ?? '',
  );
}
