
# Yeebadge
![](https://img.shields.io/cocoapods/p/YeeBadgeView.svg?style=flat)![](https://img.shields.io/badge/language-objc-orange.svg)
![](https://img.shields.io/cocoapods/v/YeeBadgeView.svg?style=flat)
![](https://img.shields.io/cocoapods/l/YeeBadgeView.svg) <br>


add badgeView for UIView

### OverView

Support Three Style,but you don't need to know it's implementation, i  haved deal with it

  *   YeeBadgeRedDotStytle
  *   YeeBadgeNumberStytle
  *   YeeBadgeTextStytle
  
### How to use

```
 pod 'YeeBadgeView', '~> 0.0.3'
```


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
 ### ScreenShot
 
 ![2018-4-14.png](https://upload-images.jianshu.io/upload_images/1488651-1e7d181761279bb9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 
 ### Version
 > 2018-11-28   pod  support <br>
 >  2018-4-14   1.0.2 <br>
 > 2017-7       1.0.1






