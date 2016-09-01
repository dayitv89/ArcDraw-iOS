//
//  ArcImageView.m
//  ArcDraw
//
//  Created by Gaurav Sharma on 31/08/16.
//  Copyright © 2016 GDS. All rights reserved.
//

#import "ArcImageView.h"

@interface ArcImageView () {
    CGFloat start, end, endFinal;
    NSTimer *timer;
}
@property (nonatomic, weak) CAShapeLayer *maskLayer;
@property (nonatomic, weak) CAShapeLayer *circleLayer;
@end


@implementation ArcImageView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setupView];
}

- (void)setupView {
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

- (void)cropStartAngle:(CGFloat)start1 endAngle:(CGFloat)end1 {
    [self setupView];
    start = start1;
    end = start1;
    endFinal = end1;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/endFinal
                                             target:self
                                           selector:@selector(crop)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)crop {
    end++;
    
    CGFloat radius = self.frame.size.width/2;
    CGFloat starttime = ((M_PI * (start + 270))/ 180);
    CGFloat endtime =  ((M_PI * (end + 270))/ 180);
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    UIBezierPath *arc = [UIBezierPath bezierPath];
    [arc moveToPoint:center];
    [arc addArcWithCenter:center
                   radius:radius
               startAngle:starttime
                 endAngle:endtime
                clockwise:self.clockWise];
    
    self.maskLayer.path = [arc CGPath];
    self.circleLayer.path = [arc CGPath];
    
    if (end == endFinal) {
        [timer invalidate];
    }
}

@end
