//
//  Picture.h
//  InstaKilo
//
//  Created by Anthony Tulai on 2016-01-27.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Picture : NSObject

@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) UIImageView *imageView;

-(instancetype) initWithName:(NSString *)name subject:(NSString *)subject location:(NSString *)location;

@end
