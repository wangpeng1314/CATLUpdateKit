#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CATLVersionUpdateView.h"
#import "CTMediator+VersionUpdate.h"
#import "Target_CATLVersionUpdateView.h"

FOUNDATION_EXPORT double CATLUpdateKitVersionNumber;
FOUNDATION_EXPORT const unsigned char CATLUpdateKitVersionString[];

