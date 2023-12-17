//
//  CatView.m
//  LookinDemoOC
//
//  Created by likai.123 on 2023/10/16.
//

#import "CatView.h"
#import <UIKit/UIKit.h>

@interface CatView ()

@end

@implementation CatView

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

/// 实现该方法以在 Lookin 中展示自定义属性
/// 请留意该方法是否已经被父类、子类、分类实现了，如果是，为了避免冲突，你可以把该方法更名为 lookin_customDebugInfos_0（末尾的数字 0 可以被替换为 0 ～ 5 中的任意数字）
/// 每次 Lookin 刷新时都会调用该方法，因此若该方法耗时较长，则会拖慢刷新速度
///
/// Implement this method to display custom properties in Lookin.
/// Please note if this method has already been implemented by the superclass, subclass, or category. If so, to avoid conflicts, you can rename this method to lookin_customDebugInfos_0 (the trailing number 0 can be replaced with any number from 0 to 5).
/// This method is called every time Lookin refreshes, so if this method takes a long time to execute, it will slow down the refresh speed.
///
/// https://bytedance.feishu.cn/docx/TRridRXeUoErMTxs94bcnGchnlb
- (NSDictionary<NSString *, id> *)lookin_customDebugInfos {
    NSDictionary<NSString *, id> *ret = @{
        // 可选项。这些信息会在 Lookin 的右侧属性面板中被展示。
        // Optional. These details will be displayed in the right-hand property panel of Lookin.
        @"properties": [self catView_makeCustomProperties],
        // 可选项。这些信息会在 Lookin 左侧图层结构中被展示。
        // Optional. This information will be displayed in the layer structure on the left side of Lookin.
        @"subviews": [self catView_makeCustomSubviews],
        // 可选项。该 View 实例在 Lookin 左侧图层树中的名字。
        // Optional. The name of the view instance in the hierarchy panel on the left side of Lookin.
        @"title": @"CustomCatView",
        // 可选项。为 DanceUI 项目组预留的字段，项目组之外的人请忽略
        // Optional. Reserved fields for the DanceUI project team, please ignore if you are not part of the team.
        @"lookin_source": [self createDanceUIJson],
    };
    return ret;
}

- (NSArray *)catView_makeCustomProperties {
    NSMutableArray *properties = [NSMutableArray array];
    
    // string property
    [properties addObject:@{
        // 可选项。 在 Lookin 中展示的属性组的名称。
        // Optional. The name of the property group displayed in Lookin.
        @"section": @"CatInfo",
        // 必填项。在 Lookin 中展示的属性的名称。
        // Required. The name of the property displayed in Lookin.
        @"title": @"Nickname",
        // 可选项。在 Lookin 中展示的属性的值。如果属性值为 nil 则不要设置该项，否则 NSDictionary 可能由于插入 nil 而 Crash。
        // Optional. The value of the property displayed in Lookin. If the property value is nil, do not set this item, otherwise NSDictionary may crash due to inserting nil.
        @"value": @"Sushi",
        // 必填项。告知 Lookin 以 String 格式解析和展示该属性。
        // Required. Specify the format in which Lookin should parse and display the property.
        @"valueType": @"string",
        // 可选项。如果配置了该字段，则用户可以在 Lookin 中实时修改该属性。
        //【警告】这个 block 会被 Lookin 始终持有，因此请万分注意内存管理。
        // Optional. If this field is configured, users can modify the property by Lookin.
        // [Warning] This block will be retained by Lookin indefinitely, so please be extremely careful with memory management.
        @"retainedSetter": ^(NSString *newString) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // number property
    [properties addObject:@{
        @"section": @"CatInfo",
        @"title": @"Age",
        @"value": [NSNumber numberWithDouble:8],
        @"valueType": @"number",
        @"retainedSetter": ^(NSNumber *newNumber) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // bool property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"IsFriendly",
        @"value": [NSNumber numberWithBool:YES],
        @"valueType": @"bool",
        @"retainedSetter": ^(BOOL newBool) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // color property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"SkinColor",
        @"value": [UIColor blueColor],
        @"valueType": @"color",
        @"retainedSetter": ^(UIColor *newColor) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // rect property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"CatRect",
        @"value": [NSValue valueWithCGRect:CGRectMake(1, 2, 3, 4)],
        @"valueType": @"rect",
        @"retainedSetter": ^(CGRect newRect) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // size property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"CatSize",
        @"value": [NSValue valueWithCGSize:CGSizeMake(5, 6)],
        @"valueType": @"size",
        @"retainedSetter": ^(CGSize newSize) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // point property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"CatPoint",
        @"value": [NSValue valueWithCGPoint:CGPointMake(7, 8)],
        @"valueType": @"point",
        @"retainedSetter": ^(CGPoint newPoint) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // insets property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"CatInsets",
        @"value": [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(1, 2, 3, 4)],
        @"valueType": @"insets",
        @"retainedSetter": ^(UIEdgeInsets newInsets) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // shadow property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"CatShadow",
        @"value": @{
            @"opacity": @0.5,
            @"offset": [NSValue valueWithCGSize:CGSizeMake(5, 10)],
            @"radius": @2.5,
            // 可选项，没有该项则表示颜色为 nil
            // Optional. Do not set this item when the shadow color is nil.
            @"color": UIColor.redColor
        },
        @"valueType": @"shadow"
    }];
    
    // enum property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"Type",
        @"value": @"Corgi",
        @"valueType": @"enum",
        // 当 valueType 为 enum 时，必须设置该项，内容为所有可用的 enum 值。
        // When valueType is "enum", this item must be set, with the content being all available enum cases.
        @"allEnumCases": @[@"Corgi", @"Samoyed", @"Golden Retriever", @"Teddy"],
        @"retainedSetter": ^(NSString *newValue) {
            NSLog(@"Try to modify by Lookin.");
        }
    }];
    
    // json property
    [properties addObject:@{
        @"section": @"Animal Info",
        @"title": @"CatJson",
        @"value": [self createSomeJson],
        @"valueType": @"json"
    }];
    
    return [properties copy];
}

- (NSArray *)catView_makeCustomSubviews {
    NSMutableArray *subviews = [NSMutableArray array];
    
    [subviews addObject:@{
        // 必填项。该元素在 Lookin 中展示的名字。
        // Required. The name of the element displayed in Lookin.
        @"title": @"Fake Cat Subview",
        // 可选项。该元素在 Lookin 中展示的副标题。
        // Optional. The subtitle of the element displayed in Lookin.
        @"subtitle": @"Nice Baby",
        // 可选项。如果包含该项目，则 Lookin 会在中间图像区域展示一个线框。这里的 Rect 是相对于当前 Window 的（不是相对于父元素）。
        // Optional. If this item is included, Lookin will display a wireframe in the middle image area. The Rect here is relative to the current Window (not relative to the parent element).
        @"frameInWindow": [NSValue valueWithCGRect:CGRectMake(100, 100, 200, 300)],
        // 可选项。这些信息会展示在 Lookin 的右侧面板，字段格式参见上面的 catView_makeCustomProperties 方法
        // Optional. This information will be displayed in the right-hand panel of Lookin, with field formatting as described in the catView_makeCustomProperties method above.
        @"properties": @[
            @{
                @"section": @"CatInfo",
                @"title": @"Nickname",
                @"value": @"Tom",
                @"valueType": @"string",
            },
            @{
                @"section": @"CatInfo",
                @"title": @"Age",
                @"value": @8,
                @"valueType": @"number",
            },
        ]
    }];

    [subviews addObject:@{
        @"title": @"SomeConfig",
        @"lookin_source": [self createDanceUIJson],
        // 可选项。你可以递归地添加你的虚拟 subview。
        // Optional. You can recursively add your virtual subview.
        @"subviews": @[
            @{ @"title": @"CatConfig0" },
            @{ @"title": @"CatConfig1" }
        ]
    }];
    
    return [subviews copy];
}

- (NSString *)createSomeJson {
    NSArray *arr = @[
        @{
            @"title":  @"allowedBehaviors",
            @"desc": @"HostingControllerAllowedBehaviors",
            @"details": @[
                @{
                    @"title":  @"rawValue",
                    @"desc": @"0"
                }, @{
                    @"title":  @"contentScrollViewBridge",
                    @"desc": @"UIKitContentScrollViewBridge",
                    @"details": @[
                        @{
                            @"title":  @"bridgeSetEdges",
                            @"desc": @"[:]"
                        }, @{
                            @"title":  @"pixelLength",
                            @"desc": @"0.33333333"
                        }]
                }]
        },
        @{
            @"title":  @"scenePhase",
            @"desc": @"active"
        }
    ];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (NSString *)createDanceUIJson {
    NSDictionary *dict = @{
        @"type": @"DanceUIApp.ContentView",
        @"method": @"body.get",
        @"build_path": @"/Users/bytedance/Library/Developer/Xcode/DerivedData/DanceUIApp-ayaxbucdgzeouqefaavnvvhsjpvj/Build/Products/Debug-iphonesimulator/DanceUIApp.app/DanceUIApp"
    };
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
