//
//  LayoutBySubject.m
//  InstaKilo
//
//  Created by Anthony Tulai on 2016-01-27.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "LayoutBySubject.h"
#import "Picture.h"

@interface LayoutBySubject ()

@property (strong, nonatomic) Picture *currentPic;
@property (strong, nonatomic) NSMutableArray *allPics;

@end


@implementation LayoutBySubject

-(void) createLayout {
    self.minimumInteritemSpacing = 75;
    self.minimumLineSpacing = 100;
    self.sectionInset = UIEdgeInsetsMake(50, 20, 50, 20);
    self.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 100);
    self.footerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 50);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

-(void) setCurrentPic:(Picture *)currentPic {
    self.currentPic = currentPic;
}

-(void)setAllPics:(NSMutableArray *)allPics {
    for (Picture  *pic in allPics) {
        [self.allPics addObject: pic];
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    UILabel *cellLabel = (UILabel*)[cell viewWithTag:42];
    cellLabel.text = [NSString stringWithFormat:@"%ld, %ld", (long)indexPath.section, (long)indexPath.item];
    
    //Picture *currentPic = self.currentPic;
    //currentPic.bounds = cell.bounds;
    
    //[cell addSubview:currentPic];
    
    
//    switch (indexPath.section) {
//        case 0:
//            cell.backgroundColor = [UIColor blueColor];
//            break;
//        case 1:
//            cell.backgroundColor = [UIColor yellowColor];
//            break;
//        case 2:
//            cell.backgroundColor = [UIColor greenColor];
//        default:
//            break;
//    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeader" forIndexPath:indexPath];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionFooter" forIndexPath:indexPath];
    }
    return nil;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //if (collectionViewLayout == self.bigLayout) {
        return CGSizeMake(150 + indexPath.item*20, 100 + indexPath.item*20);
   // }
//    if (collectionViewLayout == self.smallLayout) {
//        return CGSizeMake(100 + indexPath.item*5, 50 + indexPath.item*5);
//    }
//    
//    return CGSizeZero;
}

@end
