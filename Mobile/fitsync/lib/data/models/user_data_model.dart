class UserDataModel {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String passwordConfirm;

  UserDataModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirm,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    firstName: json['firstName'],
    lastName: json['lastName'],
    username: json['username'],
    email: json['email'],
    password: json['password'],
    passwordConfirm: json['passwordConfirm'],
  );
}
