class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  const UserModel(
      {this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.phone});
}
