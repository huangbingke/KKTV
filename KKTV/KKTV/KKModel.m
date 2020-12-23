//
//  KKModel.m
//  KKTV
//
//  Created by KK on 2020/12/7.
//

#import "KKModel.h"

@implementation KKModel
- (instancetype)initWithTitle:(NSString *)title tvs:(NSArray *)tvs {
    if (self = [super init]) {
        self.title = title;
        self.tvs = tvs;
    }
    return self;
}
@end


@implementation KKTVModel

- (instancetype)initWithName:(NSString *)name
                         url:(NSString *)url {
    if (self = [super init]) {
        self.name = name;
        self.url = url;
    }
    return self;
}


@end
