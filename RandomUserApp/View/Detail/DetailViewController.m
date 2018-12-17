//
//  DetailViewController.m
//  RandomUserApp
//
//  Created by Junier Damian on 12/17/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
    
    @synthesize userViewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_userImage sd_setImageWithURL:[NSURL URLWithString: userViewModel.largeImageURL]];
    _userNameLabel.text = userViewModel.name;
    _userPhoneLabel.text = userViewModel.phone;
    _userCellLabel.text = userViewModel.cell;
    _userAddressStreet.text = userViewModel.street;
    _userAddressCity.text = userViewModel.city;
    _userAddressState.text = userViewModel.state;
}

@end
