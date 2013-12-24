//
//  MainMenuController.m
//  Sublime Handler
//
//  Created by Berg on 10/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import "MainMenuController.h"
#import "preferencesManager.h"

@implementation MainMenuController

- (void)setup
{

    preferencesManager *aManager = [[preferencesManager alloc] init];

    //Update menu items
    [_exitAfterLaunchCheckBox setState:[aManager exitAfterLaunch]];
    [_showLogoCheckBox setState:[aManager showsLogo]];
    NSInteger index = [aManager sublimeVersion] - 2;
    [_versionSelector selectItem:[[_versionSelector itemArray] objectAtIndex:index]];

    NSString *versionString = [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];

    [_versionLabel setStringValue:[NSString stringWithFormat:@"Sublime Handler V %@", versionString]];

}

- (IBAction)saveButtonClicked:(id)sender
{

    preferencesManager *aManager = [[preferencesManager alloc] init];
    [aManager setExitAfterLaunch:_exitAfterLaunchCheckBox.state];
    [aManager setShowsLogo:_showLogoCheckBox.state];
    [aManager setSublimeVersion:_versionSelector.selectedItem.tag];
    [aManager storeSettingsWithDefaults:[NSUserDefaults standardUserDefaults]];

    exit(1);

}

@end