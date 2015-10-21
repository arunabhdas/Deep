//
//  HomeViewController.h
//  Link
//
//  Created by Arunabh Das on 2015-10-16.
//  Copyright © 2015 Arunabh Das. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HomeViewController : UIViewController

- (IBAction)goToInternalOneTapped:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *computationText;

@property (weak, nonatomic) IBOutlet UITextField *valueA;
@property (weak, nonatomic) IBOutlet UITextField *valueB;
@property (weak, nonatomic) IBOutlet UITextField *valueTotal;
@property (nonatomic, strong) AVPlayer *player;
- (IBAction)totalTapped:(id)sender;

@end
