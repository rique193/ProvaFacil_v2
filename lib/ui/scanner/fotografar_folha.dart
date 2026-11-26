import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

/// Abre a câmera do celular para fotografar a folha de respostas. Devolve os bytes da foto, ou
/// nulo se o professor fechar a câmera sem tirar a foto.
Future<Uint8List?> fotografarFolhaComCamera() async {
  final foto = await ImagePicker().pickImage(
    source: ImageSource.camera,
    preferredCameraDevice: CameraDevice.rear,
    maxWidth: 2400,
    maxHeight: 2400,
    imageQuality: 92,
    requestFullMetadata: false,
  );
  return foto?.readAsBytes();
}
