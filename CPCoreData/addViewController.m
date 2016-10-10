//
//  addViewController.m
//  CPCoreData
//
//  Created by Student P_07 on 06/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "addViewController.h"

@interface addViewController ()

@end

@implementation addViewController

-(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {        context = [delegate managedObjectContext];
}
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segmentAction:(id)sender {
    
    localSegmentControl = sender;
    NSInteger i;
    switch (localSegmentControl.selectedSegmentIndex == i) {
        case 0:
            i=0;
            [self saveAction:sender];
            break;
        case 1:
            i=1;
            [self saveAction:sender];
            break;
            case 2:
            i=2;
            [self saveAction:sender];
            break;
        default:
            break;
    }
    
}

- (IBAction)saveAction:(id)sender {
    
    NSString *company = self.textFieldOne.text;
    NSString *model = self.textFieldTwo.text;
    NSString *price = self.textFieldThree.text;

    if (localSegmentControl.selectedSegmentIndex == 0  ) {
        
        if (company.length > 0){
            if (model.length > 0) {
                if (price.length > 0) {
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"TV" inManagedObjectContext:context];
                    
                    [newDevice setValue:company forKey:@"company"];
                    [newDevice setValue:model forKey:@"model"];
                    [newDevice setValue:price forKey:@"price"];
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        NSLog(@"Saved");
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else {
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                    }
                    
                }
            }
        }
    }
    
    else if(localSegmentControl.selectedSegmentIndex == 1 ) {
        
        if (company.length > 0) {
            if (model.length > 0) {
                if (price.length > 0) {
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"MOBILE" inManagedObjectContext:context];
                    
                    [newDevice setValue:model forKey:@"model"];
                    [newDevice setValue:price forKey:@"price"];
                    [newDevice setValue:company forKey:@"year"];
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        NSLog(@"Saved");
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else {
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                    }
                    
                }
            }
        }
    }

    else if(localSegmentControl.selectedSegmentIndex == 2 ) {
        
        if (company.length > 0) {
            if (model.length > 0) {
                
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"AC" inManagedObjectContext:context];
                    
                    [newDevice setValue:model forKey:@"name"];
                    [newDevice setValue:price forKey:@"price"];
                
                    self.textFieldThree.hidden=YES;
                
                    NSError *error;
                    
                    if ([context save:&error]) {
                        NSLog(@"Saved");
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else {
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                    }
                }
            }
        }
    }

- (IBAction)cancleAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (textField == self.textFieldOne) {
        [self.textFieldTwo becomeFirstResponder];
    }
    else if (textField == self.textFieldTwo){
        [self.textFieldThree becomeFirstResponder];
    }
    return YES;
}

@end
