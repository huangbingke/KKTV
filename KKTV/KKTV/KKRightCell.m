//
//  KKRightCell.m
//  KKTV
//
//  Created by KK on 2020/12/7.
//

#import "KKRightCell.h"

@implementation KKRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

- (void)setModel:(KKTVModel *)model {    
    self.nameLabel.text = model.name;
}


@end
