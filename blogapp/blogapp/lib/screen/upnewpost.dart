import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
typedef onSaveCallBack = Function(File image, String title);

class UpNewPost extends StatefulWidget {
  final onSaveCallBack onSave;

  const UpNewPost({Key key, @required this.onSave}) : super(key: key);
  @override
  _UpNewPostState createState() => _UpNewPostState();
}

class _UpNewPostState extends State<UpNewPost> {
  File image;
  String urlFile;
  final _formKey = GlobalKey<FormState>();
  var timeKey = DateTime.now().toString();
  TextEditingController _postTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add new'),
      ),
      body: image == null
          ? _noImage()
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(image),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _postTitle,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Titlenot empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Title'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: upLoadPost,
                        child: Text('Add'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.red,
      ),
    );
  }

  void upLoadPost() async {
    if (_formKey.currentState.validate()) {
      widget.onSave(image, _postTitle.text);
      Navigator.of(context).pop();
    }
  }

  Future getImage() async {
    // ignore: unnecessary_cast
    PickedFile photo =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      image = File(photo.path);
    });
  }

  Widget _noImage() {
    return Center(
      child: Text('Select a image'),
    );
  }
}
