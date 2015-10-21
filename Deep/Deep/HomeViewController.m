//
//  HomeViewController.m
//  Deep
//
//  Created by Arunabh Das on 2015-10-16.
//  Copyright © 2015 Arunabh Das. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import <UICKeyChainStore/UICKeyChainStore.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.valueReceived.text = appDelegate.receivedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonTapped:(id)sender {
    [self performSegueWithIdentifier:@"HomeToInternalSegue" sender:self];
}

- (IBAction)openGreenButtonTapped:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"linklink://"]];
}

- (IBAction)sendWorkToGreenTapped:(id)sender {
    
    [UICKeyChainStore setString:@"12345" forKey:@"someKey" service:@"someService"];
    
}
@end
