//
//  JCNetworkConfigManager.m
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

#import "JCNetworkConfigManager.h"
#import "JCNetworkConfig.h"

@interface JCNetworkConfigManager ()

@property (nonatomic, strong) NSMutableDictionary <NSString * ,JCNetworkConfig *>*configs;

@end

@implementation JCNetworkConfigManager

- (instancetype)init {
    if (self = [super init]) {
        _configs = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (instancetype)sharedConfigManager {
    static JCNetworkConfigManager *_sharedConfigManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfigManager = [[self alloc] init];
    });
    return _sharedConfigManager;
}


#pragma mark - Private Methods

- (void)updateNetworkConfig:(JCNetworkConfigBlock)configBlock forCategory:(NSString *)category {
    if (!category) {
        return;
    }
    
    if (configBlock) {
        configBlock([self configForCategory:category]);
    }else {
        _configs[category] = nil;
    }
}

- (JCNetworkConfig *)configForCategory:(NSString *)category {
    if (!category) {
        category = defaultCategoryKey;
    }
    if (_configs[category]) {
        return _configs[category];
    }else {
        _configs[category] = [[JCNetworkConfig alloc] init]; // 默认规则
        return _configs[category];
    }
}

#pragma mark - Public Methods

+ (void)updateNetworkConfig:(JCNetworkConfigBlock)configBlock forCategory:(NSString *)category {
    
    [[self sharedConfigManager] updateNetworkConfig:configBlock forCategory:category];
}

@end
