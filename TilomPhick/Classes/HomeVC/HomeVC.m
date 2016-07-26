//
//  HomeVC.m
//  TilomPhick
//
//  Created by Loulou on 16/7/22.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "HomeVC.h"
#import "SDCycleScrollView.h"
#import "HttpTool.h"
#import "HomeModel.h"

@interface HomeVC ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataSlideArray;
@property (nonatomic, strong) SDCycleScrollView *cycleScorllView;
@property (strong,nonatomic) HomeModel *data;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    [self addSDCycleView];
//     [self showNoMoreData];
//    RTSpinKitView *spinner = [[RTSpinKitView alloc] initWithStyle:RTSpinKitViewStyleWave];
//    [self.tableView addSubview:spinner];
    
    
    [self showLoadingAnimation];
   }

- (void)viewWillAppear:(BOOL)animated{
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
    [super viewWillAppear:animated];
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (void)addSDCycleView{

    // 创建轮播图
    CGFloat cycleX = 0;
    CGFloat cycleY = 64;
    CGFloat cycleW = SCREEN_WIDTH;
    CGFloat cycleH = SCREEN_HEIGHT * 0.25;
    CGRect rect = CGRectMake(cycleX, cycleY, cycleW, cycleH);
    
    SDCycleScrollView *cycleScorllView = [SDCycleScrollView cycleScrollViewWithFrame:rect delegate:self placeholderImage:[UIImage imageNamed:@"loginBackground.jpg"]];
    [self.view addSubview:cycleScorllView];
    self.cycleScorllView = cycleScorllView;
    [self.dataSlideArray addObject:@"http://img4.shougongke.com//Public//data//version//201607//146917284186354.jpg"];
    [self.dataSlideArray addObject:@"http://img4.shougongke.com//Public//data//version//201607//146917284186354.jpg"];
    [self.dataSlideArray addObject:@"http://img4.shougongke.com//Public//data//version//201607//146917284186354.jpg"];
    self.cycleScorllView.imageURLStringsGroup = self.dataSlideArray;
}

#pragma mark - 懒加载
- (NSMutableArray *)dataSlideArray
{
    if (!_dataSlideArray) {
        
        _dataSlideArray = [[NSMutableArray alloc] init];
    }
    return _dataSlideArray;
}

@end
