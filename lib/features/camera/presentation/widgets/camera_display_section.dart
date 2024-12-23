import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraDisplaySection extends StatelessWidget {
  final CameraController cameraController;

  const CameraDisplaySection({
    super.key,
    required this.cameraController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.7,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: CameraPreview(cameraController),
      ),
    );
  }
}
