enum Attributes { DEFAULT, ALL }

extension ExAttributes on Attributes {
  String get toStr {
    switch (this) {
      case Attributes.DEFAULT:
        return 'DEFAULT';
      case Attributes.ALL:
        return 'ALL';
    }
  }
}
