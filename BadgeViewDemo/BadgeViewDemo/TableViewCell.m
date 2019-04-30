//
//  TableViewCell.m
//  BadgeViewDemo
//
//  Created by Yee on 2018/4/14.
//  Copyright © 2018年 Yee. All rights reserved.
//

#import "TableViewCell.h"
@interface TableViewCell ()
{
    UIImageView *m_pImageView;

    UILabel     *m_pTextLable;
}
@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        [self add_OwnView];
    }
    return self;
}
-(void)add_OwnView{
    
    m_pTextLable=[[UILabel alloc] initWithFrame:CGRectMake(30,(60-23)*0.5, 45, 23)];
    m_pTextLable.text=@"Stytle";
    m_pTextLable.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:m_pTextLable];
    m_pImageView=[[UIImageView alloc] init];
    m_pImageView.image=[UIImage imageNamed:@"13745236"];
    m_pImageView.contentMode = UIViewContentModeScaleAspectFit;
    [m_pImageView setFrame:CGRectMake(m_pTextLable.frame.origin.x+m_pTextLable.frame.size.width+25,10, 40, 40)];
    [self.contentView addSubview:m_pImageView];
}
-(void)configueCellBadgeStyle:(YeeBadgeStytle)style{
    
    switch (style) {
        case YeeBadgeRedDotStytle:
        {
            [m_pImageView  ShowBadgeView];
        }
            break;
        case YeeBadgeNumberStytle:
        {
            m_pImageView.redDotNumber= 20;
            m_pImageView.redDotBorderWidth = 1.0;
            m_pImageView.redDotBorderColor = [UIColor magentaColor];
            [m_pImageView  ShowBadgeView];
        }
            break;
        default:
        {
            m_pImageView.redDotText= @"testNew";
            [m_pImageView  ShowBadgeView];
        }
            break;
    }
    
}
@end
