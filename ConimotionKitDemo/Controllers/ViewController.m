//
//  ViewController.m
//  ConimotionKitDemo
//
//  Created by 张旭 on 3/25/16.
//  Copyright © 2016 Kassol. All rights reserved.
//

#import "ViewController.h"
#import "ConimoTionKitDemo-Swift.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ConimotionButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.button animate];
}

@end
