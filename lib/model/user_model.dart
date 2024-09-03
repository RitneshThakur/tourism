
class UserModel {
  String? id;
  String? fullName;
  int? phoneNumber;
//  String? birthDate;
  String? address;
 // String? imageURL;
  //String? role;

  UserModel(
      {this.id,
       // this.role,
        this.fullName,
        this.phoneNumber,
       // this.birthDate,
        this.address,
       // this.imageURL
      });

  ///This function is used to convert flutter model object to firebase readable json
  toJson() {
    return {
      //'imageURL': imageURL,
      'id': id,
      'full_name': fullName,
      'phoneNumber': phoneNumber,
      //'birthDate': birthDate,
      'address': address,
     // 'role': role
    };
  }

  factory UserModel.fromJson(
      documentSnapshot) {
    final data = documentSnapshot.data();
    return UserModel(
        id: data['id'],
        fullName: data['full_name'],
        phoneNumber: data['phoneNumber'],
       // birthDate: data['birthDate'],
        address: data['address'],
        //imageURL: data['imageURL'],
        //role: data['role']
        );
  }
}
