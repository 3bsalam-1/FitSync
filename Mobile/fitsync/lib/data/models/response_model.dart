class ResponseModel {
  final String token;
  final String message;

  ResponseModel({required this.token, required this.message});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    token: json['token'] ?? '',
    message: json['message'] ?? '',
  );
}
