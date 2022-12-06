enum QualityFilter { NONE, AUTO, LOW, MEDIUM, HIGH }

extension ExQualityFilter on QualityFilter {
  String get toStr {
    switch (this) {
      case QualityFilter.NONE:
        return 'NONE';
      case QualityFilter.AUTO:
        return 'AUTO';
      case QualityFilter.LOW:
        return 'LOW';
      case QualityFilter.MEDIUM:
        return 'MEDIUM';
      case QualityFilter.HIGH:
        return 'HIGH';
    }
  }
}
