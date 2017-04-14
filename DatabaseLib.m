//
//  DatabaseLib.m
//  KI_TestNo_03..sqlite
//
//  Created by Student P_02 on 07/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import "DatabaseLib.h"
#import "ViewController.h"
@implementation DatabaseLib
+(instancetype)getSharedObject
{
    static DatabaseLib *sharedObject;
    if(sharedObject==nil)
    {
        sharedObject=[[DatabaseLib alloc]init];
        
    }
    return sharedObject;
}
-(NSString *)getdatabasePath
{
    NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[[docDir firstObject]stringByAppendingString:@"sqliteDatabase.db"];
    return dbpath;
    
}
-(int)executeQuery:(NSString *)query
{
    int success=0;
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getdatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=1;
            }
        }
        
    }
    return success;
    
}
-(void)createDatabase

{
    NSString *query=@"create table if not exists taskTable(taskId text,taskName text)";
    int issuccess=[self executeQuery:query];
    if (issuccess)
    {
        NSLog(@"Database created successfully");
        
    }
    else
        NSLog(@"Database created failed");
    
}
-(NSArray *)getAllTasks:(NSString *)query
{
    self.itemArray=[[NSMutableArray alloc]init];
    //self.ratesArray=[[NSMutableArray alloc]init];
    //NSMutableArray *taskArray=[[NSMutableArray alloc]init];
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getdatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const char *task=(const char *)sqlite3_column_text(stmt, 0);
                NSString *myTask=[NSString stringWithFormat:@"%s",task];
               // NSString *myname=[NSString stringWithFormat:@"%s",name];
                //[taskArray addObject:myname];
               // [taskArray addObject:myTask];
                [ self.itemArray addObject:myTask];
                
            }
            
        }
    }
    NSLog(@"%@",self.itemArray);
    return self.itemArray;
}

                

-(NSArray *)getAllrates:(NSString *)query
{
    self.ratesArray=[[NSMutableArray alloc]init];
    //self.ratesArray=[[NSMutableArray alloc]init];
    //NSMutableArray *taskArray=[[NSMutableArray alloc]init];
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getdatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const char *task=(const char *)sqlite3_column_text(stmt, 1);
                NSString *myTask=[NSString stringWithFormat:@"%s",task];
                // NSString *myname=[NSString stringWithFormat:@"%s",name];
                //[taskArray addObject:myname];
                // [taskArray addObject:myTask];
                [ self.ratesArray addObject:myTask];
                
            }
            
        }
    }
    NSLog(@"%@",self.ratesArray);
    return self.ratesArray;
}




@end

