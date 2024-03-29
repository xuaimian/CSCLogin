//
//  ViewController.m
//  CSCLogin
//
//  Created by spring on 2019/7/3.
//  Copyright © 2019 spring. All rights reserved.
//

#import "SignInViewController.h"
#import "SignInWithEmailViewController.h"
#import "RegistrationViewController.h"
#define brownishGrey [UIColor colorWithRed:112/255.0f green:112/255.0f blue:112/255.0f alpha:1]
@interface SignInViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UILabel *lb4;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *imgsScrollView;

@property (weak, nonatomic) IBOutlet UIButton *btn_signup;

@property (weak, nonatomic) IBOutlet UIButton *btn_facebook;
@property (weak, nonatomic) IBOutlet UIButton *btn_google;
@property (weak, nonatomic) IBOutlet UIButton *btn_signIn;
@property (strong, nonatomic)NSTimer *carouselTimer;


@end

@implementation SignInViewController

- (IBAction)signIn:(id)sender {
    SignInWithEmailViewController *nextvc = [[SignInWithEmailViewController alloc]init];
    
     [self.navigationController pushViewController:nextvc animated:true];
}

- (IBAction)thirdSignInWithFacebook:(id)sender {
}
- (IBAction)thirdSignInWithGoogle:(id)sender {
}

- (IBAction)goToRegistration:(id)sender {
    
    RegistrationViewController *nextvc = [[RegistrationViewController alloc]init];
    [self.navigationController pushViewController:nextvc animated:true];
}

-(void)autoDisplayCarousel
{
    NSInteger nextPage = _pageControl.currentPage + 1;
    if (nextPage == [_pageControl numberOfPages])
    {
        nextPage = 0;
    }
    [_pageControl setCurrentPage:nextPage];
    [self updateCurrentPage:_pageControl];
}
- (IBAction)updateCurrentPage:(UIPageControl *)sender {
    [self updateScrollView: sender.currentPage];
}
-(void)updateScrollView:(NSInteger)number
{
    [_imgsScrollView scrollRectToVisible:CGRectMake(number*_imgsScrollView.frame.size.width, 0, _imgsScrollView.frame.size.width, _imgsScrollView.frame.size.height) animated:true];

}
-(void)setUpBtnOutlet
{
    _btn_signIn.layer.cornerRadius = 10;
    _btn_signIn.layer.masksToBounds = true;
    _btn_facebook.layer.cornerRadius = 10;
    _btn_facebook.layer.masksToBounds = true;
    _btn_google.layer.cornerRadius = 10;
    _btn_google.layer.masksToBounds = true;
    _btn_signup.layer.cornerRadius = 10;
    _btn_signup.layer.masksToBounds = true;
}
-(void)setUpTextAttribute
{

    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:@"Create an account and try a  free wash and dry in your laundry room - no credit card required." attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:19],NSForegroundColorAttributeName:brownishGrey,NSKernAttributeName: @(-0.28)}];
    [attributedString1 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:19] range:NSMakeRange(29, 17)];
    _lb1.attributedText = attributedString1;
    
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:@"Pay for laundry easily with  auto-fill options to save time and give you control." attributes:@{
                                                                   NSFontAttributeName: [UIFont systemFontOfSize:19],
                                                                   NSForegroundColorAttributeName:brownishGrey,
                                                                   NSKernAttributeName: @(-0.28)
                                                                   }];
    [attributedString2 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:19] range:NSMakeRange(0, 22)];
    _lb2.attributedText = attributedString2;
    
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:@"Know and be notified if washers and dryers are available and when laundry is done." attributes:@{
                                                                                                                                                                                                        NSFontAttributeName: [UIFont systemFontOfSize:19],
                                                                                                                                                                                                        NSForegroundColorAttributeName: brownishGrey,
                                                                                                                                                                                                        NSKernAttributeName: @(-0.28)
                                                                                                                                                                                                        }];
    [attributedString3 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:19] range:NSMakeRange(0, 20)];
    _lb3.attributedText = attributedString3;
    
    NSMutableAttributedString *attributedString4 = [[NSMutableAttributedString alloc] initWithString:@"Get answers and help if you need it. We’ll keep your laundry experience simple and easy." attributes:@{
                                                                                                                                                                                                              NSFontAttributeName: [UIFont systemFontOfSize:19],
                                                                                                                                                                                                              NSForegroundColorAttributeName: brownishGrey,
                                                                                                                                                                                                              NSKernAttributeName: @(-0.28)
                                                                                                                                                                                                              }];
    [attributedString4 addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:19] range:NSMakeRange(0, 20)];
    _lb4.attributedText = attributedString4;
    
}



-(NSTimer *)carouselTimer
{
    if (!_carouselTimer) {
        _carouselTimer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(autoDisplayCarousel) userInfo:nil repeats:true];
    }
    return _carouselTimer;
}

#pragma mark ==========================Life Cycle Method============================
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTextAttribute];
    [self setUpBtnOutlet];
  
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    if (self.carouselTimer) {
        [[NSRunLoop currentRunLoop]addTimer:_carouselTimer forMode:NSDefaultRunLoopMode];
    }
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (_carouselTimer ) {
        [_carouselTimer invalidate];

    }
}
-(void)dealloc
{
    
    NSLog(@"__func :%s retainCount:%ld",__func__,(long)CFGetRetainCount((__bridge CFTypeRef)self));
}
#pragma mark ==================UIScrollViewDelegate=======================
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    _pageControl.currentPage = page;
}
@end
