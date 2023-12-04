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
    name: "Nenhum arquivo selecionado",
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
    //---Create http package multipart request object
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("https://monitoria-api.onrender.com/batch_create_users"),
    );
    //-----add other fields if needed
    request.fields["id"] = "abc";

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //------Button to choose file using file picker plugin
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ElevatedButton(
              style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(200, 40))),
                child: Text("Selecionar Arquivo", style: TextStyle(fontSize: 20)),
                onPressed: () => chooseFileUsingFilePicker()),
          ),
          //------Show file name when file is selected
          if (objFile != null) Text("Arquivo selecionado : ${objFile.name}"),
          //------Show file size when file is selected
          if (objFile != null) Text("Tamanho : ${objFile.size} bytes"),
          //------Show upload utton when file is selected
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(
              style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(150, 40)), backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Text("Enviar", style: TextStyle(fontSize: 18),), onPressed: () => uploadSelectedFile()),
          ),
        ],
      ),
    );
  }
}
