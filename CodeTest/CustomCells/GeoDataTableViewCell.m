//
//  GeoDataTableViewCell.m
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import "GeoDataTableViewCell.h"
#import "Properties.h"

@implementation GeoDataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setUpCell:(Features *)feature {
    Properties *property  = [[Properties alloc]initWithDict:feature.properties];
    self.placeLabel.text = property.place;
    self.typeLabel.text = property.type;
    self.timeLabel.text = property.time;
    self.magnitudeLabel.text = [NSString stringWithFormat:@"Magniture: %@",property.magnitude];
}

@end
