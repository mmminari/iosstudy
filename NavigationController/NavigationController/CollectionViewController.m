//
//  CollectionViewController.m
//  NavigationController
//
//  Created by 김민아 on 2016. 5. 9..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import "CollectionViewController.h"
#import "ShowImageView.h"
#import "ButtonView.h"
#import "LabelView.h"
#import "SwitchView.h"

@interface CollectionViewController ()

@property (weak,nonatomic) NSArray *arr;
@property (strong, nonatomic) CollectionCell *cCell;
@property (strong, nonatomic) ShowImageView *imageVC;
@property (strong, nonatomic) ButtonView *buttonVC;
@property (strong, nonatomic) LabelView *labelVC;
@property (strong, nonatomic) SwitchView *swithVC;





@end

@implementation CollectionViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.buttonVC = [[ButtonView alloc]init];
    self.imageVC = [[ShowImageView alloc]init];


}


                         
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height-64.0f;
    
    return CGSizeMake(width, height);
    
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellId = @"collectionCell";
    
    CollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellId
                                                                                forIndexPath:indexPath];
    
    if(indexPath.item == 0)
    {
        cell.colorView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:self.imageVC.ShowImageView];

        

    }
    if(indexPath.item == 1)
    {
        cell.colorView.backgroundColor = [UIColor purpleColor];
    }
    if(indexPath.item == 2)
    {
        cell.colorView.backgroundColor = [UIColor brownColor];

    }
    if(indexPath.item == 3)
    {
        cell.colorView.backgroundColor = [UIColor magentaColor];
    }

  
    
    
    return cell;
}


@end