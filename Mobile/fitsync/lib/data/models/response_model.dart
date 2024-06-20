class ResponseModel {
  final String? token;
  final String? message;
  final String? status;
  final Map<String, dynamic>? data;

  ResponseModel({
    required this.token,
    required this.message,
    required this.status,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    token: json['token'] ?? '',
    message: json['message'] ?? '',
    status: json['status'] ?? '',
    data: json['data']['userInfo'] ?? '',
  );
}
