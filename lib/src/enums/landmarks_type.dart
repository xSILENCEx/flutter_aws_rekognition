enum LandmarksType {
  eyeLeft,
  eyeRight,
  mouthLeft,
  mouthRight,
  nose,
  leftEyeBrowLeft,
  leftEyeBrowRight,
  leftEyeBrowUp,
  rightEyeBrowLeft,
  rightEyeBrowRight,
  rightEyeBrowUp,
  leftEyeLeft,
  leftEyeRight,
  leftEyeUp,
  leftEyeDown,
  rightEyeLeft,
  rightEyeRight,
  rightEyeUp,
  rightEyeDown,
  noseLeft,
  noseRight,
  mouthUp,
  mouthDown,
  leftPupil,
  rightPupil,
  upperJawlineLeft,
  midJawlineLeft,
  chinBottom,
  midJawlineRight,
  upperJawlineRight,
}

extension LandmarksTypeExString on String {
  LandmarksType get landmarksType {
    switch (this) {
      case 'eyeLeft':
        return LandmarksType.eyeLeft;
      case 'eyeRight':
        return LandmarksType.eyeRight;
      case 'mouthLeft':
        return LandmarksType.mouthLeft;
      case 'mouthRight':
        return LandmarksType.mouthRight;
      case 'nose':
        return LandmarksType.nose;
      case 'leftEyeBrowLeft':
        return LandmarksType.leftEyeBrowLeft;
      case 'leftEyeBrowRight':
        return LandmarksType.leftEyeBrowRight;
      case 'leftEyeBrowUp':
        return LandmarksType.leftEyeBrowUp;
      case 'rightEyeBrowLeft':
        return LandmarksType.rightEyeBrowLeft;
      case 'rightEyeBrowRight':
        return LandmarksType.rightEyeBrowRight;
      case 'rightEyeBrowUp':
        return LandmarksType.rightEyeBrowUp;
    }

    return LandmarksType.eyeLeft;
  }
}

extension ExLandmarksType on LandmarksType {
  String get toStr {
    switch (this) {
      case LandmarksType.eyeLeft:
        return 'eyeLeft';
      case LandmarksType.eyeRight:
        return 'eyeRight';
      case LandmarksType.mouthLeft:
        return 'mouthLeft';
      case LandmarksType.mouthRight:
        return 'mouthRight';
      case LandmarksType.nose:
        return 'nose';
      case LandmarksType.leftEyeBrowLeft:
        return 'leftEyeBrowLeft';
      case LandmarksType.leftEyeBrowRight:
        return 'leftEyeBrowRight';
      case LandmarksType.leftEyeBrowUp:
        return 'leftEyeBrowUp';
      case LandmarksType.rightEyeBrowLeft:
        return 'rightEyeBrowLeft';
      case LandmarksType.rightEyeBrowRight:
        return 'rightEyeBrowRight';
      case LandmarksType.rightEyeBrowUp:
        return 'rightEyeBrowUp';
      case LandmarksType.leftEyeLeft:
        return 'leftEyeLeft';
      case LandmarksType.leftEyeRight:
        return 'leftEyeRight';
      case LandmarksType.leftEyeUp:
        return 'leftEyeUp';
      case LandmarksType.leftEyeDown:
        return 'leftEyeDown';
      case LandmarksType.rightEyeLeft:
        return 'rightEyeLeft';
      case LandmarksType.rightEyeRight:
        return 'rightEyeRight';
      case LandmarksType.rightEyeUp:
        return 'rightEyeUp';
      case LandmarksType.rightEyeDown:
        return 'rightEyeDown';
      case LandmarksType.noseLeft:
        return 'noseLeft';
      case LandmarksType.noseRight:
        return 'noseRight';
      case LandmarksType.mouthUp:
        return 'mouthUp';
      case LandmarksType.mouthDown:
        return 'mouthDown';
      case LandmarksType.leftPupil:
        return 'leftPupil';
      case LandmarksType.rightPupil:
        return 'rightPupil';
      case LandmarksType.upperJawlineLeft:
        return 'upperJawlineLeft';
      case LandmarksType.midJawlineLeft:
        return 'midJawlineLeft';
      case LandmarksType.chinBottom:
        return 'chinBottom';
      case LandmarksType.midJawlineRight:
        return 'midJawlineRight';
      case LandmarksType.upperJawlineRight:
        return 'upperJawlineRight';
    }
  }
}
