//
//  GRDetailViewController.m
//  GradedReading
//
//  Created by XiaoYin Wang on 12-5-20.
//  Copyright (c) 2012年 HackFisher. All rights reserved.
//

#import "GRDetailViewController.h"

@interface GRDetailViewController ()
- (void)configureView;
@end

@implementation GRDetailViewController

@synthesize lessonTextView = _lessonText;
@synthesize levelSlider = _levelSlider;
@synthesize levelLabel = _levelLabel;
@synthesize detailItem = _detailItem;
@synthesize level = _level;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        NSURL* url = [[NSBundle mainBundle] URLForResource:[self.detailItem description] withExtension:@"txt"];
        
        NSLog(@"The path is : %@", url);
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        self.lessonTextView.text = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setLessonTextView:nil];
    [self setLevelLabel:nil];
    [self setLevelSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // self.lessonTextView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changeHighLightWords:(id)sender {
    self.level = (int)self.levelSlider.value;
    
    //NSLog(@"Level %d", self.level);
    
    NSString *levelString = [[NSString alloc] initWithFormat:@"%d", self.level];
    
    if ([levelString length] == 0) {
        levelString = @"1";
    }
    
    self.levelLabel.text = [[NSString alloc] initWithFormat:@"Level %@", levelString];
}
@end
