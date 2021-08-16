import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
//import 'package:wallpaper_app/image_editor_pro.dart';
import 'package:firexcode/firexcode.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_app/widgets/widgets.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_app/image_editor_pro.dart';
//import 'dart:js' as js;

class ImageView extends StatefulWidget {
  final String imgPath;

  ImageView({required this.imgPath});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title : WallPaperApp(),
        actions: <Widget>[
           IconButton(icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                   ExampleInstagramFilterSelection(imgPath: ''),

                ));
          } )

]),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgPath,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: kIsWeb
                  ? Image.network(widget.imgPath, fit: BoxFit.cover)
                  : CachedNetworkImage(
                imageUrl: widget.imgPath,
                placeholder: (context, url) =>
                    Container(
                      color: Color(0xfff5f8fd),
                    ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      if (kIsWeb) {
                        _launchURL(widget.imgPath);
                        //js.context.callMethod('downloadUrl',[widget.imgPath]);
                        //response = await dio.download(widget.imgPath, "./xx.html");
                      } else {
                        _save();
                      }
                      //Navigator.pop(context);
                    },
                    child: Stack(
                      children: <Widget>[

                        Container(


                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                RaisedButton(

                                  child: Text('Apply'),
                                  textColor: Colors.black,
                                  color: Color(0xfff5f8fd),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0))),
                                  onPressed: () {
                                    _showDialog(context);
                                  },

                                ),

                                // Text(
                                //   kIsWeb
                                //       ? "Image will open in new tab to download"
                                //       : "Image will be saved in gallery",
                                //   style: TextStyle(
                                //       fontSize: 8, color: Colors.white70),
                                // ),
                              ],
                            )),
                      ],
                    )),


                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
    }

  _save() async {
    await _askPermission();
    var response = await Dio().get(widget.imgPath,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */ await PermissionHandler()
          .requestPermissions([PermissionGroup.photos]);
    } else {
      /* PermissionStatus permission = */ await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }




  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: new Text("Apply Wallpaper"),
            content: new
            Container (
                height: 150,
                child: Column(
                    children: <Widget>[


                      new FlatButton(
                          child: new Text("Home Screen"),
                          onPressed: (setHomeScreen)

                      ),
                      new FlatButton(
                          child: new Text("Lock Screen"),
                          onPressed: (setLockScreen)
                      ),

                      new FlatButton(
                          child: new Text("Both"),
                          onPressed: (setHomeAndLockScreen)

                      )
                    ]


                )
            )


        );
      },
    );
  }

  Future<void> setHomeScreen() async {
    String result;

    _showToast(context);
    var file = await DefaultCacheManager().getSingleFile(
        widget.imgPath);
// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);


    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
// If the widget was removed from the tree while the asynchronous platform
// message was in flight, we want to discard the reply rather than calling
// setState to update our non-existent appearance.
    if (mounted) {
      _showToast(context);

    }


  }

  Future<void> setLockScreen() async {
    String result1;
    var file = await DefaultCacheManager().getSingleFile(
        widget.imgPath);
// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result1 = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.LOCK_SCREEN);
    } on PlatformException {
      result1 = 'Failed to get wallpaper.';
    }
// If the widget was removed from the tree while the asynchronous platform
// message was in flight, we want to discard the reply rather than calling
// setState to update our non-existent appearance.
    if (!mounted) {

    }
    return;
  }

  Future<void> setHomeAndLockScreen() async {
    String result2;
    var file = await DefaultCacheManager().getSingleFile(
        widget.imgPath);
// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result2 = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.BOTH_SCREENS);
    } on PlatformException {
      result2 = 'Failed to get wallpaper.';
    }
// If the widget was removed from the tree while the asynchronous platform
// message was in flight, we want to discard the reply rather than calling
// setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void _showToast(BuildContext context) {

    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 32.0
    );
    // final scaffold = ScaffoldMessenger.of(context);
    // scaffold.showSnackBar(
    //   SnackBar(
    //     content: const Text('Done'),
    //
    //   ),
    // );
  }




 }
