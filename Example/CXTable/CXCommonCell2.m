//
//  CXCommonCell2.m

//
//  Created by hntnet on 2021/11/3.
//

#import "CXCommonCell2.h"

@implementation CXCommonCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (IBAction)valueChanged:(UITextField *)sender {
    if (self.cellTextFieldHandle) {
        self.cellTextFieldHandle(sender.text);
    }
}


@end
