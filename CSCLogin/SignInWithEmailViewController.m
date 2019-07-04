//
//  SignInWithEmailViewController.m
//  CSCLogin
//
//  Created by spring on 2019/7/4.
//  Copyright © 2019 spring. All rights reserved.
//

#import "SignInWithEmailViewController.h"
#import "SignInViewController.h"

@interface SignInWithEmailViewController ()

@end

@implementation SignInWithEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)gotoNext:(id)sender {
    
    SignInViewController *sign1 = [[SignInViewController alloc]initWithNibName:@"SignInViewController" bundle:nil];
    [self.navigationController pushViewController:sign1 animated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
