//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:image_picker_saver/image_picker_saver.dart';
//
//class CoinDetailCardWidget extends StatefulWidget {
//  @override
//  _CoinDetailCardWidgetState createState() => _CoinDetailCardWidgetState();
//}
//
//class _CoinDetailCardWidgetState extends State<CoinDetailCardWidget> {
//  GlobalKey _globalKey = new GlobalKey();
//  Future<void> _captureScreenshot(_globalKey, var data) async {
//    try {
//      RenderRepaintBoundary boundary =
//      _globalKey.currentContext.findRenderObject();
//      ui.Image image = await boundary.toImage();
//      ByteData byteData =
//      await image.toByteData(format: ui.ImageByteFormat.png);
//      var png = byteData.buffer.asUint8List();
//      final snackBar = SnackBar(
//        content: Text('Saved to Gallery'),
//        backgroundColor: Colors.green,
//        action: SnackBarAction(
//          label: 'Ok',
//          onPressed: () {
//            // Some code
//          },
//        ),
//      );
//      var filePath = await ImagePickerSaver.saveFile(
//          fileData: byteData.buffer.asUint8List());
//      print(filePath);
//      Scaffold.of(context).showSnackBar(snackBar);
//      Navigator.of(context).pop();
//    } catch (e) {
//      print(e);
//    }
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
