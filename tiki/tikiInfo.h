//
//  tikiInfo.h
//  tiki
//
//  Created by Alex Lauderdale on 1/15/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tikiInfo : NSObject <UITableViewDataSource>


+ (NSDictionary*) dict;
+ (NSString*) path;
///tiki info
+ (NSArray*) tikiNames;
+ (NSArray*) tikiPowers;
+ (NSArray*) tikiStrengths;
+ (NSArray*) tikiAttacks;
+ (NSArray*) tikiDefense;
+ (NSArray*) tikiThumbs;
+ (NSArray*) tikiLargeImages;
+ (NSArray*) tikiCommands;





@end
