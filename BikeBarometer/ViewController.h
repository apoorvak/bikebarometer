//
//  ViewController.h
//  BikeBarometer
//
//  Created by Brian on 6/12/13.
//  Copyright (c) 2013 Cascade Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"


@interface ViewController : UIViewController<UITextFieldDelegate>{
    
    IBOutlet UITextField *txtZip;
    IBOutlet UILabel *lblState;
    IBOutlet UILabel *lblScore;
    IBOutlet UILabel *lblCity;
    IBOutlet UILabel *lblCondition;
    IBOutlet UILabel *lblTemperature;
    IBOutlet UILabel *lblIts;
    IBOutlet UILabel *lblDegrees;
    IBOutlet UILabel *lblScoreTitle;
    IBOutlet UIImageView *imgMeter;
    NSInteger score;
    IBOutlet UIButton *btnSend;
    IBOutlet UILabel *lblTitle;
    
}

- (IBAction)clickTheButton:(id)sender;


@end
