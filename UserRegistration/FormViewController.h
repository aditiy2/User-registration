//
//  FormViewController.h
//  UserRegistration
//
//  Created by Hugo Adolfo Perez Solorzano on 9/26/12.
//  Copyright (c) 2012 bmgh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UITextField *firstnamefld;
    IBOutlet UITextField *lastnamefld;
    IBOutlet UITextField *emailfld;
    IBOutlet UITextField *dobfld;
    IBOutlet UITextField *countrylistfld;
    IBOutlet UIButton *submitbutton;
    IBOutlet UIButton *cancelbutton;
    IBOutlet UIPickerView *countrylistpicker;
    NSMutableArray *pickerData;
    IBOutlet UIButton *dimispicker;
    IBOutlet UIDatePicker *objdatepicker;
    NSMutableArray *CountrylistArray;
    NSDictionary *data;
    IBOutlet UIButton *dismisdatepicker;

}
@property(nonatomic,strong)NSMutableArray *CountrylistArray;
-(IBAction)SubmitInformation:(id)sender;
-(IBAction)TextFieldResign:(id)sender;
- (BOOL) validateEmail: (NSString *) candidate;
-(IBAction)pickerShow;
-(IBAction)ShowDatePicker:(id)sender;
-(IBAction)DismisPicker:(id)sender;
- (void)ChangeDate:(id)sender;
-(IBAction)dismisdatepicker:(id)sender;


@end
