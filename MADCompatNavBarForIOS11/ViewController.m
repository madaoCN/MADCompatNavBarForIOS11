//
//  ViewController.m
//  MADCompatNavBarForIOS11
//
//  Created by 梁宪松 on 2018/1/14.
//  Copyright © 2018年 madao. All rights reserved.
//

#import "ViewController.h"
#import "MADSearchBar.h"

#define MAD_SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define MAD_SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (nonatomic, strong) MADSearchBar *titleSearchBar;
@property (nonatomic, strong) MADSearchBar *commonSearchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.titleView = self.titleSearchBar;
    [self.view addSubview:self.commonSearchBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter
- (MADSearchBar *)titleSearchBar
{
    if (!_titleSearchBar) {
        _titleSearchBar = [[MADSearchBar alloc] initWithFrame:CGRectMake(0,
                                                                    0,  MAD_SCREEN_WIDTH,
                                                                    44)];
        
    }
    return _titleSearchBar;
}

- (MADSearchBar *)commonSearchBar
{
    if (!_commonSearchBar) {
        _commonSearchBar = [[MADSearchBar alloc] initWithFrame:CGRectMake(0,
                                                                    100,  MAD_SCREEN_WIDTH,
                                                                    44)];
        
    }
    return _commonSearchBar;
}
@end
