//
//  sublimeLauncher.m
//  Sublime Handler
//
//  Created by Berg on 08/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import "sublimeLauncher.h"
#import "preferencesManager.h"

@implementation sublimeLauncher

- (NSDictionary*)parseUrlParams:(NSURL*)anURL
{
    NSString *command = [anURL host];
    NSString *params = [anURL query];

    NSArray *explodedParams = [params componentsSeparatedByString:@"&"];
    NSMutableDictionary *paramsDictionary = [[NSMutableDictionary alloc] init];

    [paramsDictionary setObject:command forKey:@"command"];

    for (NSString *aStr in explodedParams) {
        NSArray *explodedParam = [aStr componentsSeparatedByString:@"="];
        if([explodedParam count] == 2)
            [paramsDictionary setObject:[explodedParam objectAtIndex:1] forKey:[explodedParam objectAtIndex:0]];
    }

    //Convert File URL to standard url if it is one
    NSString *filePath = [paramsDictionary objectForKey:@"url"];
    NSString *path = [filePath stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    path = [path stringByReplacingOccurrencesOfString:@"file://" withString:@""];

    [paramsDictionary setObject:path forKey:@"url"];

    return paramsDictionary;

}

- (BOOL)launchSublimeWithURL:(NSURL*)anURL
{
    preferencesManager *manager = [[preferencesManager alloc] init];
    NSInteger sublimeVersion = [manager sublimeVersion];
    NSString *applicationIdentifier = [NSString stringWithFormat:@"com.sublimetext.%d", (int)sublimeVersion];

    NSDictionary *params = [self parseUrlParams:anURL];

    if(params)
    {
        if(![[params objectForKey:@"command"] isEqualToString:@"open"])
        {
            return NO;
        }

        NSError *error;
        NSString *arguments = [NSString stringWithFormat:@"%@:%@:%@",
                               [params objectForKey:@"url"],
                               ([params objectForKey:@"line"] ? [params objectForKey:@"line"] : 0),
                               ([params objectForKey:@"column"] ? [params objectForKey:@"column"] : 0)];


        NSURL *sublUrl = [[NSWorkspace sharedWorkspace] URLForApplicationWithBundleIdentifier:applicationIdentifier];

        NSRunningApplication *subl = [[NSWorkspace sharedWorkspace] launchApplicationAtURL:sublUrl
                                                      options:NSWorkspaceLaunchAllowingClassicStartup
                                                configuration:@{NSWorkspaceLaunchConfigurationArguments:@[arguments]}
                                                        error:&error];

        [subl activateWithOptions:NSApplicationActivateAllWindows];

    }

    return YES;

}
@end
