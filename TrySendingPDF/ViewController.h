//
//  ViewController.h
//  TrySendingPDF
//
//  Created by Alice Jin on 14/3/2018.
//  Copyright © 2018 Alice Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet WKWebView *webView;
- (IBAction)pdfButtonClicked:(id)sender;
- (IBAction)downloadPdfButtonClicked:(id)sender;

@end


