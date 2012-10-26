//
//  ViewController.m
//  AccordionStyle
//
//  Created by Zsika Phillip on 10/25/12.
//  Copyright (c) 2012 Zsika Phillip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize NewYork,Alaska,Texas,listOfSections_DataSource,selectedSection,listOfSections,selectedSectionTail,directoryTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.Alaska  = [[NSMutableArray alloc]initWithObjects:@"city 1",@"city 2", nil];
    self.NewYork  = [[NSMutableArray alloc]initWithObjects:@"city 1",@"city 2", nil];
    self.Texas  = [[NSMutableArray alloc]initWithObjects:@"city 1",@"city 2", nil];
    
    self.listOfSections_DataSource = [[NSMutableArray alloc]initWithObjects:self.Alaska,self.NewYork,self.Texas, nil];
    
    //setting up the list of section with empty arrays
    
    NSMutableArray *emptyArray = [[NSMutableArray alloc]init];
    listOfSections = [[NSMutableArray alloc]init];
    for (int i = 0;i<3; i++) {
        [listOfSections addObject:emptyArray];
    }
    self.selectedSection = -1;
    self.selectedSectionTail = -1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [listOfSections_DataSource count];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(selectedSection !=section)
        return 1;
    else{
        NSArray *array = [listOfSections objectAtIndex:section];
        return [array count];
    }

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    if(section == 0)
        return @"Alaska";
    else if(section == 1)
        return @"New York";
    else if(section == 2)
        return @"Texas";
    else return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"cell";
    
 if(self.selectedSection == indexPath.section){//this is just to check to see if this section is the one we touched
    
        UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }

        NSArray *myArray = [listOfSections_DataSource objectAtIndex:indexPath.section];//this now contains your cities
        NSString* myString = [myArray objectAtIndex:indexPath.row]; // get city for that row, under the state
        cell.textLabel.text = myString;
    return cell;
 }
 else{//THIS IS going to happen the first time
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @"more";
 return cell;
}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //check to see if the cell is for exapnding or for selection
    if([cell.textLabel.text isEqualToString:@"more"]){ // this means we need to expand
        
        listOfSections = [[NSMutableArray alloc]init];
        //setting up the list of section with empty arrays
        
        NSMutableArray *emptyArray = [[NSMutableArray alloc]init];
        for (int i = 0;i<3; i++) {
            [listOfSections addObject:emptyArray];
        }
        
        //Add array of cities here
        [listOfSections replaceObjectAtIndex:indexPath.section withObject:[listOfSections_DataSource objectAtIndex:indexPath.section]];
        
        
        int tapedRow = [indexPath section];
        
        self.selectedSection = tapedRow;
        
        NSMutableIndexSet *myIndexSet = [[NSMutableIndexSet alloc]init];
        [myIndexSet addIndex:selectedSection];
        [myIndexSet addIndex:selectedSectionTail];
        
        // Updateing section in the tableview to provide an accordion-like feel to this table view
        if(selectedSectionTail!=-1)
            [directoryTable reloadSections:(NSIndexSet*)myIndexSet withRowAnimation:UITableViewRowAnimationFade];
        else {
            [directoryTable reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:
             UITableViewRowAnimationFade];
        }
        //[directoryTable reloadData];
    }
    else{
    }
    selectedSectionTail = selectedSection;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
