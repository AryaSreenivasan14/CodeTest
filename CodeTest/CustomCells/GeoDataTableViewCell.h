//
//  GeoDataTableViewCell.h
//  CodeTest
//
//  Created by Promptchu Pty Ltd on 3/12/19.
//

#import <UIKit/UIKit.h>
#import "Features.h"



@interface GeoDataTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *magnitudeLabel;
- (void)setUpCell:(Features *)feature;

@end
