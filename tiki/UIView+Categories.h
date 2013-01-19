//
//  UIView+Categories.h
//
//

#import <UIKit/UIKit.h>



@interface UIView (FrameConvenience)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

@property (nonatomic) CGSize  frameSize;
@property (nonatomic) CGFloat frameHeight;
@property (nonatomic) CGFloat frameWidth;

@property (nonatomic) CGPoint frameMax;
@property (nonatomic) CGFloat frameMaxX;
@property (nonatomic) CGFloat frameMaxY;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

- (void)setFrameOrigin:(CGPoint)origin;
- (void)setFrameXOrigin:(CGFloat)xOrigin;
- (void)setFrameYOrigin:(CGFloat)yOrigin;


- (void)setFrameRightBorderXValue:(CGFloat)xValue;
- (CGFloat)rightBorderXValue;
- (CGFloat)bottomBorderYValue;

- (CGRect)frameForBorderWithSize:(CGFloat)size;

- (void)centerVerticallyInSuperviewWithXOrigin:(CGFloat)xOrigin;
- (void)centerHorizontallyInSuperviewWithYOrigin:(CGFloat)yOrigin;
- (void)centerInSuperview;
- (void)centerInSuperviewWithOffset:(CGPoint)offset;
- (void) centerVerticallyInSuperview;
- (void) centerHorizontallyInSuperview;
- (void) floorOrigin;

@end

@interface UIView (Layout)

// these are easier to code than the clunky CGRectGet*() functions
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat minx;
@property (nonatomic) CGFloat maxx;
@property (nonatomic) CGFloat miny;
@property (nonatomic) CGFloat maxy;

@end

@interface UIView (LogConvenience)

- (void)logSelfAndAncestors;
- (void)logSelfAndChildren;
- (void)logSelf;                                                       

@end

@interface UIView (BoundsConvenience) 

@property (nonatomic) CGPoint boundsOrigin;
@property (nonatomic) CGFloat boundsX;
@property (nonatomic) CGFloat boundsY;

@property (nonatomic) CGSize  boundsSize;
@property (nonatomic) CGFloat boundsHeight;
@property (nonatomic) CGFloat boundsWidth;

@property (nonatomic) CGPoint boundsMax;
@property (nonatomic) CGFloat boundsMaxX;
@property (nonatomic) CGFloat boundsMaxY;

@property (nonatomic) CGPoint boundsCenter;
@property (nonatomic) CGFloat boundsCenterX;
@property (nonatomic) CGFloat boundsCenterY;

@end

@interface UIView (Grid)

- (void)overlayGridWithLineSpace:(CGFloat)pixels color:(UIColor *)color;

@end

@interface UIView (Reflection)

- (UIImage *)bottomReflectedImageWithHeight:(NSUInteger)height;

@end