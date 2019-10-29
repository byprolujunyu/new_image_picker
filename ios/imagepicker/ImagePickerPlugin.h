//
//  ImagePickerPlugin.h
//  Runner
//
//  Created by 鲁隽彧 on 2019/10/29.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import <TZImagePickerController/TZImageManager.h>
#import <Flutter/Flutter.h>
@interface ImagePickerPlugin : NSObject

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar;

@end
