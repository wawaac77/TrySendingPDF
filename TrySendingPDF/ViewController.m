//
//  ViewController.m
//  TrySendingPDF
//
//  Created by Alice Jin on 14/3/2018.
//  Copyright © 2018 Alice Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <WKNavigationDelegate, WKUIDelegate>

@property (strong, nonatomic) NSString *filePathRecord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *urlStr = @"http://techslides.com/sample-files-for-development";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    [_webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pdfButtonClicked:(id)sender {
    //NSString *pdfFilePath = [[NSBundle mainBundle] pathForResource:@"TapNGo" ofType:@"pdf"];
    //UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"TapNGoFile", [NSURL fileURLWithPath:pdfFilePath]] applicationActivities:nil];
    
    if (_filePathRecord.length != 0) {
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"samplePDF", [NSURL fileURLWithPath:_filePathRecord]] applicationActivities:nil];
        
        [self presentViewController:activityViewController animated:YES completion:nil];
    }
    
    
    /*
    NSData *pdfData = [NSData dataWithContentsOfFile:pdfFilePath];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"Test", pdfData] applicationActivities:nil];
    
    [self presentViewController:activityViewController animated:YES completion:nil];
     */
}

- (IBAction)downloadPdfButtonClicked:(id)sender {
    
    NSString *currentURLString = _webView.URL.absoluteString;
    NSLog(@"currentURLString %@", currentURLString);
    
    NSURL *currentURL = _webView.URL;
    NSData *dataPdf = [NSData dataWithContentsOfURL:currentURL];
    
    //Get path directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //Create PDF_Documents directory
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"PDF_Documents"];
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, @"samplePdfFilePath.pdf"];
    self.filePathRecord = filePath;
    [dataPdf writeToFile:filePath atomically:YES];
    
//    NSURL *tmpDirURL = [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];        // get /tmp folder path
//
//    self.fileURL = [[tmpDirURL URLByAppendingPathComponent:@"samplePdf"] URLByAppendingPathExtension:@"pdf"];
}
@end
