//
//  UserBoardcastController.m
//  DoubanClient
//
//  Created by chenkai on 14/10/27.
//  Copyright (c) 2014年 kai.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserBoardcastController.h"
#import "UserBoardcastView.h"


@implementation UserBoardcastController



- (void)loadView
{
    [super loadView];
    
    UserBoardcastView *boardcastView= [[UserBoardcastView alloc] init];
    boardcastView.alpha =0.5;
    boardcastView.backgroundColor = [UIColor yellowColor];
    
    [boardcastView.defineButton addTarget:self action:@selector(getCustomerBlock) forControlEvents:UIControlEventTouchDown];
    self.view=boardcastView;
    
    [self testCodeBlockFunction];
    
}

- (void) getCustomerBlock
{
    
}

//define point to function with c style
void (*megerCustomerName)(void);

//define code block
void (^spiltOutCustomerName)(void);

//define a code block and development it
int (^square_block)(int inputNumber) = ^(int inputNumber)
{
    return  (inputNumber * inputNumber);
};

//define a code block without return type and argument
void (^foundCustomerById)()= ^{ NSLog(@"i'm a code block without returntype and argument；") ;};


//use typedef a code block
typedef double (^asArgumentForFunction)(double object1,double object2);

//typedef a test code block
typedef double (^blockLocalArgument)(void);


//define a code block find customer by id
int (^getCustomerInfoById)(int customerId) = ^(int customerId)
{
    return customerId;
};

//define code block test function
- (void) testCodeBlockFunction
{
    //call the code block
    int result =  square_block(5);
   
    //define code bloack syntax
    //
    //<retruntype> (^blockname)(list of arguments) = ^(arguments)
    //{
    //    Body
    //};
    
    //call the code block without return type and arguments
    foundCustomerById();
    
    //call the code block
    int customerId= getCustomerInfoById(12);
    NSLog([NSString stringWithFormat:@"find out customer id is :%d",customerId]);
    
    //pretty cool features for code block
    //psnote：替换原来函数
    NSString *customerGroup= @"ShangPing Company For SF Express";
    int value = 6;
    int (^multiply_block)(int number) = ^(int number) { return (value * number);};
    
    int number = multiply_block (6);
    NSLog([NSString stringWithFormat:@"call block  first features : %d",number]);
    
    //as same as you can call code block with other one
    int (^formatCustomerById) (int customerId) = ^(int customerId)
    {
        //能够调用 与上下问语句块
       int result=  multiply_block(customerId);
       return (result * 3);
    };
    
    
    //call embed code block
    int embedCustomerId = formatCustomerById (2);
    NSLog([NSString stringWithFormat:@"embed other one cold block value:%d",embedCustomerId]);

    //and other way is you use code block as function argument
    [self callCodeBlockAsArgument];
    
    //use typedef define a code block
    typedef double(^makeValueToDouble)(double object1,double object2); //定义语句块的签名[返回类型，名字，参数]
    makeValueToDouble asCommonConst = ^(double object1,double object2)
                                     {return object1 * object2 ;};//定义语句块的实现
    
    double callValue= makedev(4, 5);//typedef 方式语句块调用 这样可以定义语句块 可以有多重实现 取决不同场景.
    NSLog(@"typedef value:%f",callValue);
    
    //try again code block as function argument [failed]
    asArgumentForFunction defineDetail = ^(double object1,double object2) {return  (object1  + object2);};
    //[self callBlockAsArgument: defineDetail];
    
    
    //本地变量 语句块
    [self callCodeBlockLocalArgument];
    
    //全局变量 语句块
    [self callCodeBlockDomainArgument];
}


- (void) callCodeBlockAsArgument
{
    NSArray *customerArray = [NSArray arrayWithObjects:@"FrankLin",@"TomyChen",@"JackMa",@"FrankLin", nil];
    NSLog(@"unsorted array %@",customerArray);
    
    NSArray *sortedCustomerArray = [customerArray sortedArrayUsingComparator:^(NSString *object1,NSString *object2)
                                   { return [object1 compare:object2] ;}];
    NSLog(@"sorted array %@",sortedCustomerArray);
    
}

- (void) callCodeBlockLocalArgument
{
    //typedef double (^blockLocalArgument)(void);
    double firstObj = 12,secondObj = 2;
    
    blockLocalArgument testLocalArgument = ^(void) {return firstObj * secondObj;};
    double convertValue = testLocalArgument();
    NSLog(@"changed before: %f",convertValue);
    
    firstObj = 5;
    secondObj = 6;
    convertValue = testLocalArgument();
    NSLog(@"changed after: %f",convertValue);
    
    //虽然中间修改两个参数的数值,但两次最终输出结果还是一致的.
    //在代码块之前定义的本地变量 才能对语句块可见. 之后任何改变都能直接反馈到语句块中
    //变量是本地 语句块定义它时 会复制并保持它们的状态.
    //本地变量 会被代码块作为常量获取到 使用. 如果修改本地变量的值 则声明时必须定义为可修改的.
    
    
    //通过__block 方式定义可以改变的本地变量
    __block double threeValue = 3;
    blockLocalArgument changeTheLocalValue = ^(void) {
        threeValue =12;
        return threeValue;
    };
    
    NSLog(@"change Local value in block :%f",changeTheLocalValue());
    

}


static double firstCus = 10, secondCus = 20;

- (void) callCodeBlockDomainArgument
{
    blockLocalArgument testDomainArgument = ^(void) {return firstCus * secondCus ;};
    double firstResult= testDomainArgument();
    NSLog(@"firstDomain Result :%f",firstResult);
    
    firstCus = 5;
    secondCus = 10;
    firstResult =testDomainArgument();
    NSLog(@"firstDomain After : %f",firstResult);
    
    //NSLog(@"%f",testDomainArgument());
    
    //因为代码块blockLocalArgument 通过typedef 跟firstCus & secondCus 都是全局
    //代码块可以访问与它相同的有效范围的声明的变量

 
}


- (void) validateCodeBlockSomeTip
{
    //typedef double(^testArguments) (double object1,double object2) ;
    
    //int (^multiply_block)(int number) = ^(int number) { return (value * number);};
 
    double (^regiondddDefine)(double d) = ^(double d) { return 23.00;};
    double (^justTestArgumentName)(double argument1) =^(double a) {return a;};//can be different

    //define group username and code name for this
    double *firstNumber =45;
    
}













@end