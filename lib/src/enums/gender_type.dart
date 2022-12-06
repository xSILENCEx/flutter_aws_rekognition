enum GenderType { Male, Female }

extension GenderTypeExString on String {
  GenderType get gender {
    switch (this) {
      case 'Male':
        return GenderType.Male;
      case 'Female':
        return GenderType.Female;
    }

    return GenderType.Male;
  }
}

extension ExGenderType on GenderType {
  String get toStr {
    switch (this) {
      case GenderType.Male:
        return 'Male';
      case GenderType.Female:
        return 'Female';
    }
  }
}
