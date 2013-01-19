//
//  tikiInfo.m
//  tiki
//
//  Created by Alex Lauderdale on 1/15/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiInfo.h"

@implementation tikiInfo



+ (NSString *)path{
    return [[NSBundle mainBundle] pathForResource:@"tikis" ofType:@"plist"];
}

+ (NSDictionary *)dict{
    return [[NSDictionary alloc] initWithContentsOfFile:[self path]];
}

+ (NSArray *)tikiNames{
    NSArray *tikiNames = [[self dict] objectForKey:@"tikiNames"];
    return tikiNames;
}

+ (NSArray *)tikiDefense{
    NSArray *tikiDefense = [[self dict] objectForKey:@"tikiDefense"];
    return tikiDefense;
}

+ (NSArray *)tikiStrengths{
    NSArray *tikiStrengths = [[self dict] objectForKey:@"tikiStrengths"];
    return tikiStrengths;
}

+ (NSArray *)tikiAttacks{
    NSArray *tikiAttacks = [[self dict] objectForKey:@"tikiAttacks"];
    return tikiAttacks;
}

+ (NSArray *)tikiPowers{
    NSArray *tikiPowers = [[self dict] objectForKey:@"tikiPowers"];
    return tikiPowers;
}

+ (NSArray *)tikiThumbs{
    NSArray *tikiThumbs = [[self dict] objectForKey:@"tikiThumbs"];
    return tikiThumbs;
}

+ (NSArray *)tikiLargeImages{
    NSArray *tikiLargeImages = [[self dict] objectForKey:@"tikiLargeImages"];
    return tikiLargeImages;
}

+ (NSArray *)tikiCommands{
    NSArray *tikiCommands = [[self dict] objectForKey:@"tikiCommands"];
    return tikiCommands;
}



@end
