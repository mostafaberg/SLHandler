//
//  sublimeLauncher.m
//  Sublime Handler
//
//  Created by Berg on 08/12/13.
//  Copyright (c) 2013 mostafaberg. All rights reserved.
//

#import "sublimeLauncher.h"

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
    NSDictionary *params = [self parseUrlParams:anURL];
    if(params)
    {
        NSString *arguments = [NSString stringWithFormat:@"%@:%@", [params objectForKey:@"url"], [params objectForKey:@"line"]];
        NSError *error;
        NSURL *sublUrl = [[NSWorkspace sharedWorkspace] URLForApplicationWithBundleIdentifier:@"com.sublimetext.3"];

        NSRunningApplication *subl = [[NSWorkspace sharedWorkspace] launchApplicationAtURL:sublUrl
                                                      options:NSWorkspaceLaunchAllowingClassicStartup
                                                configuration:@{NSWorkspaceLaunchConfigurationArguments:@[arguments]}
                                                        error:&error];
        NSLog(@"%@", subl);
        [subl activateWithOptions:NSApplicationActivateAllWindows];

    }

    return YES;
}
@end
