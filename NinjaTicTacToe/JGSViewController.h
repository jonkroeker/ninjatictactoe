//
//  JGSViewController.h
//  NinjaTicTacToe
//
//  Created by Jon Kroeker on 3/19/14.
//  Copyright (c) 2014 Jon Kroeker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGSViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *resetButtonOutlet;
@property (strong, nonatomic) IBOutlet UILabel *winnerLabel;
- (IBAction)squarePress:(UIButton *)sender;
- (IBAction)resetButton:(UIButton *)sender;

@end
