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
    NSLog(@"%@", [moment format:@"MMMM dd yyyy, h:mm:ss a"]);
    NSLog(@"%@", [moment format:@"MMM dd yy"]);
    NSLog(@"%@", [moment format:@"yyyy 'escaped' yyyy"]);
    NSLog(@"%@", [moment format]);
    
    NSLog(@"%@", [[NSMoment momentWithDateAsString:@"1986-12-11 at 08h" format:@"yyyy-MM-dd 'at' HH'h'"] format]);
    NSLog(@"%@", [[NSMoment momentWithDateAsString:@"juillet 2012" format:@"MMMM yyyy" localeIdentifier:@"fr_FR"] format]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
