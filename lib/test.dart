import 'dart:convert';
import 'dart:developer';

import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      upload(imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
    for (var key in data.keys) {
      request.fields[key] = data[key].toString();
    }
    return request;
  }

  upload(File imageFile) async {
// open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

// get file length
    var length = await imageFile.length();

// string to uri
    var uri = Uri.parse("http://192.168.137.1:3000/api/postfileupload");

// create multipart request
    var request = new http.MultipartRequest("POST", uri);
    // request.headers["authorization"] = "badboy";
    // request = jsonToFormData(request, data);
// multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

// add file to multipart

    request.files.add(multipartFile);

    request.headers['x-auth-token'] =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNmJiNzQyYTYzOGI5MDNiNDUyZTg4ZSIsImlhdCI6MTY2ODAxNTAzMX0.WB8atT4BvB6GGnFgWRFktHbCgyMLfLcBNWNKgfRXKPU";

// send
    var response = await request.send();

    log(response.toString());

// listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print(value);
    // });
  }

  bool isloaded = false;
  var result;

  fetch() async {
    /*  var url = Uri.https('http://192.168.137.1:3000', '/image', {'q': '{http}'});
    var response = await http.get(url);
    result = jsonDecode(response.body);
    print(result[0]['image']);
    setState(() {
      isloaded = true;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    pickImage();
                  }),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () {}),
            ],
          ),
        ));
  }
}
