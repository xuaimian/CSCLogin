//
//  SignInWithEmailViewController.m
//  CSCLogin
//
//  Created by spring on 2019/7/4.
//  Copyright © 2019 spring. All rights reserved.
//

#import "SignInWithEmailViewController.h"
#import "SignInViewController.h"

@interface SignInWithEmailViewController ()<UITextFieldDelegate>

@end

@implementation SignInWithEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}
-(void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"Sign In";
  
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction:)];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(submitAction:)];

    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    EWTextField *emailTF = [[EWTextField alloc]initWithFrame:CGRectMake(24, 51,[UIScreen mainScreen].bounds.size.width - 48 , 35) isSecure:false];
    emailTF.label.text = @"Email";
    emailTF.font = [UIFont systemFontOfSize:18];
    emailTF.clearButtonMode = UITextFieldViewModeAlways;
    emailTF.keyboardType = UIKeyboardTypePhonePad;
    emailTF.delegate = self;
    [self.view addSubview:emailTF];
    EWTextField *pwdTF = [[EWTextField alloc]initWithFrame:CGRectMake(24, emailTF.frame.origin.y+emailTF.frame.size.height+30,[UIScreen mainScreen].bounds.size.width - 48 , 35) isSecure:true];
    pwdTF.label.text = @"Password";
    pwdTF.font = [UIFont systemFontOfSize:18];
    pwdTF.delegate = self;
    [self.view addSubview:pwdTF];
 
    
    
    UIButton *resetPassword = [UIButton buttonWithType:UIButtonTypeCustom];

    resetPassword.frame = CGRectMake(24, pwdTF.frame.size.height+pwdTF.frame.origin.y+45, 150, 30);
    [resetPassword setTitle:@"Forgot your password?" forState:UIControlStateNormal];
    resetPassword.titleLabel.font = [UIFont systemFontOfSize:12];
    [resetPassword setTitleColor:[UIColor colorWithRed:37/255.0f green:169/255.0f blue:218/255.0f alpha:1] forState:UIControlStateNormal];

    
    [self.view addSubview:resetPassword];
    [resetPassword addTarget:self action:@selector(goForgetPasswordEvent) forControlEvents:UIControlEventTouchUpInside];
    
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:true];
}
-(void)cancelAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:true];
}
-(void)submitAction:(UIBarButtonItem *)sender
{
    
}
-(void)goForgetPasswordEvent
{
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField isKindOfClass:[EWTextField class]])
    {
        EWTextField *item = (EWTextField *)textField;
    if ([item.text isEqualToString:@""]) {
        [item changeLabel];
    }
    [item changeLineBlueColor];
    }
    return  true;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isKindOfClass:[EWTextField class]])
    {
        EWTextField *item = (EWTextField *)textField;
        if ([item.text isEqualToString:@""]) {
            [item disChangeLabel];
        }
        [item changeLineGreyColor];
    }
}


@end
