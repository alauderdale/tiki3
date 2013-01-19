//
//  UIColor+HexColors.m
//  Gloo
//

#import "UIColor+HexColors.h"

@implementation UIColor (HexColors)

+ (UIColor *)colorFromRGB:(unsigned)rgbValue
{
return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                       green:((float)((rgbValue & 0xFF00) >> 8))/255.0
                        blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];

}

+ (UIColor *)colorFromRGBString:(NSString *)rgbStringValue
{
    unsigned result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:rgbStringValue];
    [scanner scanHexInt:&result];
    return [UIColor colorFromRGB:result];
}


- (id)initWithRGBHex:(UInt32)hex
{
	int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
    
    return [self initWithRed:r / 255.0f
					   green:g / 255.0f
						blue:b / 255.0f
					   alpha:1.0f];
}

/// Same logic as +[UIColor colorWithHexString:], but intializes a retained UIColor rather than autoreleased.
///
- (id)initWithHexString:(NSString *)stringToConvert
{
	NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
	unsigned hexNum;
	if ([scanner scanHexInt:&hexNum]) return [self initWithRGBHex:hexNum];
	else return nil;
}
@end
