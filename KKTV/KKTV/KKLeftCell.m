//
//  KKLeftCell.m
//  KKTV
//
//  Created by KK on 2020/12/7.
//

#import "KKLeftCell.h"

@implementation KKLeftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(KKModel *)model {
    self.titleLabel.text = model.title;
    self.titleLabel.font = model.isSelect ? [UIFont boldSystemFontOfSize:40]: [UIFont boldSystemFontOfSize:30];
    self.contentView.backgroundColor = model.isSelect ? UIColor.whiteColor : UIColor.clearColor;
    self.titleLabel.textColor = model.isSelect ? kRGBColor(57, 125, 158) : UIColor.lightGrayColor;
    
}





@end
