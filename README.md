# Yeebadge

add badgeView for UIView


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

###  author
  Yee
 [https://www.jianshu.com/u/d50125d6fd7a](https://www.jianshu.com/u/d50125d6fd7a)





