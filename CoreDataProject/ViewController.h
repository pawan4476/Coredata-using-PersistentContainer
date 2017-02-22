//
//  ViewController.h
//  CoreDataProject
//
//  Created by Nagam Pawan on 9/29/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UITextField *companyTextField;
@property (strong, nonatomic) IBOutlet UITextField *idTextField;
- (IBAction)saveData:(id)sender;


@end

