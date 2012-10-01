//
//  RegistrationFormViewController.m
//  UserRegistration
//
//  Created by Hugo Adolfo Perez Solorzano on 9/26/12.
//  Copyright (c) 2012 bmgh. All rights reserved.
//

#import "RegistrationFormViewController.h"
#define MAX_LENGTH 7
#define NUMERIC                 @"1234567890"


@implementation RegistrationFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    objTableView.delegate=self;
    objTableView.dataSource=self;
    firstNametexfld.delegate=self;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    
    bool fDidResign = [textField resignFirstResponder];
    
    
    return fDidResign;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//{
//    if (textField.tag==NUMERIC) {
//        
//    }
    if (textField.text.length >= MAX_LENGTH && range.length == 0)
    {
        UIAlertView *alet=[[UIAlertView alloc]initWithTitle:@"Bangulator" message:@"you Can Enter Max. 7 Character" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alet show];
        firstNametexfld.text=@"";
        return NO; // return NO to not change text
    }
    else
    {return YES;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    objTableView.backgroundColor=[UIColor orangeColor];
    if (indexPath.row==0) {
        UILabel *firstName=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 120, 30)];
        firstName.text=@"First Name";
        firstName.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:firstName];
        firstNametexfld=[[UITextField alloc]initWithFrame:CGRectMake(180, 5, 135, 30)];
        firstNametexfld.borderStyle=UITextBorderStyleBezel;
        firstNametexfld.placeholder=@"First Name";
        [cell.contentView addSubview:firstNametexfld];
    }
    if (indexPath.row==1) {
        UILabel *lastName=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 120, 30)];
        lastName.text=@"Last Name";
        lastName.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:lastName];
        UITextField *lastNametexfld=[[UITextField alloc]initWithFrame:CGRectMake(180, 5, 135, 30)];
        lastNametexfld.borderStyle=UITextBorderStyleBezel;
        lastNametexfld.placeholder=@"Last Name";
        [cell.contentView addSubview:lastNametexfld];
    }
    if (indexPath.row==2) {
        UILabel *emailaddress=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 120, 30)];
        emailaddress.text=@"Email address";
        emailaddress.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:emailaddress];
        UITextField *emailaddresstexfld=[[UITextField alloc]initWithFrame:CGRectMake(180, 5, 135, 30)];
        emailaddresstexfld.borderStyle=UITextBorderStyleBezel;
        emailaddresstexfld.placeholder=@"Email address";
        [cell.contentView addSubview:emailaddresstexfld];
    }
    if (indexPath.row==3) {
        UILabel *doblabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 120, 30)];
        doblabel.text=@"Date of Birth";
        doblabel.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:doblabel];
        UITextField *dobtexfld=[[UITextField alloc]initWithFrame:CGRectMake(180, 5, 135, 30)];
        dobtexfld.borderStyle=UITextBorderStyleBezel;
        dobtexfld.placeholder=@"Date of Birth";
        [cell.contentView addSubview:dobtexfld];
    }
    if (indexPath.row==4) {
        UILabel *countryListlbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 120, 30)];
        countryListlbl.text=@"Country of Birth";
        countryListlbl.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:countryListlbl];
        UITextField *countryListtexfld=[[UITextField alloc]initWithFrame:CGRectMake(180, 5, 135, 30)];
        countryListtexfld.borderStyle=UITextBorderStyleBezel;
        countryListtexfld.placeholder=@"Country of Birth";
        [cell.contentView addSubview:countryListtexfld];
    }
    if (indexPath.row==5) {
        
        UIButton *SubmitButton=[UIButton buttonWithType:UIButtonTypeCustom];
        SubmitButton.frame=CGRectMake(70, 5, 80, 35);
        [SubmitButton setTitle:@"Submit" forState:UIControlStateNormal];
        //[SubmitButton addTarget:self action:@selector(PreviousButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [SubmitButton setImage:[UIImage imageNamed:@"submit.png"] forState:UIControlStateNormal];
         [cell.contentView addSubview:SubmitButton];
        UIButton *CancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
        CancelButton.frame=CGRectMake(180, 5, 80, 35);
        [CancelButton setTitle:@"Submit" forState:UIControlStateNormal];
       // [CancelButton addTarget:self action:@selector(PreviousButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [CancelButton setImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
        [cell.contentView addSubview:CancelButton];
        
    }
    // Configure the cell...
    
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
