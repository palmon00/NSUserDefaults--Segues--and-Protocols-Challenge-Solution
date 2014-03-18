//
//  CCSignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Raymond Louie on 3/17/14.
//  Copyright (c) 2014 Raymond Louie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCreateAccountViewController.h"
#import "CCViewController.h"

@interface CCSignInViewController : UIViewController <CCCreateAccountViewControllerDelegate, CCViewControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonPressed:(UIButton *)sender;
- (IBAction)createAccountButtonPressed:(UIBarButtonItem *)sender;

@end
