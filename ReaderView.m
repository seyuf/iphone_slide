//
//  ReaderView.m
//  Xproj
//
//  Created by Etudiant on 10/04/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import "ReaderView.h"
@interface ReaderView()
@property (nonatomic, assign) int currentPage;
@end
@implementation ReaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) displayPageAtIndex:(int)index animated:(BOOL) animated
{
    if (index >= 0 && index < [self.delegate numberOfPages])
    {
        
        [self.subviews.lastObject removeFromSuperview];
  
        UIView * view = [self.delegate pageAtIndex:index];
        [self addSubview:view];
        self.currentPage  = index;
    }
}

-(void) previousPage{
    [self displayPageAtIndex:self.currentPage - 1 animated:YES];
    
}

-(void) nextPage{
    [self displayPageAtIndex:self.currentPage + 1 animated:YES];
}

-(void)layoutSubviews
{
    if (!self.gestureRecognizers.count) {
        
        UISwipeGestureRecognizer * previousPageReconizer =
        [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previousPage)];
        
        previousPageReconizer.direction =
        UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:previousPageReconizer];
        
        UISwipeGestureRecognizer * nextPageReconizer =
        [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextPage)];
        
        nextPageReconizer.direction=
        UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:nextPageReconizer];
        
        self.userInteractionEnabled = YES;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
