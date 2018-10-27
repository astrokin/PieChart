//
//  JPCViewController.m
//  JustPieChart
//
//  Created by Alexey Strokin on 10/27/2018.
//  Copyright (c) 2018 Alexey Strokin. All rights reserved.
//

#import "JPCViewController.h"

@import JustPieChart;

static inline UIColor *GetRandomUIColor()
{
    CGFloat r = arc4random() % 255;
    CGFloat g = arc4random() % 255;
    CGFloat b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}

static const NSInteger tHoleLabelTag = 7;
static const NSInteger tValueLabelTag = 77;


@interface JPCViewController () <PieChartViewDelegate, PieChartViewDataSource>

@property (nonatomic, strong) IBOutlet PieChartView *pieChartView;
@property (nonatomic, strong) IBOutlet UISlider *holeSlider;
@property (nonatomic, strong) IBOutlet UISlider *slicesSlider;
@property (nonatomic, strong) IBOutlet UILabel *holeLabel;
@property (nonatomic, strong) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *pieChartSizeConstraint;

@end

@implementation JPCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pieChartView.delegate = self;
    self.pieChartView.datasource = self;
    
    self.holeSlider.tag = tHoleLabelTag;
    self.slicesSlider.tag = tValueLabelTag;
    
    self.holeSlider.minimumValue = 0.0f;
    self.holeSlider.maximumValue = self.pieChartSizeConstraint.constant/2 - 1;
    
    self.slicesSlider.minimumValue = 1.0f;
    self.slicesSlider.maximumValue = 100.0f;
    self.slicesSlider.value = arc4random() % 100;
    
    int max = self.holeSlider.maximumValue;
    self.holeSlider.value = arc4random() % max;
    
    [self didChangeValueForSlider:self.holeSlider];
    [self didChangeValueForSlider:self.slicesSlider];
    [self.pieChartView reloadData];
}

-(IBAction)didChangeValueForSlider:(UISlider*)slider
{
    if (slider.tag == tValueLabelTag) self.valueLabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
    if (slider.tag == tHoleLabelTag) self.holeLabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
    [self.pieChartView reloadData];
}

#pragma mark -    PieChartViewDelegate
-(CGFloat)centerCircleRadius
{
    return self.holeSlider.value;
}
#pragma mark - PieChartViewDataSource
-(int)numberOfSlicesInPieChartView:(PieChartView *)pieChartView
{
    return self.slicesSlider.value;
}
-(UIColor *)pieChartView:(PieChartView *)pieChartView colorForSliceAtIndex:(NSUInteger)index
{
    return GetRandomUIColor();
}
-(double)pieChartView:(PieChartView *)pieChartView valueForSliceAtIndex:(NSUInteger)index
{
    return 100/self.slicesSlider.value;
}
#pragma mark -

@end
