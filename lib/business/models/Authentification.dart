class Authentification {
  String email;
  String password;

  Authentification({
    required this.email,
    required this.password
  });

  Map toJson() {
    return {
      "email": email,
      "password": password
    };
  }
}
