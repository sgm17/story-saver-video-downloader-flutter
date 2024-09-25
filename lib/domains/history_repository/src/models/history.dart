import 'package:freezed_annotation/freezed_annotation.dart';
part 'history.freezed.dart';
part 'history.g.dart';

@freezed
class History with _$History {
  const factory History({required String image, required String filename}) =
      _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
