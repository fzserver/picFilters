import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picFilters/pages/upload/upload.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File image;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      image = File(pickedFile.path);
    });
  }

  void clear() {
    setState(() => image = null);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pic Filters'),
      ),
      body: ListView(
        children: [
          if (image != null) ...[
            Image.file(image),
            Row(
              children: [
                FlatButton(
                  child: Icon(
                    Icons.refresh,
                  ),
                  onPressed: clear,
                ),
              ],
            ),
            Upload(file: image),
          ]
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.photo_camera,
            ),
            onPressed: () => pickImage(
              ImageSource.camera,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.photo_library,
            ),
            onPressed: () => pickImage(
              ImageSource.gallery,
            ),
          ),
        ],
      )),
    );
  }
}
