//
//  ArcView.h
//  ArcDraw
//
//  Created by Gaurav Sharma on 01/09/16.
//  Copyright © 2016 GDS. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ArcView : UIView

@property (nonatomic) IBInspectable BOOL clockWise;
@property (nonatomic, strong) IBInspectable UIImage *fillImage;
@property (nonatomic, strong) IBInspectable UIImage *backImage;

- (void)cropStartAngle:(CGFloat)start endAngle:(CGFloat)end;

@end
