import 'package:freezed_annotation/freezed_annotation.dart';

part 'sender_id_obj.freezed.dart';
part 'sender_id_obj.g.dart';

@freezed
class SenderIdObj with _$SenderIdObj{
  factory SenderIdObj({
    String? id,
    String? user_name,
    String? p_image,
    String? ring_name,
  }) = _SenderIdObj;
  factory SenderIdObj.fromJson(Map<String, dynamic> json) => _$SenderIdObjFromJson(json);
}