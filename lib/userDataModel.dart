class UserDataModel {
  final String name;
  final String userName;
  final String email;
  final String phoneNumber;
  final String website;

  UserDataModel(
      {this.name, this.userName, this.email, this.phoneNumber, this.website});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      phoneNumber: json['phone'],
      website: json['website'],
    );
  }
}
