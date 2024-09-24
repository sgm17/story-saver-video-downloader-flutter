import 'package:freezed_annotation/freezed_annotation.dart';
part 'candidate.freezed.dart';
part 'candidate.g.dart';

@freezed
class Candidate with _$Candidate {
  const factory Candidate({
    required String url,
    required int height,
    required int width,
  }) = _Candidate;

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);
}
