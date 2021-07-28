//
//  CTMediator+VersionUpdate.m
//  CATLUpdateKit
//
//  Created by 汪鹏 on 2021/7/28.
//

#import "CTMediator+VersionUpdate.h"

@implementation CTMediator (VersionUpdate)

- (UIView *)showUpdateDescContentText:(NSString *)text andIsMustUpdate:(BOOL)isMustUpdate withAppId:(NSString *)appId {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:text forKey:@"Message"];
    [dic setValue:@(isMustUpdate) forKey:@"Must"];
    [dic setValue:appId forKey:@"APPID"];
    
    // 测试
    return [self performTarget:@"CATLVersionUpdateView" action:@"CATLVersionShowUpdateNoticeView" params:dic shouldCacheTarget:NO];
}

@end
