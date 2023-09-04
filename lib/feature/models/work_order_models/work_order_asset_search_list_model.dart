import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_work_order/work_order_asset_search_list_model.g.dart';

@JsonSerializable()
class WorkOrderAssetSearchList extends Equatable {
  final String? code;
final String? serialNo;
  final String? name;
  final String? status;
  final String? locationCode;
  final String? binaAdi;
  final String? katAdi;
  final String? kanatAdi;
  final String? mahalAdi;
  final String? loctree;

  const WorkOrderAssetSearchList(
      {this.code,
      this.serialNo,
      this.name,
      this.status,
      this.locationCode,
      this.binaAdi,
      this.katAdi,
      this.kanatAdi,
      this.mahalAdi,
      this.loctree});

  factory WorkOrderAssetSearchList.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderAssetSearchListFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderAssetSearchListToJson(this);

  static List<WorkOrderAssetSearchList> fromJsonList(List<dynamic> jsonList) {
    List<WorkOrderAssetSearchList> items = [];
    for (var item in jsonList) {
      items.add(WorkOrderAssetSearchList.fromJson(item));
    }
    return items;
  }

// "CODE": "ENV00000119613",
//             "SERIALNO": "3417Q26146",
//             "NAME": "SU SOĞUTMALI CHILLER GRUPLARI ve KULELER-TEKTES-CARRIER",
//             "STATUS": "Kullanımda",
//             "LOCATIONCODE": "A-BK(T)-027",
//             "bina_adi": "Ana Bina",
//             "kat_adi": "B1 Katı",
//             "kanat_adi": "A Blok",
//             "mahal_adi": "TESİSAT MERKEZİ",
//             "LOCTREE": "A-BK(T)-027 - Ana Bina >> B1 Katı >> A Blok""
  @override
  List<Object?> get props => [
        code,
        serialNo,
        name,
        status,
        locationCode,
        binaAdi,
        katAdi,
        kanatAdi,
        mahalAdi,
        loctree
      ];
}
