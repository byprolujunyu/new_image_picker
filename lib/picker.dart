import 'dart:async';

import 'package:flutter/services.dart';

class MultiImagePicker {
  static const MethodChannel _channel =
      const MethodChannel('plugins.flutter.io/image_picker');

  static Future pickImages() {
    return _channel.invokeMethod('getGallery');
  }
}
