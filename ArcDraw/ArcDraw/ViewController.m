//
//  ViewController.m
//  ArcDraw
//
//  Created by Gaurav Sharma on 31/08/16.
//  Copyright © 2016 GDS. All rights reserved.
//

#import "ViewController.h"
#import "ArcImageView.h"

@interface ViewController () {
    __weak IBOutlet ArcImageView *imgViewFilled;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performAnimation];
}

- (void)performAnimation {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(showScore)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)showScore {
    static int i = 0;
    if (i > 12) {
       [timer invalidate];
        [imgViewFilled setImage:nil];
        return;
    }
    CGFloat filledAngle = 30*i++;
    [imgViewFilled cropStartAngle:0 endAngle:filledAngle];
}

@end
