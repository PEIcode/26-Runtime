//
//  Person+tope.m
//  26-Runtime
//
//  Created by sunny&pei on 2018/6/6.
//  Copyright © 2018年 sunny&pei. All rights reserved.
//

#import "Person+tope.h"
#import <objc/runtime.h>
@implementation Person (tope)
static char *PersonName = "lpzlpz";
//如果没有写属性的setter和getter方法 会给出以下警告
//Property 'name' requires method 'name' to be defined - use @dynamic or provide a method implementation in this category
//Property 'name' requires method 'setName:' to be defined - use @dynamic or provide a method implementation in this category
/** 分类是不能合成属性的，因为合成属性会生成对应的实例变量，而分类是不允许添加实例变量的（实例变量所在内存区域已初始化为不可更改，无法在动态运行时修改之）。
    虽然不能增加实例变量，但是添加属性还是可以的，只不过需要自己在分类中实现get和set方法，同时标记属性为动态获取
    其中一种方法叫做关联引用，实现了用存取器来访问属性，当然实际上并没有实例变量，所以本质上只不过是增加了两个方法而已。
 */
-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, PersonName, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)name{
    return objc_getAssociatedObject(self, PersonName);
}
-(void)say{
    NSLog(@"%s ---- %@",__func__,self);
}
-(NSString *)description{
    return [NSString stringWithFormat:@"<%ld,%@>",(long)self.age,self.name];
}
@end
