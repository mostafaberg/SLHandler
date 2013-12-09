//
//  sublimeLauncher.h
//  Sublime Handler
//
//  Created by Berg on 08/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sublimeLauncher : NSObject

- (NSDictionary*)parseUrlParams:(NSURL*)anURL;
- (BOOL)launchSublimeWithURL:(NSURL*)anURL;

@end
