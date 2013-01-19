//
//  UIView+Categories.m
//
//

#import "UIView+Categories.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (FrameConvenience)

/*========================================================================*
 * origin
 *========================================================================*/
- (CGPoint) frameOrigin; {  return self.frame.origin;   }
- (void) setFrameOrigin:(CGPoint)frameOrigin;
{
    CGRect frame = self.frame;
    frame.origin = frameOrigin;
    self.frame = frame;
}

- (CGFloat) frameX; { return self.frame.origin.x; }
- (void) setFrameX:(CGFloat)frameX;
{
    CGRect frame = self.frame;
    frame.origin.x = frameX;
    self.frame = frame;
}

- (CGFloat) frameY; { return self.frame.origin.y; }
- (void) setFrameY:(CGFloat)frameY;
{
    CGRect frame = self.frame;
    frame.origin.y = frameY;
    self.frame = frame;
}

/*========================================================================*
 * size
 *========================================================================*/
- (CGSize) frameSize; { return self.frame.size; }
- (void) setFrameSize:(CGSize)frameSize;
{
    CGRect frame = self.frame;
    frame.size = frameSize;
    self.frame = frame;
}

- (CGFloat) frameHeight; { return self.frame.size.height; }
- (void) setFrameHeight:(CGFloat)frameHeight;
{
    CGRect frame = self.frame;
    frame.size.height = frameHeight;
    self.frame = frame; 
}

- (CGFloat) frameWidth; { return self.frame.size.width; }
- (void) setFrameWidth:(CGFloat)frameWidth;
{
    CGRect frame = self.frame;
    frame.size.width = frameWidth;
    self.frame = frame; 
}

/*========================================================================*
 * max
 *========================================================================*/
- (CGPoint) frameMax; 
{
    return CGPointMake(self.frame.origin.x + self.frame.size.width,
                       self.frame.origin.y + self.frame.size.height);
}
- (void) setFrameMax:(CGPoint)frameMax;
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(frameMax.x - self.frame.size.width,
                               frameMax.y - self.frame.size.height);
    self.frame = frame;     
}

- (CGFloat) frameMaxX; { return (self.frame.origin.x + self.frame.size.width); }
- (void)setFrameMaxX:(CGFloat)frameMaxX;
{
    CGRect frame = self.frame;
    frame.origin.x = frameMaxX - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat) frameMaxY; { return (self.frame.origin.y + self.frame.size.height); }
- (void) setFrameMaxY:(CGFloat)frameMaxY;
{
    CGRect frame = self.frame;
    frame.origin.y = frameMaxY - self.frame.size.height;
    self.frame = frame;
}

/*========================================================================*
 * center
 *========================================================================*/
- (CGFloat) centerX; { return self.center.x; }
- (void) setCenterX:(CGFloat)centerX; 
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat) centerY; { return self.center.y; }
- (void) setCenterY:(CGFloat)centerY;
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setFrameXOrigin:(CGFloat)xOrigin {
    CGRect viewFrame = [self frame];
    viewFrame.origin.x = xOrigin;
    [self setFrame:viewFrame];
}

- (void)setFrameYOrigin:(CGFloat)yOrigin {
    CGRect viewFrame = [self frame];
    viewFrame.origin.y = yOrigin;
    [self setFrame:viewFrame];
}

- (void)setFrameRightBorderXValue:(CGFloat)xValue {
    CGRect viewFrame = [self frame];
    viewFrame.origin.x = xValue - viewFrame.size.width;
    [self setFrame:viewFrame];
}

- (CGFloat)rightBorderXValue {
    CGFloat xOrigin = [self frame].origin.x;
    CGFloat width = [self frame].size.width;
    return (xOrigin + width);
}

- (CGFloat)bottomBorderYValue {
    CGFloat yOrigin = [self frame].origin.y;
    CGFloat height = [self frame].size.height;
    return (yOrigin + height);
}

- (CGRect)frameForBorderWithSize:(CGFloat)size {
    CGFloat x = [self frame].origin.x - size;
    CGFloat y = [self frame].origin.y - size;
    CGFloat width = [self frame].size.width + (size * 2);
    CGFloat height =  [self frame].size.height + (size * 2);
    return CGRectMake(x, y, width, height);
}

- (void)centerVerticallyInSuperviewWithXOrigin:(CGFloat)xOrigin
{
    if(nil == [self superview])
    {
        return;
    }
    
    CGRect superviewBounds = [[self superview] bounds];
    CGRect selfFrame = [self frame];
    selfFrame.origin.x = xOrigin;
    selfFrame.origin.y = floor((superviewBounds.size.height - selfFrame.size.height)/2);
    [self setFrame:selfFrame];
}

- (void) centerVerticallyInSuperview;
{
    [self centerVerticallyInSuperviewWithXOrigin: self.frame.origin.x];
}

- (void)centerHorizontallyInSuperviewWithYOrigin:(CGFloat)yOrigin
{
    if(nil == [self superview])
    {
        return;
    }
    
    CGRect superviewBounds = [[self superview] bounds];
    CGRect selfFrame = [self frame];
    selfFrame.origin.x = floor((superviewBounds.size.width - selfFrame.size.width)/2);
    selfFrame.origin.y = yOrigin;
    [self setFrame:selfFrame];
}

- (void) centerHorizontallyInSuperview;
{
    [self centerHorizontallyInSuperviewWithYOrigin: self.frame.origin.y];
}

- (void)centerInSuperview
{
    if(nil == [self superview])
    {
        return;
    }
    
    CGRect superviewBounds = [[self superview] bounds];
    CGRect selfFrame = [self frame];
    selfFrame.origin.x = floor((superviewBounds.size.width - selfFrame.size.width)/2);
    selfFrame.origin.y = floor((superviewBounds.size.height - selfFrame.size.height)/2);
    [self setFrame:selfFrame];
}

- (void)centerInSuperviewWithOffset:(CGPoint)offset
{
    if(nil == [self superview])
    {
        return;
    }
    CGRect superviewBounds = [[self superview] bounds];
    CGRect selfFrame = [self frame];
    selfFrame.origin.x = floor((superviewBounds.size.width - selfFrame.size.width)/2) + offset.x;
    selfFrame.origin.y = floor((superviewBounds.size.height - selfFrame.size.height)/2) + offset.y;
    [self setFrame:selfFrame];
}

- (void) floorOrigin;
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(floorf(frame.origin.x),
                               floorf(frame.origin.y));
    self.frame = frame;
}

@end

@implementation UIView (Layout)

- (CGFloat) width
{
	return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width;
{
    self.frameWidth = width;
}

- (CGFloat) height
{
	return CGRectGetHeight(self.frame);
}

- (void) setHeight:(CGFloat)height;
{
    self.frameHeight = height;
}

- (CGFloat) minx
{
	return CGRectGetMinX(self.frame);
}

- (void)setMinx:(CGFloat)minx;
{
    self.frameX = minx;
}

- (CGFloat) maxx
{
	return CGRectGetMaxX(self.frame);
}

- (void)setMaxx:(CGFloat)maxx;
{
    self.frameMaxX = maxx;
}

- (CGFloat) miny
{
	return CGRectGetMinY(self.frame);
}

- (void) setMiny:(CGFloat)miny;
{
    self.frameY = miny;
}

- (CGFloat) maxy
{
	return CGRectGetMaxY(self.frame);
}

- (void)setMaxy:(CGFloat)maxy;
{
    self.frameMaxY = maxy;
}

@end

@implementation UIView (BoundsConvenience)

/* origin */
- (CGPoint) boundsOrigin; {  return self.bounds.origin;   }
- (void) setBoundsOrigin:(CGPoint)boundsOrigin;
{
    CGRect bounds = self.bounds;
    bounds.origin = boundsOrigin;
    self.bounds = bounds;
}

- (CGFloat) boundsX; { return self.bounds.origin.x; }
- (void) setBoundsX:(CGFloat)boundsX;
{
    CGRect bounds = self.bounds;
    bounds.origin.x = boundsX;
    self.bounds = bounds;
}

- (CGFloat) boundsY; { return self.bounds.origin.y; }
- (void) setBoundsY:(CGFloat)boundsY;
{
    CGRect bounds = self.bounds;
    bounds.origin.y = boundsY;
    self.bounds = bounds;
}

/* size */
- (CGSize) boundsSize; { return self.bounds.size; }
- (void) setBoundsSize:(CGSize)boundsSize;
{
    CGRect bounds = self.bounds;
    bounds.size = boundsSize;
    self.bounds = bounds;
}

- (CGFloat) boundsHeight; { return self.bounds.size.height; }
- (void) setBoundsHeight:(CGFloat)boundsHeight;
{
    CGRect bounds = self.bounds;
    bounds.size.height = boundsHeight;
    self.bounds = bounds; 
}

- (CGFloat) boundsWidth; { return self.bounds.size.width; }
- (void) setBoundsWidth:(CGFloat)boundsWidth;
{
    CGRect bounds = self.bounds;
    bounds.size.width = boundsWidth;
    self.bounds = bounds; 
}

/* max */
- (CGPoint) boundsMax; 
{
    return CGPointMake(self.bounds.origin.x + self.bounds.size.width,
                       self.bounds.origin.y + self.bounds.size.height);
}
- (void) setBoundsMax:(CGPoint)boundsMax;
{
    CGRect bounds = self.bounds;
    bounds.origin = CGPointMake(boundsMax.x - self.bounds.size.width,
                                boundsMax.y - self.bounds.size.height);
    self.bounds = bounds;     
}

- (CGFloat) boundsMaxX; { return (self.bounds.origin.x + self.bounds.size.width); }
- (void)setBoundsMaxX:(CGFloat)boundsMaxX;
{
    CGRect bounds = self.bounds;
    bounds.origin.x = boundsMaxX - self.bounds.size.width;
    self.bounds = bounds;
}

- (CGFloat) boundsMaxY; { return (self.bounds.origin.y + self.bounds.size.height); }
- (void) setBoundsMaxY:(CGFloat)boundsMaxY;
{
    CGRect bounds = self.bounds;
    bounds.origin.y = boundsMaxY - self.bounds.size.height;
    self.bounds = bounds;
}

- (CGPoint)boundsCenter;
{
    CGPoint boundsCenter = CGPointMake(self.bounds.origin.x + (self.bounds.size.width / 2.0f),
                                       self.bounds.origin.y + (self.bounds.size.height / 2.0f));
    return boundsCenter;
}
- (void)setBoundsCenter:(CGPoint)boundsCenter;
{
    CGRect bounds = self.bounds; 
    bounds.origin.x = boundsCenter.x - (bounds.size.width / 2.0f);
    bounds.origin.y = boundsCenter.y - (bounds.size.height / 2.0f);
    self.bounds = bounds;
}

- (CGFloat)boundsCenterX;  {  return self.bounds.origin.x + (self.bounds.size.width / 2.0f);  }
- (void)setBoundsCenterX:(CGFloat)boundsCenterX;
{
    CGRect bounds = self.bounds; 
    bounds.origin.x = boundsCenterX - (bounds.size.width / 2.0f);
    self.bounds = bounds;
}

- (CGFloat)boundsCenterY;  {  return self.bounds.origin.y + (self.bounds.size.height / 2.0f);  }
- (void)setBoundsCenterY:(CGFloat)boundsCenterY;
{
    CGRect bounds = self.bounds; 
    bounds.origin.y = boundsCenterY - (bounds.size.height / 2.0f);
    self.bounds = bounds;
}

@end

@interface UIView (LogConveniencePrivate)

- (void)logSelfWithoutHeader;
- (void)logSelfWithoutHeaderAndLeadingString:(NSString *)leading;
- (void)logHeader;
- (NSMutableString *)appendPaddedString:(NSString *)string toString:(NSMutableString *)original;
- (void)logSelfAndChildrenWithLeadingSpace:(NSString *)leading;

@end

@implementation UIView (LogConvenience)

/*** public ***/

- (void)logSelfAndAncestors {
    [self logHeader];
    
    UIView *viewToPrint = self;
    do {
        [viewToPrint logSelfWithoutHeader];
    }
    while((viewToPrint = [viewToPrint superview]) != nil);
}

- (void)logSelfAndChildren {
    [self logHeader];
    [self logSelfAndChildrenWithLeadingSpace:@""];
}

- (void)logSelf {
    [self logHeader];
    [self logSelfWithoutHeader];
}

/*** private ***/

- (void)logHeader {
    
    NSMutableString *header = [[NSMutableString alloc] init];
    [self appendPaddedString:@"class" toString:header];
    [self appendPaddedString:@"mem" toString:header];
    
    [self appendPaddedString:@"framex" toString:header];
    [self appendPaddedString:@"framey" toString:header];
    [self appendPaddedString:@"framew" toString:header];
    [self appendPaddedString:@"frameh" toString:header];
    
    [self appendPaddedString:@"contentw" toString:header];
    [self appendPaddedString:@"contenth" toString:header];
    
    NSLog(@"%@", header);

}

- (void)logSelfWithoutHeader {
    
    NSMutableString *viewInfo = [[NSMutableString alloc] init];
    [self appendPaddedString:[NSString stringWithFormat:@"%@", [self class]] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%p", self] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].origin.x] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].origin.y] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].size.width] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].size.height] toString:viewInfo];
    
    if([self isKindOfClass:[UIScrollView class]]) {
        CGSize viewContentSize = [(UIScrollView *)self contentSize];
        [self appendPaddedString:[NSString stringWithFormat:@"%.0f", viewContentSize.width] toString:viewInfo];
        [self appendPaddedString:[NSString stringWithFormat:@"%.0f", viewContentSize.height] toString:viewInfo];
    }
    
    NSLog(@"%@", viewInfo);

}

- (void)logSelfWithoutHeaderAndLeadingString:(NSString *)leading {
    
    NSMutableString *viewInfo = [[NSMutableString alloc] initWithString:leading];
    [self appendPaddedString:[NSString stringWithFormat:@"%@", [self class]] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%p", self] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].origin.x] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].origin.y] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].size.width] toString:viewInfo];
    [self appendPaddedString:[NSString stringWithFormat:@"%.0f", [self frame].size.height] toString:viewInfo];
    
    if([self isKindOfClass:[UIScrollView class]]) {
        CGSize viewContentSize = [(UIScrollView *)self contentSize];
        [self appendPaddedString:[NSString stringWithFormat:@"%.0f", viewContentSize.width] toString:viewInfo];
        [self appendPaddedString:[NSString stringWithFormat:@"%.0f", viewContentSize.height] toString:viewInfo];
    }
    
    NSLog(@"%@", viewInfo);

}

- (void)logSelfAndChildrenWithLeadingSpace:(NSString *)leading {
    [self logSelfWithoutHeaderAndLeadingString:leading];
    for(UIView *subview in [self subviews]) {
        [subview logSelfAndChildrenWithLeadingSpace:[NSString stringWithFormat:@"%@-", leading]];
    }
}

- (NSMutableString *)appendPaddedString:(NSString *)string toString:(NSMutableString *)original {
    NSInteger columnWidth = 10.0;
    NSInteger lengthOfString = [string length];
    NSMutableString *newString;
    if(lengthOfString < columnWidth) {
        newString = [NSMutableString stringWithString:string];
        while([newString length] < (NSUInteger)columnWidth) {
            [newString appendString:@" "];
        }
    } else if(lengthOfString > columnWidth) {
        newString = [NSMutableString stringWithString:[string substringToIndex:columnWidth]];
    } else {
        newString = [NSMutableString stringWithString:string];
    }
    
    [newString appendString:@" | "];
    
    [original appendString:newString];
    return original;
}

@end

@implementation UIView (Grid)

- (void)overlayGridWithLineSpace:(CGFloat)pixels color:(UIColor *)color {
    NSInteger countAcross = [self frame].size.width / pixels;
    NSInteger countDown = [self frame].size.height / pixels;
    
    for(int i = 0; i <= countAcross; i++) {
        UIView *verticalLine = [[UIView alloc] initWithFrame:CGRectMake(i * pixels, 0, 1, [self frame].size.height)];
        [verticalLine setBackgroundColor:color];
        [self addSubview:verticalLine];

    }

    for(int i = 0; i <= countDown; i++) {
        UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, i * pixels, [self frame].size.width, 1)];
        [horizontalLine setBackgroundColor:color];
        [self addSubview:horizontalLine];

    }
}

@end

@implementation UIView (Reflection)

CGImageRef      createGradientImage(int pixelsWide, int pixelsHigh);
CGContextRef    createBitmapContext(int pixelsWide, int pixelsHigh);

CGImageRef createGradientImage(int pixelsWide, int pixelsHigh)
{
	CGImageRef theCGImage = NULL;
	
	// gradient is always black-white and the mask must be in the gray colorspace
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	
	// create the bitmap context
	CGContextRef gradientBitmapContext = CGBitmapContextCreate(NULL, pixelsWide, pixelsHigh,
															   8, 0, colorSpace, kCGImageAlphaNone);
	
	// define the start and end grayscale values (with the alpha, even though
	// our bitmap context doesn't support alpha the gradient requires it)
	CGFloat colors[] = {0.0, 1.0, 1.0, 1.0};
	
	// create the CGGradient and then release the gray color space
	CGGradientRef grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
	CGColorSpaceRelease(colorSpace);
	
	// create the start and end points for the gradient vector (straight down)
	CGPoint gradientStartPoint = CGPointZero;
	CGPoint gradientEndPoint = CGPointMake(0, pixelsHigh);
	
	// draw the gradient into the gray bitmap context
	CGContextDrawLinearGradient(gradientBitmapContext, grayScaleGradient, gradientStartPoint,
								gradientEndPoint, kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(grayScaleGradient);
	
	// convert the context into a CGImageRef and release the context
	theCGImage = CGBitmapContextCreateImage(gradientBitmapContext);
	CGContextRelease(gradientBitmapContext);
	
	// return the imageref containing the gradient
    return theCGImage;
}

CGContextRef createBitmapContext(int pixelsWide, int pixelsHigh)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	
	// create the bitmap context
	CGContextRef bitmapContext = CGBitmapContextCreate (NULL, pixelsWide, pixelsHigh, 8,
														0, colorSpace,
														// this will give us an optimal BGRA format for the device:
														(kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
	CGColorSpaceRelease(colorSpace);
	
    return bitmapContext;
}

- (UIImage *)bottomReflectedImageWithHeight:(NSUInteger)height
{
    if(height == 0)
		return nil;
	
	UIGraphicsBeginImageContext(self.bounds.size);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	// create a bitmap graphics context the size of the view
	CGContextRef mainViewContentContext = createBitmapContext(self.bounds.size.width, height);
	
	// create a 2 bit CGImage containing a gradient that will be used for masking the 
	// main view content to create the 'fade' of the reflection.  The CGImageCreateWithMask
	// function will stretch the bitmap image as required, so we can create a 1 pixel wide gradient
	CGImageRef gradientMaskImage = createGradientImage(1, height);
	
	// create an image by masking the bitmap of the mainView content with the gradient view
	// then release the  pre-masked content bitmap and the gradient bitmap
	CGContextClipToMask(mainViewContentContext, CGRectMake(0.0, 0.0, self.bounds.size.width, height), gradientMaskImage);
	CGImageRelease(gradientMaskImage);
	
	// In order to grab the part of the image that we want to render, we move the context origin to the
	// height of the image that we want to capture, then we flip the context so that the image draws upside down.
	CGContextTranslateCTM(mainViewContentContext, 0.0, height);
	CGContextScaleCTM(mainViewContentContext, 1.0, -1.0);
	
	// draw the image into the bitmap context
	CGContextDrawImage(mainViewContentContext, self.bounds, [viewImage CGImage]);
	
	// create CGImageRef of the main view bitmap content, and then release that bitmap context
	CGImageRef reflectionImage = CGBitmapContextCreateImage(mainViewContentContext);
	CGContextRelease(mainViewContentContext);
	
	// convert the finished reflection image to a UIImage 
	UIImage *theImage = [UIImage imageWithCGImage:reflectionImage];
	
	// image is retained by the property setting above, so we can release the original
	CGImageRelease(reflectionImage);
	
	return theImage;
}

@end

