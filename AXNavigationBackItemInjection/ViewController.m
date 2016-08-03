//
//  ViewController.m
//  AXNavigationBackItemInjection
//
//  Created by devedbox on 16/8/3.
//  Copyright © 2016年 devedbox. All rights reserved.
//

#import "ViewController.h"
#import "AXPopNavigationController.h"

@interface ViewController ()
{
    BOOL _shouldPopItem;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _shouldPopItem = NO;
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(nonnull UINavigationItem *)item {
    if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_8_0) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"!!!" message:@"you just clicked the back navigation item." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
#pragma clang diagnostic pop
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"!!!" message:@"you just clicked the back navigation item." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Do not pop" style:UIAlertActionStyleCancel handler:NULL]];
        __weak typeof(self) wself = self;
        [alert addAction:[UIAlertAction actionWithTitle:@"Pop!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _shouldPopItem = YES;
                [wself.navigationController popViewControllerAnimated:YES];
            });
        }]];
        [self presentViewController:alert animated:YES completion:NULL];
    }
    
    return _shouldPopItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end