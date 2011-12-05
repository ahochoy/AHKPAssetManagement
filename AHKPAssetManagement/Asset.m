//
//  Asset.m
//  AHKPAssetManagement
//
//  Created by kevin henderson perez on 12/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Asset.h"

#define EQUIP_DESC 0
#define LAST_SCANNED 1
#define LOCATION 2

@implementation Asset

@synthesize equipId, equipDesc, lastScanned, location, image;

-(NSArray *) assetToArray{
    
    NSArray *tmp = [[NSArray alloc] initWithObjects:self.equipId, self.equipDesc, self.lastScanned, self.location, nil];
                        
    [tmp autorelease];
    return tmp;
}

@end
