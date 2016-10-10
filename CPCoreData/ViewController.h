//
//  ViewController.h
//  CPCoreData
//
//  Created by Student P_07 on 06/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "addViewController.h"
#import "customTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    NSMutableArray *tvArray;
    NSMutableArray *mobileArray;
    NSMutableArray *acArray;
    UISegmentedControl *segmentControl;
}



@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)segmentAction:(id)sender;
- (IBAction)addAction:(id)sender;





@end

