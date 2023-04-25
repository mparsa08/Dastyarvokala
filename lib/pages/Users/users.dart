class Users {
  final String username;
  final String? email;
  final String? realname;
  final String password;

  Users({
    this.email,
    required this.username,
    this.realname,
    required this.password,
  });
}
