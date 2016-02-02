//
//  LayoutBySubject.h
//  InstaKilo
//
//  Created by Anthony Tulai on 2016-01-27.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Picture.h"

@interface LayoutBySubject : UICollectionViewFlowLayout

-(void) createLayout;

-(void) setCurrentPic:(Picture *)currentPic;

-(void) setAllPics:(NSMutableArray *)allPics;

@property (strong, nonatomic) IBOutlet LayoutBySubject *flowLayout;

@end
