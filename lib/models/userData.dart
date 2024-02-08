class UserData {
  const UserData({
    required this.id,
    required this.access_token,
    required this.fullname,
    required this.email,
    required this.role,
  });

  final String id;
  final String access_token;
  final String fullname;
  final String email;
  final String role;
}
