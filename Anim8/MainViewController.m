//
//  MainViewController.m
//  Anim8
//
//  Created by Nicolas Ameghino on 6/1/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "MainViewController.h"
#import "ModalViewController.h"
#import "FadeAnimation.h"

@interface MainViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation MainViewController

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
    self.view.backgroundColor = [UIColor orangeColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"main";
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor redColor];
    
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
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] init];
    [tgr addTarget:self action:@selector(presentTapHandler:)];
    [self.view addGestureRecognizer:tgr];
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

-(void)viewWillDisappear:(BOOL)animated {
    [Logger logViewController:self];
}

-(void)viewDidDisappear:(BOOL)animated {
    [Logger logViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tap handlers
-(void) presentTapHandler:(id) sender {
    ModalViewController *modal = [[ModalViewController alloc] init];
    modal.transitioningDelegate = self;
    modal.modalPresentationStyle = UIModalPresentationCustom;
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] init];
    [tgr addTarget:self action:@selector(dismissTapHandler:)];
    [modal.view addGestureRecognizer:tgr];
    
    [self presentViewController:modal
                       animated:YES
                     completion:NULL];
}

-(void) dismissTapHandler:(id) sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Transitioning delegate
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [FadeAnimation new];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting
                                                                     sourceController:(UIViewController *)source {
    return [FadeAnimation new];
    
}

@end
