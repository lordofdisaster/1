//
//  ViewController.h
//  Etris
//
//  Created by Elf on 11.08.15.
//  Copyright (c) 2015 Elf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{

    NSMutableArray *cells;
    
    NSMutableArray *cellsForChoose;
    
    NSMutableOrderedSet *selectedCellsSet;
    
    
    
    int figureOne;
    int figureTwo;
    
    enum figure {lineH=0, lineW, figureO,
        figureL, figureLr1, figureLr2, figureLr3,
        figureJ, figureJr1, figureJr2, figureJr3,
        figureS, figureSr1,
        figureZ, figureZr1,
        figureT, figureTr1, figureTr2, figureTr3 };
    
}

@property (weak, nonatomic) IBOutlet UIImageView *figureOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *figureTwoImageView;

@property(weak, nonatomic) UIColor *selectedCellsColor;
@property(weak, nonatomic) UIColor *backgroundColor;
@property(weak, nonatomic) UIColor *labelColor;
@property(weak, nonatomic) UIColor *buttonColor;


@property (strong, nonatomic) IBOutlet UIView *mainBackgroud;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *bestScoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *menuButton;


-(UIView *)checkCrossWithCells:(CGRect)touchRect;

-(UIView*)selectCellByTouch:(UITouch*)touch;
-(NSArray*)sortSelectedCells;

-(BOOL)isCellRed:(int)tag;

-(void)setfigureOne;
-(void)setfigureTwo;
-(void)setfigureOneImage;
-(void)setfigureTwoImage;
-(void)changeGameScore;
-(void)bestScoreSaver;
-(void)optimizeCellSize:(int)ceedDotX :(int)ceedDotY :(int)ceedCellSize :(int)stepFromStatusbar;
-(void)coloringApp;
-(void)sizingAppForScreen;

-(NSUInteger)supportedInterfaceOrientations;
-(UIStatusBarStyle)preferredStatusBarStyle;



-(void)isCellChosen;


-(BOOL)isSetEqualFigure:(int)figure;
-(BOOL)checklineH;
-(BOOL)checklineW;
-(BOOL)checkfigureO;

-(BOOL)checkfigureL;
-(BOOL)checkfigureLr1;
-(BOOL)checkfigureLr2;
-(BOOL)checkfigureLr3;

-(BOOL)checkfigureJ;
-(BOOL)checkfigureJr1;
-(BOOL)checkfigureJr2;
-(BOOL)checkfigureJr3;

-(BOOL)checkfigureS;
-(BOOL)checkfigureSr1;

-(BOOL)checkfigureZ;
-(BOOL)checkfigureZr1;

-(BOOL)checkfigureT;
-(BOOL)checkfigureTr1;
-(BOOL)checkfigureTr2;
-(BOOL)checkfigureTr3;


- (IBAction)resetCells:(id)sender;

@end

