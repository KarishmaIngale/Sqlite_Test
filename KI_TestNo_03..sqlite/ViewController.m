//
//  ViewController.m
//  KI_TestNo_03..sqlite
//
//  Created by Student P_02 on 07/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myArray=[[NSArray alloc]init];
    NSString *query=@"select * from taskTable";
    //self.myArray=[[DatabaseLib getSharedObject]getAllTasks:query];
   // [self.MyView reloadData];

    self.ratesArray=[[DatabaseLib getSharedObject]getAllrates:query];
    [self.MyView reloadData];
    
    self.itemArray=[[DatabaseLib getSharedObject]getAllTasks:query];
    NSLog(@"%@",self.itemArray);

   // self.ratesArray=[[DatabaseLib getSharedObject]getAllrates:query];
    NSLog(@"%@",self.ratesArray);

    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.itemArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.ratesArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


    - (IBAction)MyButton:(id)sender {
        
    
NSString *idText,*nameText;
idText=self.MyText.text;
nameText=self.YourText.text;
NSString *query=[NSString stringWithFormat:@"insert into taskTable(taskId,taskName)values(\"%@\",\"%@\")",idText,nameText];
NSLog(@"%@",idText);

int issuccess=[[DatabaseLib getSharedObject]executeQuery:query];
if(issuccess)
{
    NSLog(@"insearted:success");
    
    NSString *query=@"select * from taskTable";
    self.myArray=[[DatabaseLib getSharedObject]getAllTasks:query];
    
     [self.MyView reloadData];
    
}
else

{
    NSLog(@"inserted:failed");
    
   // ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
    
}



        
    }

        
        @end

