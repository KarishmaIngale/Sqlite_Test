//
//  ViewController.h
//  KI_TestNo_03..sqlite
//
//  Created by Student P_02 on 07/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseLib.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property NSArray *myArray;
@property NSArray *itemArray;
@property NSArray *ratesArray;
- (IBAction)MyButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *MyText;
@property (strong, nonatomic) IBOutlet UITextField *YourText;
@property (strong, nonatomic) IBOutlet UITableView *MyView;

@end

