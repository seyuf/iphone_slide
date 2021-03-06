//
//  PictureViewController.m
//  Xproj
//
//  Created by Etudiant on 10/04/2014.
//  Copyright (c) 2014 Etudiant. All rights reserved.
//

#import "PictureViewController.h"
#import "ReaderView.h"

@interface PictureViewController () <ReaderViewDelegate>
@property (weak, nonatomic) IBOutlet ReaderView *readerView;
@property (strong, nonatomic) NSArray * pictures;

@end

@implementation PictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

-(long) numberOfPages
{
    return self.pictures.count;
}

-(UIView *) pageAtIndex:(int)index
{
    //NSString *imageName = [NSString stringWithFormat:@"00%i.jpeg",index];
    //UIImage * image= [UIImage imageNamed:imageName];
    
    
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = self.readerView.bounds;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    self.title = @"chargement...";
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        FlickrPicture * picture = self.pictures[index];
        NSData * imageData =  [NSData dataWithContentsOfURL:picture.url];
        dispatch_sync( dispatch_get_main_queue(), ^{
            imageView.image=  [UIImage imageWithData:imageData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            self.title = picture.title;
        });
    });
    
       return imageView;

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    for (UIActivityIndicatorView * spinner in self.view.subviews) {
        spinner.center = self.view.center;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.readerView.delegate = self;
    
    UIActivityIndicatorView * indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.backgroundColor = [UIColor blackColor];
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        self.pictures = [FlickrPicture picturesAroundLocation:self.location];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.readerView.delegate = self;
            [self.readerView displayPageAtIndex:0 animated:YES];
            [indicator stopAnimating];
        });
        

    });
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
