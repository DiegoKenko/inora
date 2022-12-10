import 'package:firebase_storage/firebase_storage.dart';

final storageRef = FirebaseStorage.instance.ref();

Future<String> getFileFromStorage(String file) async {
  Reference reference = FirebaseStorage.instance.ref();
  Reference fileReference = reference.child(file);
  String imgUrl = await fileReference.getDownloadURL();
  return imgUrl;
}
