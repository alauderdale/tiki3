//
//  tikiOverlayView.m
//  tiki
//
//  Created by Alex Lauderdale on 1/19/13.
//  Copyright (c) 2013 Alex Lauderdale. All rights reserved.
//

#import "tikiOverlayView.h"
#import "tikiBoldLabel.h"


@implementation tikiOverlayView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       self.tikiCommandLabel.text = @"hi";
    }
    return self;
}



@end
