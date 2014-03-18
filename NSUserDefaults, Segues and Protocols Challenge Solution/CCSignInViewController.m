//
//  CCSignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Raymond Louie on 3/17/14.
//  Copyright (c) 2014 Raymond Louie. All rights reserved.
//

#import "CCSignInViewController.h"
#import "CCCreateAccountViewController.h"
#import "CCViewController.h"

@interface CCSignInViewController ()

@end

@implementation CCSignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // if Create Account VC, set delegate
    if ([segue.destinationViewController isKindOfClass:[CCCreateAccountViewController class]]) {
        CCCreateAccountViewController *createAccountVC = segue.destinationViewController;
        createAccountVC.delegate = self;
    }
    
    // if VC, set labels
    if ([segue.destinationViewController isKindOfClass:[CCViewController class]])
    {
        CCViewController *vC = segue.destinationViewController;
        vC.username = self.usernameTextField.text;
        vC.password = self.passwordTextField.text;
        vC.delegate = self;
    }
    
    // clean up local text fields for privacy
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonPressed:(UIButton *)sender {
    // if username is blank, show error
    if ([self.usernameTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter username" message:@"Please enter a username." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    // if password is blank, show error
    if ([self.passwordTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter password" message:@"Please enter a password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    // retrieve saved username and password
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults] stringForKey:USER_NAME];
    NSString *savedPassword = [[NSUserDefaults standardUserDefaults] stringForKey:USER_PASSWORD];

    // if username doesn't match show alert
    if (![self.usernameTextField.text isEqualToString:savedUsername]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Username not found" message:@"Username not found." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    // if password doesn't match show alert
    if (![self.passwordTextField.text isEqualToString:savedPassword]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Password incorrect" message:@"Password incorrect." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    // open VC
    [self performSegueWithIdentifier:@"toViewController" sender:self];
}

- (IBAction)createAccountButtonPressed:(UIBarButtonItem *)sender {
    // open CreateAccountVC
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:self];
}

#pragma mark - CCCreateAccountViewControllerDelegate

-(void)didCancel
{
    // dismiss create account view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCreateAccount
{
    // dismiss create account view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CCViewControllerDelegate

-(void)didLogout
{
    // dismiss view controler
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
