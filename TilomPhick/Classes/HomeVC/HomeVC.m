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
#import "EqualWidthButtonCell.h"
#import "EqualWidthButtonCell2.h"

@interface HomeVC ()<SDCycleScrollViewDelegate>
{
    UIImageView *_barImage;

}
@property (nonatomic, strong) NSMutableArray *dataSlideArray;
@property (nonatomic, strong) SDCycleScrollView *cycleScorllView;
@property (strong,nonatomic) HomeModel *data;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[EqualWidthButtonCell2 class] forCellReuseIdentifier:@"EqualWidthButtonCell2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"EqualWidthButtonCell" bundle:nil] forCellReuseIdentifier:@"EqualWidthButtonCell"];
    self.tableView.rowHeight = RC_Y(150);
    [self addSDCycleView];

    self.title = @"轮播";
    [self messageBar];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    EqualWidthButtonCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"EqualWidthButtonCell2"];
    cell.clickButtonBlock = ^(UIButton *sender, NSInteger tag){
        NSLog(@"%@-----%ld",sender.titleLabel.text, tag);
    };
    return cell;
}
#pragma mark - Customer Methods
- (void)messageBar
{
    _barImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tixing_xiaoxi"] ];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickMessage)];
    [_barImage addGestureRecognizer:tap];
    
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithCustomView:_barImage];
    
    [self rdv_tabBarController].navigationItem.rightBarButtonItem = bar;
}

- (void)clickMessage{
    NSLog(@"message");
}

- (void)addSDCycleView{

    // 创建轮播图
    CGFloat cycleX = 0;
    CGFloat cycleY = 0;
    CGFloat cycleW = SCREEN_WIDTH;
    CGFloat cycleH = SCREEN_HEIGHT * 0.25;
    CGRect rect = CGRectMake(cycleX, cycleY, cycleW, cycleH);
    
    SDCycleScrollView *cycleScorllView = [SDCycleScrollView cycleScrollViewWithFrame:rect delegate:self placeholderImage:[UIImage imageNamed:@"loginBackground.jpg"]];
    self.tableView.tableHeaderView = cycleScorllView;
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
