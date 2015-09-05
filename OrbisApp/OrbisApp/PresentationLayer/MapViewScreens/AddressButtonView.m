//
//  AddressButtonView.m
//  OrbisApp
//
//  Created by Kuldeep Saini on 28/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import "AddressButtonView.h"

@implementation AddressButtonView
@synthesize lblHeader,lblDesc,lblFrom_To,btnBackground;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


-(void)designInterfaceWithLocationFrom:(NSString*)path andDesc:(NSString*)desc
{
    CGFloat yPos = 5;
    
    lblFrom_To = [[UILabel alloc] initWithFrame:CGRectMake(0, yPos, CGRectGetWidth(self.frame), 20)];
    lblFrom_To.text = [path uppercaseString];
    lblFrom_To.textAlignment = NSTextAlignmentCenter;
    lblFrom_To.font =FONT_TitilliumWeb_SemiBold(14.0);
    lblFrom_To.textColor = APP_TEXT_COLOR;
    lblFrom_To.backgroundColor = [UIColor clearColor];
    [self addSubview:lblFrom_To];
    
    yPos+=lblFrom_To.frame.size.height;
    
    lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(5, yPos, CGRectGetWidth(self.frame)-10, 20)];
    lblHeader.text = @"";
    lblHeader.textAlignment = NSTextAlignmentCenter;
    lblHeader.font =FONT_TitilliumWeb_SemiBold(12.0);
    lblHeader.textColor = APP_TEXT_COLOR;
    lblHeader.backgroundColor = [UIColor clearColor];
    [self addSubview:lblHeader];

    yPos+=lblHeader.frame.size.height;
    
    lblDesc = [[UILabel alloc] initWithFrame:CGRectMake(10, yPos, CGRectGetWidth(self.frame)-25, 40)];
    lblDesc.text = desc;
    lblDesc.numberOfLines = 2;
    lblDesc.textAlignment = NSTextAlignmentCenter;
    lblDesc.font =FONT_TitilliumWeb_Regular(12.0);
    lblDesc.textColor = APP_TEXT_COLOR;
    lblDesc.backgroundColor = [UIColor clearColor];
    [self addSubview:lblDesc];

}


-(void)updateComponentValue:(NSString*)header andDesc:(NSString*)des
{
    lblHeader.text = header;
    lblDesc.text = des;
    

}



-(void)designButtonWithTitle:(NSString*)title andTime:(NSString*)time
{
    CGFloat yPos = 0;

    btnBackground = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBackground setFrame:self.bounds];
    [btnBackground setBackgroundImage:nil forState:UIControlStateNormal];
    [btnBackground setBackgroundImage:[UIImage imageNamed:@"maptabs"] forState:UIControlStateSelected];
    [self addSubview:btnBackground];
    
    lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, yPos, CGRectGetWidth(self.frame)-30, 40)];
    lblHeader.text = title;
    lblHeader.textAlignment = NSTextAlignmentCenter;
    lblHeader.userInteractionEnabled = YES;
    lblHeader.font =FONT_TitilliumWeb_Regular(12.0);
    lblHeader.textColor = APP_TEXT_COLOR;
    lblHeader.backgroundColor = [UIColor clearColor];
    [self addSubview:lblHeader];
    
    lblDesc = [[UILabel alloc] initWithFrame:CGRectMake(lblHeader.frame.size.width, yPos, 30, 40)];
    lblDesc.text = time;
    lblDesc.numberOfLines = 0;
    lblDesc.userInteractionEnabled = YES;
    lblDesc.textAlignment = NSTextAlignmentCenter;
    lblDesc.font =FONT_TitilliumWeb_Regular(8.0);
    lblDesc.textColor = APP_TEXT_COLOR;
    lblDesc.backgroundColor = [UIColor clearColor];
    lblDesc.textColor = [UIColor redColor];
    [self addSubview:lblDesc];
}


-(void)setSelectedButton{
    btnBackground.selected = YES;
}

-(void)setDeslectedButton{
    btnBackground.selected = NO;
}


@end
