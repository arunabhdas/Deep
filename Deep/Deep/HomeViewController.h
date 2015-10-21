//
//  HomeViewController.h
//  Deep
//
//  Created by Arunabh Das on 2015-10-16.
//  Copyright © 2015 Arunabh Das. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
- (IBAction)buttonTapped:(id)sender;
- (IBAction)openGreenButtonTapped:(id)sender;
- (IBAction)sendWorkToGreenTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *valueReceived;

@end
