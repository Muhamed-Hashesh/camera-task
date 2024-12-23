import 'dart:io';

import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imagePaths;

  const GalleryPage({
    super.key,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: const Color(0xff1b1b1b),
      ),
      backgroundColor: const Color(0xff1b1b1b),
      body: imagePaths.isEmpty
          ? const Center(
              child: Text(
                'No images found!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                final imagePath = imagePaths[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullScreenImage(imagePath: imagePath),
                      ),
                    );
                  },
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
