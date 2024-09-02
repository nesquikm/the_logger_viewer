import 'package:flutter/material.dart';
import 'package:the_logger_viewer/area_id.dart';

/// Intro widget.
class Intro extends StatelessWidget {
  /// Default constructor.
  const Intro({required this.areaId, super.key});

  /// Area id.
  final AreaId areaId;

  @override
  Widget build(BuildContext context) {
    final text = switch (areaId) {
      AreaId.main => 'Drop logfile here',
      AreaId.details => 'Here will be details',
    };
    return Center(
      child: Text(text),
    );
  }
}
