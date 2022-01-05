//
//  CXTableViewCell.m
//  CXTable_Example
//
//  Created by hntnet on 2021/11/11.
//  Copyright © 2021 hntnet. All rights reserved.
//

#import "CXTableViewCell.h"

@implementation CXTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
