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

    //TODO remove me
    _launchedURL = [NSURL URLWithString:@"subl://open?url=file:///Users/Berg/.bash_history&line=484"];

    if(_launchedURL.absoluteString.length > 0)
    {
        [_launcher launchSublimeWithURL:_launchedURL];
        exit(0);
    }
    else
    {
        [_launcher launchSublimeWithURL:_launchedURL];
    }
}

- (void)handleAppleEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{

    NSString *urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];

    [self setLaunchedURL: [NSURL URLWithString:urlString]];
    
}

@end