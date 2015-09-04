//
//  AddressButtonView.h
//  OrbisApp
//
//  Created by Kuldeep Saini on 28/08/15.
//  Copyright (c) 2015 bansalOrg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressButtonView : UIControl


@property(nonatomic,strong)UILabel *lblFrom_To;
@property(nonatomic,strong)UILabel *lblHeader;
@property(nonatomic,strong)UILabel *lblDesc;
@property(nonatomic,strong)UIButton *btnBackground;


-(void)designInterfaceWithLocationFrom:(NSString*)path andDesc:(NSString*)desc;

-(void)updateComponentValue:(NSString*)header andDesc:(NSString*)des;

-(void)designButtonWithTitle:(NSString*)title andTime:(NSString*)time;

-(void)setSelectedButton;
-(void)setDeslectedButton;

@end
