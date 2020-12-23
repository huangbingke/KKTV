//
//  KKRightCell.h
//  KKTV
//
//  Created by KK on 2020/12/7.
//

#import <UIKit/UIKit.h>
#import "KKModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKRightCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (nonatomic, strong) KKTVModel *model;


@end

NS_ASSUME_NONNULL_END
