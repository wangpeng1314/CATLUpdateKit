//
//  CATLVersionUpdateView.m
//  CATLUpdateKit
//
//  Created by 汪鹏 on 2021/7/28.
//

#import "CATLVersionUpdateView.h"
#import <Masonry/Masonry.h>

#define KHexColor(hexValue) [UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

#define KRelativeFontSize(a)        (a) * (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) / 750.0f)

#define KRelativeFont(fontSize)  [UIFont fontWithName:@"PingFangSC-Regular" size:KRelativeFontSize(fontSize)] ?: [UIFont systemFontOfSize:KRelativeFontSize(fontSize)]

@interface CATLVersionUpdateView ()
// 背景view
@property(nonatomic, strong) UIView *bgView;
// 去更新(非强制更新才显示)
@property(nonatomic, strong) UIButton *nowUpdateButton;
// 稍后更细(非强制更新才显示)
@property(nonatomic, strong) UIButton *laterUpdateButton;
// 更新内容
@property(nonatomic, strong) UITextView *updateDescView;
// 更新(强制更新才显示)
@property(nonatomic, strong) UIButton *mustUpdateButton;
// appid
@property(nonatomic, strong) NSString *app_id;
@end

@implementation CATLVersionUpdateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        [self createLayout];
    }
    return self;
}

- (void)createUI {
    
    
    [self addSubview:self.bgView];
    [self addSubview:self.updateDescView];
    [self addSubview:self.nowUpdateButton];
    [self addSubview:self.laterUpdateButton];
    
    [self addSubview:self.mustUpdateButton];
}

- (void)createLayout {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(60);
        make.right.equalTo(self.mas_right).offset(-60);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.bottom.equalTo(self.nowUpdateButton.mas_bottom).offset(-20);
    }];
    
    [self.updateDescView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(40);
        make.left.equalTo(self.bgView.mas_left).offset(32);
        make.right.equalTo(self.bgView.mas_right).offset(-32);
        make.bottom.equalTo(self.nowUpdateButton.mas_top).offset(-40);
        make.height.offset(120);
    }];
    
    [self.nowUpdateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.updateDescView.mas_bottom).offset(40);
        make.left.equalTo(self.bgView.mas_left).offset(32);
        make.right.equalTo(self.laterUpdateButton.mas_left).offset(-32);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-20);
        make.height.offset(60);
        make.width.equalTo(self.laterUpdateButton);
    }];
    
    [self.laterUpdateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.updateDescView.mas_bottom).offset(40);
        make.left.equalTo(self.nowUpdateButton.mas_right).offset(20);
        make.right.equalTo(self.bgView.mas_right).offset(-32);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-20);
        make.height.offset(60);
        make.width.equalTo(self.nowUpdateButton);
    }];
    
    [self.mustUpdateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.updateDescView.mas_bottom).offset(40);
        make.left.equalTo(self.bgView.mas_left).offset(32);
        make.right.equalTo(self.bgView.mas_right).offset(-32);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-20);
        make.height.offset(60);
    }];
    
}

- (void)configUpdateDescContentText:(NSString *)text andIsMustUpdate:(BOOL)isMustUpdate withAppId:(nonnull NSString *)appId{
    self.updateDescView.text = text;
    self.app_id = appId ? appId : @"";
    
    if (isMustUpdate) {
        self.mustUpdateButton.hidden = NO;
        self.nowUpdateButton.hidden = YES;
        self.laterUpdateButton.hidden = YES;
    }else{
        self.mustUpdateButton.hidden = YES;
        self.nowUpdateButton.hidden = NO;
        self.laterUpdateButton.hidden = NO;
    }
    
    
}

#pragma mark--event
- (void)laterUpdateButtonClickAction:(UIButton*)sender {
    [self removeFromSuperview];
}

- (void)nowUpdateButtonClickAction:(UIButton*)sender {
    
    //[YPCSVProgress showStatusMessageWithTitle:@"开发中" finishBlock:nil];
    
    /*
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",self.app_id]];
    if (@available(iOS 10.0, *)){
        [[UIApplication sharedApplication]openURL:url options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES} completionHandler:^(BOOL success) {
            if (success) {
                DLog(@"10以后可以跳转url");
            }else{
                DLog(@"10以后不可以跳转url");
            }
        }];
    }else{
        BOOL success = [[UIApplication sharedApplication] openURL:url];
        if (success) {
            DLog(@"10以前可以跳转url");
        }else{
            DLog(@"10以前不可以跳转url");
        }
    }
     */
}

#pragma mark--getter,setter
- (UITextView *)updateDescView {
    if (!_updateDescView) {
        _updateDescView = [UITextView new];
        _updateDescView.font = KRelativeFont(24);
        _updateDescView.textColor = KHexColor(0x999999);
        _updateDescView.editable = NO;
    }
    return _updateDescView;
}

- (UIButton *)mustUpdateButton {
    if (!_mustUpdateButton) {
        _mustUpdateButton = [UIButton new];
        [_mustUpdateButton setTitle:@"立即更新" forState:UIControlStateNormal];
        _mustUpdateButton.titleLabel.font = KRelativeFont(30);
        [_mustUpdateButton setTitleColor:KHexColor(0xFFFFFF) forState:UIControlStateNormal];
        _mustUpdateButton.layer.cornerRadius = 4;
        _mustUpdateButton.backgroundColor = KHexColor(0x008D84);
        [_mustUpdateButton addTarget:self action:@selector(nowUpdateButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        _mustUpdateButton.hidden = YES;
    }
    return _mustUpdateButton;
}

- (UIButton *)laterUpdateButton {
    if (!_laterUpdateButton) {
        _laterUpdateButton = [UIButton new];
        [_laterUpdateButton setTitle:@"暂不更新" forState:UIControlStateNormal];
        _laterUpdateButton.titleLabel.font = KRelativeFont(30);
        [_laterUpdateButton setTitleColor:KHexColor(0x008D84) forState:UIControlStateNormal];
        _laterUpdateButton.layer.cornerRadius = 4;
        _laterUpdateButton.layer.borderColor = KHexColor(0x008D84).CGColor;
        _laterUpdateButton.layer.borderWidth = 1;
        _laterUpdateButton.backgroundColor = KHexColor(0xFFFFFF);
        [_laterUpdateButton addTarget:self action:@selector(laterUpdateButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        _laterUpdateButton.hidden = YES;
    }
    return _laterUpdateButton;
}

- (UIButton *)nowUpdateButton {
    if (!_nowUpdateButton) {
        _nowUpdateButton = [UIButton new];
        [_nowUpdateButton setTitle:@"立即更新" forState:UIControlStateNormal];
        _nowUpdateButton.titleLabel.font = KRelativeFont(30);
        [_nowUpdateButton setTitleColor:KHexColor(0xFFFFFF) forState:UIControlStateNormal];
        _nowUpdateButton.layer.cornerRadius =4;
        _nowUpdateButton.backgroundColor = KHexColor(0x008D84);
        [_nowUpdateButton addTarget:self action:@selector(nowUpdateButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        _nowUpdateButton.hidden = YES;
    }
    return _nowUpdateButton;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 4;
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}

@end
