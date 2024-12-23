import 'dart:io';

import 'package:camera/camera.dart';

class CameraService {
  late CameraController cameraController;
  late List<CameraDescription> cameras;

  List<String> savedImages = [];

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );
    await cameraController.initialize();
  }

  Future<String> capturePhoto() async {
    try {
      final XFile image = await cameraController.takePicture();

      final Directory directory = Directory('/storage/emulated/0/DCIM/Camera');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final String savePath =
          '${directory.path}/captured_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

      await File(image.path).copy(savePath);

      savedImages.add(savePath);

      return savePath;
    } catch (e) {
      throw Exception('Error while saving photo: $e');
    }
  }

  Future<void> loadSavedImages() async {
    final Directory directory = Directory('/storage/emulated/0/DCIM/Camera');
    if (await directory.exists()) {
      final files = directory
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.jpg'))
          .toList();

      files.sort((a, b) {
        final aModified = a.statSync().modified;
        final bModified = b.statSync().modified;
        return bModified.compareTo(aModified);
      });

      savedImages = files.map((file) => file.path).toList();
    }
  }

  Future<void> switchCamera() async {
    final nextCameraIndex =
        (cameras.indexOf(cameraController.description) + 1) % cameras.length;
    cameraController = CameraController(
      cameras[nextCameraIndex],
      ResolutionPreset.high,
    );
    await cameraController.initialize();
  }

  void dispose() {
    cameraController.dispose();
  }
}
