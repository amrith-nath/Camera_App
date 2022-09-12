import 'dart:io';
import 'package:camera_app/functions/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCaptured = false;
  bool showSave = false;

  // XFile? _imageFile;
  // String? _status;
  // bool? _imageLoading;
  // ImagePicker? _imagePicker;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _status = '';
  //   _imageLoading = false;
  //   _imagePicker = ImagePicker();
  // }
  //-------------------******************------------------
  File? image;
  String? savedText = '';

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      // final imagePermanent = await saveImagePermanently(image.path);

      setState(() {
        this.image = imageTemp;
        isCaptured = true;
        showSave = true;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick Image : $e');
    }
  }

  // Future<File?> saveImagePermanently(String imagepath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagepath);
  //   final image = File('${directory.path}/$name');
  //   return File(imagepath).copy(image.path);
  // }

  Future saveImage(ctx) async {
    setState(() {
      showSave = false;
    });
    // final imagePermanent = await saveImagePermanently(image.path);
    await GallerySaver.saveImage(
      image!.path,
      albumName: 'MyPhotoGallery',
    );
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: bodyTextsmall('image saved'),
      backgroundColor: const Color.fromRGBO(129, 178, 154, 1),
    ));
    // showSnackBar();
  }

  showAlert(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            backgroundColor: colorBlack(),
            title: bodyTextWhitesmall('You didnt saved your image yet.'),
            content: bodyTextWhitesmall('Do you want to Save?'),
            actions: [
              TextButton(
                  onPressed: () {
                    cancelImage();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
                    style: const TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    saveImage(context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
            ],
          );
        });
  }

  // showSnackBar() {
  //   final SnackBarnew = SnackBar(
  //     content: bodyText('Image saved to Gallery'),
  //   );
  // }

  Future cancelImage() async {
    setState(() {
      image = null;
      isCaptured = false;
      showSave = false;
    });
  }

  Future openGallery() async {
    await saveImage(context);
    openInternalGallery();
  }

  Future openInternalGallery() async {
    await LaunchApp.openApp(androidPackageName: 'com.miui.gallery');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      backgroundColor: colorBlackLight(),
      appBar: AppBar(
        backgroundColor: colorBlackLight(),
        elevation: 0.0,
        title: bodyTextWhite('Camera app'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                width: width,
                decoration: BoxDecoration(
                    color: colorBlackLight(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: image != null
                      ? Image.file(image!)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            bodyTextWhite('Take a picture'),
                            Image.asset('asset/icons8-cameras-96.png'),
                          ],
                        ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: !isCaptured
                              ? null
                              : RawMaterialButton(
                                  onPressed: () {
                                    openGallery();
                                  },
                                  elevation: 2.0,
                                  fillColor: colorBlack(),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.photo_album,
                                    size: 40.0,
                                    color: Colors.blue,
                                  ),
                                ),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            pickImage();
                            setState(() {
                              savedText = '';
                            });
                          },
                          elevation: 2.0,
                          fillColor: colorYellow(),
                          padding: const EdgeInsets.all(15.0),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.photo_camera_sharp,
                            size: 40.0,
                          ),
                        ),
                        Container(
                          child: !isCaptured
                              ? null
                              : RawMaterialButton(
                                  onPressed: () {
                                    if (showSave) {
                                      showAlert(context);
                                    } else {
                                      cancelImage();
                                    }
                                  },
                                  elevation: 2.0,
                                  fillColor: colorBlack(),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.close,
                                    size: 40.0,
                                    color: Color.fromRGBO(224, 122, 95, 1),
                                  ),
                                ),
                        ),
                        Container(
                          child: !showSave
                              ? null
                              : RawMaterialButton(
                                  onPressed: () {
                                    saveImage(context);
                                  },
                                  elevation: 2.0,
                                  fillColor: colorBlack(),
                                  padding: const EdgeInsets.all(15.0),
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.save,
                                    size: 40.0,
                                    color: Color.fromRGBO(129, 178, 154, 1),
                                  ),
                                ),
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
