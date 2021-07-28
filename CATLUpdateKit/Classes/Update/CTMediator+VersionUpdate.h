//
//  CTMediator+VersionUpdate.h
//  CATLUpdateKit
//
//  Created by 汪鹏 on 2021/7/28.
//

#import <CTMediator/CTMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (VersionUpdate)
- (UIView*)showUpdateDescContentText:(NSString *)text andIsMustUpdate:(BOOL)isMustUpdate withAppId:(NSString*)appId;
@end

NS_ASSUME_NONNULL_END
