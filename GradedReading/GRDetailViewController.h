//
//  GRDetailViewController.h
//  GradedReading
//
//  Created by XiaoYin Wang on 12-5-20.
//  Copyright (c) 2012年 HackFisher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRDetailViewController : UIViewController
- (IBAction)changeHighLightWords:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *lessonWebView;
@property (weak, nonatomic) IBOutlet UISlider *levelSlider;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UISwitch *levelSwitch;

@property (strong, nonatomic) id detailItem;

@property (nonatomic) int level;
@property (nonatomic) BOOL showLevel;
@property (copy, nonatomic) NSString *text;

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end
