//
//  UIAlertView+BYYBlock.m
//  BaiduNuomiTuan
//
//  Created by zuopengl on 14-6-1.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import "UIAlertView+BYYBlock.h"
#import <objc/runtime.h>

static NSString *kBYYUIAlertViewCompletionBlockAssociatedKey = @"kBYYUIAlertViewCompletionBlockAssociatedKey";

@implementation UIAlertView (BYYBlock)

- (void)showWithCompletion:(BYYUIAlertViewCompletion)completion {
    objc_setAssociatedObject(self, (__bridge const void *)(kBYYUIAlertViewCompletionBlockAssociatedKey), completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setDelegate:self];
    [self show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    BYYUIAlertViewCompletion completionHandler = objc_getAssociatedObject(self, (__bridge const void *)(kBYYUIAlertViewCompletionBlockAssociatedKey));
    
    if (completionHandler != nil) {
        completionHandler(alertView, buttonIndex);
    }
}

@end
