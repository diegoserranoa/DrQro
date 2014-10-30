//
//  ViewController.m
//  DrQro
//
//  Created by Diego Serrano on 10/30/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL keyboardIsShown;
    CGSize kbSize;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) UITextField *activeField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    keyboardIsShown = NO;
    [self addGestureRecognizers];
    [self registerForKeyboardNotifications];
}

- (void)addGestureRecognizers
{
    UITapGestureRecognizer *usuarioGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
	usuarioGestureRecognizer.cancelsTouchesInView = NO;
    
	[self.scrollView addGestureRecognizer:usuarioGestureRecognizer];
}

#pragma mark - IBActions

- (IBAction)loginAction:(UIButton *)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if ([username isEqualToString:@""]) {
        // campo vacio
    } else if ([password isEqualToString:@""]){
        // constrasena vacia
    } else {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (!error) {
                [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"rootViewController"] animated:YES completion:nil];
                
            } else {
                // ocurrio un error
            }
        }];
    }
}

#pragma mark - Keyboard

// TextField
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
    if (keyboardIsShown) {
        [self scrollToView];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)sender
{
    self.activeField = nil;
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidChange:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
    
}

// Called when the keyboard is shown and the active field changes.
- (void)scrollToView
{
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
    CGRect buttonRect = self.view.frame;
    buttonRect.size.height = self.loginButton.frame.origin.y + self.loginButton.frame.size.height + 10;
    
    [self.scrollView setContentSize:CGSizeMake(buttonRect.size.width, buttonRect.size.height)];
    
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.loginButton.frame animated:YES];
    }
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [self scrollToView];
    keyboardIsShown = YES;
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

// Called when the UIKeyboardDidHideNotification is sent.
- (void)keyboardDidHide:(NSNotification*)aNotification
{
    [self dismissKeyboard];
    keyboardIsShown = NO;
}

// Called when the UIKeyboardDidChangeFrameNotification is sent
- (void)keyboardDidChange:(NSNotification *) aNotification
{
    NSDictionary* info = [aNotification userInfo];
    kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [self scrollToView];
}

-(void) dismissKeyboard
{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
