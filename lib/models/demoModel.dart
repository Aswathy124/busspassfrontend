class Signup {
  final String name;
  final String admissionNo;
  final String department;
  final String email;
  final String password;

  Signup({
    required this.name,
    required this.admissionNo,
    required this.department,
    required this.email,
    required this.password,
  });

  factory Signup.fromJson(Map<String, dynamic> json) {
    return Signup(
      name: json['name'],
      admissionNo: json['admissionNo'],
      department: json['department'],
      email: json['email'],
      password: json['password'],
    );
  }
}
