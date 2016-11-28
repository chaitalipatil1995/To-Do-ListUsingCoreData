//
//  ViewController.m
//  CPCoreData
//
//  Created by Student P_07 on 06/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {        context = [delegate managedObjectContext];
    }
    return context;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tvArray = [[NSMutableArray alloc]init];
    mobileArray = [[NSMutableArray alloc]init];
    acArray = [[NSMutableArray alloc]init];

    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(segmentControl.selectedSegmentIndex==0)
        {
            return tvArray.count;
        }
    else if (segmentControl.selectedSegmentIndex==1) {
       
        return mobileArray.count;
        }
        else if (segmentControl.selectedSegmentIndex == 2){
            return acArray.count;
        }
        
        return 0;
}



-(UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"device_cell"];
    
    {
    if (segmentControl.selectedSegmentIndex == 0) {
        
        NSManagedObjectContext *Tv = [tvArray objectAtIndex:indexPath.row];
        
                cell.nameLabel.text = [Tv valueForKey:@"company"];
                cell.labelTwo.text = [Tv valueForKey:@"model"];
                cell.labelThree.text = [Tv valueForKey:@"price"];
        
        NSLog(@"%@",tvArray);
    }
    else if (segmentControl.selectedSegmentIndex == 1){
        
        NSManagedObjectContext *Mobile = [mobileArray objectAtIndex:indexPath.row];
        
                cell.nameLabel.text = [Mobile valueForKey:@"model"];
                cell.labelTwo.text = [Mobile valueForKey:@"price"];
                cell.labelThree.text = [Mobile valueForKey:@"year"];
    }
    else if (segmentControl.selectedSegmentIndex == 2){
        
                NSManagedObjectContext *AC = [acArray objectAtIndex:indexPath.row];
        
                cell.nameLabel.text = [AC valueForKey:@"name"];
                cell.labelTwo.text = [AC valueForKey:@"price"];

    }
        
        
}
    
    return cell;

    
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self fetchDeviceFromCoreData];
    
}

-(void)fetchDeviceFromCoreData {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (segmentControl.selectedSegmentIndex == 0) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"TV"];
        
        NSError *error;
        tvArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }

    }
    else if (segmentControl.selectedSegmentIndex == 1) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"MOBILE"];
        
        NSError *error;
        mobileArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }
        
    }
    else if (segmentControl.selectedSegmentIndex == 2) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"AC"];
        
        NSError *error;
         acArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }

    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self deleteEntry:indexPath];
    }
    else{
        
        
    }
}

            
-(void)deleteEntry:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (segmentControl.selectedSegmentIndex == 0) {
        
        [context deleteObject:[tvArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            
            [self fetchDeviceFromCoreData];
            
            [self.tableView reloadData];
        }
        else {
            
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    else if (segmentControl.selectedSegmentIndex == 1) {
        
        [context deleteObject:[mobileArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            
            [self fetchDeviceFromCoreData];
            
            [self.tableView reloadData];
            
        }
        else {
            
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    else if (segmentControl.selectedSegmentIndex == 2) {
        
        [context deleteObject:[acArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            
            
            [self fetchDeviceFromCoreData];
            
            [self.tableView reloadData];
            
        }
        else {
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
    }
    
    
}



- (IBAction)segmentAction:(id)sender {
    
    segmentControl = sender;
    
    NSInteger i;
        switch (segmentControl.selectedSegmentIndex == i) {
            case 0:
                i=0;
                [self.tableView reloadData];
                break;
            case 1:
                i=1;
                [self.tableView reloadData];
                break;
            case 2:
                i=2;
                [self.tableView reloadData];
                break;
            default:
                break;
        }
    
}

- (IBAction)addAction:(id)sender {
    
    addViewController *addView = [self.storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
    
    [self.navigationController pushViewController:addView animated:YES];

}
@end
