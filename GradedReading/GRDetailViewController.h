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

@property (weak, nonatomic) IBOutlet UITextView *lessonTextView;
@property (weak, nonatomic) IBOutlet UISlider *levelSlider;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@property (strong, nonatomic) id detailItem;

@property (nonatomic) int level;


@end
