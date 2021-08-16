import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import '../model/post.dart';

class Reponsitory {
  final dataRef = FirebaseFirestore.instance;
  Stream<List<Post>> getPost() {
    return dataRef.collection('posts').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Post.fomJson(doc.data())).toList();
    });
  }

  Future<void> pushPost(File image, String title) async {
    String urlFile;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child('Image').child(DateTime.now().toString());

    UploadTask storageUploadTask = ref.putFile(image);
    var imageUrl = await (await storageUploadTask).ref.getDownloadURL();
    urlFile = imageUrl.toString();

    var dbTime = DateTime.now();
    var formatDate = DateFormat('MMM d,yyyy');
    var formaTime = DateFormat('EEEE , hh:mm aaa');
    String time = formaTime.format(dbTime);
    String date = formatDate.format(dbTime);
    dataRef.collection('posts').doc().set({
      'image': urlFile,
      'title': title,
      'date': date,
      'time': time,
    });
  }
}
