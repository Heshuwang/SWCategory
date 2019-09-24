//
//  UITableView+placeholder.m
//  BeautifulAgent
//
//  Created by  on 2017/7/20.
//  Copyright © 2017年 . All rights reserved.
//

#import "WTableViewNoDataView.h"

@interface WTableViewNoDataView ()

@property (nonatomic, copy) void(^clickBlock)(void);
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong)UILabel * label;
@property (nonatomic, strong)NSString * title;

@end


@implementation WTableViewNoDataView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img title:(NSString * )title viewClick:(void(^)(void))clickBlock {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = ViewColor;
        self.clickBlock = clickBlock;
        self.img = img;
        self.title =title;
        [self setupSubViews];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setupSubViews {
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:self.img];
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)];
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:tap];
    
    
    self.label =[[UILabel alloc]init];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor =kColorToStr(@"666666");
    self.label.font =[UIFont systemFontOfSize:16];
    self.label.alpha =0.8;
    self.label.text=self.title;
    [self addSubview:self.label];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat imageVY  = 0;
    if (self.img ==nil) {
        imageVY =(self.height-self.img.size.height-self.height/2)/2.0;
    }else{
        imageVY =(self.height-self.img.size.height)/2.0;
    }
    self.imgView.center = CGPointMake(SCREEN_W/2.0, imageVY);
    self.label.frame =CGRectMake(0, self.imgView.bottom+kRealValueW(15), SCREEN_W, 30);
}

- (void)clickImgView:(UITapGestureRecognizer *)recognizer {
    
    self.clickBlock();
}

@end


