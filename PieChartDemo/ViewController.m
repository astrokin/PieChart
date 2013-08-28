//
//  ViewController.m
//  PieChartViewDemo
//
//  Created by Strokin Alexey on 8/27/13.
//  Copyright (c) 2013 Strokin Alexey. All rights reserved.
//

#import "ViewController.h"
#import "PieChartView.h"

static inline UIColor *GetRandomUIColor()
{
   CGFloat r = arc4random() % 255;
   CGFloat g = arc4random() % 255;
   CGFloat b = arc4random() % 255;
   UIColor * color = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1.0f];
   return color;
}

static const CGFloat dia = 250.0f;

static const CGRect kPieChartViewFrame = {{35.0f, 35.0f},{dia, dia}};
static const CGRect kHoleSliderFrame = {{35.0f, 300.0f},{dia, 20.0}};
static const CGRect kSlicesSliderFrame = {{35.0f, 330.0f},{dia, 20.0}};

static const CGRect kHoleLabelFrame = {{0.0f, 300.0f},{35.0, 20.0}};
static const CGRect kValueLabelFrame = {{0.0f, 330.0f},{35.0, 20.0}};

static const NSInteger tHoleLabelTag = 7;
static const NSInteger tValueLabelTag = 77;

@interface ViewController ()
<
   PieChartViewDelegate,
   PieChartViewDataSource
>
{
   PieChartView *pieChartView;
   UISlider *holeSlider;
   UISlider *slicesSlider;
   UILabel *holeLabel;
   UILabel *valueLabel;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
	pieChartView = [[PieChartView alloc] initWithFrame:kPieChartViewFrame];
   pieChartView.delegate = self;
   pieChartView.datasource = self;
   [self.view addSubview:pieChartView];
   
   holeLabel = [self labelWithFrame:kHoleLabelFrame];
   [self.view addSubview:holeLabel];
   
   valueLabel = [self labelWithFrame:kValueLabelFrame];
   [self.view addSubview:valueLabel];
   
   holeSlider = [[UISlider alloc] initWithFrame:kHoleSliderFrame];
   holeSlider.tag = tHoleLabelTag;
   [holeSlider addTarget:self action:@selector(didChangeValueForSlider:)
      forControlEvents:UIControlEventValueChanged];
   holeSlider.minimumValue = 0.0f;
   holeSlider.maximumValue = dia/2 - 1;
   int max = holeSlider.maximumValue;
   holeSlider.value = arc4random() % max;
   [self.view addSubview:holeSlider];
   [self didChangeValueForSlider:holeSlider];
   
   slicesSlider = [[UISlider alloc] initWithFrame:kSlicesSliderFrame];
   slicesSlider.tag = tValueLabelTag;
   [slicesSlider addTarget:self action:@selector(didChangeValueForSlider:)
      forControlEvents:UIControlEventValueChanged];
   slicesSlider.minimumValue = 0.0f;
   slicesSlider.maximumValue = 100.0f;
   slicesSlider.value = arc4random() % 100;
   [self.view addSubview:slicesSlider];
   [self didChangeValueForSlider:slicesSlider];
   
   [pieChartView reloadData];
}

- (UILabel*)labelWithFrame:(CGRect)frame
{
   UILabel *resultLabel = [[UILabel alloc] initWithFrame:frame];
   resultLabel.backgroundColor = [UIColor clearColor];
   resultLabel.textAlignment = NSTextAlignmentCenter;
   resultLabel.textColor = [UIColor blackColor];
   resultLabel.font = [UIFont systemFontOfSize:15.0f];
   resultLabel.shadowOffset = (CGSize){2,1};
   resultLabel.shadowColor = [UIColor lightGrayColor];
   return [resultLabel autorelease];
}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   pieChartView = nil;
}

-(void)didChangeValueForSlider:(UISlider*)slider
{
   if (slider.tag == tValueLabelTag) valueLabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
   if (slider.tag == tHoleLabelTag) holeLabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
   [pieChartView reloadData];
}

#pragma mark -    PieChartViewDelegate
-(CGFloat)centerCircleRadius
{
   return holeSlider.value;
}
#pragma mark - PieChartViewDataSource
-(int)numberOfSlicesInPieChartView:(PieChartView *)pieChartView
{
   return slicesSlider.value;
}
-(UIColor *)pieChartView:(PieChartView *)pieChartView colorForSliceAtIndex:(NSUInteger)index
{
   return GetRandomUIColor();
}
-(double)pieChartView:(PieChartView *)pieChartView valueForSliceAtIndex:(NSUInteger)index
{
   return 100/slicesSlider.value;
}
#pragma mark -

@end
