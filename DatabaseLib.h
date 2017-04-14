//
//  DatabaseLib.h
//  KI_TestNo_03..sqlite
//
//  Created by Student P_02 on 07/04/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface DatabaseLib : NSObject
{
    sqlite3 *taskDatabase;
    
}
+(instancetype)getSharedObject;
-(void)createDatabase;
-(NSString *)getdatabasePath;
-(int)executeQuery:(NSString *)query;
-(NSArray *)getAllTasks:(NSString *)query;

-(NSArray *)getAllrates:(NSString *)query;
@property NSMutableArray *itemArray;
@property NSMutableArray *ratesArray;


@end
