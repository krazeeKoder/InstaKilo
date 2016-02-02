//
//  Picture.m
//  InstaKilo
//
//  Created by Anthony Tulai on 2016-01-27.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "Picture.h"

@implementation Picture


-(instancetype) initWithName:(NSString *)name subject:(NSString *)subject location:(NSString *)location {
    self = [super init];
    if (self) {
        _name = name;
        _subject = subject;
        _location = location;
        _imageView = [UIImageView new];
    }
    return self;
}
@end
