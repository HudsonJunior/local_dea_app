import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  dynamic listDeas() async {
    final collection = firestore.collection('deas');
    final response = await collection.get();

    for (var dea in response.docs) {
      dea.data();
    }
  }
}
