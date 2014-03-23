//
//  JGSViewController.m
//  NinjaTicTacToe
//
//  Created by Jon Kroeker on 3/19/14.
//  Copyright (c) 2014 Jon Kroeker. All rights reserved.
//

#import "JGSViewController.h"

@interface JGSViewController ()

@end

@implementation JGSViewController

int turns;
bool firstPlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    firstPlayer = YES;
	turns = 0;
}

#pragma mark - Button Action

- (IBAction)squarePress:(UIButton *)sender {
    
    //Set button tags, and create button instance.
    
    NSInteger i = [sender tag];
    UIButton *tmpButton = (UIButton *)[self.view viewWithTag:i];
    
    //Check if button contains image by checking tag, if less than 10 increment the tag by 10
    if (turns <= 9) {
        if (i < 10) {
            if (firstPlayer) {
                [tmpButton setImage:[UIImage imageNamed:@"X.png"]forState:UIControlStateNormal];
                [tmpButton setTag:i+10];
            }else {
                [tmpButton setImage:[UIImage imageNamed:@"O.png"]forState:UIControlStateNormal];
                [tmpButton setTag:i+10];
            }
            firstPlayer = !(firstPlayer);
            turns++;
        }
    }
    
    //Results displayed when there is a winner
    
    if ([self checkForWin]) {
        
        [self.winnerLabel setHidden:NO];
        [self.resetButtonOutlet setHidden:NO];
        [self.resetButtonOutlet setEnabled:YES];
        if (firstPlayer) {
            self.winnerLabel.text = @"O Wins!";
        }else {
            self.winnerLabel.text = @"X Wins!";
        }
        
        turns = 10;
    }
}

- (IBAction)resetButton:(UIButton *)sender {
    UIButton *b1 = (UIButton *)[self.view viewWithTag:11];
    UIButton *b2 = (UIButton *)[self.view viewWithTag:12];
    UIButton *b3 = (UIButton *)[self.view viewWithTag:13];
    UIButton *b4 = (UIButton *)[self.view viewWithTag:14];
    UIButton *b5 = (UIButton *)[self.view viewWithTag:15];
    UIButton *b6 = (UIButton *)[self.view viewWithTag:16];
    UIButton *b7 = (UIButton *)[self.view viewWithTag:17];
    UIButton *b8 = (UIButton *)[self.view viewWithTag:18];
    UIButton *b9 = (UIButton *)[self.view viewWithTag:19];
    
    [b1 setTag:1];
    [b2 setTag:2];
    [b3 setTag:3];
    [b4 setTag:4];
    [b5 setTag:5];
    [b6 setTag:6];
    [b7 setTag:7];
    [b8 setTag:8];
    [b9 setTag:9];
    
    [b1 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b2 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b3 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b4 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b5 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b6 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b7 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b8 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    [b9 setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal];
    
    [self.winnerLabel setHidden:YES];
    [self.resetButtonOutlet setHidden:YES];
    [self.resetButtonOutlet setEnabled:NO];
    firstPlayer = YES;
	turns = 0;
}

#pragma mark - Helper Methods

- (BOOL)checkForWin {
    
    UIButton *button1 = (UIButton *)[self.view viewWithTag:11];
    UIButton *button2 = (UIButton *)[self.view viewWithTag:12];
    UIButton *button3 = (UIButton *)[self.view viewWithTag:13];
    UIButton *button4 = (UIButton *)[self.view viewWithTag:14];
    UIButton *button5 = (UIButton *)[self.view viewWithTag:15];
    UIButton *button6 = (UIButton *)[self.view viewWithTag:16];
    UIButton *button7 = (UIButton *)[self.view viewWithTag:17];
    UIButton *button8 = (UIButton *)[self.view viewWithTag:18];
    UIButton *button9 = (UIButton *)[self.view viewWithTag:19];
    
    
    //Horizontal Checks
    
    if((button1.currentImage == button2.currentImage) && (button2.currentImage == button3.currentImage) && (button1.currentImage != NULL)) {
        return YES;
    }
    if((button4.currentImage == button5.currentImage) && (button5.currentImage == button6.currentImage) && (button4.currentImage != NULL)) {
        return YES;
    }
    if((button7.currentImage == button8.currentImage) && (button8.currentImage == button9.currentImage) && (button7.currentImage != NULL)) {
        return YES;
    }
    
    //Vertical Checks
    
    if((button1.currentImage == button4.currentImage) && (button4.currentImage == button7.currentImage) && (button1.currentImage != NULL)) {
        return YES;
    }
    if((button2.currentImage == button5.currentImage) && (button5.currentImage == button8.currentImage) && (button2.currentImage != NULL)) {
        return YES;
    }
    if((button3.currentImage == button6.currentImage) && (button6.currentImage == button9.currentImage) && (button3.currentImage != NULL)) {
        return YES;
    }
    
    //Diagnal Checks
    
    if((button1.currentImage == button5.currentImage) && (button5.currentImage == button9.currentImage) && (button1.currentImage != NULL)) {
        return YES;
    }
    if((button3.currentImage == button5.currentImage) && (button5.currentImage == button7.currentImage) && (button3.currentImage != NULL)) {
        return YES;
    }
    
    //Tie Check
    
    if (turns == 9) {
        [self.winnerLabel setHidden:NO];
        [self.resetButtonOutlet setHidden:NO];
        [self.resetButtonOutlet setEnabled:YES];
        self.winnerLabel.text = @"Tie Game!";
    }
    return NO;
}

@end
