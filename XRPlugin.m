//
//  XRPlugin.m
//  XRPlugin
//
//  Created by mac on 13-8-1.
//  Copyright (c) 2013年 xiaoran. All rights reserved.
//

#import "XRPlugin.h"

@implementation XRPlugin

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    NSLog(@"hello world");
    
    [self shareXRPlugin];
}

+ (id)shareXRPlugin
{
    
    static dispatch_once_t token;
    static XRPlugin *instant=nil;
    dispatch_once(&token , ^{
        
        instant = [[XRPlugin alloc] init];
    
    });
    
    return instant;
}


- (id)init
{
    if ([super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRecieveFinishLaunchingNotification:) name:@"NSApplicationDidFinishLaunchingNotification" object:nil];
    }
    return  self;
}


- (void)didRecieveFinishLaunchingNotification:(NSNotification *)notification
{
    // xcode 加载完成
    NSLog(@"xcode load finished!!");
    NSMenuItem *menu = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    if (menu) {
        NSLog(@"add submenu to Edit");
        [[menu submenu] addItem:[NSMenuItem separatorItem]];
        NSMenuItem *newItem = [[NSMenuItem alloc] initWithTitle:@"What's this" action:@selector(showSelected) keyEquivalent:@""];;
        [newItem setTarget:self];
        
        [[menu submenu] addItem:newItem];
        [newItem release];
        
    }
    
    
    

}

- (void)showSelected
{

}


@end



