//
//  RegistrationFormViewController.h
//  UserRegistration
//
//  Created by Hugo Adolfo Perez Solorzano on 9/26/12.
//  Copyright (c) 2012 bmgh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationFormViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    IBOutlet UITableView *objTableView;
    UITextField *firstNametexfld;
}
@end
