//
//  CourseButton.m
//  teacherApp
//
//  Created by tztddong on 16/4/25.
//  Copyright © 2016年 dong. All rights reserved.
//

#import "CourseButton.h"
#import "UIView+XL.h"

@implementation CourseButton

- (void)layoutSubviews{

    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame)+2;
    self.imageView.centerY = self.titleLabel.centerY;
    
}

@end
