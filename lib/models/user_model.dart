class UserModel {
  final String uId;
  final String username;
  final String email;
  final String phone;
  final String userImg;
  final String userDeviceToken;
  final String country;
  final String userAddress;
  final String street;
  final bool isAdmin;
  final bool isActive;
  final DateTime createOn;

  UserModel({
    required this.uId,
    required this.username,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.userDeviceToken,
    required this.country,
    required this.userAddress,
    required this.street,
    required this.isAdmin,
    required this.isActive,
    required this.createOn,
  });

  // Factory constructor for creating a new UserModel instance from a map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      userImg: json['userImg'] as String,
      userDeviceToken: json['userDeviceToken'] as String,
      country: json['country'] as String,
      userAddress: json['userAddress'] as String,
      street: json['street'] as String,
      isAdmin: json['isAdmin'] == 'true',
      isActive: json['isActive'] == 'true',
      createOn: DateTime.parse(json['createOn'] as String),
    );
  }

  // Method to convert UserModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'username': username,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'userAddress': userAddress,
      'street': street,
      'isAdmin': isAdmin.toString(),
      'isActive': isActive.toString(),
      'createOn': createOn.toIso8601String(),
    };
  }
}
