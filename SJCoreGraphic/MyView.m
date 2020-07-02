//
//  MyView.m
//  SJCoreGraphic
//
//  Created by Katherine on 2020/7/2.
//  Copyright © 2020 JiuwenDragon. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
//    [self addLine]; // 画线
//    [self addTriangle]; //  画三角形
//    [self addArcWithRect:rect]; //  画弧形
//    [self addSectorRect:rect]; //画扇形
//    [self addCircularRect:rect]; //  画圆
    [self addRect:rect];
}

// 画线
- (void)addLine {
    //获取图形上下文，图形上下文输出的目标是self-》也就是当前的试图对象。
      CGContextRef context = UIGraphicsGetCurrentContext();
      //设置线条的颜色
      [[UIColor yellowColor] set];
      //设置线宽
      CGContextSetLineWidth(context, 5);
      // 设置线的头尾的样式
      CGContextSetLineCap(context, kCGLineCapButt);
      //连接点的样式
      CGContextSetLineJoin(context, kCGLineJoinRound);
      //线条的起点
      CGContextMoveToPoint(context, 100, 100);
      //线条的终点
      CGContextAddLineToPoint(context, 300, 100);
      //渲染线条
      CGContextStrokePath(context);
}

//  画三角形
- (void)addTriangle {
    //获取图形上下文，图形上下文输出的目标是self-》也就是当前的试图对象。
      CGContextRef context = UIGraphicsGetCurrentContext();
      //设置线条的颜色
      [[UIColor yellowColor] set];
      //设置线宽
      CGContextSetLineWidth(context, 5);
      // 设置线的头尾的样式
      CGContextSetLineCap(context, kCGLineCapButt);
      //连接点的样式
      CGContextSetLineJoin(context, kCGLineJoinRound);
      //线条的起点
      CGContextMoveToPoint(context, 100, 100);
      //线条的终点
      CGContextAddLineToPoint(context, 300, 100);
      CGContextAddLineToPoint(context, 100, 300);
      CGContextClosePath(context);
      //渲染线条
      CGContextStrokePath(context);
}

//  画弧形
- (void)addArcWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

       /*!
        *  @author zhihua, 16-06-02 17:06:03
        *  圆心的点
        *  半径
        *  起始的弧度
        *  结束的弧度
        *  clockwise 0 顺针 1 逆时针
        *  @brief
        */
       CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), 100, 0, M_PI*0.65, 1);
       CGContextStrokePath(context);
}

//画扇形
- (void)addSectorRect:(CGRect)rect {

    //获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextMoveToPoint(context, CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), 50, 0, M_PI*0.25, 1);

    CGContextClosePath(context);

    CGContextStrokePath(context);
}
//  画圆
- (void)addCircularRect:(CGRect)rect {
    //获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextAddEllipseInRect(context, CGRectMake(CGRectGetMidX(rect), CGRectGetMidY(rect), 200, 200));
    CGContextStrokePath(context);
}
// 画文字、画图片
- (void)addRect:(CGRect)rect {
    //画图片
       UIImage *image = [UIImage imageNamed:@"chiji.jpg"];
       //[image drawAtPoint:CGPointZero];
       //[image drawInRect:CGRectMake(10, 10, 50, 50)];

       //平铺
       [image drawAsPatternInRect:CGRectMake(40, 100, 300, 200)];

       //画文字
       NSString *text = @"建设世界科技强国的号角已经吹响，科技创新的春天已经来临。";

       NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor redColor]};

       [text drawInRect:rect withAttributes:attr];
       //这个方法不会换行
       //[text drawAtPoint:CGPointMake(10, 100) withAttributes:nil];
}


@end
