//
//  CupVC.m
//  TilomPhick
//
//  Created by Loulou on 16/7/26.
//  Copyright © 2016年 QXB. All rights reserved.
//

#import "CupVC.h"
#import "HomeVC.h"
@interface CupVC ()
{
    NSArray *items;
    NSMutableDictionary *stateDictionary;
    NSIndexPath *lastIndexPath;
}
@end

@implementation CupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    items = [@"Lunbo Bravo Charlie Delta Echo Foxtrot Golf Hotel India Juliet Kilo Lima Mike November Oscar Papa Romeo Quebec Sierra Tango Uniform Victor Whiskey Xray Yankee Zulu" componentsSeparatedByString:@" "];
    stateDictionary = [NSMutableDictionary dictionary];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //    self.tabBarController.navigationItem.title = @"首页";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = items[indexPath.row];
    
    
    //    单选
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [lastIndexPath row];
    cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    //    多选
    //    BOOL isChecked = ((NSNumber *)stateDictionary[indexPath]).boolValue;
    //    cell.accessoryType = isChecked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger newRow = [indexPath row];
    NSInteger oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
    
    //    单选
    if (newRow != oldRow) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:
                                    indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:
                                    lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = indexPath;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //    多选
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    BOOL isChecked = !((NSNumber *)stateDictionary[indexPath]).boolValue;
    //    stateDictionary[indexPath] = @(isChecked);
    //    cell.accessoryType = isChecked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    
    HomeVC *vc = [[HomeVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
@end
