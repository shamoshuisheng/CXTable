//
//  CXBaseTableViewModel.h
//
//

#import <Foundation/Foundation.h>
#import "CXBase.h"
NS_ASSUME_NONNULL_BEGIN
@class CXTableView;
typedef UITableViewCell* (^TableCellCallBlock)(NSIndexPath *indexPath,UITableView* tableView);

typedef CGFloat (^TableCellHeightBlock)(NSIndexPath *indexPath,UITableView* tableView);


typedef UIView* (^TableHeaderCallBlock)(NSInteger section,UITableView* tableView);

typedef CGFloat (^TableHeaderHeightBlock)(NSInteger section,UITableView* tableView);



typedef UIView* (^TableFooterCallBlock)(NSInteger section,UITableView* tableView);
typedef CGFloat (^TableFooterHeightBlock)(NSInteger section,UITableView* tableView);


typedef void (^TableHeaderRefreshingBlock)(CXTableView *tableView);

typedef void (^TableFooterRefreshingBlock)(CXTableView *tableView);

@interface CXTableViewModel : CXBase

//table设置
///table样式
CXPropStatementAndPropSetFuncStatement(assign, CXTableViewModel, UITableViewStyle, tableViewStyle);

///用于设置cell
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableCellCallBlock, tableCellCallBlock);

CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableCellHeightBlock, tableCellHeightBlock);

///header
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableHeaderCallBlock, tableHeaderCallBlock);

///header高度
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableHeaderHeightBlock, tableHeaderHeightBlock);
///footer
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableFooterCallBlock, tableFooterCallBlock);
///footer高度
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableFooterHeightBlock, tableFooterHeightBlock);
///cell名字此项为必须设置
CXPropStatementAndPropSetFuncStatement(strong, CXTableViewModel, NSArray *, cellNameArray);




///是否允许滚动
CXPropStatementAndPropSetFuncStatement(assign, CXTableViewModel, BOOL, allowScroll);








///数据源
CXPropStatementAndPropSetFuncStatement(strong, CXTableViewModel, NSMutableArray *, dataSource);

#pragma mark ===========空页面===============
///是否显示空页面
CXPropStatementAndPropSetFuncStatement(assign, CXTableViewModel, BOOL, showEmpty);
///空页面图片名称
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, NSString *, emptyImageName);
///空页面图片尺寸
CXPropStatementAndPropSetFuncStatement(assign, CXTableViewModel, CGSize, emptyImageSize);

///空页面描述
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, NSString *, emptyTitleName);





#pragma mark ===刷新相关===

///是否允许回弹，如果此属性为NO时，则刷新不可用
CXPropStatementAndPropSetFuncStatement(assign, CXTableViewModel, BOOL, bounces);

///允许刷新
CXPropStatementAndPropSetFuncStatement(assign, CXTableViewModel, BOOL, allowRefresh);

///下拉刷新
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableHeaderRefreshingBlock, tableHeaderRefreshingBlock);

///上拉加载
CXPropStatementAndPropSetFuncStatement(copy, CXTableViewModel, TableFooterRefreshingBlock, tableFooterRefreshingBlock);

@property (nonatomic ,assign) CGFloat tableHeight;



CXTableViewModel *CXTableParam(void);




@end

NS_ASSUME_NONNULL_END
