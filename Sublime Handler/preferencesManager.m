//
//  preferencesManager.m
//  Sublime Handler
//
//  Created by Berg on 08/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import "preferencesManager.h"

@implementation preferencesManager

@synthesize exitAfterLaunch, showsLogo, sublimeVersion;

- (id) init
{
    self = [super init];

    if(self)
    {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [self loadSettingsWithDefaults:userDefaults];
    }

    return self;
}

- (void)storeSettingsWithDefaults:(NSUserDefaults*)defaults
{

    [defaults setInteger:[self sublimeVersion] forKey:PREF_SUBLIME_VERSION_KEY];
    [defaults setBool:[self exitAfterLaunch] forKey:PREF_EXIT_AFTER_LAUNCH_KEY];
    [defaults setBool:[self showsLogo] forKey:PREF_SHOW_LOGO_KEY];

    [defaults synchronize];

}

- (void)loadSettingsWithDefaults:(NSUserDefaults*)defaults
{

    [self setSublimeVersion:[defaults integerForKey:PREF_SUBLIME_VERSION_KEY]];
    [self setExitAfterLaunch:[defaults boolForKey:PREF_EXIT_AFTER_LAUNCH_KEY]];
    [self setShowsLogo:[defaults boolForKey:PREF_SHOW_LOGO_KEY]];

}
@end
