class WorkOrderFilterModel {
  final String? state;
  final String? stateName;
  final String? building;
  final String? buildingName;
  final String? floor;
  final String? floorName;
  final String? workOrderCode;
  final bool? searchNeed;

  WorkOrderFilterModel({
    this.state,
    this.building,
    this.floor,
    this.workOrderCode,
    this.searchNeed,
    this.stateName,
    this.buildingName,
    this.floorName,
  });
}
