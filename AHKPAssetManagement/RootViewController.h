//
//  RootViewController.h
//  AHKPAssetManagement
//
//  Created by kevin henderson perez on 12/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXingWidgetController.h"
#import "QRCodeReader.h"
#import "AssetManager.h"

@interface RootViewController : UITableViewController {
    
    AssetManager *myAM;

}

@property (nonatomic, retain) AssetManager *myAM;

@end
