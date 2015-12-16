//
//  HMViewController.m
//  06-画板
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"

#import "MBProgressHUD+MJ.h"

#import "HMPaintView.h"

#import "HMHandleImageView.h"

@interface HMViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet HMPaintView *paintView;

@end

@implementation HMViewController

#warning 保存
- (IBAction)save:(id)sender {
    // 把画板截屏
    
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(_paintView.bounds.size, NO, 0.0);
    
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 把画板上的内容渲染到上下文
    [_paintView.layer renderInContext:ctx];
    
    // 获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 保存到用户的相册里面
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

// 保存相册后回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) { // 保存失败
        
        [MBProgressHUD showError:@"保存失败"];
        
    }else{ // 保存成功
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}

#pragma mark - 选择照片
- (IBAction)selectedPicture:(id)sender {
    
    // 去用户的相册
    // 照片选择器
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    // 数据源
    picker.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // 设置delegate
    picker.delegate = self;
    
    // 展示照片选择器
    [self presentViewController:picker animated:YES completion:nil];
}

// 选中照片的时候调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 获取选中图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // 创建处理图片的view
    HMHandleImageView *handleView = [[HMHandleImageView alloc] initWithFrame:self.paintView.frame];
    
    // 定义block:相当于自己的小弟，到时候直接吩咐做事
    handleView.block = ^(UIImage *image){
        
        _paintView.image = image;
    };
    
    handleView.image = image;
    
    [self.view addSubview:handleView];
    
    // 取消Modal
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark 橡皮擦
- (IBAction)eraser:(id)sender {
    
    _paintView.color = [UIColor whiteColor];
}

#pragma mark 撤销
- (IBAction)undo:(id)sender {
    [_paintView undo];
}

#pragma mark 清屏
- (IBAction)clearScreen:(id)sender {
    [_paintView clearScreen];
}


#pragma mark 颜色选择
- (IBAction)colorClick:(UIButton *)sender {
    
    _paintView.color = sender.backgroundColor;
}

#pragma mark 监听滑块的值
- (IBAction)valueChange:(UISlider *)sender {
    _paintView.width = sender.value;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
