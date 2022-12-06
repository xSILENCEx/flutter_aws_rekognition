enum EmotionsType {
  DISGUSTED,
  HAPPY,
  SURPRISED,
  ANGRY,
  CONFUSED,
  CALM,
  SAD,
}

extension EmotionsTypeExString on String {
  EmotionsType get emotions {
    switch (this) {
      case 'DISGUSTED':
        return EmotionsType.DISGUSTED;
      case 'HAPPY':
        return EmotionsType.HAPPY;
      case 'SURPRISED':
        return EmotionsType.SURPRISED;
      case 'ANGRY':
        return EmotionsType.ANGRY;
      case 'CONFUSED':
        return EmotionsType.CONFUSED;
      case 'CALM':
        return EmotionsType.CALM;
      case 'SAD':
        return EmotionsType.SAD;
    }

    return EmotionsType.HAPPY;
  }
}

extension ExEmotionsType on EmotionsType {
  String get toStr {
    switch (this) {
      case EmotionsType.DISGUSTED:
        return 'DISGUSTED';
      case EmotionsType.HAPPY:
        return 'HAPPY';
      case EmotionsType.SURPRISED:
        return 'SURPRISED';
      case EmotionsType.ANGRY:
        return 'ANGRY';
      case EmotionsType.CONFUSED:
        return 'CONFUSED';
      case EmotionsType.CALM:
        return 'CALM';
      case EmotionsType.SAD:
        return 'SAD';
    }
  }
}
