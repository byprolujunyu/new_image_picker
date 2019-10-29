//
//  ImagePickerPlugin.m
//  Runner
//
//  Created by 鲁隽彧 on 2019/10/29.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//
#import "ImagePickerPlugin.h"
@interface ImagePickerPlugin ()<TZImagePickerControllerDelegate>
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
    self.result=result;
    if ([@"getGallery" isEqualToString:call.method]) {
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
        // 是否显示可选原图按钮
          imagePickerVc.allowPickingOriginalPhoto = YES;
          // 是否允许显示视频
          imagePickerVc.allowPickingVideo = YES;
          // 是否允许显示图片
          imagePickerVc.allowPickingImage = YES;

        // You can get the photos by block, the same as by delegate.
        // 你可以通过block或者代理，来得到用户选择的照片.
//        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
//            NSLog(@"%@",photos);
//            NSLog(@"%@",assets);
//            self.result(assets);
//        }];
        
//        [imagePickerVc setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOriginalPhoto,NSArray<NSDictionary *> *infos){
//            NSLog(@"%@",infos);
//            for (NSDictionary *info in infos) {
//
//            }
//        }];
        [_viewController presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    
    
}

// 选择视频的回调
-(void)imagePickerController:(TZImagePickerController *)picker
       didFinishPickingVideo:(UIImage *)coverImage
                sourceAssets:(PHAsset *)asset{
    
}
    


@end
