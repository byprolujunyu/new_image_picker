//
//  ImagePickerPlugin.m
//  Runner
//
//  Created by 鲁隽彧 on 2019/10/29.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//
#import "ImagePickerPlugin.h"
#import "TZImagePickerController.h"
@interface ImagePickerPlugin ()
@property (strong, nonatomic) FlutterResult result;
@end
@implementation ImagePickerPlugin
{
    
}
UIViewController *_viewController;
- (instancetype)initWithViewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    _viewController = viewController;
  }
  return self;
}

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"plugins.flutter.io/image_picker" binaryMessenger:[registrar messenger] ];
    UIViewController *viewController =
         [UIApplication sharedApplication].delegate.window.rootViewController;
    ImagePickerPlugin* instance =[[ImagePickerPlugin alloc] initWithViewController:viewController];
    [registrar addMethodCallDelegate:instance channel:channel];
}


- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
//    if ([@"start" isEqualToString:call.method]) {
//        self.result = result;
//        [[self _asrManager] start];
//    }else if ([@"stop" isEqualToString:call.method]) {
//         [[self _asrManager] stop];
//    }else if ([@"cancel" isEqualToString:call.method]) {
//        [[self _asrManager] cancel];
//    } else{
//        result(FlutterMethodNotImplemented);
//    }
    
    if ([@"getGallery" isEqualToString:call.method]) {
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:_viewController];

        // You can get the photos by block, the same as by delegate.
        // 你可以通过block或者代理，来得到用户选择的照片.
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            NSLog(@"%@",photos);
            NSLog(@"%@",assets);
            self.result(photos);
        }];
        [_viewController presentViewController:imagePickerVc animated:YES completion:nil];
    }
}
@end
