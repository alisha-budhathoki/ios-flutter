import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Create a Dart project appropriate for the build config
    private lazy var dartProject: FlutterDartProject = {
        #if DEBUG
        // Debug/Profile expect kernel_blob.bin and friends
        return FlutterDartProject()
        #else
        // Release/AOT: use the precompiled Dart bundle from the app’s main bundle
        return FlutterDartProject(precompiledDartBundle: Bundle.main)
        #endif
    }()

    // One shared engine
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine",
                                           project: dartProject)

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Run the engine
        flutterEngine.run()

        // Register plugins
        GeneratedPluginRegistrant.register(with: flutterEngine)

        return true
    }
}
