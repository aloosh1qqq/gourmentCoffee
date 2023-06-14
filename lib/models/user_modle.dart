class UserModel {
  String? uid;
  String? email;
  String? username;
  String? type;

  UserModel({this.uid, this.email, this.username, this.type});

  // receive data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        type: map['type']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'username': username, 'type': type};
  }
}
