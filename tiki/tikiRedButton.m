//
//  tikiRedButton.m
//  tiki
//
//  Created by Alex Lauderdale on 1/20/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiRedButton.h"

@implementation tikiRedButton

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
    [self setTitleColor:[UIColor colorFromRGB:0xffffff]
               forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"tiki_red_button_bg"]
                              stretchableImageWithLeftCapWidth:15
                              topCapHeight:0]
                    forState:UIControlStateNormal];
}

@end
