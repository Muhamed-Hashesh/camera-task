import 'package:camera_task/features/camera/presentation/data/camera_services.dart';
import 'package:camera_task/features/camera/presentation/views/gallary_app.dart';
import 'package:flutter/material.dart';

class BottomCameraRow extends StatelessWidget {
  final VoidCallback onCapturePressed;
  final VoidCallback onSwitchCamera;
  final CameraService cameraService;

  const BottomCameraRow({
    super.key,
    required this.onCapturePressed,
    required this.onSwitchCamera,
    required this.cameraService,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    GalleryPage(imagePaths: cameraService.savedImages),
              ),
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onCapturePressed,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onSwitchCamera,
            icon: const Icon(Icons.cameraswitch, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
