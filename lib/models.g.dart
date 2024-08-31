// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogFileImpl _$$LogFileImplFromJson(Map<String, dynamic> json) =>
    _$LogFileImpl(
      logs: (json['logs'] as List<dynamic>)
          .map((e) => LogRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LogFileImplToJson(_$LogFileImpl instance) =>
    <String, dynamic>{
      'logs': instance.logs,
    };

_$LogRecordImpl _$$LogRecordImplFromJson(Map<String, dynamic> json) =>
    _$LogRecordImpl(
      loggerName: json['logger_name'] as String,
      id: (json['id'] as num).toInt(),
      recordTimestamp: const DateTimeSerializer()
          .fromJson(json['record_timestamp'] as String),
      sessionId: (json['session_id'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      message: json['message'] as String,
      error: json['error'] as String?,
      stackTrace: json['stack_trace'] as String?,
      time: const TimestampSerializer().fromJson((json['time'] as num).toInt()),
    );

Map<String, dynamic> _$$LogRecordImplToJson(_$LogRecordImpl instance) =>
    <String, dynamic>{
      'logger_name': instance.loggerName,
      'id': instance.id,
      'record_timestamp':
          const DateTimeSerializer().toJson(instance.recordTimestamp),
      'session_id': instance.sessionId,
      'level': instance.level,
      'message': instance.message,
      'error': instance.error,
      'stack_trace': instance.stackTrace,
      'time': const TimestampSerializer().toJson(instance.time),
    };
