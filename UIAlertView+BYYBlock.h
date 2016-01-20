//
//  UIAlertView+BYYBlock.h
//  BaiduNuomiTuan
//
//  Created by zuopengl on 14-6-1.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  alertView点击回调
 *
 *  @param alertView   alertView对象
 *  @param buttonIndex 点击的索引
 */
typedef void (^BYYUIAlertViewCompletion)(UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (BYYBlock)
- (void)showWithCompletion:(BYYUIAlertViewCompletion)completion;
@end
