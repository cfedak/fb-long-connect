//
//  ViewController.m
//  firebase-long-connect
//
//  Created by Christopher Fedak on 12/22/15.
//  Copyright © 2015 SMART Technologies. All rights reserved.
//

#import "ViewController.h"
#import <Firebase/Firebase.h>
#import <libextobjc/extobjc.h>
#import <MBProgressHUD/MBProgressHUD.h>

static NSString *token = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE0NTA4MTkxNzQsImQiOnsidWlkIjoiMSJ9LCJleHAiOiIxNDU1NDMzMjAwMDAwIiwidiI6MH0.83cj16NYi_uroyPd-h0WM5CFntdVxUj6KcMzaO7_g38";
static NSString *path = @"https://crackling-torch-790.firebaseio.com";

@interface ViewController ()
@property Firebase *firebase;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressed:(id)sender {
    [self startFirebaseAfterURLConnect];
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)attemptFinished {
    self.button.enabled = true;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)startFirebaseAfterURLConnect {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://www.firebase.com"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    @weakify(self)
    NSLog(@"talking to web page");
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        @strongify(self)
        NSHTTPURLResponse *htResponse = (NSHTTPURLResponse *)response;
        if (htResponse.statusCode == 200) {
            NSLog(@"Done");
            [self performSelectorOnMainThread:@selector(startFirebase) withObject:nil waitUntilDone:NO];
        } else {
            [self performSelectorOnMainThread:@selector(attemptFinished) withObject:nil waitUntilDone:NO];
        }
    }] resume];
}

- (void)startFirebase {
    self.firebase = [[Firebase alloc] initWithUrl:path];
    @weakify(self)
    NSLog(@"Authenticating");
    [self.firebase authWithCustomToken:token withCompletionBlock:^(NSError *error, FAuthData *authData) {
        NSLog(@"Authed with error %@", error);
        @strongify(self)
        [self attemptFinished];
    }];
}

@end
