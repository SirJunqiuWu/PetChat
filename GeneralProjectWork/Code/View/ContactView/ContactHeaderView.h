//
//  ContactHeaderView.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/5/18.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContactHeaderViewDelegate <NSObject>

@optional

- (void)changeCategoryWithIndex:(NSInteger)index;

@end

@interface ContactHeaderView : UIView
@property(nonatomic,assign)id<ContactHeaderViewDelegate>delegate;

@end
