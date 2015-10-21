//
//  HomeViewController.m
//  Link
//
//  Created by Arunabh Das on 2015-10-16.
//  Copyright © 2015 Arunabh Das. All rights reserved.
//

#import "HomeViewController.h"
#import <UICKeyChainStore/UICKeyChainStore.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSError *sessionError = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:&sessionError];
    
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[[NSBundle mainBundle] URLForResource:@"silence" withExtension:@"mp3"]];
    [self setPlayer:[[AVPlayer alloc] initWithPlayerItem:item]];
    
    [[self player] setActionAtItemEnd:AVPlayerActionAtItemEndNone];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(task:) object:nil] start];
    
    [[self player] play];
    
}

- (void)task:(id)args
{
    while (1)
    {
        NSDate *today = [NSDate date];
        NSLog(@"%@ : Link is still running...", [today description]);
        
        NSString *string = [UICKeyChainStore stringForKey:@"someKey" service:@"someService"];
        
        NSLog(@"the string is %@", string);
        sleep(1);
    }
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



- (IBAction)goToInternalOneTapped:(id)sender {
        [self performSegueWithIdentifier:@"HomeToInternalOneSegue" sender:self];
}
- (IBAction)totalTapped:(id)sender {
    NSInteger total = [self.valueA.text intValue] + [self.valueB.text intValue];
    NSLog(@"total : %ld", total);
    self.valueTotal.text = [NSString stringWithFormat:@"%ld", total];
    NSString *fullUrl = [@"bluelink://" stringByAppendingString:self.valueTotal.text];
    /*
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"bluelink://"]];
    */
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: fullUrl]];
    
}
@end
