import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  final File file;

  Upload({Key key, this.file}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://wallpapers-fraz.appspot.com');

  StorageUploadTask uploadTask;

  void startUpload() {
    String filePath = 'PicFilters/${DateTime.now()}.png';
    setState(() {
      uploadTask = storage.ref().child(filePath).putFile(widget.file);
    });
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
    if (uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: uploadTask.events,
          builder: (context, snap) {
            var event = snap?.data?.snapshot;
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0.0;

            return Column(
              children: [
                if (uploadTask.isComplete) Text('Upload Completed'),
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} %'),
              ],
            );
          });
    } else {
      return FlatButton.icon(
        label: Text('Upload to Firebase'),
        icon: Icon(
          Icons.cloud_upload,
        ),
        onPressed: startUpload,
      );
    }
  }
}
