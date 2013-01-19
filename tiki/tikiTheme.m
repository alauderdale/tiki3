//
//  tikiTheme.m
//  tiki
//
//  Created by Alex Lauderdale on 1/16/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiTheme.h"
#import "UIColor+HexColors.h"

@implementation tikiTheme

+ (NSString *)boldFontName
{
    return @"Gilgongo Sledge";
}

// Generally this style of button is used as a navigation bar item.
+ (UIButton *)customButtonWithText:(NSString *)text
{
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton.titleLabel setFont:[UIFont fontWithName:[self boldFontName] size:12.0f]];
    [customButton setTitleColor:[UIColor colorFromRGB:0xffffff] forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [customButton setTitle:text forState:UIControlStateNormal];
    [customButton setFrame:CGRectMake(0, 0, 60, 30)];
    [customButton setBackgroundImage:[[UIImage imageNamed:@"topbar_action_button"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 3, 0, 3)] forState:UIControlStateNormal];
    [customButton setBackgroundImage:[[UIImage imageNamed:@"topbar_action_button_pressed"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 3, 0, 3)] forState:UIControlStateHighlighted];
    
    return customButton;
}



@end
