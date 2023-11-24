import 'package:app/screens/camera_view_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

List<CameraDescription>? cameras;

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
          future: cameraValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(cameraController);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Positioned(
          bottom: 0.00,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            color: Colors.black,
            child: Column(children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.flash_off,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      takePhoto(context);
                    },
                    child: Icon(
                      Icons.panorama_fish_eye,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.flip_camera_ios,
                        color: Colors.white,
                        size: 28,
                      ))
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Hold for video, tap for Video',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )
            ]),
          ),
        )
      ]),
    );
  }

  Future<void> takePhoto(BuildContext context) async {
    final XFile file = await cameraController.takePicture();
    final path = join(
      (await getDownloadsDirectory())!.path,
      "$file",
    );
    //await cameraController.takePicture(path);
    print('path------------------------$path');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraViewScreen(
            path: path,
          ),
        ));
  }
}
