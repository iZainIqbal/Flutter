import 'dart:math';

import 'package:google_ml_kit/google_ml_kit.dart';

class Face {
  final Rectangle<int> boundingBox;
  final double headEulerAngleY;
  final double headEulerAngleZ;
  final double leftEyeOpenProbability;
  final double rightEyeOpenProbability;
  final double smilingProbability;
  final int trackingId;
  final Map<FaceLandmarkType, FaceLandmark> _landmarks;

  Face({
    required this.boundingBox,
    required this.headEulerAngleY,
    required this.headEulerAngleZ,
    required this.leftEyeOpenProbability,
    required this.rightEyeOpenProbability,
    required this.smilingProbability,
    required this.trackingId,
    required Map<FaceLandmarkType, FaceLandmark> landmarks,
  }) : _landmarks = landmarks;

  FaceLandmark? getLandmark(FaceLandmarkType landmarkType) {
    return _landmarks[landmarkType];
  }
}
