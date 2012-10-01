//  FormViewController.m
//  UserRegistration
//
//  Created by Hugo Adolfo Perez Solorzano on 9/26/12.
//  Copyright (c) 2012 bmgh. All rights reserved.
//

#import "FormViewController.h"
#import "JSON.h"
@implementation FormViewController
@synthesize CountrylistArray;
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
    dismisdatepicker.hidden=YES;
    dimispicker.hidden=YES;
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:
                              @"http://ec2-54-247-32-16.eu-west-1.compute.amazonaws.com/countries.json"]];
    NSData *response = [NSURLConnection
                        sendSynchronousRequest:request
                        returningResponse:nil error:nil];
        NSString *json_string = [[NSString alloc]
                             initWithData:response encoding:NSUTF8StringEncoding];
    NSArray *statuse=[parser objectWithString:json_string];
       // NSLog(@"%@",data);
    CountrylistArray=[[NSMutableArray alloc]init];
    for (NSDictionary *status in statuse)
    {
        NSLog(@"name~~~~%@", [status objectForKey:@"name"]);
       // NSLog(@"code~~~~~%@", [status objectForKey:@"code"]);
       
        [CountrylistArray addObject:[status objectForKey:@"name"]];
        NSLog(@"%@",CountrylistArray);
        
    }

		
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	dobfld.text = [NSString stringWithFormat:@"%@",
                      [df stringFromDate:[NSDate date]]];
	[self.view addSubview:dobfld]; 
	
	objdatepicker.datePickerMode = UIDatePickerModeDate;
	objdatepicker.hidden = YES;
	objdatepicker.date = [NSDate date];
    
	[objdatepicker addTarget:self
	               action:@selector(ChangeDate:)
	     forControlEvents:UIControlEventValueChanged];
	     
    
    
    
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    self.title=@"User Registration Form";
    pickerData=[[NSMutableArray alloc]initWithObjects:@"mexico",@"mexico",@"up",@"mexico",nil];
	countrylistpicker.delegate=self;
	countrylistpicker.dataSource=self;
	countrylistpicker.hidden=YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)ChangeDate:(id)sender
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
   	df.dateStyle = NSDateFormatterMediumStyle;
	dobfld.text = [NSString stringWithFormat:@"%@",
                      [df stringFromDate:objdatepicker.date]];
}

-(IBAction)SubmitInformation:(id)sender

{
    
    
	if([self validateEmail:[emailfld text]] ==1)
	{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Registration" message:@"Registration Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        

//		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"You Enter Correct Email id." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//		[alert show];
//        
	}
	else{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"You Enter Incoorect Email id." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
	}	
       
  
   NSString *urlString = [NSString stringWithFormat:@"ec2-54-247-32-16.eu-west-1.compute.amazonaws.com/register_user.php",firstnamefld.text,lastnamefld.text,emailfld.text,countrylistfld.text];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *returnData = [NSData dataWithContentsOfURL:url];
    NSLog(@"returnData%@",returnData);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:300];
    NSString *postLength = [NSString stringWithFormat:@"%d", [returnData length]];

    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:returnData];
    
    NSURLConnection *theConnection =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSMutableData *webData;
    
    if( theConnection ) {
        webData = [NSMutableData data];
    }
    else {
        NSLog(@"theConnection is NULL");
    }

    
    
}
-(IBAction)DismisPicker:(id)sender
{
    //[self DismisPicker:countrylistpicker];
    countrylistpicker.hidden=YES;
    dimispicker.hidden=YES;
    
}
-(IBAction)TextFieldResign:(id)sender
{
    [firstnamefld resignFirstResponder];
    [lastnamefld resignFirstResponder];
    [emailfld resignFirstResponder];
    [dobfld resignFirstResponder];
    [countrylistfld resignFirstResponder];
}
- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    //	return 0;
    return [emailTest evaluateWithObject:candidate];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}
-(IBAction)dismisdatepicker:(id)sender
{
    dismisdatepicker.hidden=YES;
    objdatepicker.hidden=YES;
}
-(IBAction)ShowDatePicker:(id)sender
{
    dismisdatepicker.hidden=NO;
    objdatepicker.hidden=NO;
}
-(IBAction)pickerShow
{
    dimispicker.hidden=FALSE;
	countrylistpicker.hidden=NO;
	//txt2.text=[NSString stringWithFormat:@"%@",[pickerData objectAtIndex:row]];
	//picker.hidden=YES ;
}


//PickerViewController.m
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	
	return [CountrylistArray count];
}

//PickerViewController.m
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
        return [CountrylistArray objectAtIndex:row];
        
}


- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    countrylistfld.text=(NSString *)[CountrylistArray objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return 50;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
