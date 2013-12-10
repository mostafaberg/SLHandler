//
//  MainMenuController.h
//  Sublime Handler
//
//  Created by Berg on 10/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainMenuController : NSWindow

@property (strong) IBOutlet NSPopUpButton *versionSelector;
@property (strong) IBOutlet NSButton *exitAfterLaunchCheckBox;
@property (strong) IBOutlet NSButton *showLogoCheckBox;
@property (strong) IBOutlet NSTextField *versionLabel;

- (IBAction)saveButtonClicked:(id)sender;


@end
