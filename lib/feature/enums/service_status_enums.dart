enum ServiceStatusEnums {
  success,
  resultCode,
  isTrue
}

extension ServiceStatusEnumsExtension on ServiceStatusEnums {
  String get rawText {
    switch (this) {
      case ServiceStatusEnums.success:
        return 'success';
      case ServiceStatusEnums.resultCode:
        return '200';
      case ServiceStatusEnums.isTrue:
        return 'true';
      default:
        return 'unknown';
    }
  }
}
