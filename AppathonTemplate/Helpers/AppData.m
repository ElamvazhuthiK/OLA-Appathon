//
//  AppData.m
//  OPX
//
//  Created by Chandrachudh on 6/20/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import "AppData.h"
#define kDBName @"storeData.db"
#define kErrorMessage @"ErrorMessage"

@implementation AppData
static AppData *appData = nil;
+ (id)getObject
{
    if (appData == nil)
    {
        appData = [AppData new];
    }
    return appData;
}

+ (void)loadData
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kDBName])
    {
        NSData *data = [[NSMutableData alloc] initWithData:[[NSUserDefaults standardUserDefaults] objectForKey:kDBName]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        appData = [unarchiver decodeObjectForKey:kDBName];
        [unarchiver finishDecoding];
    }
}

+ (void)saveData
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:appData forKey:kDBName];
    [archiver finishEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kDBName];
}
#pragma mark NSCoding delegates
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithBool:self.username] forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.username = [aDecoder decodeObjectForKey:@"username"];
    self.password = [aDecoder decodeObjectForKey:@"password"];
    return self;
}
@end
