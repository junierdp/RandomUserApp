//
//  DetailViewController.h
//  RandomUserApp
//
//  Created by Junier Damian on 12/17/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
    
    @property (weak, nonatomic) IBOutlet UIImageView *userImage;
    @property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
    @property (weak, nonatomic) IBOutlet UILabel *userPhoneLabel;
    @property (weak, nonatomic) IBOutlet UILabel *userCellLabel;
    @property (weak, nonatomic) IBOutlet UILabel *userAddressStreet;
    @property (weak, nonatomic) IBOutlet UILabel *userAddressCity;
    @property (weak, nonatomic) IBOutlet UILabel *userAddressState;
    
    @property (nonatomic, strong) NSObject *userViewModel;

@end

NS_ASSUME_NONNULL_END
