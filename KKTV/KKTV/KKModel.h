//
//  KKModel.h
//  KKTV
//
//  Created by KK on 2020/12/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class KKTVModel;
@interface KKModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray<KKTVModel *> *tvs;
@property (nonatomic, assign) BOOL isSelect;

- (instancetype)initWithTitle:(NSString *)title tvs:(NSArray *)tvs;

@end



@interface KKTVModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithName:(NSString *)name
                         url:(NSString *)url;

@end
NS_ASSUME_NONNULL_END
