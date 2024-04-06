class User {
  final String name;
  final String admissionNo;
  final String department;
  final String email;
  final String password;

  User({required this.name, required this.admissionNo, required this.department, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      admissionNo: json['admissionNo'],
      department: json['department'],
      email: json['email'],
      password: json['password'],
    );
  }
}
