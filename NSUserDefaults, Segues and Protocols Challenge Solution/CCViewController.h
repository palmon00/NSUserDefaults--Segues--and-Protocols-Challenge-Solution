//
//  CCViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Raymond Louie on 3/17/14.
//  Copyright (c) 2014 Raymond Louie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCViewControllerDelegate <NSObject>

@required
-(void)didLogout;

@end


@interface CCViewController : UIViewController

@property (weak, nonatomic) id <CCViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;

- (IBAction)logoutButtonPressed:(UIButton *)sender;

@end
