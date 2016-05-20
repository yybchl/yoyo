//
//  TextUpViewController.m
//  yoyo
//
//  Created by YoYo on 16/5/12.
//  Copyright © 2016年 cn.yoyoy.mw. All rights reserved.
//
#import "TextUpViewController.h"

@interface TextFieldCell : UITableViewCell

@property (strong, nonatomic) UITextField *textField;

@end
@implementation TextFieldCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textField = [[UITextField alloc] initWithFrame:CGRectOffset(self.contentView.frame, 20, 0)];
        _textField.placeholder = @"输入文字";
        [self.contentView addSubview:_textField];
    }
    return self;
}
@end

@interface TextUpViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation TextUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [NSMutableArray arrayWithObjects:@"1", @"2", nil];
    self.title = @"输入框上移";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = false;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped]; //Grouped类型的，section头部就不会一直停留在最上面
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [_tableView setEditing:YES animated:YES];//列表是否可以编辑
    [self.view addSubview:_tableView];
    //添加回收键盘手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    tap.cancelsTouchesInView = false;
    [self.view addGestureRecognizer:tap];
    //监听键盘出现和消失
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark 回收键盘
-(void)dismiss:(UIGestureRecognizer *)sender {
    [self.view endEditing:YES]; //页面停止编辑
}
#pragma mark 键盘出现
-(void)keyboardWillShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    self.tableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - keyBoardRect.size.height);
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, keyBoardRect.size.height, 0);
}
#pragma mark 键盘消失
-(void)keyboardWillHide:(NSNotification *)note
{
//    self.tableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    self.tableView.contentInset = UIEdgeInsetsZero;
}
#pragma mark 列数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
#pragma mark 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }else if (section == 1) {
        return 14;
    }else {
        return _array.count;
    }
}
#pragma mark 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}
#pragma mark 列表头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}
#pragma mark 列表尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}
#pragma mark 列表头设置成自定义视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 25)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellid";
    TextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.textField.delegate = self;
    }
    if (indexPath.section == 2) {
        cell.textLabel.text = _array[indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section]];
    if (indexPath.section == 2) {
        // 取出要拖动的模型数据
        NSDictionary *dict = _array[indexPath.row];
        //删除之前行的数据
        [_array removeObject:dict];
        // 插入数据到新的位置
        [_array insertObject:dict  atIndex:0];
    }
}
#pragma mark 选择编辑模式，添加模式很少用,默认是删除
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewCellEditingStyleNone;
//}
#pragma mark 排序 当移动了某一行时候会调用
//编辑状态下，只要实现这个方法，就能实现拖动排序
//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
//{
//    // 取出要拖动的模型数据
//    Goods *goods = _goodsAry[sourceIndexPath.row];
//    //删除之前行的数据
//    [_goodsAry removeObject:goods];
//    // 插入数据到新的位置
//    [_goodsAry insertObject:goods atIndex:destinationIndexPath.row];
//}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    textField.text = [self countNumAndChangeformat:textField.text];
}
- (NSString *)countNumAndChangeformat:(NSString *)num
{
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

