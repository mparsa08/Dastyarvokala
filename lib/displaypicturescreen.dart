import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String? imagePath;
  final String? albumName;

  const DisplayPictureScreen(
      {super.key, required this.imagePath, required this.albumName});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  Future saveImage(String xFile) async {
    await GallerySaver.saveImage(xFile,
        albumName: 'پرونده_${widget.albumName}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Image.file(
                  File(widget.imagePath!),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.green)),
                      onPressed: () {
                        saveImage(widget.imagePath!);
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text('ذخیره')),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red)),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text('حذف')),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
