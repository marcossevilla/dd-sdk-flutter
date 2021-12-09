import 'package:pigeon/pigeon.dart';

class DdSdkConfiguration {
  late String clientToken;
  late String env;
  String? applicationId;
  bool? nativeCrashReportEnabled;
  double? sampleRate;
  String? site;
  String? trackingConsent;
  Map<String?, Object?>? additionalConfig;
}

@HostApi()
abstract class DdSdkPigeon {
  void initialize(DdSdkConfiguration configuration);
}

@HostApi()
abstract class DdLogsPigeon {
  void debug(String message, Map<String, Object?> context);
  void info(String message, Map<String, Object?> context);
  void warn(String message, Map<String, Object?> context);
  void error(String message, Map<String, Object?> context);
}
