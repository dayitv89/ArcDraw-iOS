//
//  ArcView.m
//  ArcDraw
//
//  Created by Gaurav Sharma on 01/09/16.
//  Copyright © 2016 GDS. All rights reserved.
//

#import "ArcView.h"
#import "ArcImageView.h"

@interface ArcView ()
@property (nonatomic, strong) ArcImageView *imgViewFill;
@end

@implementation ArcView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setupView];
}

- (void)setupView {
    if (!self.imgViewFill) {
        [self layoutIfNeeded];

        UIImageView *backImgVw = [[UIImageView alloc] initWithFrame:self.bounds];
        [backImgVw setImage:self.backImage];
        [backImgVw setContentMode:self.contentMode];
        [self addSubview:backImgVw];
        
        ArcImageView *fillImgVw = [[ArcImageView alloc] initWithFrame:self.bounds];
        [fillImgVw setImage:self.fillImage];
        [fillImgVw setContentMode:self.contentMode];
        [fillImgVw setClockWise:self.clockWise];
        [self addSubview:fillImgVw];
        self.imgViewFill = fillImgVw;
        self.imgViewFill.hidden = YES;
    }
}

- (void)cropStartAngle:(CGFloat)start endAngle:(CGFloat)end {
    [self setupView];
    [self.imgViewFill cropStartAngle:start endAngle:end];
    self.imgViewFill.hidden = NO;
}

@end
