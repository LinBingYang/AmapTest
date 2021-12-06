//
//  ViewController.m
//  AmapTest
//
//  Created by Admin on 2021/12/6.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
@interface ViewController ()<MAMapViewDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) MAGroundOverlay *groundOverlay;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self Creatmapview];
    UIImage *img=[UIImage imageNamed:@"test.png"];
    CLLocationCoordinate2D amapcoord1 = CLLocationCoordinate2DMake(28.312901,115.85229);
    CLLocationCoordinate2D amapcoord2 = CLLocationCoordinate2DMake(23.499072,120.736501);
    MACoordinateBounds coordinateBounds = MACoordinateBoundsMake(amapcoord1,amapcoord2);
    
    self.groundOverlay = [MAGroundOverlay groundOverlayWithBounds:coordinateBounds icon:img];
    [self.mapView addOverlay:self.groundOverlay];
    self.mapView.visibleMapRect = self.groundOverlay.boundingMapRect;
}

-(void)Creatmapview{
    
    self.mapView=[[MAMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
//    self.mapView.showsUserLocation=YES;
    self.mapView.showsScale=NO;
    self.mapView.rotateEnabled = NO;
    self.mapView.rotateCameraEnabled = NO;
    self.mapView.showsCompass=NO;
    self.mapView.userInteractionEnabled = YES;
    [self.view addSubview:self.mapView];
    
}
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{

    
    if ([overlay isKindOfClass:[MAGroundOverlay class]])
    {
        MAGroundOverlayRenderer *groundOverlayRenderer = [[MAGroundOverlayRenderer alloc] initWithGroundOverlay:(MAGroundOverlay *)overlay];
        return groundOverlayRenderer;
    }
   
    return nil;
}
@end
