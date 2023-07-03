class UserModel {
 final String name;
 final String email;
 final String createdAt;
 final String photo;
 final String phoneNumber;
 final String uid;

  UserModel({
    required this.name, 
    required this.email,
    required this.createdAt,
    required this.photo, 
    required this.phoneNumber, 
    required this.uid,
 });

// from map
 factory UserModel.fromMap(Map<String, dynamic> map) {
  return UserModel(
    name: map['name'] ?? '', 
    email: map['email'] ?? '', 
    createdAt: map['createdAt'] ?? '', 
    photo: map['photo'] ?? '', 
    phoneNumber: map['phoneNumber'] ?? '', 
    uid: map['uid'] ?? ''
    );
 }

//to map
Map<String, dynamic> toMap() {
  return {
     "name": name,
     "email": email,
     "createdAt": createdAt,
     "photo": photo,
     "phoneNumber": phoneNumber,
     "uid":uid,
  };
}


}