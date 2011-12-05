//
//  Asset.h
//  AHKPAssetManagement
//
//  Created by kevin henderson perez on 12/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Asset : NSObject {
    
    NSString *equipId;
    NSString *equipDesc;
    NSDate *lastScanned;
    NSString *location;
    UIImage *image;
    
}

@property (nonatomic, retain) NSString *equipId;
@property (nonatomic, retain) NSString *equipDesc;
@property (nonatomic, retain) NSDate *lastScanned;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) UIImage *image;

-(NSArray *) assetToArray;

@end
