//
//  WXPushComponent.m
//  farwolf.weex
//
//  Created by 郑江荣 on 2017/5/3.
//  Copyright © 2017年 郑江荣. All rights reserved.
//

#import "WXPushComponent.h"
#import "WeexFactory.h"
 
@implementation WXPushComponent

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openURL)];
        _tap.delegate = self;
        if (attributes[@"href"]) {
            _href = attributes[@"href"];
        }
        if (attributes[@"navbarVisibility"]) {
            _navbarVisibility = attributes[@"navbarVisibility"];
        }
        else
        {
            _navbarVisibility=@"hidden";
        }
    }
    return self;
}

- (void)dealloc
{
    if (_tap.delegate) {
        _tap.delegate = nil;
    }
}

- (void)viewDidLoad
{
    [self.view addGestureRecognizer:_tap];
}

- (void)openURL
{
    if (_href && [_href length] > 0) {
        /* a标签的跳转连接 可以根据该链接 进行跳转 */
    
    
      
        
        [WeexFactory renderNew:[Weex getFinalUrl:_href weexInstance:self.weexInstance] compelete:^(WXNormalViewContrller *vc) {
             [[self.weexInstance.viewController navigationController] pushViewController:vc animated:YES];
        } fail:^(NSString *msg) {
            
        } frame:[UIApplication sharedApplication].keyWindow.frame];
 
        
   
       
    }
}

- (void)com {
    
    CGFloat w=[UIScreen mainScreen].bounds.size.width;
    CGFloat h=[UIScreen mainScreen].bounds.size.height;
//    [weexInstance.viewController.view bringSubviewToFront:_popView];
    [UIView animateWithDuration:0.15 animations:^{
        
        
    }];
    
    
    
    
}

- (void)updateAttributes:(NSDictionary *)attributes
{
    if (attributes[@"href"]) {
        _href = attributes[@"href"];
    }
}

#pragma mark
#pragma gesture delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return YES;
    }
    
    return NO;
}

@end
