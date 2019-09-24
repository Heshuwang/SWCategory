//
//  WTableViewLogOutView.m
//  tableView无数据占位图
//
//  Created by hs on 2017/10/27.
//  Copyright © 2017年. All rights reserved.
//

#import "WTableViewLogOutView.h"

@interface WTableViewLogOutView ()

@property (nonatomic, copy) void(^clickBlock) (void);
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong)UIButton * btn;
@property (nonatomic, strong)NSString * btnTitle;
@end
@implementation WTableViewLogOutView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img  btnTitle:(NSString *)btnTitle viewClick:(void(^) (void))clickBlock{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = ViewColor;
        self.clickBlock = clickBlock;
        self.img = img;
        self.btnTitle =btnTitle;
        [self setupSubViews];
        self.clipsToBounds = YES;
    }
    return self;

}
- (void)setupSubViews {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:self.img];
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame  = CGRectMake(0, 0,150, 40);
    btn.backgroundColor =[UIColor redColor];
    btn.layer.cornerRadius =5;
    btn.layer.masksToBounds = YES;
    [btn setTitle:self.btnTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(logoutBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.btn =btn;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imgView.center = CGPointMake(SCREEN_W/2.0, CGRectGetHeight(self.frame)/2.0-self.img.size.height/2+25-64);
    self.btn.center = CGPointMake(SCREEN_W/2.0, CGRectGetHeight(self.frame)/2.0+25-64);
}

- (void)logoutBtnAction{
    self.clickBlock();
}



@end
