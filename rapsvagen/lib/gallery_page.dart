import 'package:flutter/material.dart';
import 'gallery.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galleri')),
      body: const GallerySection(),
    );
  }
}
