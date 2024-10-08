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
  @JsonKey(name: _loggerName)
  String get loggerName => throw _privateConstructorUsedError;
  @JsonKey(name: _id)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: _recordTimestamp)
  @DateTimeSerializer()
  DateTime get recordTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: _sessionId)
  int get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: _level)
  @LevelSerializer()
  Level get level => throw _privateConstructorUsedError;
  @JsonKey(name: _message)
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: _error)
  String? get error => throw _privateConstructorUsedError;
  @JsonKey(name: _stackTrace)
  String? get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(name: _time)
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
      {@JsonKey(name: _loggerName) String loggerName,
      @JsonKey(name: _id) int id,
      @JsonKey(name: _recordTimestamp)
      @DateTimeSerializer()
      DateTime recordTimestamp,
      @JsonKey(name: _sessionId) int sessionId,
      @JsonKey(name: _level) @LevelSerializer() Level level,
      @JsonKey(name: _message) String message,
      @JsonKey(name: _error) String? error,
      @JsonKey(name: _stackTrace) String? stackTrace,
      @JsonKey(name: _time) @TimestampSerializer() DateTime time});
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
      {@JsonKey(name: _loggerName) String loggerName,
      @JsonKey(name: _id) int id,
      @JsonKey(name: _recordTimestamp)
      @DateTimeSerializer()
      DateTime recordTimestamp,
      @JsonKey(name: _sessionId) int sessionId,
      @JsonKey(name: _level) @LevelSerializer() Level level,
      @JsonKey(name: _message) String message,
      @JsonKey(name: _error) String? error,
      @JsonKey(name: _stackTrace) String? stackTrace,
      @JsonKey(name: _time) @TimestampSerializer() DateTime time});
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
class _$LogFileRecordImpl extends _LogFileRecord with DiagnosticableTreeMixin {
  const _$LogFileRecordImpl(
      {@JsonKey(name: _loggerName) required this.loggerName,
      @JsonKey(name: _id) required this.id,
      @JsonKey(name: _recordTimestamp)
      @DateTimeSerializer()
      required this.recordTimestamp,
      @JsonKey(name: _sessionId) required this.sessionId,
      @JsonKey(name: _level) @LevelSerializer() required this.level,
      @JsonKey(name: _message) required this.message,
      @JsonKey(name: _error) required this.error,
      @JsonKey(name: _stackTrace) required this.stackTrace,
      @JsonKey(name: _time) @TimestampSerializer() required this.time})
      : super._();

  factory _$LogFileRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogFileRecordImplFromJson(json);

  @override
  @JsonKey(name: _loggerName)
  final String loggerName;
  @override
  @JsonKey(name: _id)
  final int id;
  @override
  @JsonKey(name: _recordTimestamp)
  @DateTimeSerializer()
  final DateTime recordTimestamp;
  @override
  @JsonKey(name: _sessionId)
  final int sessionId;
  @override
  @JsonKey(name: _level)
  @LevelSerializer()
  final Level level;
  @override
  @JsonKey(name: _message)
  final String message;
  @override
  @JsonKey(name: _error)
  final String? error;
  @override
  @JsonKey(name: _stackTrace)
  final String? stackTrace;
  @override
  @JsonKey(name: _time)
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

abstract class _LogFileRecord extends LogFileRecord {
  const factory _LogFileRecord(
      {@JsonKey(name: _loggerName) required final String loggerName,
      @JsonKey(name: _id) required final int id,
      @JsonKey(name: _recordTimestamp)
      @DateTimeSerializer()
      required final DateTime recordTimestamp,
      @JsonKey(name: _sessionId) required final int sessionId,
      @JsonKey(name: _level) @LevelSerializer() required final Level level,
      @JsonKey(name: _message) required final String message,
      @JsonKey(name: _error) required final String? error,
      @JsonKey(name: _stackTrace) required final String? stackTrace,
      @JsonKey(name: _time)
      @TimestampSerializer()
      required final DateTime time}) = _$LogFileRecordImpl;
  const _LogFileRecord._() : super._();

  factory _LogFileRecord.fromJson(Map<String, dynamic> json) =
      _$LogFileRecordImpl.fromJson;

  @override
  @JsonKey(name: _loggerName)
  String get loggerName;
  @override
  @JsonKey(name: _id)
  int get id;
  @override
  @JsonKey(name: _recordTimestamp)
  @DateTimeSerializer()
  DateTime get recordTimestamp;
  @override
  @JsonKey(name: _sessionId)
  int get sessionId;
  @override
  @JsonKey(name: _level)
  @LevelSerializer()
  Level get level;
  @override
  @JsonKey(name: _message)
  String get message;
  @override
  @JsonKey(name: _error)
  String? get error;
  @override
  @JsonKey(name: _stackTrace)
  String? get stackTrace;
  @override
  @JsonKey(name: _time)
  @TimestampSerializer()
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$LogFileRecordImplCopyWith<_$LogFileRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LogFileRecordLevels _$LogFileRecordLevelsFromJson(Map<String, dynamic> json) {
  return _LogFileRecordLevels.fromJson(json);
}

/// @nodoc
mixin _$LogFileRecordLevels {
  @JsonKey(name: 'levels')
  @LevelSerializer()
  List<Level> get levels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogFileRecordLevelsCopyWith<LogFileRecordLevels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogFileRecordLevelsCopyWith<$Res> {
  factory $LogFileRecordLevelsCopyWith(
          LogFileRecordLevels value, $Res Function(LogFileRecordLevels) then) =
      _$LogFileRecordLevelsCopyWithImpl<$Res, LogFileRecordLevels>;
  @useResult
  $Res call({@JsonKey(name: 'levels') @LevelSerializer() List<Level> levels});
}

/// @nodoc
class _$LogFileRecordLevelsCopyWithImpl<$Res, $Val extends LogFileRecordLevels>
    implements $LogFileRecordLevelsCopyWith<$Res> {
  _$LogFileRecordLevelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_value.copyWith(
      levels: null == levels
          ? _value.levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<Level>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogFileRecordLevelsImplCopyWith<$Res>
    implements $LogFileRecordLevelsCopyWith<$Res> {
  factory _$$LogFileRecordLevelsImplCopyWith(_$LogFileRecordLevelsImpl value,
          $Res Function(_$LogFileRecordLevelsImpl) then) =
      __$$LogFileRecordLevelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'levels') @LevelSerializer() List<Level> levels});
}

/// @nodoc
class __$$LogFileRecordLevelsImplCopyWithImpl<$Res>
    extends _$LogFileRecordLevelsCopyWithImpl<$Res, _$LogFileRecordLevelsImpl>
    implements _$$LogFileRecordLevelsImplCopyWith<$Res> {
  __$$LogFileRecordLevelsImplCopyWithImpl(_$LogFileRecordLevelsImpl _value,
      $Res Function(_$LogFileRecordLevelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levels = null,
  }) {
    return _then(_$LogFileRecordLevelsImpl(
      levels: null == levels
          ? _value._levels
          : levels // ignore: cast_nullable_to_non_nullable
              as List<Level>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogFileRecordLevelsImpl
    with DiagnosticableTreeMixin
    implements _LogFileRecordLevels {
  const _$LogFileRecordLevelsImpl(
      {@JsonKey(name: 'levels')
      @LevelSerializer()
      required final List<Level> levels})
      : _levels = levels;

  factory _$LogFileRecordLevelsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogFileRecordLevelsImplFromJson(json);

  final List<Level> _levels;
  @override
  @JsonKey(name: 'levels')
  @LevelSerializer()
  List<Level> get levels {
    if (_levels is EqualUnmodifiableListView) return _levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_levels);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LogFileRecordLevels(levels: $levels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LogFileRecordLevels'))
      ..add(DiagnosticsProperty('levels', levels));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFileRecordLevelsImpl &&
            const DeepCollectionEquality().equals(other._levels, _levels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_levels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogFileRecordLevelsImplCopyWith<_$LogFileRecordLevelsImpl> get copyWith =>
      __$$LogFileRecordLevelsImplCopyWithImpl<_$LogFileRecordLevelsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogFileRecordLevelsImplToJson(
      this,
    );
  }
}

abstract class _LogFileRecordLevels implements LogFileRecordLevels {
  const factory _LogFileRecordLevels(
      {@JsonKey(name: 'levels')
      @LevelSerializer()
      required final List<Level> levels}) = _$LogFileRecordLevelsImpl;

  factory _LogFileRecordLevels.fromJson(Map<String, dynamic> json) =
      _$LogFileRecordLevelsImpl.fromJson;

  @override
  @JsonKey(name: 'levels')
  @LevelSerializer()
  List<Level> get levels;
  @override
  @JsonKey(ignore: true)
  _$$LogFileRecordLevelsImplCopyWith<_$LogFileRecordLevelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
