enum ServiceResponseStatusEnums { result, records, detail, statusCode, success, resultCode,info }

extension ServiceResponseStatusExtension on ServiceResponseStatusEnums {
  String get rawText {
    switch (this) {
      case ServiceResponseStatusEnums.result:
        return 'result';
      case ServiceResponseStatusEnums.records:
        return 'records';
      case ServiceResponseStatusEnums.detail:
        return 'detail';
      case ServiceResponseStatusEnums.success:
        return 'success';
      case ServiceResponseStatusEnums.resultCode:
        return 'resultcode';
      case ServiceResponseStatusEnums.info:
        return 'info';
      case ServiceResponseStatusEnums.statusCode:
        return '200';
      default:
        return 'unknown';
    }
  }
}
