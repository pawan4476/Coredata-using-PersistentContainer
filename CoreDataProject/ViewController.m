//
//  ViewController.m
//  CoreDataProject
//
//  Created by Nagam Pawan on 9/29/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Entity.h"

@interface ViewController ()
@end

@implementation ViewController
-(NSPersistentContainer *)persistentContainer {
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).persistentContainer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveData:(id)sender {
    [self.persistentContainer performBackgroundTask:^(NSManagedObjectContext *context){
        Entity *desc = (Entity *)[NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:context];
        [desc setValue:self.nameTextField.text forKey:@"name"];
        [desc setValue:self.ageTextField.text forKey:@"age"];
        [desc setValue:self.companyTextField.text forKey:@"company"];
        [desc setValue:self.idTextField.text forKey:@"id"];
        [context save:nil];
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        else{
            NSLog(@"data is saved %@ ", desc);
        }

    }];
    
}
@end
