//
//  Target_CATLVersionUpdateView.m
//  CATLUpdateKit
//
//  Created by 汪鹏 on 2021/7/28.
//

#import "Target_CATLVersionUpdateView.h"
#import "CATLVersionUpdateView.h"

@implementation Target_CATLVersionUpdateView
- (UIView *)Action_CATLVersionShowUpdateNoticeView:(NSDictionary *)param {
    CATLVersionUpdateView *update = [CATLVersionUpdateView new];
    NSString *text = [param objectForKey:@"Message"];
    BOOL isMust = [param objectForKey:@"Must"];
    NSString *app_id = [param objectForKey:@"APPID"];
    [update configUpdateDescContentText:text andIsMustUpdate:isMust withAppId:app_id];
    return update;
}
@end
