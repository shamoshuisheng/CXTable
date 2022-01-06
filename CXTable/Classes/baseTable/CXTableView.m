//
//  CXBaseTableView.m
//
//

#import "CXTableView.h"

#define CXWeakSelf(type)  __weak typeof(type) weak##type = type;

@interface CXTableView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tb;


@end
@implementation CXTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
       
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    
    
 
    return self;
}

-(void)layoutSubviews{
    self.tb.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}



#pragma mark ==========tableview==========
-(UITableView *)tb{
    if (_tb==nil) {
        if (self.param.cellNameArray.count == 0) {
            return nil;
        }
        _tb = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 150) style:self.param.tableViewStyle];
        _tb.delegate = self;
        _tb.dataSource = self;
        _tb.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tb.backgroundColor = [UIColor clearColor];
        _tb.showsVerticalScrollIndicator = NO;
        _tb.showsHorizontalScrollIndicator = NO;
    
        _tb.estimatedSectionFooterHeight = 0.0;
        _tb.estimatedSectionHeaderHeight = 0.0;

    //        if (@available(iOS 11.0, *))
    //        {
    //            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    //        } else {
    //            // 针对 11.0 以下的iOS系统进行处理
    //            // 不要自动调整inset
    //            UIViewController *vc = target;
    //            vc.automaticallyAdjustsScrollViewInsets = NO;
    //        }
        
        
        
        if (@available(iOS 15.0, *)) {
            _tb.sectionHeaderTopPadding = 0;
        }
        
        
        for (int i = 0; i < self.param.cellNameArray.count; i ++ ) {
            NSString *cellName = self.param.cellNameArray[i];
            NSString *path = [[NSBundle mainBundle] pathForResource:cellName ofType:@"nib"];
            if (path != nil) {
                //没有xib文件
                [_tb registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
            }else{
                [_tb registerClass:NSClassFromString(cellName) forCellReuseIdentifier:cellName];
            }
            
        }
        
        _tb.bounces = self.param.bounces;
        _tb.scrollEnabled = self.param.allowScroll;
    }
    return _tb;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    id model = self.param.dataSource.firstObject;
    if ([model isKindOfClass:[NSArray class]]) {
        return self.param.dataSource.count;
    }else{
        return 1;
    }
   
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id model = self.param.dataSource.firstObject;
    if ([model isKindOfClass:[NSArray class]]) {
        NSArray *arr = self.param.dataSource[section];
        return arr.count;
        
    }else{
        return self.param.dataSource.count;
    }
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     return self.param.tableCellCallBlock(indexPath, tableView);
}


#pragma mark ----行高----
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.param.tableCellHeightBlock) {

        CGFloat height = 0;
        if (self.param.tableCellHeightBlock) {
            height = self.param.tableCellHeightBlock(indexPath, tableView);
        }

        return height;
    }else{
        return UITableViewAutomaticDimension;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}




#pragma mark ----head----

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.param.tableHeaderCallBlock) {
        return self.param.tableHeaderCallBlock(section, tableView);
    }else{
        return nil;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    CGFloat height = 0.01;
    if (self.param.tableHeaderHeightBlock) {
        
     height = self.param.tableHeaderHeightBlock(section, tableView);
    }

    
    return height;
}


#pragma mark ----footer----
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if (self.param.tableFooterCallBlock) {
        return self.param.tableFooterCallBlock(section, tableView);
    }else{
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height = 0.01;
    if (self.param.tableFooterHeightBlock) {
        height =  self.param.tableFooterHeightBlock(section, tableView);
    }
    
    return height;
}

#pragma mark ===========点击事件===============
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cxTableView:didSelectRowAtIndexPath:)]) {
        [self.delegate cxTableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

-(void)reloadDate{
    [self.tb reloadData];
}

-(void)selectRowAtIndexPath:(NSIndexPath *)indexPath scrollPosition:(UITableViewScrollPosition)scrollPosition{
    [self.tb selectRowAtIndexPath:indexPath animated:YES scrollPosition:scrollPosition];
}


#pragma mark ===========数据加载===============
-(void)setParam:(CXTableViewModel *)param{
    _param = param;
    
    [self addSubview:self.tb];
    
//    self.tableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if (_param.allowRefresh) {
        [self addRefresh];
    }
    
    if (_param.showEmpty) {
        [self setUpEmptyView];
    }
}

#pragma mark ===EmptyView===
-(void)setUpEmptyView
{
    LYEmptyView *emptyView = [LYEmptyView emptyViewWithImageStr:self.param.emptyImageName?:@"empty_page" titleStr:nil detailStr:self.param.emptyTitleName?:@"暂无可用记录噢~"];
    
    emptyView.subViewMargin = 30.f;
    
    emptyView.contentViewOffset = -100;
    emptyView.imageSize = (self.param.emptyImageSize.height != 0)?self.param.emptyImageSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 100, [UIScreen mainScreen].bounds.size.width - 100);
    self.tb.ly_emptyView = emptyView;
}




#pragma mark ===========添加刷新控件===============
-(void)addRefresh
{
    CXWeakSelf(self);


    self.tb.mj_header.automaticallyChangeAlpha = YES;

    self.tb.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakself.tb.mj_footer.hidden = YES;
        if (self.param.tableHeaderRefreshingBlock) {
            self.param.tableHeaderRefreshingBlock(self);
            
        }
    }];
//    [self.tableView.mj_header beginRefreshing];

    //追加尾部刷新
    self.tb.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
    
        if (self.param.tableFooterRefreshingBlock) {
            self.param.tableFooterRefreshingBlock(self);
        }

    }];
    self.tb.mj_footer.hidden = YES;
    
}
#pragma mark ===停止刷新===
-(void)stopRefreshing{
    [self.tb.mj_header endRefreshing];
    [self.tb.mj_footer endRefreshing];
}
#pragma mark ===开始刷新===
-(void)beginRefreshing{
    [self.tb.mj_header beginRefreshing];
    self.tb.mj_footer.hidden = YES;
    
}
#pragma mark ===显示无更多数据状态===
-(void)endRefreshingWithNoMoreData{
    [self.tb.mj_footer endRefreshingWithNoMoreData];
}
#pragma mark ===隐藏footer刷新===
-(void)hiddenFooterRefreshing:(BOOL)hidden{
    [self.tb.mj_footer setHidden:hidden];
}
#pragma mark ===隐藏header刷新===
-(void)hiddenHeaderRefreshing:(BOOL)hidden{
    [self.tb.mj_header setHidden:hidden];
}





@end
