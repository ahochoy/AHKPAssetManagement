//
//  AssetManager.h
//  AHKPAssetManagement
//
//  Created by kevin henderson perez on 12/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Asset.h"


@interface AssetManager : NSObject {
    
    NSMutableArray *assets;
    
}

@property (nonatomic, retain) NSMutableArray *assets;

-(void)addAsset:(Asset *)asset;
-(BOOL)doesAssetExist:(NSString *)ID;
-(Asset *)retrieveAssetWithID:(NSString *)ID;

@end
