//
//  ModalViewController.m
//  Anim8
//
//  Created by Nicolas Ameghino on 6/1/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.backgroundColor = [UIColor blackColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"modal";
    label.textColor = [UIColor whiteColor];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:label];
    
    [self.view addConstraints:
     @[
       [NSLayoutConstraint constraintWithItem:label
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeHeight
                                   multiplier:1.0f
                                     constant:0.0f],
       [NSLayoutConstraint constraintWithItem:label
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeWidth
                                   multiplier:1.0f
                                     constant:0.0f],
       [NSLayoutConstraint constraintWithItem:label
                                    attribute:NSLayoutAttributeCenterX
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeCenterX
                                   multiplier:1.0f
                                     constant:0.0f],
       [NSLayoutConstraint constraintWithItem:label
                                    attribute:NSLayoutAttributeCenterY
                                    relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                    attribute:NSLayoutAttributeCenterY
                                   multiplier:1.0f
                                     constant:0.0f]
       ]];
}

-(void)viewWillAppear:(BOOL)animated {
    [Logger logViewController:self];
}

-(void)viewDidAppear:(BOOL)animated {
    [Logger logViewController:self];
}

-(void)viewWillLayoutSubviews {
    [Logger logViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
