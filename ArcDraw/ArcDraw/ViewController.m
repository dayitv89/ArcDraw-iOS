//
//  ViewController.m
//  ArcDraw
//
//  Created by Gaurav Sharma on 31/08/16.
//  Copyright © 2016 GDS. All rights reserved.
//

#import "ViewController.h"

@interface ArcImageView ()
@property (nonatomic, weak) CAShapeLayer *maskLayer;
@property (nonatomic, weak) CAShapeLayer *circleLayer;
@end


@implementation ArcImageView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setupLayers];
}

- (void)setupLayers {
    if (!self.maskLayer) {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        self.layer.mask = maskLayer;
        self.maskLayer = maskLayer;
    }
    if (!self.circleLayer) {
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        circleLayer.fillColor = [[UIColor clearColor] CGColor];
        [self.layer addSublayer:circleLayer];
        self.circleLayer = circleLayer;
    }
}

- (void)cropArcStartAngle:(CGFloat)start
                 endAngle:(CGFloat)end {
    [self setupLayers];
    
    CGFloat radius = self.frame.size.width/2;
    
    CGFloat starttime = ((M_PI * (start + 270))/ 180);
    CGFloat endtime =  ((M_PI * (end + 270))/ 180);
    //draw arc
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    UIBezierPath *arc = [UIBezierPath bezierPath];
    [arc moveToPoint:center];
    [arc addArcWithCenter:center
                   radius:radius
               startAngle:starttime
                 endAngle:endtime
                clockwise:YES];
    
    self.maskLayer.path = [arc CGPath];
    self.circleLayer.path = [arc CGPath];
}

@end



#pragma mark -

@interface ViewController () {
    __weak IBOutlet ArcImageView *imgViewFilled;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    imgViewFilled.layer.mask = maskLayer;
//    self.maskLayer = maskLayer;
//    
//    
//    CAShapeLayer *circleLayer = [CAShapeLayer layer];
//    circleLayer.lineWidth = 3.0;
//    circleLayer.fillColor = [[UIColor clearColor] CGColor];
//    circleLayer.strokeColor = [[UIColor blackColor] CGColor];
//    [imgViewFilled.layer addSublayer:circleLayer];
//    self.circleLayer = circleLayer;
    
    [self performAnimation];
}

- (void)performAnimation {
//    for (int i = 0; i <= 10; i++) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showScore:[self anglePoints:25]];
//        });
//    }
}

- (CGFloat)anglePoints:(int)score {
    //    [CardManager sharedInstance].last_card.redemption_mark.floatValue) * score
    return 100;//(360.0 / 10);
}

- (void)showScore:(CGFloat)filledAngle {
    [imgViewFilled cropArcStartAngle:0
                       endAngle:filledAngle];
}


@end
