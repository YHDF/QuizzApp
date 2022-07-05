class User {
  final int userId;
  final String imagePath;
  final String name;
  final String email;
  final String token;

  const User({
    required this.userId,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.token
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        imagePath: responseData['imagePath'],
        name: responseData['name'],
        email: responseData['email'],
        token: responseData['access_token'],
    );
  }
}