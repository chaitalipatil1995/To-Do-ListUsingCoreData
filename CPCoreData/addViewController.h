//
//  addViewController.h
//  CPCoreData
//
//  Created by Student P_07 on 06/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface addViewController : UIViewController<UITextFieldDelegate>
{
    UISegmentedControl *localSegmentControl;
}


@property (strong, nonatomic) IBOutlet UITextField *textFieldOne;
@property (strong, nonatomic) IBOutlet UITextField *textFieldTwo;
@property (strong, nonatomic) IBOutlet UITextField *textFieldThree;

- (IBAction)segmentAction:(id)sender;
- (IBAction)saveAction:(id)sender;

- (IBAction)cancleAction:(id)sender;




@end
