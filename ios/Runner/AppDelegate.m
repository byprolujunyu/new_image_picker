#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "ImagePickerPlugin.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    [ImagePickerPlugin  registerWithRegistrar:[self registrarForPlugin:@"plugins.flutter.io/image_picker"]
     ];  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
