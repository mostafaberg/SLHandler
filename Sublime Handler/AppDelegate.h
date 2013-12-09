//
//  AppDelegate.h
//  Sublime Handler
//
//  Created by Berg on 08/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "preferencesManager.h"
#import "sublimeLauncher.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow    *window;
@property (strong) preferencesManager   *preferences;
@property (strong) sublimeLauncher      *launcher;
@property (strong) NSURL*               launchedURL;

@end
