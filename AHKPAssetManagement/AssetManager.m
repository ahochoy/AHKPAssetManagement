//
//  AssetManager.m
//  AHKPAssetManagement
//
//  Created by kevin henderson perez on 12/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AssetManager.h"

#define EQUIP_DESC 0
#define LAST_SCANNED 1
#define LOCATION 2

@implementation AssetManager

@synthesize assets;

-(void) addAsset:(Asset *)asset{
    
    [self.assets addObject: asset];

}

@end
