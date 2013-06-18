//
//  ViewController.m
//  BikeBarometer
//
//  Created by Brian on 6/12/13.
//  Copyright (c) 2013 Cascade Media. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController


-(IBAction)clickTheButton:(id)sender{
    
    NSLog(@"Bike Barometer!");
    NSString *queryString = [NSString stringWithFormat:@"?q=%@",txtZip.text];
    NSLog(@"%@",kMainUrl);
    NSString *strUrl = [kMainUrl stringByAppendingFormat:@"%@",[queryString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    //strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",strUrl);
    NSURL *requestUrl =[NSURL URLWithString:strUrl];
    NSLog(@"%@",requestUrl);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    [request setHTTPMethod:@"GET"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    [txtZip resignFirstResponder];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    NSError *requestError;
    NSDictionary *responseDictionary =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&requestError];
    if ([[responseDictionary objectForKey:@"error"] integerValue] == 1) {
        NSLog(@"Incorrect Zip code");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bike Barometer" message:@"Please enter a valid Zip code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
    
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [self.view setFrame:CGRectMake(0, 20, 320, 480)];
        [UIView commitAnimations];
        
        
        lblCity.text = [responseDictionary objectForKey:@"city"];
        lblCondition.text = [responseDictionary objectForKey:@"condition"];
        lblState.text = [responseDictionary objectForKey:@"state"];
        lblTemperature.text = [[responseDictionary objectForKey:@"temp"] stringValue];
        lblScore.text = [[responseDictionary objectForKey:@"score"] stringValue];
        score = [[responseDictionary objectForKey:@"score"] integerValue];
        lblIts.hidden = NO;
        lblDegrees.hidden = NO;
        lblScoreTitle.hidden = NO;
        
        switch (score) {
            case 0:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 1:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 2:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 3:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 4:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 5:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 6:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 7:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 8:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 9:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            case 10:
                imgMeter.image = [UIImage imageNamed:[NSString stringWithFormat:@"bar-%d.png",score]];
                break;
            default:
                break;
        }
        NSLog(@"%@",responseDictionary);
        NSLog(@"%@",lblCity.text);
        NSLog(@"%@",lblCondition.text);
        NSLog(@"%@",lblState.text);
        NSLog(@"%@",lblTemperature.text);
        NSLog(@"%@",lblScore.text);

    }
    
    
    
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [self.view setFrame:CGRectMake(0, -40, 320, 480)];
    [UIView commitAnimations];
    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [self.view setFrame:CGRectMake(0, 20, 320, 480)];
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
