//
//  tikiButton.m
//  tiki
//
//  Created by Alex Lauderdale on 1/17/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiButton.h"
#import "tikiTheme.h"
#import "UIColor+HexColors.h"

@implementation tikiButton


- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    
    if (self) {
        [self setupStyle];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupStyle];
    }
    
    return self;
}

- (void)setupStyle
{
    [self.titleLabel setFont:[UIFont fontWithName:[tikiTheme boldFontName] size:self.titleLabel.font.pointSize]];
    [self setTitleColor:[UIColor colorFromRGB:0xf2f2f2]
               forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"tiki_button"]
                              stretchableImageWithLeftCapWidth:10
                              topCapHeight:0]
                    forState:UIControlStateNormal];
}

@end
