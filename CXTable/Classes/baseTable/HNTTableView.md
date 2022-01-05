- (void)viewDidLoad
{
    [super viewDidLoad];
    
       NSArray *a = [self loadData];
    
//    self.param = [[CXTableViewModel alloc]init];
//    self.param.cellName = NSStringFromClass([CXCommonCell2 class]);;
//    self.param.cellCallBlock = ^UITableViewCell *(NSIndexPath * _Nonnull indexPath, UITableView * _Nonnull tableView, id  _Nonnull model) {
//        CXCommonCell2 *cell = (CXCommonCell2 *)[tableView dequeueReusableCellWithIdentifier:@"CXCommonCell2"];
//        if (cell == nil) {
//            cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([cell class]) owner:self options:nil].firstObject;
//        }
//        return cell;
//    };
//    self.param.headerCallBlock = ^UIView *(NSInteger section, UITableView * _Nonnull tableView, id  _Nonnull model) {
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
//        if (section %2  == 0) {
//            view.backgroundColor = [UIColor redColor];
//        }else{
//            view.backgroundColor = [UIColor blueColor];
//        }
//
//        return view;
//    };
//    self.param.allowRefresh = NO;
//    self.param.cellHeightBlock = ^CGFloat(NSIndexPath * _Nonnull indexPath, UITableView * _Nonnull tableView, id  _Nonnull model) {
//        return 100;
//    };
////    self.param.headerHeightBlock = ^CGFloat(NSInteger section, UITableView * _Nonnull tableView) {
////        return 50;
////    };
////    self.param.footerHeightBlock = ^CGFloat(NSInteger section, UITableView * _Nonnull tableView) {
////        return 0;
////    };
//    self.param.allowRefresh = YES;
//    self.param.headerWithRefreshingBlock = ^(CXTableView *tableView) {
//        [tableView stopRefreshing];
//        NSLog(@"刷新结束");
//    };
//    self.param.allowScroll = YES;
//    self.param.dataSource = a;
//
    self.param =
    Param()
    .cellNameSet(NSStringFromClass([CXCommonCell2 class]))
    .cellCallBlockSet(^UITableViewCell *(NSIndexPath * _Nonnull indexPath, UITableView * _Nonnull tableView, id  _Nonnull model) {
        CXCommonCell2 *cell = (CXCommonCell2 *)[tableView dequeueReusableCellWithIdentifier:@"CXCommonCell2"];
        if (cell == nil) {
            cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([cell class]) owner:self options:nil].firstObject;
        }
        return cell;
    })
    .cellHeightBlockSet(^CGFloat(NSIndexPath * _Nonnull indexPath, UITableView * _Nonnull tableView, id  _Nonnull model) {
        return 100;
    })
    .headerCallBlockSet(^UIView *(NSInteger section, UITableView * _Nonnull tableView, id  _Nonnull model) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        if (section %2  == 0) {
            view.backgroundColor = [UIColor redColor];
        }else{
            view.backgroundColor = [UIColor blueColor];
        }

        return view;
    })
    .headerHeightBlockSet(^CGFloat(NSInteger section, UITableView * _Nonnull tableView) {
                return 50;
       })
    .allowScrollSet(YES)
    .allowRefreshSet(YES)
    .headerWithRefreshingBlockSet(^(CXTableView *tableView) {
        [tableView stopRefreshing];
        NSLog(@"刷新结束");
    })
    .dataSourceSet(a)
    ;
    
    
    
    
    self.tableView.param = self.param;
   
    
    [self.view addSubview:self.tableView];
    
    
}

-(CXTableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[CXTableView alloc]initWithFrame:CGRectMake(0, 88, CXScreenWidth, CXScreenHeight-88)];
    }
    _tableView.delegate = self;
    return _tableView;
}


-(void)baseTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了---%ld",indexPath.row);
}


-(NSArray *)loadData{
    
    return @[@[@{@"name":@"1"},@{@"name":@"1"}],@[@{@"name":@"2"},@{@"name":@"1"}],@[@{@"name":@"3"},@{@"name":@"1"},@{@"name":@"1"}],@[@{@"name":@"4"},@{@"name":@"1"}],@[@{@"name":@"5"}],@[@{@"name":@"6"}],@[@{@"name":@"7"},@{@"name":@"1"}],@[@{@"name":@"8"}],@[@{@"name":@"9"}],@[@{@"name":@"1"}],@[@{@"name":@"1"},@{@"name":@"1"}]];
    
    
    
}
