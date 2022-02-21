import 'package:freezed_annotation/freezed_annotation.dart';

part 'receiver_id_obj.freezed.dart';
part 'receiver_id_obj.g.dart';

@freezed
class ReceiverIdObj with _$ReceiverIdObj{
  factory ReceiverIdObj({
    String? id,
    String? user_name,
    String? p_image,
  }) = _ReceiverIdObj;
  factory ReceiverIdObj.fromJson(Map<String, dynamic> json) => _$ReceiverIdObjFromJson(json);
}