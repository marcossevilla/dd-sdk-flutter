import 'package:datadog_sdk/pigeon.dart';
import 'package:flutter/services.dart';

import 'datadog_sdk_platform_interface.dart';

class DatadogSdkMethodChannel extends DatadogSdkPlatform {
  final pigeon = DdSdkPigeon();

  @override
  Future<void> initialize(DdSdkConfiguration configuration) async {
    return pigeon.initialize(configuration);
  }

  @override
  DdLogs get ddLogs => DdLogsMethodChannel();
}

class DdLogsMethodChannel extends DdLogs {
  final pigeon = DdLogsPigeon();

  @override
  Future<void> debug(String message,
      [Map<String, Object?> context = const {}]) {
    return pigeon.debug(message, context);
  }

  @override
  Future<void> info(String message, [Map<String, Object?> context = const {}]) {
    return pigeon.info(message, context);
  }

  @override
  Future<void> warn(String message, [Map<String, Object?> context = const {}]) {
    return pigeon.warn(message, context);
  }

  @override
  Future<void> error(String message,
      [Map<String, Object?> context = const {}]) {
    return pigeon.error(message, context);
  }
}
