//
//  FirstViewControllerAppDelegate.h
//  UserRegistration
//
//  Created by Hugo Adolfo Perez Solorzano on 9/26/12.
//  Copyright (c) 2012 bmgh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormViewController.h"
#import "RegistrationFormViewController.h"
@class RegistrationFormViewController;
@class FormViewController;
@interface FirstViewControllerAppDelegate : UIResponder <UIApplicationDelegate>
{
    RegistrationFormViewController *objRegistrationFormViewController;
    UINavigationController *objNavigationController;
    FormViewController *objFormViewController;
}
@property (strong, nonatomic)RegistrationFormViewController *objRegistrationFormViewController;
@property (strong, nonatomic)UINavigationController *objNavigationController;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)FormViewController *objFormViewController;

@end
