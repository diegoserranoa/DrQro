//
//  DoctoresTableViewCell.m
//  DrQro
//
//  Created by Diego Serrano on 10/20/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "DoctoresTableViewCell.h"

@implementation DoctoresTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
