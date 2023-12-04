import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadWithHttp extends StatefulWidget {
  @override
  _FileUploadWithHttpState createState() => _FileUploadWithHttpState();
}

class _FileUploadWithHttpState extends State<FileUploadWithHttp> {
  PlatformFile objFile = PlatformFile(
    name: "No File Selected",
    size: 0,
    bytes: Uint8List(0),
    readStream: null,
  );

  void chooseFileUsingFilePicker() async {
    //-----pick file by file picker,

    var result = await FilePicker.platform.pickFiles(
      withReadStream:
          true, // this will return PlatformFile object with read stream
    );
    if (result != null) {
      setState(() {
        objFile = result.files.single;
      });
    }
  }

  void uploadSelectedFile() async {
    // we need to prevent Uncaught (in promise) Error: Bad state: Stream has already been listened to. that happens when we press upload button multiple times

    //---Create http package multipart request object
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("https://monitoria-api.onrender.com/batch_create_users"),
    );

    if (objFile.readStream == null) {
      print("No file selected.");
      return;
    }
    //-----add selected file with request
    request.files.add(new http.MultipartFile(
        "file", objFile.readStream!, objFile.size,
        filename: objFile.name));

    //-------Send request
    var resp = await request.send();

    //------Read response
    String result = await resp.stream.bytesToString();

    //-------Your response
    print(result);
    if (objFile.readStream != null) {
      // let's refresh the page
      setState(() {
        objFile = PlatformFile(
          name: "No File Selected",
          size: 0,
          bytes: Uint8List(0),
          readStream: null,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //------Button to choose file using file picker plugin
          ElevatedButton(
              child: Text("Choose File"),
              onPressed: () => chooseFileUsingFilePicker()),
          //------Show file name when file is selected
          if (objFile != null) Text("File name : ${objFile.name}"),
          //------Show file size when file is selected
          if (objFile != null) Text("File size : ${objFile.size} bytes"),
          //------Show upload utton when file is selected
          ElevatedButton(
              child: Text("Upload"), onPressed: () => uploadSelectedFile()),
        ],
      ),
    );
  }
}
