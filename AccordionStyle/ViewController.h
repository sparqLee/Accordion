//
//  ViewController.h
//  AccordionStyle
//
//  Created by Zsika Phillip on 10/25/12.
//  Copyright (c) 2012 Zsika Phillip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, retain)  IBOutlet UITableView *directoryTable;
@property (nonatomic, retain)  NSMutableArray *Alaska;
@property (nonatomic, retain)  NSMutableArray *Texas;
@property (nonatomic, retain)  NSMutableArray *NewYork;
@property (nonatomic, retain)  NSMutableArray *listOfSections_DataSource;
@property (nonatomic, retain)  NSMutableArray *listOfSections; // this is a placeholder
@property (nonatomic)          int selectedSection;//knows which state to expand
@property (nonatomic)          int selectedSectionTail;//knows which state to close

@end
