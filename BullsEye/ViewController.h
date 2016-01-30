//
//  ViewController.h
//  BullsEye
//
//  Created by Nikolay on 01.12.15.
//  Copyright © 2015 nut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic,weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;
-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider * )slider;
- (IBAction)startOver;
@end

