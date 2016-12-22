//
//  AppDelegate.m
//  DZ12Blocks
//
//  Created by Vasilii on 21.12.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // создаю блок с возращаемыми параметрами
    void (^myBlockWithParams)(NSString*, NSInteger) = ^(NSString *string, NSInteger intValue) {
        NSLog(@"My block with parametrs: string: %@, int: %@", string, @(intValue));
    };
    
    // вызываю и передаю в него параметры
    myBlockWithParams(@"My block number", 1);

    //метод которые принимает блок и вызывает его (см после return YES;)
    [self myBlocksMethod:^{
        NSLog(@"MYBLOCK!!!");
    }];
    
    Student * student1 = [[Student alloc] init];
    student1.name = @"Ivan";
    student1.lastName = @"Ivanov";
    
    Student * student2 = [[Student alloc] init];
    student2.name = @"Petr";
    student2.lastName = @"Petrov";
    
    Student * student3 = [[Student alloc] init];
    student3.name = @"Semen";
    student3.lastName = @"Sidorov";
    
    Student * student4 = [[Student alloc] init];
    student4.name = @"Olga";
    student4.lastName = @"Antonova";
    
    Student * student5 = [[Student alloc] init];
    student5.name = @"Igor";
    student5.lastName = @"Ivanov";
    
    Student * student6 = [[Student alloc] init];
    student6.name = @"Sweta";
    student6.lastName = @"Svetlova";
    
    Student * student7 = [[Student alloc] init];
    student7.name = @"Ira";
    student7.lastName = @"Morozova";
    
    Student * student8 = [[Student alloc] init];
    student8.name = @"Alex";
    student8.lastName = @"Belov";
    
    Student * student9 = [[Student alloc] init];
    student9.name = @"Alexandr";
    student9.lastName = @"Alexandrov";
    
    Student * student10 = [[Student alloc] init];
    student10.name = @"Leon";
    student10.lastName = @"Ul";
    
    NSArray * students = [NSArray arrayWithObjects: student1, student2, student3, student4, student5, student6, student7, student8, student9, student10, nil];
    
    // сортеруем и сравниваем
    students = [students sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([[obj1 lastName] isEqualToString:[obj2 lastName]]) {
            return [[obj1 name] compare: [obj2 name]];
        } else {
            return [[obj1 lastName] compare:[obj2 lastName]];
        }
        
    }];
    
    for (Student * student in students) {
        NSLog(@"Student %@ %@", student.lastName, student.name);
    }
    
    return YES;
}

//метод который ничего не принимает и возвращает блок, ничего не принимает и невозращает называтеся testBlock
-(void) myBlocksMethod : (void (^)(void)) testBlock {
    
    NSLog(@"TestBlockMethod");
    testBlock();
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
