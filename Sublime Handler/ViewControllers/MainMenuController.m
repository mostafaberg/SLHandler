//
//  MainMenuController.m
//  Sublime Handler
//
//  Created by Berg on 10/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import "MainMenuController.h"

@implementation MainMenuController

- (void)setup
{
    [_exitAfterLaunchCheckBox setState:NO];
    [_showLogoCheckBox setState:NO];
    [_versionSelector selectItem:[[_versionSelector itemArray] objectAtIndex:0]];
}

- (IBAction)saveButtonClicked:(id)sender
{
}

@end
