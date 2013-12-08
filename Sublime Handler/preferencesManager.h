//
//  preferencesManager.h
//  Sublime Handler
//
//  Created by Berg on 08/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PREF_SUBLIME_PATH_KEY       @"sublimePath"
#define PREF_SHOW_LOGO_KEY          @"showLogo"
#define PREF_EXIT_AFTER_LAUNCH_KEY  @"exitAfterLaunch"

@interface preferencesManager : NSObject

@property (nonatomic) NSString* sublimePath;
@property (nonatomic) BOOL      showsLogo;
@property (nonatomic) BOOL      exitAfterLaunch;


- (void)storeSettingsWithDefaults:(NSUserDefaults*)defaults;
- (void)loadSettingsWithDefaults:(NSUserDefaults*)defaults;

@end
