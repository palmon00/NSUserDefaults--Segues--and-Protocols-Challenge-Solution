//
//  CCCreateAccountViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Raymond Louie on 3/17/14.
//  Copyright (c) 2014 Raymond Louie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCCreateAccountViewControllerDelegate <NSObject>

@required
-(void)didCancel;
-(void)didCreateAccount;

@end

#define USER_NAME @"username"
#define USER_PASSWORD @"password"

@interface CCCreateAccountViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <CCCreateAccountViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)createAccountButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
