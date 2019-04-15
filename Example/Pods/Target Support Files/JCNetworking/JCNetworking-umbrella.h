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

#import "JCNetwork.h"
#import "JCNetworkConfig.h"
#import "JCNetworkConfigManager.h"
#import "JCNetworkManager.h"
#import "JCNetworkRequest.h"

FOUNDATION_EXPORT double JCNetworkingVersionNumber;
FOUNDATION_EXPORT const unsigned char JCNetworkingVersionString[];

