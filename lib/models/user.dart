class User{
  final int? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String login;
  final String password;
  final String imageUrl;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.login,
    required this.imageUrl
  });


   // Getter for user ID
  int? get getUserId => userId;

  // Setter for user ID
  set setUserId(int? userId) => userId = userId;
    

  factory User.fromJson(Map<String, dynamic> json) {
  return User(
    userId: json['userId'] ?? 0, // Utilisation d'une valeur par défaut de 0 si 'userId' est null.
    firstName: json['firstName'] ?? '',
    lastName: json['lastName'] ?? '',
    email: json['email'] ?? '',
    login: json['login'] ?? '',
    password: json['password'] ?? '',
    imageUrl: json['imageUrl'] ?? '',
  );
}


  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "login": login,
    "password": password,
    "imageUrl": imageUrl,
  };
}