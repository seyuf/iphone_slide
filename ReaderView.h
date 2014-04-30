//
//  ReaderView.h
//  Xproj
//
//  Created by Etudiant on 10/04/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ReaderViewDelegate <NSObject>
-(long) numberOfPages;
-(UIView *) pageAtIndex:(int)index;
@end

@interface ReaderView : UIView
@property (nonatomic,weak) id<ReaderViewDelegate> delegate;
-(void) displayPageAtIndex:(int)index animated:(BOOL)animated;

@end
