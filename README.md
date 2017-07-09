# Yeebadge

![Simulator Screen Shot 2017年7月9日 下午8.23.10.png](http://upload-images.jianshu.io/upload_images/1488651-b816a3792c207c45.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
UIView *blueView=[[UIView alloc] init];

[blueView setFrame:CGRectMake(40, 70, 200, 20)];
[blueView  yee_MakeBadgeText:@"" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:10]];
[blueView setBackgroundColor:[UIColor blueColor]];
[self.view addSubview:blueView];

UIView *grayView=[[UIView alloc] init];

[grayView setFrame:CGRectMake(40, 120, 200, 20)];
[grayView  yee_MakeBadgeText:@"100" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:10]];
[grayView setBackgroundColor:[UIColor grayColor]];
[self.view addSubview:grayView];


UIButton *buttonView=[UIButton buttonWithType:UIButtonTypeCustom];
[buttonView setFrame:CGRectMake(40, 180, 50, 40)];
[buttonView setImage:[UIImage imageNamed:@"artical_detail_icon_comment_disabled"] forState:UIControlStateNormal];
[buttonView  yee_MakeBadgeText:@"2345" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:9]];

[self.view addSubview:buttonView];
```
为任意视图添加小圆点和角标文字
