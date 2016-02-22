//
//  ViewController.m
//  Etris
//
//  Created by Elf on 11.08.15.
//  Copyright (c) 2015 Elf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int score;
int bestScore;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self supportedInterfaceOrientations];
    [self sizingAppForScreen];
    [self coloringApp];
    

    
    NSString *scoreChange = [[NSString alloc] initWithFormat:@" Score: %i", score];
    self.scoreLabel.text = scoreChange;
    
    
    
    
    cellsForChoose      = [[NSMutableArray alloc]init];
    selectedCellsSet    = [[NSMutableOrderedSet alloc]init];
    cells               = [[NSMutableArray alloc]init];
    
    
    
    for (int y=11; y<=81; y=y+10) {
        for (int x=y; x<=y+7; x++) {
            [cells addObject:[self.view viewWithTag:x]];
            
        }
    }
    

    
    [self setfigureOne];
    [self setfigureTwo];
    
    [self setfigureOneImage];
    [self setfigureTwoImage];
    
    NSLog(@"\n figure one = %i \n figure two = %i", figureOne, figureTwo);

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (UITouch *touch  in touches) {
        
        if ([self selectCellByTouch:touch]) {
            [selectedCellsSet addObject:[self selectCellByTouch:touch]];
            
            if ([selectedCellsSet count]>=5) {
                [[selectedCellsSet objectAtIndex:0]setBackgroundColor:[UIColor whiteColor]];
                [selectedCellsSet removeObjectAtIndex:0];
            }
            
        }
    }
    
    //NSLog(@"%@", selectedCellsSet);
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (UITouch *touch  in touches) {
        
        if ([self selectCellByTouch:touch]) {
            [selectedCellsSet addObject:[self selectCellByTouch:touch]];

            if ([selectedCellsSet count]>=5) {
                [[selectedCellsSet objectAtIndex:0]setBackgroundColor:[UIColor whiteColor]];
                [selectedCellsSet removeObjectAtIndex:0];
            }

        }
        
    }
    
    //NSLog(@"%@", selectedCellsSet);
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    if ([self isSetEqualFigure:figureOne]) {
        [self setfigureOne];
        [self setfigureOneImage];
        [self changeGameScore];
        
    
    }
    
    if ([self isSetEqualFigure:figureTwo]) {
        [self setfigureTwo];
        [self setfigureTwoImage];
        [self changeGameScore];
        
    }
    
    [self isCellChosen];
    [self bestScoreSaver];
    
#pragma mark cellColor
    
    //_selectedCellsColor = [UIColor redColor];

    
    
    NSLog(@"\n figure one = %i \n figure two = %i", figureOne, figureTwo);

}











- (IBAction)resetCells:(id)sender {
    
    // Чтобы чистить поле от последних выбранных ячеек, нужно перед каждым новым коном (начала выбора клеток фигуры) сохранять отдельно массив уже выбранных.
    
    for (UIView *cell   in cells) {
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
    
    [selectedCellsSet removeAllObjects];
    
    [self setfigureOne];
    [self setfigureTwo];
    
    [self setfigureOneImage];
    [self setfigureTwoImage];
    
    score = 0;  //обнуление счетчика очков при запуске новой игры
    NSString *scoreChange = [[NSString alloc] initWithFormat:@" Score: %i", score];
    self.scoreLabel.text = scoreChange;
    
    
    
    
    
}


#pragma mark Checking figures

-(BOOL)isSetEqualFigure:(int)figure{
    
    BOOL answer=NO;
    
    if ([selectedCellsSet count]==4) {
        
        switch (figure) {
            case lineH:
                answer=[self checklineH];
                break;
            case lineW:
                answer=[self checklineW];
                break;
            case figureO:
                answer=[self checkfigureO];
                break;
            case figureL:
                answer=[self checkfigureL];
                break;
            case figureLr1:
                answer=[self checkfigureLr1];
                break;
            case figureLr2:
                answer=[self checkfigureLr2];
                break;
            case figureLr3:
                answer=[self checkfigureLr3];
                break;
            case figureJ:
                answer=[self checkfigureJ];
                break;
            case figureJr1:
                answer=[self checkfigureJr1];
                break;
            case figureJr2:
                answer=[self checkfigureJr2];
                break;
            case figureJr3:
                answer=[self checkfigureJr3];
                break;
            case figureS:
                answer=[self checkfigureS];
                break;
            case figureSr1:
                answer=[self checkfigureSr1];
                break;
            case figureZ:
                answer=[self checkfigureZ];
                break;
            case figureZr1:
                answer=[self checkfigureZr1];
                break;
            case figureT:
                answer=[self checkfigureT];
                break;
            case figureTr1:
                answer=[self checkfigureTr1];
                break;
            case figureTr2:
                answer=[self checkfigureTr2];
                break;
            case figureTr3:
                answer=[self checkfigureTr3];
                break;

            default:
                break;
        }
        
    }
    
    return answer;
    
}


-(BOOL)checklineH{
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+10 && cellThree==cellTwo+10 && cellFour == cellThree+10) {
        answer = YES;
        
        
        
        NSLog(@"LineH is ready");
    }
    return answer;
}


-(BOOL)checklineW{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellTwo+1 && cellFour == cellThree+1) {
        answer = YES;
        
        NSLog(@"LineW is ready");
    }
    return answer;

}

-(BOOL)checkfigureO{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+10 && cellFour == cellOne+11) {
        answer = YES;
        
        NSLog(@"FigureO is ready");
        
       }
    return answer;
}
    
-(BOOL)checkfigureL{
        
        BOOL answer = NO;
        
        NSArray *ourSet = [self sortSelectedCells];
        
        int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
        int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
        int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
        int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
        
        
        if (cellTwo==cellOne+10 && cellThree==cellOne+20 && cellFour == cellOne+21) {
            answer = YES;
            
            NSLog(@"FigureL is ready");
        }
        return answer;
}

-(BOOL)checkfigureLr1{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+10 && cellFour == cellOne+20) {
        answer = YES;
        
        NSLog(@"FigureLr1 is ready");
    }
    return answer;
}

-(BOOL)checkfigureLr2{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+2 && cellFour == cellOne+10) {
        answer = YES;
        
        NSLog(@"FigureLr2 is ready");
    }
    return answer;
}

-(BOOL)checkfigureLr3{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+10 && cellThree==cellOne+11 && cellFour == cellOne+12) {
        answer = YES;
        
        NSLog(@"FigureLr3 is ready");
    }
    return answer;
}

-(BOOL)checkfigureJ{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+10 && cellThree==cellOne+19 && cellFour == cellOne+20) {
        answer = YES;
        
        NSLog(@"FigureJ is ready");
    }
    return answer;
}

-(BOOL)checkfigureJr1{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+11 && cellFour == cellOne+21) {
        answer = YES;
        
        NSLog(@"FigureJr1 is ready");
    }
    return answer;
}

-(BOOL)checkfigureJr2{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+2 && cellFour == cellOne+12) {
        answer = YES;
        
        NSLog(@"FigureJr2 is ready");
    }
    return answer;
}

-(BOOL)checkfigureJr3{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+8 && cellThree==cellOne+9 && cellFour == cellOne+10) {
        answer = YES;
        
        NSLog(@"FigureJr3 is ready");
    }
    return answer;
}

-(BOOL)checkfigureS{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+9 && cellFour == cellOne+10) {
        answer = YES;
        
        NSLog(@"FigureS is ready");
    }
    return answer;
}

-(BOOL)checkfigureSr1{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+10 && cellThree==cellOne+11 && cellFour == cellOne+21) {
        answer = YES;
        
        NSLog(@"FigureSr1 is ready");
    }
    return answer;
}

-(BOOL)checkfigureZ{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+11 && cellFour == cellOne+12) {
        answer = YES;
        
        NSLog(@"FigureZ is ready");
    }
    return answer;
}

-(BOOL)checkfigureZr1{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+9 && cellThree==cellOne+10 && cellFour == cellOne+19) {
        answer = YES;
        
        NSLog(@"FigureZr1 is ready");
    }
    return answer;
}

-(BOOL)checkfigureT{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+1 && cellThree==cellOne+2 && cellFour == cellOne+11) {
        answer = YES;
        
        NSLog(@"FigureT is ready");
    }
    
    return answer;
}

-(BOOL)checkfigureTr1{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+9 && cellThree==cellOne+10 && cellFour == cellOne+11) {
        answer = YES;
        
        NSLog(@"FigureTr1 is ready");
    }
    
    return answer;
}

-(BOOL)checkfigureTr2{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+10 && cellThree==cellOne+11 && cellFour == cellOne+20) {
        answer = YES;
        
        NSLog(@"FigureTr2 is ready");
    }
    return answer;
}

-(BOOL)checkfigureTr3{
    
    BOOL answer = NO;
    
    NSArray *ourSet = [self sortSelectedCells];
    
    int cellOne     = (int)[[ourSet objectAtIndex:0] tag];
    int cellTwo     = (int)[[ourSet objectAtIndex:1] tag];
    int cellThree   = (int)[[ourSet objectAtIndex:2] tag];
    int cellFour    = (int)[[ourSet objectAtIndex:3] tag];
    
    
    if (cellTwo==cellOne+9 && cellThree==cellOne+10 && cellFour == cellOne+20) {
        answer = YES;
        
        NSLog(@"FigureTr3 is ready");
    }
    return answer;
    
}

#pragma mark -----


-(void)setfigureOne{
    
    figureOne = arc4random()%18;
    
}

-(void)setfigureTwo{
    
    figureTwo = arc4random()%18;
    if (figureOne == figureTwo) {
        [self setfigureTwo];
    }
}

-(void)setfigureOneImage{
    
    NSString *imageName = [NSString stringWithFormat:@"image%i", figureOne];
    UIImage *image = [UIImage imageNamed:imageName];
    
    [[self figureOneImageView] setImage:image];
    
}

-(void)setfigureTwoImage{
    
    NSString *imageName = [NSString stringWithFormat:@"image%i", figureTwo];
    UIImage *image = [UIImage imageNamed:imageName];
    
    [[self figureTwoImageView] setImage:image];
    
    
}


-(UIView *)selectCellByTouch:(UITouch *)touch{
    
    CGPoint touchpoint = [touch locationInView:self.view];
    
    CGRect touchRect = CGRectMake(touchpoint.x, touchpoint.y, 1.0, 1.0);
    
    return [self checkCrossWithCells:touchRect];
    
}



-(NSArray *)sortSelectedCells{
    
    NSArray *array = [selectedCellsSet array];
    
    NSSortDescriptor *descriptorOne = [NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:descriptorOne];
    
    return  [array sortedArrayUsingDescriptors:descriptors];
}

-(BOOL)isCellRed:(int)tag{
    
    return [[self.view viewWithTag:tag] backgroundColor]==_selectedCellsColor?YES:NO;
}



-(UIView *)checkCrossWithCells:(CGRect)touchRect{
    
    UIView *cellAdress = nil;
    
    for (UIView *cell  in cells) {
        
        BOOL cross = CGRectIntersectsRect(cell.frame, touchRect);
        
        if (cross!=0) {

            [cell setBackgroundColor:_selectedCellsColor];
            cellAdress = cell;
            break;
        }
        
    }
    
    return cellAdress;
    
}


-(void)changeGameScore{
    score = score + 4;
    NSString *scoreChange = [[NSString alloc] initWithFormat:@" Score: %i", score];
    self.scoreLabel.text = scoreChange;
}

-(void)bestScoreSaver{
    
    if (score > bestScore){
        bestScore = score;
        
    }
    NSString *bestScoreChange = [[NSString alloc] initWithFormat:@" Best: %i", bestScore];
    self.bestScoreLabel.text = bestScoreChange;

}

-(void)optimizeCellSize:(int)ceedDotX :(int)ceedDotY :(int)ceedCellSize :(int)stepFromStatusbar{
    
    #pragma mark Entering ceed value for creating gamefield
    
    int cellSize=ceedCellSize;
    int x=ceedDotX;
    int y=ceedDotY;
    int tag=11;
    int cellTag=0;
    int boarderTag=18;

    for (int counter=1; counter<=9; counter++) {
        while (tag <= boarderTag) {
            //NSLog(@"cellTag: %i,x:%i y:%i,cellSize:%i tag:%i\n",  cellTag, x, y,cellSize,tag);
            CGRect newRect = CGRectMake(x, y, cellSize, cellSize);
            [[self.view viewWithTag:tag] setFrame:newRect];
            cellTag=tag-10*counter;
            x=ceedDotX+cellSize*cellTag+cellTag;
            tag++;
        }
        cellTag=0;
        tag=tag+2;
        x=ceedDotX;
        y=y+cellSize+1;
        boarderTag=boarderTag+10;
    }
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    //CGFloat screenHeight = screenSize.height;
    
    //stepFromStatusbar = 30;
    
    //menu button position
    x=4;
    y=stepFromStatusbar;
    int buttonSizeX=screenWidth-24;
    buttonSizeX=buttonSizeX/2;
    int buttonSizeY=43;
    CGRect buttonRect = CGRectMake(x, y, buttonSizeX, buttonSizeY);
    [_menuButton setFrame:buttonRect];
    
    //labelScore position
    x=buttonSizeX+12;
    y=stepFromStatusbar;
    int labelSizeX=screenWidth-x-4;
    int labelSizeY=buttonSizeY+5+buttonSizeX/2-9;
    labelSizeY=labelSizeY/3;
    CGRect labelRect = CGRectMake(x, y, labelSizeX, labelSizeY);
    [_scoreLabel setFrame:labelRect];
    
    //label best position
    x=buttonSizeX+12;
    y=stepFromStatusbar+labelSizeY+5;
    labelSizeX=screenWidth-x-4;
    CGRect bestLabelRect = CGRectMake(x, y, labelSizeX, labelSizeY);
    [_bestScoreLabel setFrame:bestLabelRect];
    
    //reset button position
    
    x=buttonSizeX+12;
    y=stepFromStatusbar+labelSizeY*2+5*2;
    labelSizeX=screenWidth-x-4;
    CGRect newGameButtonRect = CGRectMake(x, y, labelSizeX, labelSizeY);
    [[self.view viewWithTag:2] setFrame:newGameButtonRect];
    
    //figure IMG position
    int imgSize;
    x=4;
    imgSize=buttonSizeX/2-2;
    y=stepFromStatusbar+buttonSizeY+7;
    
    CGRect imgRect = CGRectMake(x, y, imgSize, imgSize);
    [_figureOneImageView setFrame:imgRect];
    
    x=4+imgSize+4;
    CGRect img2Rect = CGRectMake(x, y, imgSize, imgSize);
    [_figureTwoImageView setFrame:img2Rect];
    
    
    
}
#pragma mark App design Colors


-(void)coloringApp{
    
    _backgroundColor=[UIColor colorWithRed:0.84 green:0.82 blue:0.80 alpha:1.0];
    _buttonColor=[UIColor colorWithRed:1.00 green:0.67 blue:0.12 alpha:1.0];
    _labelColor=[UIColor colorWithRed:0.63 green:0.58 blue:0.54 alpha:1.0];
    
    _selectedCellsColor = [UIColor redColor];
    
    
    [_scoreLabel setBackgroundColor:_labelColor];
    [_bestScoreLabel setBackgroundColor:_labelColor];
    [_mainBackgroud  setBackgroundColor:_backgroundColor];
    [_menuButton setBackgroundColor:_buttonColor];
    [[self.view viewWithTag:2]setBackgroundColor:_buttonColor];
    
}


-(void)sizingAppForScreen{
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
    NSLog(@"\n Width: %.f Height: %.f", screenWidth, screenHeight);
    
        //iPhone4 !no iAd!
    if (screenHeight == 480) {
        int ceedDotX=4;
        int ceedDotY=160;
        int ceedCellSize=38;
        int stepFromStatusbar=30;
        [self optimizeCellSize:(int)ceedDotX :(int)ceedDotY :(int)ceedCellSize :(int)stepFromStatusbar];
        NSLog(@"\n iPhone4 screen detected.");
    }
        //iPhone5
    if (screenHeight == 568) {
        int ceedDotX=4;
        int ceedDotY=172;
        int ceedCellSize=38;
        int stepFromStatusbar=40;
        [self optimizeCellSize:(int)ceedDotX :(int)ceedDotY :(int)ceedCellSize :(int)stepFromStatusbar];
        NSLog(@"\n iPhone5 screen detected.");
    }
        //iPhone6
    if (screenHeight == 667) {
        int ceedDotX=4;
        int ceedDotY=200;
        int ceedCellSize=45;
        int stepFromStatusbar=47;
        [self optimizeCellSize:(int)ceedDotX :(int)ceedDotY :(int)ceedCellSize :(int)stepFromStatusbar];
        NSLog(@"\n iPhone6 screen detected.");
    }
        //iPhone6+
    if (screenHeight == 736) {
        int ceedDotX=4;
        int ceedDotY=218;
        int ceedCellSize=50;
        int stepFromStatusbar=47;
        [self optimizeCellSize:(int)ceedDotX :(int)ceedDotY :(int)ceedCellSize :(int)stepFromStatusbar];
        NSLog(@"\n iPhone6+ screen detected.");
    }
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



-(void)savingFigureCells{
    
    for (int y=11; y<=81; y=y+10) {
        for (int x=y; x<=y+7; x++) {
            [cells addObject:[self.view viewWithTag:x]];
        }
    }

    
}



-(void)isCellChosen{
    
    for (int y=11; y<=81; y=y+10) {
        for (int x=y; x<=y+7; x++) {
    
    if ([[self.view viewWithTag:x] backgroundColor]==_selectedCellsColor) {  
        [[self.view viewWithTag:x] setBackgroundColor:[UIColor orangeColor]];
    
    }
         }
         }

}





@end
