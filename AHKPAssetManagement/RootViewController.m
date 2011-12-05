//
//  RootViewController.m
//  AHKPAssetManagement
//
//  Created by kevin henderson perez on 12/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "AssetManager.h"
#import "Asset.h"

#define EQUIP_ID 0
#define EQUIP_DESC 1
#define LAST_SCANNED 2
#define LOCATION 3

@implementation RootViewController

@synthesize myAM;

- (void)viewDidLoad
{
    //Initialize AssetManager
    AssetManager *tmpAM = [[AssetManager alloc] init];
    
    //Read in from plist and populate AssetManager Object
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Assets" ofType:@"plist"];
    
    NSArray *assets = [NSArray arrayWithContentsOfFile:path];
    
    //Process each array of Asset Info pulled in from the plist
    for (NSArray *assetInfo in assets) {
        
        //Create a temporary asset to store the information and add it to the tmpAsset List
        Asset *tmpAsset = [[Asset alloc] init];
        
        tmpAsset.equipId = [assetInfo objectAtIndex: EQUIP_ID];
        tmpAsset.equipDesc = [assetInfo objectAtIndex: EQUIP_DESC];
        tmpAsset.lastScanned = [assetInfo objectAtIndex: LAST_SCANNED];
        tmpAsset.location = [assetInfo objectAtIndex: LOCATION];
        
        //Add temporary asset to assets array and release
        [tmpAM addAsset: tmpAsset];
        [tmpAsset release];
    }
    
    self.myAM = tmpAM;
    
    [path release];
    [assets release];
    [tmpAM release];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    //TODO: Reload Table View
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

//Notifies the view controller that its view was dismissed, covered, or otherwise hidden from view.
- (void)viewDidDisappear:(BOOL)animated
{
    //TODO: Save to plist file from current AssetManager Object
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Assets" ofType:@"plist"];
    
    NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    
    for (Asset *asset in self.myAM.assets) {
        
        NSArray *tmp = [[NSArray alloc] initWithObjects: asset.equipId, asset.equipDesc, asset.lastScanned, asset.location , nil];
        
        [tmpArray addObject: tmp];
        [tmp release];
    }
    
    [tmpArray writeToFile:path atomically:YES];
    
    [tmpArray release];
    
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
