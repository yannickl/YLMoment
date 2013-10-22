//
//  YLViewController.m
//  NSMomentExample
//
//  Created by YannickL on 18/10/13.
//  Copyright (c) 2013 Yannick Loriot. All rights reserved.
//

#import "YLViewController.h"
#import "NSMoment.h"

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMoment *moment = [NSMoment now];
    
    // Formatting dates
    NSLog(@"moment: %@", [moment format:@"MMMM dd YYYY, h:mm:ss a"]);
    NSLog(@"moment: %@", [moment format:@"MMM DD yy"]);
    NSLog(@"moment: %@", [moment format:@"YYYY 'escaped' YYYY"]);
    NSLog(@"moment: %@", [moment format]);
    
    NSLog(@"moment: %@", [[NSMoment momentWithDateAsString:@"1986-12-11 at 08h" format:@"YYYY-MM-dd 'at' HH'h'"] format]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
