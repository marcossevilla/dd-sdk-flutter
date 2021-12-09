import Flutter
import UIKit
import DatadogSDKBridge

public class SwiftDatadogSdkPlugin: NSObject, FlutterPlugin, FLTDdSdkPigeon {
    let nativeSdk: DdSdk

    override init() {
        nativeSdk = Bridge.getDdSdk()

        super.init()
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let api : FLTDdSdkPigeon & NSObjectProtocol = SwiftDatadogSdkPlugin()
        FLTDdSdkPigeonSetup(registrar.messenger(), api)
    }

    public func initializeConfiguration(_ configuration: FLTDdSdkConfiguration, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let internalConfiguration = DdSdkConfiguration(
            clientToken: configuration.clientToken! as NSString,
            env: configuration.env! as NSString,
            applicationId: configuration.applicationId! as NSString,
            nativeCrashReportEnabled: configuration.nativeCrashReportEnabled?.boolValue,
            sampleRate: configuration.sampleRate?.doubleValue,
            site: configuration.site as NSString?,
            trackingConsent: configuration.trackingConsent as NSString?,
            additionalConfig: configuration.additionalConfig as NSDictionary?
        )
        nativeSdk.initialize(configuration: internalConfiguration)
    }
}

public class SwiftDdLogsPlugin: NSObject, FlutterPlugin, FLTDdLogsPigeon {
    let nativeSdk: DdLogs

    override init() {
        nativeSdk = Bridge.getDdLogs()

        super.init()
    }

    public func debugMessage(_ message: String, context: [String : Any], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        nativeSdk.debug(message: message as NSString, context: context as NSDictionary)
    }

    public func infoMessage(_ message: String, context: [String : Any], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        nativeSdk.info(message: message as NSString, context: context as NSDictionary)
    }

    public func warnMessage(_ message: String, context: [String : Any], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        nativeSdk.warn(message: message as NSString, context: context as NSDictionary)
    }

    public func errorMessage(_ message: String, context: [String : Any], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        nativeSdk.error(message: message as NSString, context: context as NSDictionary)
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let api : FLTDdLogsPigeon & NSObjectProtocol = SwiftDdLogsPlugin()
        FLTDdLogsPigeonSetup(registrar.messenger(), api)
    }
}
