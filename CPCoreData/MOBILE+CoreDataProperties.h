//
//  MOBILE+CoreDataProperties.h
//  CPCoreData
//
//  Created by Student P_07 on 06/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MOBILE.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOBILE (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *model;
@property (nullable, nonatomic, retain) NSString *year;
@property (nullable, nonatomic, retain) NSString *price;

@end

NS_ASSUME_NONNULL_END
