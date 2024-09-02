// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogFile _$LogFileFromJson(Map<String, dynamic> json) {
  return _LogFile.fromJson(json);
}

/// @nodoc
mixin _$LogFile {
  @JsonKey(name: 'logs')
  List<LogFileRecord> get logs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogFileCopyWith<LogFile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogFileCopyWith<$Res> {
  factory $LogFileCopyWith(LogFile value, $Res Function(LogFile) then) =
      _$LogFileCopyWithImpl<$Res, LogFile>;
  @useResult
  $Res call({@JsonKey(name: 'logs') List<LogFileRecord> logs});
}

/// @nodoc
class _$LogFileCopyWithImpl<$Res, $Val extends LogFile>
    implements $LogFileCopyWith<$Res> {
  _$LogFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LogFileRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogFileImplCopyWith<$Res> implements $LogFileCopyWith<$Res> {
  factory _$$LogFileImplCopyWith(
          _$LogFileImpl value, $Res Function(_$LogFileImpl) then) =
      __$$LogFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'logs') List<LogFileRecord> logs});
}

/// @nodoc
class __$$LogFileImplCopyWithImpl<$Res>
    extends _$LogFileCopyWithImpl<$Res, _$LogFileImpl>
    implements _$$LogFileImplCopyWith<$Res> {
  __$$LogFileImplCopyWithImpl(
      _$LogFileImpl _value, $Res Function(_$LogFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_$LogFileImpl(
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LogFileRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogFileImpl with DiagnosticableTreeMixin implements _LogFile {
  const _$LogFileImpl(
      {@JsonKey(name: 'logs') required final List<LogFileRecord> logs})
      : _logs = logs;

  factory _$LogFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogFileImplFromJson(json);

  final List<LogFileRecord> _logs;
  @override
  @JsonKey(name: 'logs')
  List<LogFileRecord> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LogFile(logs: $logs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LogFile'))
      ..add(DiagnosticsProperty('logs', logs));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFileImpl &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_logs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogFileImplCopyWith<_$LogFileImpl> get copyWith =>
      __$$LogFileImplCopyWithImpl<_$LogFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogFileImplToJson(
      this,
    );
  }
}

abstract class _LogFile implements LogFile {
  const factory _LogFile(
          {@JsonKey(name: 'logs') required final List<LogFileRecord> logs}) =
      _$LogFileImpl;

  factory _LogFile.fromJson(Map<String, dynamic> json) = _$LogFileImpl.fromJson;

  @override
  @JsonKey(name: 'logs')
  List<LogFileRecord> get logs;
  @override
  @JsonKey(ignore: true)
  _$$LogFileImplCopyWith<_$LogFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LogFileRecord _$LogFileRecordFromJson(Map<String, dynamic> json) {
  return _LogFileRecord.fromJson(json);
}

/// @nodoc
mixin _$LogFileRecord {
  @JsonKey(name: 'logger_name')
  String get loggerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'record_timestamp')
  @DateTimeSerializer()
  DateTime get recordTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  int get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  @LevelSerializer()
  Level get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  String? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'stack_trace')
  String? get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  @TimestampSerializer()
  DateTime get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogFileRecordCopyWith<LogFileRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogFileRecordCopyWith<$Res> {
  factory $LogFileRecordCopyWith(
          LogFileRecord value, $Res Function(LogFileRecord) then) =
      _$LogFileRecordCopyWithImpl<$Res, LogFileRecord>;
  @useResult
  $Res call(
      {@JsonKey(name: 'logger_name') String loggerName,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'record_timestamp')
      @DateTimeSerializer()
      DateTime recordTimestamp,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'level') @LevelSerializer() Level level,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'error') String? error,
      @JsonKey(name: 'stack_trace') String? stackTrace,
      @JsonKey(name: 'time') @TimestampSerializer() DateTime time});
}

/// @nodoc
class _$LogFileRecordCopyWithImpl<$Res, $Val extends LogFileRecord>
    implements $LogFileRecordCopyWith<$Res> {
  _$LogFileRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggerName = null,
    Object? id = null,
    Object? recordTimestamp = null,
    Object? sessionId = null,
    Object? level = null,
    Object? message = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      loggerName: null == loggerName
          ? _value.loggerName
          : loggerName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recordTimestamp: null == recordTimestamp
          ? _value.recordTimestamp
          : recordTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogFileRecordImplCopyWith<$Res>
    implements $LogFileRecordCopyWith<$Res> {
  factory _$$LogFileRecordImplCopyWith(
          _$LogFileRecordImpl value, $Res Function(_$LogFileRecordImpl) then) =
      __$$LogFileRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'logger_name') String loggerName,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'record_timestamp')
      @DateTimeSerializer()
      DateTime recordTimestamp,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'level') @LevelSerializer() Level level,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'error') String? error,
      @JsonKey(name: 'stack_trace') String? stackTrace,
      @JsonKey(name: 'time') @TimestampSerializer() DateTime time});
}

/// @nodoc
class __$$LogFileRecordImplCopyWithImpl<$Res>
    extends _$LogFileRecordCopyWithImpl<$Res, _$LogFileRecordImpl>
    implements _$$LogFileRecordImplCopyWith<$Res> {
  __$$LogFileRecordImplCopyWithImpl(
      _$LogFileRecordImpl _value, $Res Function(_$LogFileRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggerName = null,
    Object? id = null,
    Object? recordTimestamp = null,
    Object? sessionId = null,
    Object? level = null,
    Object? message = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
    Object? time = null,
  }) {
    return _then(_$LogFileRecordImpl(
      loggerName: null == loggerName
          ? _value.loggerName
          : loggerName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recordTimestamp: null == recordTimestamp
          ? _value.recordTimestamp
          : recordTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogFileRecordImpl
    with DiagnosticableTreeMixin
    implements _LogFileRecord {
  const _$LogFileRecordImpl(
      {@JsonKey(name: 'logger_name') required this.loggerName,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'record_timestamp')
      @DateTimeSerializer()
      required this.recordTimestamp,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'level') @LevelSerializer() required this.level,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'error') required this.error,
      @JsonKey(name: 'stack_trace') required this.stackTrace,
      @JsonKey(name: 'time') @TimestampSerializer() required this.time});

  factory _$LogFileRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogFileRecordImplFromJson(json);

  @override
  @JsonKey(name: 'logger_name')
  final String loggerName;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'record_timestamp')
  @DateTimeSerializer()
  final DateTime recordTimestamp;
  @override
  @JsonKey(name: 'session_id')
  final int sessionId;
  @override
  @JsonKey(name: 'level')
  @LevelSerializer()
  final Level level;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'error')
  final String? error;
  @override
  @JsonKey(name: 'stack_trace')
  final String? stackTrace;
  @override
  @JsonKey(name: 'time')
  @TimestampSerializer()
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LogFileRecord(loggerName: $loggerName, id: $id, recordTimestamp: $recordTimestamp, sessionId: $sessionId, level: $level, message: $message, error: $error, stackTrace: $stackTrace, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LogFileRecord'))
      ..add(DiagnosticsProperty('loggerName', loggerName))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('recordTimestamp', recordTimestamp))
      ..add(DiagnosticsProperty('sessionId', sessionId))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('stackTrace', stackTrace))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFileRecordImpl &&
            (identical(other.loggerName, loggerName) ||
                other.loggerName == loggerName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recordTimestamp, recordTimestamp) ||
                other.recordTimestamp == recordTimestamp) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loggerName, id, recordTimestamp,
      sessionId, level, message, error, stackTrace, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogFileRecordImplCopyWith<_$LogFileRecordImpl> get copyWith =>
      __$$LogFileRecordImplCopyWithImpl<_$LogFileRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogFileRecordImplToJson(
      this,
    );
  }
}

abstract class _LogFileRecord implements LogFileRecord {
  const factory _LogFileRecord(
      {@JsonKey(name: 'logger_name') required final String loggerName,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'record_timestamp')
      @DateTimeSerializer()
      required final DateTime recordTimestamp,
      @JsonKey(name: 'session_id') required final int sessionId,
      @JsonKey(name: 'level') @LevelSerializer() required final Level level,
      @JsonKey(name: 'message') required final String message,
      @JsonKey(name: 'error') required final String? error,
      @JsonKey(name: 'stack_trace') required final String? stackTrace,
      @JsonKey(name: 'time')
      @TimestampSerializer()
      required final DateTime time}) = _$LogFileRecordImpl;

  factory _LogFileRecord.fromJson(Map<String, dynamic> json) =
      _$LogFileRecordImpl.fromJson;

  @override
  @JsonKey(name: 'logger_name')
  String get loggerName;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'record_timestamp')
  @DateTimeSerializer()
  DateTime get recordTimestamp;
  @override
  @JsonKey(name: 'session_id')
  int get sessionId;
  @override
  @JsonKey(name: 'level')
  @LevelSerializer()
  Level get level;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'error')
  String? get error;
  @override
  @JsonKey(name: 'stack_trace')
  String? get stackTrace;
  @override
  @JsonKey(name: 'time')
  @TimestampSerializer()
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$LogFileRecordImplCopyWith<_$LogFileRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
