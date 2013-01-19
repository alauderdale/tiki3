//
//  tikiBoldLabel.m
//  tiki
//
//  Created by Alex Lauderdale on 1/16/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiBoldLabel.h"
#import "tikiTheme.h"

@implementation tikiBoldLabel


- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    
    if (self) {
        self.font = [UIFont fontWithName:[tikiTheme boldFontName]
                                    size:self.font.pointSize];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont fontWithName:[tikiTheme boldFontName]
                                    size:self.font.pointSize];
    }
    return self;
}



@end
