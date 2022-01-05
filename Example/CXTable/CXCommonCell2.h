//
//  CXCommonCell2.h

//
//  Created by hntnet on 2021/11/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^CellTextFieldHandle)(NSString *content);
@interface CXCommonCell2 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (weak, nonatomic) IBOutlet UITextField *descTextField;


///左侧距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *descLeftDis;

///右侧btn
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;


@property (nonatomic ,copy) CellTextFieldHandle cellTextFieldHandle;


@end

NS_ASSUME_NONNULL_END
