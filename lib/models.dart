import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// Log file model.
@freezed
sealed class LogFile with _$LogFile {
  /// Default constructor.
  const factory LogFile({
    @JsonKey(name: 'logs') required List<LogRecord> logs,
  }) = _LogFile;

  /// Create a LogFile from JSON.
  factory LogFile.fromJson(Map<String, Object?> json) =>
      _$LogFileFromJson(json);
}

/// Log record model.
@freezed
sealed class LogRecord with _$LogRecord {
  /// Default constructor.
  const factory LogRecord({
    @JsonKey(name: 'logger_name') required String loggerName,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'record_timestamp')
    @DateTimeSerializer()
    required DateTime recordTimestamp,
    @JsonKey(name: 'session_id') required int sessionId,

    /// should be a LogLevel
    @JsonKey(name: 'level') required int level,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'error') required String? error,
    @JsonKey(name: 'stack_trace') required String? stackTrace,
    @JsonKey(name: 'time') @TimestampSerializer() required DateTime time,
  }) = _LogRecord;

  /// Create a LogRecord from JSON.
  factory LogRecord.fromJson(Map<String, Object?> json) =>
      _$LogRecordFromJson(json);
}

/// Timestamp serializer.
class TimestampSerializer implements JsonConverter<DateTime, int> {
  /// Default constructor.
  const TimestampSerializer();

  @override
  DateTime fromJson(int timestamp) =>
      DateTime.fromMicrosecondsSinceEpoch(timestamp);

  @override
  int toJson(DateTime date) => date.microsecondsSinceEpoch;
}

/// DateTime string serializer.
class DateTimeSerializer implements JsonConverter<DateTime, String> {
  /// Default constructor.
  const DateTimeSerializer();

  @override
  DateTime fromJson(String string) => DateTime.parse(string);

  @override
  String toJson(DateTime date) => date.toString();
}
