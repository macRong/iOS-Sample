//
//  GCDViewController.m
//  iOS-Sample
//
//  Created by 荣守振 on 2018/4/15.
//  Copyright © 2018年 macRong. All rights reserved.
//

#import "GCDViewController.h"
#import "Person.h"
#import "MPFDowloadManager.h"
#import "MPFDownloadTaskModel.h"
#import "fishhook.h"
#import "Cat.h"
#import "NodeCustomeView.h"

typedef void(^Gl)(BOOL);
@interface GCDViewController ()
{
    CAShapeLayer *shapeLayer;
    NSTimer *timer;
}

@property (nonatomic, strong) Gl gl;

@end

@implementation GCDViewController


- (void)dealloc
{
    [super dealloc];
    NSLog(@"GCDViewController.dealloc");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@" %@, %s",NSStringFromClass([self class]), __PRETTY_FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@" %@, %s",NSStringFromClass([self class]), __PRETTY_FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@" %@, %s",NSStringFromClass([self class]), __PRETTY_FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@" %@, %s",NSStringFromClass([self class]), __PRETTY_FUNCTION__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *obj = [[UIView alloc]init];
//    NSArray *ar = @[obj];
    NSHashTable *hashTable = [NSHashTable weakObjectsHashTable];
    [hashTable addObject:obj];
    NSLog(@"===== objc =%lu",(unsigned long)obj.retainCount);
    
    
    //第一步，通过UIBezierPath设置圆形的矢量路径
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    //第二步，用CAShapeLayer沿着第一步的路径画一个完整的环（颜色灰色，起始点0，终结点1）
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = CGRectMake(0, 0, 52.0f, 52.0f);//设置Frame
    bgLayer.position = self.view.center;//居中显示
    bgLayer.fillColor = [UIColor redColor].CGColor;//填充颜色=透明色
    bgLayer.path = circle.CGPath;//设置bgLayer的绘制路径为circle的路径
    [self.view.layer addSublayer:bgLayer];//添加到屏幕上
    
    //第三步，用CAShapeLayer沿着第一步的路径画一个红色的环形进度条，但是起始点=终结点=0，所以开始不可见
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(2, 2, 48.0f, 48.0f);
    shapeLayer.position = self.view.center;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.f;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 0;
    shapeLayer.path = circle.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    //第四步，用一个定时器进行测试，每一秒，进度加10%
//    timer = [NSTimer scheduledTimerWithTimeInterval:1/3.0f target:self selector:@selector(animate) userInfo:nil repeats:YES];
}

- (void)animate
{
    [UIView animateWithDuration:.01 animations:^{
        shapeLayer.strokeEnd += 1/3.0f;
    }];
}

void (^testBl)(void);

- (void)testFunc
{
     int age = 20;
    testBl = ^{
        NSLog(@"===== age = %d",age);
    };
    
    age = 30;
}

- (void)clangCfun
{

}

- (void)testA
{
    NSLog(@"2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    NSLog(@"%s",__PRETTY_FUNCTION__);

//    GCDViewController __block *clan = [GCDViewController new];
//    clan.age = 22;
//
//    clan.blk = ^int(int num) {
//        clan.age = 33;
//        return num *clan.age;
//    };
//
//    clan.blk(2);

//    int age = 8;
//    void(^bl)(int) = ^void(int num){
//        int ag = num*age;
//        NSLog(@"---- ag=%d",age);
//    };
//
//    bl(2);
    
//    int age = 28;
//    void (^Bl)(BOOL) = ^(BOOL ism){
//        NSLog(@"-------bl=%@",timer);
//    };
//
//    Bl(YES);

    
//    if (self.gl)
//    {
//        self.gl(YES);
//    }
//
//    self.gl = ^(BOOL ss) {
//        NSLog(@"sddssd =%d",age);
//    };
    
    
//    NodeCustomeView *view = [[NodeCustomeView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];

//    NSArray *ar = @[];
//    [ar objectAtIndex:99999];
    
//    MPFDownloadTaskModel *model=[MPFDownloadTaskModel model];
//    model.name=@"111.png";
//    model.url=@"http://qncdn.miaopai.com/static2018/wap/insapk/comm/iphone 750x1334.png";
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"MPFSDownloadCache"];
//    [self createDirectory:path];
//
//    model.destinationPath=  [NSString pathWithComponents:@[path, model.name]];
//
//    //添加下载任务
//    [[MPFDowloadManager shredManager] downloadUrl:model.url toPath:model.destinationPath process:^(float progress, NSString *sizeString, NSString *speedString) {
//      NSString *pr = [NSString stringWithFormat:@"%.2f%%",progress*100];
//        NSLog(@"pro = %@",pr);
//
//    } completion:^{
//        NSLog(@"-----完成");
//
//    } failure:^(NSError *error) {
//        [[MPFDowloadManager shredManager] cancelDownloadTask:model.url];
//        NSLog(@"-----error");
//    }];
    
//    rebind_symbols((struct rebinding[1]){{"NSLog",myNSLog, (void *)&origin_NSLog}}, 1);
}


#pragma ------------------------------ finshHook ------------------------------

//
//static void (*origin_NSLog)(NSString *format, ...);
//
//void myNSLog(NSString *format, ...)
//{
//
//}


- (void)createDirectory:(NSString *)directory
{
    NSFileManager *fileManager = [[NSFileManager alloc]init];

    if (![fileManager fileExistsAtPath:directory])
    {
        [fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:NULL];
    }
}

//barrier（访问数据库或者文件的时候 ，读-写锁）
- (void)barrier
{
    dispatch_queue_t t = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(t, ^{
        
        NSLog(@"1");
    });
    dispatch_async(t, ^{
        NSLog(@"2");
    });
    dispatch_barrier_async(t, ^{
        NSLog(@"barrier");
    });
    dispatch_async(t, ^{
        sleep(2);
        NSLog(@"3");
    });
    dispatch_async(t, ^{
        
        NSLog(@"4");
    });
    sleep(2);
    NSLog(@"end");
}

//group
- (void)group{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t t = dispatch_get_global_queue(0, 0);

    dispatch_group_enter(group);
    dispatch_group_async(group, t, ^{
        dispatch_async(t, ^{
            sleep(2);
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, t, ^{
        dispatch_async(t, ^{
            NSLog(@"2");
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_notify(group, t, ^{
        NSLog(@"1，2任务都完成");
    });
}

#pragma mark - 嵌套
//同步主队列
- (void)syncMain{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"任务1");
    });
    
    NSLog(@"end");
    
}
//异步主队列
- (void)asyncMain{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        sleep(2);
        NSLog(@"任务1");
    });
    
    NSLog(@"end");
    
}
//异步串行嵌套（同步）
- (void)asyncSerials{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{//block1
        NSLog(@"1");
        dispatch_async(queue, ^{//block2
            NSLog(@"2");
        });
        
    });
    
    NSLog(@"end");
    
}
//异步串行嵌套（异步）
- (void)asyncSeriala{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"1--%@",[NSThread currentThread]);
        dispatch_async(queue, ^{
            NSLog(@"2--%@",[NSThread currentThread]);
        });
        
        NSLog(@"3--%@",[NSThread currentThread]);
    });
    
    NSLog(@"end");
    
}
//同步串行嵌套（异步）
- (void)syncSeriala{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"1");
        dispatch_async(queue, ^{
            
            NSLog(@"2");
        });
        NSLog(@"3");
    });
    
    NSLog(@"end");
    
}
//异步并发嵌套（同步）
- (void)asyncConcurrents{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1");
        dispatch_sync(queue, ^{
            NSLog(@"2");
        });
        
        NSLog(@"3");
    });
    
    NSLog(@"end");
    
}
//异步并发嵌套（异步）
- (void)asyncConcurrenta{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1");
        dispatch_async(queue, ^{
            NSLog(@"2");
        });
        
        NSLog(@"3");
    });
    
    NSLog(@"end");
    
}
//同步并发嵌套（同步）
- (void)syncConcurrents{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"1");
        dispatch_sync(queue, ^{
            NSLog(@"2");
        });
        
        NSLog(@"3");
    });
    
    NSLog(@"end");
    
}
//同步并发嵌套（异步）(2的顺序是不可控的，但是end一定会在13后面)

- (void)syncConcurrenta{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{//block1
        NSLog(@"1");
        dispatch_async(queue, ^{//block2
            sleep(2);
            NSLog(@"2");
        });
        
        NSLog(@"3");
    });
    
    NSLog(@"end");
    
}
//同步并发
- (void)syncConcurrent{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"任务1");
    });
    dispatch_sync(queue, ^{
        
        NSLog(@"任务2");
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3");
    });
    NSLog(@"end");
    
}
//异步并发
- (void)asyncConcurrent{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"任务1");
    });
    dispatch_async(queue, ^{
        
        NSLog(@"任务2");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3");
    });
    
    NSLog(@"end");
    
}
//异步串行
- (void)asyncSerial{
    NSLog(@"begin");
    NSLog(@"begin--%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"任务1");
        NSLog(@"1--%@",[NSThread currentThread]);
        
    });
    dispatch_async(queue, ^{
        NSLog(@"2--%@",[NSThread currentThread]);
        
        NSLog(@"任务2");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3");
        NSLog(@"3--%@",[NSThread currentThread]);
        
    });
    NSLog(@"end");
    NSLog(@"end--%@",[NSThread currentThread]);
    
    
}
//同步串行
- (void)syncSerial{
    
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.gcd", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"任务1");
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2");
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"任务3");
    });
    NSLog(@"end");
}

- (void)someRequest
{
    // 代码如下
    dispatch_group_t group = dispatch_group_create();
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 3; i ++)
        {
            dispatch_group_enter(group);
            switch (i)
            {
                case 0:
                {
                    // 网络请求
                    [self getProductDetailsSuccess:^(BOOL success)
                    {
                        //回调执行
                        dispatch_group_leave(group);
                        
                    }];
                    
                }
                    break;
                case 1:
                {
                    //网络请求
                    [self getProductEvaluateSuccess:^(BOOL success)
                    {
                        //回调执行
                        dispatch_group_leave(group);
                        
                    }];
                    
                }
                break;
                default:
                break;
                    
            }
            
        }
        
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            //请求完毕，处理业务逻辑
            
        });
        
    });

}


@end
