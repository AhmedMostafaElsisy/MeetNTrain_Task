import 'dart:convert';

UserModel userBaseModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

List<UserModel> userListFromJson(List str) =>
    List<UserModel>.from(str.map((x) => UserModel.fromJson(x)));

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePicture;
  int? points;
  String? mobile;
  String? countryCode;
  bool? isVerified;
  bool? isTrusted;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.profilePicture,
      this.points,
      this.mobile,
      this.countryCode,
      this.isVerified,
      this.isTrusted});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      points: json['points'],
      mobile: json['mobile'],
      countryCode: json['country_code'],
      isVerified: json['is_verified'],
      isTrusted: json['isTrusted'],
    );
  }
}
