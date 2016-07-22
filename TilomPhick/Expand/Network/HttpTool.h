//
//  HttpTool.h
//  TilomPhick
//
//  Created by Loulou on 16/7/22.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

+ (void)get:(NSString *)urlString params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *))failure;

+ (void)post:(NSString *)urlString params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *))failure;
@end
