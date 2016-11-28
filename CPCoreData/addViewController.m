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
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
}
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.textFieldThree setKeyboardType:UIKeyboardTypeNumberPad];
 
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

- (IBAction)segmentAction:(id)sender {
    
    localSegmentControl = sender;

    if (localSegmentControl.selectedSegmentIndex == 0) {
        
        
        [self.textFieldOne setPlaceholder:@"Enter Company name:"];
        
        [self.textFieldTwo setPlaceholder:@"Enter Model:"];
        
        [self.textFieldThree setPlaceholder:@"Enter Price:"];
        
        
        [self saveAction:sender];
    }
    else if (localSegmentControl.selectedSegmentIndex == 1) {
        
        
        [self.textFieldOne setPlaceholder:@"Enter Company name:"];
        
        [self.textFieldTwo setPlaceholder:@"Enter Model:"];
        
        [self.textFieldThree setPlaceholder:@"Enter Price:"];
        
        [self saveAction:sender];
    }
    else if (localSegmentControl.selectedSegmentIndex == 2) {
        
        
        
        [self.textFieldOne setPlaceholder:@"Enter Company name:"];
        
        [self.textFieldTwo setPlaceholder:@"Enter Price:"];
        
        //[self.textFieldThree setPlaceholder:@"Enter Price:"];
        
        
        [self saveAction:sender];
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
                        [self showAlertWithTitle:@"ok" message:[NSString stringWithFormat:@"Data saved successfully"]];

                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else {
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",error.localizedDescription]];

                    }
                    
                }
                else{
                    [self showAlertWithTitle:@"Error" message:@"Enter price"];
                }
            }
            else{
                [self showAlertWithTitle:@"Error" message:@"Enter model name"];
            }
        }
        else{
            [self showAlertWithTitle:@"Error" message:@"Enter comapany name"];
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
                        [self showAlertWithTitle:@"ok" message:[NSString stringWithFormat:@"Data saved successfully"]];

                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else {
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",error.localizedDescription]];
                    }
                    
                }
                else{
                    [self showAlertWithTitle:@"Error" message:@"Enter price"];
                }
            }
            else{
                [self showAlertWithTitle:@"Error" message:@"Enter model name"];
            }
        }
        else{
            [self showAlertWithTitle:@"Error" message:@"Enter comapany name"];
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
                        [self showAlertWithTitle:@"ok" message:[NSString stringWithFormat:@"Data saved successfully"]];

                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else {
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                        [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",error.localizedDescription]];

                    }
                }
            
        }
        else{
            [self showAlertWithTitle:@"Error" message:@"Enter model name"];
            }
        }
    else{
        [self showAlertWithTitle:@"Error" message:@"Enter comapany name"];
    }

}



- (IBAction)cancleAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
        
    }];
    
    [alert addAction:OK];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
