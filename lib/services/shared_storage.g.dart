// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedRoute _$SavedRouteFromJson(Map<String, dynamic> json) => SavedRoute(
  hubID: Uri.parse(json['hubID'] as String),
  serverID: json['serverID'] as String?,
);

Map<String, dynamic> _$SavedRouteToJson(SavedRoute instance) =>
    <String, dynamic>{
      'hubID': instance.hubID.toString(),
      'serverID': instance.serverID,
    };
