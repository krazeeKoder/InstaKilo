//
//  CollectionViewController.m
//  InstaKilo
//
//  Created by Anthony Tulai on 2016-01-27.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "CollectionViewController.h"
#import "LayoutBySubject.h"
#import "LayoutByLocation.h"
#import "Picture.h"
#import "CollectionViewCell.h"
#import "CollectionReusableView.h"


@interface CollectionViewController ()

@property (strong, nonatomic) NSMutableArray *allPictures;
@property (strong, nonatomic) LayoutBySubject *layoutBySubject;
@property (strong, nonatomic) NSMutableSet *allSubjects;
@property (strong, nonatomic) NSMutableSet *allLocations;
@property (strong, nonatomic) NSMutableArray *allPicturesBySubject;
@property (strong, nonatomic) NSMutableArray *allPicturesByLocation;
@property (assign) bool sortMethod;
//@property (strong, nonatomic)


@end


@implementation CollectionViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.sortMethod = YES;
    self.allPictures = [NSMutableArray new];
    self.allPicturesBySubject = [NSMutableArray new];
    self.allPicturesByLocation = [NSMutableArray new];
    self.allSubjects = [NSMutableSet new];
    self.allLocations = [NSMutableSet new];
    [self loadImages];
    [self arrangeImagesBySubject];
    [self arrangeImagesByLocation];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Switch Sort" style:UIBarButtonItemStylePlain target:self action:@selector(switchSortMethod)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)arrangeImagesBySubject{
    //NSMutableSet *subjectNames = [NSMutableSet new];
    for (Picture *pic in self.allPictures) {
        [self.allSubjects addObject:pic.subject];
    }
    
    for (NSString *subjectName in self.allSubjects) {
        NSMutableArray *tempArray = [NSMutableArray new];
        for (Picture *pic in self.allPictures) {
            if ([pic.subject isEqualToString:subjectName]) {
                [tempArray addObject:pic];
            }
        }
        [self.allPicturesBySubject addObject:tempArray];
    }
}

-(void)arrangeImagesByLocation{
    for (Picture *pic in self.allPictures) {
        [self.allLocations addObject:pic.location];
    }
    
    for (NSString *locationName in self.allLocations) {
        NSMutableArray *tempArray = [NSMutableArray new];
        for (Picture *pic in self.allPictures) {
            if ([pic.location isEqualToString:locationName]) {
                [tempArray addObject:pic];
            }
        }
        [self.allPicturesByLocation addObject:tempArray];
    }

}

-(void)switchSortMethod{
    
    self.sortMethod = !self.sortMethod;
    [self.collectionView reloadData];
}
-(void)loadImages{
    
    Picture *pic1 = [[Picture alloc] initWithName:@"pic1.jpg" subject:@"fun" location:@"Canada"];
    pic1.imageView.image = [UIImage imageNamed:pic1.name];
    [self.allPictures addObject:pic1];
    
    Picture *pic2 = [[Picture alloc] initWithName:@"pic2.jpg" subject:@"fun" location:@"Mexico"];
    pic2.imageView.image = [UIImage imageNamed:pic2.name];
    [self.allPictures addObject:pic2];
    
    Picture *pic3 = [[Picture alloc] initWithName:@"pic3.jpg" subject:@"fun" location:@"America"];
    pic3.imageView.image = [UIImage imageNamed:pic3.name];
    [self.allPictures addObject:pic3];
    
    Picture *pic4 = [[Picture alloc] initWithName:@"pic4.jpg" subject:@"family" location:@"Canada"];
    pic4.imageView.image = [UIImage imageNamed:pic4.name];
    [self.allPictures addObject:pic4];
    
    Picture *pic5 = [[Picture alloc] initWithName:@"pic5.jpg" subject:@"family" location:@"Mexico"];
    pic5.imageView.image = [UIImage imageNamed:pic5.name];
    [self.allPictures addObject:pic5];
    
    Picture *pic6 = [[Picture alloc] initWithName:@"pic6.jpg" subject:@"family" location:@"America"];
    pic6.imageView.image = [UIImage imageNamed:pic6.name];
    [self.allPictures addObject:pic6];
    
    Picture *pic7 = [[Picture alloc] initWithName:@"pic7.jpg" subject:@"work" location:@"Canada"];
    pic7.imageView.image = [UIImage imageNamed:pic7.name];
    [self.allPictures addObject:pic7];
    
    Picture *pic8 = [[Picture alloc] initWithName:@"pic8.jpg" subject:@"work" location:@"Mexico"];
    pic8.imageView.image = [UIImage imageNamed:pic8.name];
    [self.allPictures addObject:pic8];
    
    Picture *pic9 = [[Picture alloc] initWithName:@"pic9.jpg" subject:@"work" location:@"America"];
    pic9.imageView.image = [UIImage imageNamed:pic9.name];
    [self.allPictures addObject:pic9];
    
    Picture *pic10 = [[Picture alloc] initWithName:@"pic10.jpg" subject:@"work" location:@"Canada"];
    pic10.imageView.image = [UIImage imageNamed:pic10.name];
    [self.allPictures addObject:pic10];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    //NSLog(@"%lu",[self.allPictures count]);
    
    if (self.sortMethod) {
    return [self.allPicturesBySubject[section] count];
    }
    return [self.allPicturesByLocation[section] count];
    
    
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *currentArray = [NSMutableArray new];
    if (self.sortMethod) {
    currentArray = self.allPicturesBySubject[indexPath.section];
    } else {
        currentArray = self.allPicturesByLocation[indexPath.section];
    }
    Picture *currentPic = currentArray[indexPath.row];
    
    CollectionViewCell *currentCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    currentCell.imageView.image = currentPic.imageView.image;

    currentCell.backgroundColor = [UIColor purpleColor];

    return currentCell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        CollectionReusableView *currentView =
        [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeader" forIndexPath:indexPath];
        
        Picture *tempPic = [Picture new];
        tempPic = self.allPicturesBySubject[indexPath.section][0];
        
        currentView.sectionTitle.text =tempPic.subject;
        
        return currentView;
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionFooter" forIndexPath:indexPath];
    }
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.sortMethod) {
    return [self.allPicturesBySubject count];
    }
    else {
        return [self.allPicturesByLocation count];
    }
}


@end
