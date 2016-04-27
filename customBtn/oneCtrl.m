//
//  oneCtrl.m
//  customBtn
//
//  Created by tztddong on 16/4/25.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "oneCtrl.h"
#import "CourseButton.h"
#import "UIView+XL.h"
#import "listView.h"

@interface oneCtrl ()

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation oneCtrl
{
    CourseButton *_titleBtn;
    ListView *_listView;
}

- (void)viewDidLoad{
    
    [self customTitleView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (NSMutableArray *)dataArray{

    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (int i = 1; i < 6; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"幼儿园%d班",i]];
        }
    }
    return _dataArray;
}

#pragma mark 自定义titleView
- (void)customTitleView{
    
    _titleBtn = [[CourseButton alloc]init];
    [_titleBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_titleBtn setTitle:@"幼儿园1班" forState:UIControlStateNormal];
    [_titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_titleBtn setImage:[UIImage imageNamed:@"tongyong_sanjiao_weizhankai@3x"] forState:UIControlStateNormal];
    [_titleBtn setImage:[UIImage imageNamed:@"tongyong_sanjiao_zhankai@3x"] forState:UIControlStateSelected];
    [_titleBtn addTarget:self action:@selector(chooseClass:) forControlEvents:UIControlEventTouchUpInside];
    
    CGSize titleSize = [_titleBtn.titleLabel.text sizeWithAttributes:[NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName]];
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shangjiantou"]];
    _titleBtn.width = titleSize.width + 2 + imageV.width;
    _titleBtn.height = _titleBtn.imageView.height > titleSize.height ? _titleBtn.imageView.height:titleSize.height;

    self.navigationItem.titleView = _titleBtn;
}

- (void)chooseClass:(CourseButton *)button{

    button.selected = !button.selected;
    [self creatClassViewWithSelected:button.selected];
}

- (void)creatClassViewWithSelected:(BOOL)selected{

    if (selected) {
        if (!_listView) {
            _listView = [ListView creatListViewWithTopView:(UIView *)_titleBtn dataArray:self.dataArray selectBlock:^(NSString *titleName) {
                if (titleName) {
                    [_titleBtn setTitle:titleName forState:UIControlStateNormal];
                    CGSize titleSize = [_titleBtn.titleLabel.text sizeWithAttributes:[NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName]];
                    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shangjiantou"]];
                    _titleBtn.width = titleSize.width + 2 + imageV.width;
                }
                [self chooseClass:_titleBtn];
            }];
            _listView.frame = self.view.bounds;
            [self.view addSubview:_listView];
        }
    }else{
        [UIView animateWithDuration:0.1 animations:^{
            _listView.alpha = 0.0;
        } completion:^(BOOL finished) {
            if (_listView) {
                
                [_listView removeFromSuperview];
                _listView = nil;
            }
        }];
    }

}

@end
