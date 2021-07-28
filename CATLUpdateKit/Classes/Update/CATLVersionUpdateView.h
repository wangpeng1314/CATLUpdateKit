//
//  CATLVersionUpdateView.h
//  CATLUpdateKit
//
//  Created by 汪鹏 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CATLVersionUpdateView : UIView
- (void)configUpdateDescContentText:(NSString *)text andIsMustUpdate:(BOOL)isMustUpdate withAppId:(NSString*)appId;
@end

NS_ASSUME_NONNULL_END
