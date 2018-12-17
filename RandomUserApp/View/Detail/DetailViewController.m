//
//  DetailViewController.m
//  RandomUserApp
//
//  Created by Junier Damian on 12/17/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

#import "DetailViewController.h"
#import <RandomUserApp-Swift.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

    @synthesize userViewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_userImage sd_setImageWithURL:[NSURL URLWithString: ((UserViewModel *)userViewModel).largeImageURL]];
    _userNameLabel.text = ((UserViewModel *)userViewModel).name;
    _userPhoneLabel.text = ((UserViewModel *)userViewModel).phone;
    _userCellLabel.text = ((UserViewModel *)userViewModel).cell;
    _userAddressStreet.text = ((UserViewModel *)userViewModel).street;
    _userAddressCity.text = ((UserViewModel *)userViewModel).city;
    _userAddressState.text = ((UserViewModel *)userViewModel).state;
}

@end
