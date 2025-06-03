import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyResponse {
  @JsonKey(ignore: true)
  List<CurrencyModel> items = [];

  CurrencyResponse();

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) {
    final response = CurrencyResponse();
    response.items = json.entries.map((entry) {
      final map = Map<String, dynamic>.from(entry.value);
      return CurrencyModel.fromJson(map);
    }).toList();
    return response;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    for (var item in items) {
      map[item.code] = item.toJson();
    }
    return map;
  }
}

@JsonSerializable()
@Entity()
class CurrencyModel {
  @Id()
  int? id;
  final String code;
  final double value;

  CurrencyModel({
    required this.code,
    required this.value,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
