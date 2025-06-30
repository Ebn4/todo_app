class Authentification {
  final String email;
  final String password;

  Authentification({
    required this.email,
    required this.password,
  });

  factory Authentification.fromJson(Map<String, dynamic> json) {
    return Authentification(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}