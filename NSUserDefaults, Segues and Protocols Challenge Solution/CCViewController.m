//
//  CCViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Raymond Louie on 3/17/14.
//  Copyright (c) 2014 Raymond Louie. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.usernameLabel.text = self.username;
    self.passwordLabel.text = self.password;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutButtonPressed:(UIButton *)sender {
    [self.delegate didLogout];
}
@end
