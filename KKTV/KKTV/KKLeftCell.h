//
//  KKLeftCell.h
//  KKTV
//
//  Created by KK on 2020/12/7.
//

#import <UIKit/UIKit.h>

#import "KKModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKLeftCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) KKModel *model;


@end

NS_ASSUME_NONNULL_END
