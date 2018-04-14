# Yeebadge

add badgeView for UIView

### OverView

Support Three Style,but you don't need to know it's implementation, i  haved deal with it

  *   YeeBadgeRedDotStytle
  *   YeeBadgeNumberStytle
  *   YeeBadgeTextStytle
  
### How to use

 * UITabBarItem
 ```
 self.tabBarItem.redDotColor =[UIColor blueColor];
 self.tabBarItem.redDotNumber = 100;
 [self.tabBarItem ShowBadgeView];
 ```
 * UIView
 ```
 m_pContentView=[[UIView alloc] initWithFrame:CGRectMake(35, 120, 100, 35)];
 [m_pContentView setBackgroundColor:[UIColor blueColor]];
 [m_pContentView ShowBadgeView];
 [self.view addSubview:m_pContentView];
 ```
 
 * UIBarButtonItem
 ```
 self.navigationItem.leftBarButtonItem.redDotColor =[UIColor blueColor];
 self.navigationItem.leftBarButtonItem.redDotNumber = 100;
 [self.navigationItem.leftBarButtonItem ShowBadgeView];
 ```
 ### version
 >  2018-4-14   1.0.2  
 > 2017-7       1.0.1
###  author
  Yee
 [https://www.jianshu.com/u/d50125d6fd7a](https://www.jianshu.com/u/d50125d6fd7a)





