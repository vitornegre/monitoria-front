import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DropzoneWidget extends StatefulWidget {
  const DropzoneWidget({super.key});

  @override
  State<DropzoneWidget> createState() => _DropzoneWidgetState();
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Stack(
          children: [
            DropzoneView(onDrop: onFilDrop),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_download),
                Text(
                  'Arraste os arquivos aqui',
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future onFilDrop(dynamic event) async {
    final name = event.name;
    print("O nome dessa porra é: $name");
  }
}
