import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class FirebaseDatabaseService {
  final dbInstance = FirebaseFirestore.instance;
  /*final eventList = [];
  final bookList = [];*/

  ///creating users
  void createUser({required UserModel userModel}) async {
    try {
      CollectionReference userCollection = await dbInstance.collection('users');
      await userCollection.add(userModel.toJson()).whenComplete(() {
        print('Account data added');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  ///This function is used to get user details from firebase
}
