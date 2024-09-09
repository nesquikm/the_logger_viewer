import 'dart:async';

import 'package:pluto_grid_plus/pluto_grid_plus.dart';

/// Custom filter resolver.
class CustomFilterResolver extends PlutoNotifierFilterResolverDefault {
  /// Default constructor.
  CustomFilterResolver({
    required this.onChange,
  });

  /// Callback when filter changes.
  final void Function(PlutoGridStateManager stateManager) onChange;

  Timer? _timer;

  @override
  Set<int> resolve(PlutoGridStateManager stateManager, Type type) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () {
      onChange(stateManager);
    });

    return super.resolve(stateManager, type);
  }
}
