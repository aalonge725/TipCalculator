//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Abraham Alonge on 6/22/21.
//

// Adding a comment so I can open a pull request to add comments on.

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender { // closes keyboard when user taps outside of it
    [self.view endEditing:true];
}

- (IBAction)updateLabels:(id)sender {
    // controls hiding/showing of labels
    if (self.billAmountField.text.length == 0) {
        [self hideLabels];
    } else if (self.billAmountField.frame.origin.y > 100) {
        [self showLabels];
    }
    
    // calculates and displays appropriate tip and total amounts
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (void)hideLabels { // hides labels if bill amount is empty
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y += 200;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
    }];
}

- (void)showLabels { // shows labels if bill amount isn't empty
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y = 100;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = 220;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 1;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
