//
//  AppDelegate.h
//  Memory
//
//  Created by Danilo Lira de Lima on 07/03/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navigationController;
}

//navigation control
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIWindow *window;

@end