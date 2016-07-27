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
#import "QlCreateAlertView.h"
#import "JFHomeMenuCell.h"
#import "GetPlistArray.h"
@interface HomeVC ()<SDCycleScrollViewDelegate, QlCreatePopViewDelegate, JFHomeMenuCellDelegate>
{
    UIImageView *_barImage;

}
@property (nonatomic, strong) NSMutableArray *dataSlideArray;
@property (nonatomic, strong) SDCycleScrollView *cycleScorllView;
@property (nonatomic, strong) HomeModel *data;
@property (nonatomic, strong) QlCreateAlertView *rightView;
@property (nonatomic, strong) NSArray *menuArray;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[EqualWidthButtonCell2 class] forCellReuseIdentifier:@"EqualWidthButtonCell2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"EqualWidthButtonCell" bundle:nil] forCellReuseIdentifier:@"EqualWidthButtonCell"];
    [self.tableView registerClass:[JFHomeMenuCell class] forCellReuseIdentifier:@"JFHomeMenuCell"];
    [self addSDCycleView];

    self.title = @"轮播";
    [self messageBar];
    self.menuArray =  [GetPlistArray arrayWithString:@"menuData.plist"];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.rdv_tabBarController setTabBarHidden:NO animated:NO];
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        JFHomeMenuCell *cell = [JFHomeMenuCell cellWithTableView:tableView menuArray:self.menuArray];
        cell.delegate = self;
        return cell;
    }else {
        EqualWidthButtonCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"EqualWidthButtonCell2"];
        cell.clickButtonBlock = ^(UIButton *sender, NSInteger tag){
            NSLog(@"%@-----%ld",sender.titleLabel.text, tag);
        };
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            return 180;
        }
            break;
        case 1:{
            return RC_Y(150);
        }break;
        default:
            break;
    }
    return 0;
}
#pragma mark - Customer Methods
- (void)messageBar
{
    _barImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tixing_xiaoxi"] ];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickMessage:)];
    [_barImage addGestureRecognizer:tap];
    
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithCustomView:_barImage];
    
    [self rdv_tabBarController].navigationItem.rightBarButtonItem = bar;
}

- (void)clickMessage:(UIImageView *)sender{
    CGFloat width = RC_X(182);
    CGFloat height = 14;
//    CGFloat x = sender.x - RC_X(170) + RC_X(20);
    CGFloat x = RC_X(250);
    
    self.rightView = [[QlCreateAlertView alloc] initWithNameArray:@[@"消息",@"新增楼盘",@"我的发布楼盘",@"我的精耕楼盘"] andMenuOrigin:CGPointMake(x, 64) andMenuWidth:width andHeight:height andLayer:0 andTableViewBackGroundColor:[UIColor whiteColor] andIsSharp:false andType:ksortPop redrawSharp:nil];
    self.rightView.tableViewDelegate = self;
    WEAK_SELF
    self.rightView.dismiss = ^{
        
        [wself.rightView removeFromSuperview];
        wself.rightView = nil;
    };
    [self.view addSubview:self.rightView];
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
