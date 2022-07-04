class User {
  int userId;
  String name;
  String email;
  String phone;
  String token;

  User({required this.userId, required this.name, required this.email, required this.phone, required this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        phone: responseData['phone'],
        token: responseData['access_token'],
    );
  }
}