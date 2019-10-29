import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class ImageScreen extends StatefulWidget {
  final String imageUrl;
  ImageScreen(this.imageUrl);
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PhotoView(
          imageProvider: NetworkImage(widget.imageUrl),
        ),
      ),
    );
  }
}