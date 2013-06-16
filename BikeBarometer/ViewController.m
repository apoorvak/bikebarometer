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
    
        lblCity.text = [responseDictionary objectForKey:@"city"];
        lblCondition.text = [responseDictionary objectForKey:@"condition"];
        lblState.text = [responseDictionary objectForKey:@"state"];
        lblTemperature.text = [[responseDictionary objectForKey:@"temp"] stringValue];
        lblScore.text = [[responseDictionary objectForKey:@"score"] stringValue];
        lblIts.hidden = NO;
        lblDegrees.hidden = NO;
        lblScoreTitle.hidden = NO;
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
