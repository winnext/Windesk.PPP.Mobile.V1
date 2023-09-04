enum BuildingTypeEnums { building, floor }

extension BuildingTypeEnumsExtension on BuildingTypeEnums {
  String get rawValue {
    switch (this) {
      case BuildingTypeEnums.building:
        return 'BUILDING';
      case BuildingTypeEnums.floor:
        return 'FLOOR';
      default:
        return '';
    }
  }
}
