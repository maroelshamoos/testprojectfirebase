import '../entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel(
      {required super.fName,
      required super.lName,
      required super.email,
      required super.isAdmin,
      required super.phoneNumber,
      required super.points});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      email: json['email'],
      fName: json['f_name'],
      isAdmin: json['is_admin'],
      lName: json['l_name'],
      phoneNumber: json['phone_num'],
      points: json['points']);

  Map<String, dynamic> toJson() => {
        'email': email,
        'f_name': fName,
        'l_name': lName,
        'phone_num': phoneNumber,
        'points': points,
        'is_admin': isAdmin
      };
}
