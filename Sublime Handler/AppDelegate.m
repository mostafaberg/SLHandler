//
//  AppDelegate.m
//  Sublime Handler
//
//  Created by Berg on 08/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{

    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self
                                                       andSelector:@selector(handleAppleEvent:withReplyEvent:)
                                                     forEventClass:kInternetEventClass
                                                        andEventID:kAEGetURL];

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    _preferences = [[preferencesManager alloc] init];
    _launcher    = [[sublimeLauncher alloc] init];

    if(_launchedURL.absoluteString.length > 0)
    {
        [_launcher launchSublimeWithURL:_launchedURL];
        if([_preferences exitAfterLaunch])
            exit(0);
    }
}

- (void)handleAppleEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{

    NSString *urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];

    [self setLaunchedURL: [NSURL URLWithString:urlString]];
    
}

@end