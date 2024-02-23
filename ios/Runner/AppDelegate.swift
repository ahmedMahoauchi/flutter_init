import UIKit
import Flutter
import GoogleMaps  // Add this import

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
   // TODO: Add your Google Maps API key

        GMSServices.provideAPIKey("AIzaSyAl8e856nkIPW2XOiSd6fwQe1YQzLMlHcU")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
