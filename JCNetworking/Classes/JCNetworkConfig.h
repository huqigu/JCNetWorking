//
//  JCNetworkConfig.h
//  AFNetworking
//
//  Created by yellow on 2019/4/12.
//

/**
 通常接口返回如： {
                "code":0,
                "data":{}
                "message":"ok"
               }
 
 用于适配不同接口返回字段不同的问题。
 */

#import <Foundation/Foundation.h>

extern NSString * const defaultCategoryKey;

@interface JCNetworkConfig : NSObject

/**
 API状态码对应的字段，默认为code
 */
@property (nonatomic ,copy) NSString *codeKey;

/**
 API正确返回时的code值，如果不相等，认为是返回错误
 */
@property (nonatomic ,copy) NSString *code;

/**
 API数据段对应的字段，默认为data
 */
@property (nonatomic ,copy) NSString *dataKey;

/**
 API信息对应的字段，默认为message
 */
@property (nonatomic ,copy) NSString *messageKey;


@end

