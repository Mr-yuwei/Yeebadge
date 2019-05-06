//
//  ViewControllerTestOne.m
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/13.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "ViewControllerTestOne.h"
#import "YeeBadgeView.h"
#import "NSObject+IvarNSlog.h"
#import "YeeBadgeViewHeader.h"
#import "TableViewCell.h"
@interface ViewControllerTestOne ()<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView  *m_ptableView;
    
}
@end

@implementation ViewControllerTestOne

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"one";
    [self add_OwnView];
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbtn setFrame:CGRectMake(0, 0, 25, 35)];
    [leftbtn setImage:[UIImage imageNamed:@"icon_my_message"] forState:UIControlStateNormal];
    UIBarButtonItem *leftbarItem=[[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = leftbarItem;
    self.navigationItem.leftBarButtonItem.redDotColor = [UIColor blueColor];
    self.navigationItem.leftBarButtonItem.redDotRadius = 5.0;
    self.navigationItem.leftBarButtonItem.redDotOffset = CGPointMake(4, +5);
    self.navigationItem.leftBarButtonItem.redDotNumber = 100;
    self.navigationItem.leftBarButtonItem.redDotBorderColor = [UIColor orangeColor];
    self.navigationItem.leftBarButtonItem.redDotBorderWidth = 1.0;

    [self.navigationItem.leftBarButtonItem ShowBadgeView];

    
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbtn setFrame:CGRectMake(0, 0, 25, 35)];
    [rightbtn setImage:[UIImage imageNamed:@"icon_my_message"] forState:UIControlStateNormal];
    UIBarButtonItem *rightbarItem = [[UIBarButtonItem alloc] initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem = rightbarItem;
    self.navigationItem.rightBarButtonItem.redDotColor = [UIColor brownColor];
    [self.navigationItem.rightBarButtonItem ShowBadgeView];
    self.navigationItem.rightBarButtonItem.redDotOffset = CGPointMake(-5, 5);
    
    self.tabBarItem.redDotColor = [UIColor greenColor];
    self.tabBarItem.redDotBorderColor = [UIColor blueColor];
    self.tabBarItem.redDotBorderWidth = 1.0;
    self.tabBarItem.redDotMaxNumber = 99;
    self.tabBarItem.redDotNumber = 10000;
    [self.tabBarItem ShowBadgeView];
    
    [NSObject PrintClassIvar:[UIBarButtonItem class]];
}
- (void)add_OwnView{
    m_ptableView=[[UITableView alloc] initWithFrame:self.view.bounds];
    m_ptableView.delegate = self;
    m_ptableView.dataSource = self;
    m_ptableView.tableFooterView =[[UIView alloc] init];
    [m_ptableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    [self.view addSubview:m_ptableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    [cell configueCellBadgeStyle:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row %2 ==0 )
    {
        [self.tabBarItem ShowBadgeView];
        return;
    }
   [self.tabBarItem hideBadgeView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
