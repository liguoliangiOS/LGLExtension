# LGLExtension

[![CI Status](https://img.shields.io/travis/lgliang/LGLExtension.svg?style=flat)](https://travis-ci.org/lgliang/LGLExtension)
[![Version](https://img.shields.io/cocoapods/v/LGLExtension.svg?style=flat)](https://cocoapods.org/pods/LGLExtension)
[![License](https://img.shields.io/cocoapods/l/LGLExtension.svg?style=flat)](https://cocoapods.org/pods/LGLExtension)
[![Platform](https://img.shields.io/cocoapods/p/LGLExtension.svg?style=flat)](https://cocoapods.org/pods/LGLExtension)

## Description 
 
 `LGLExtension`是一个`Swift`的轻量级的库，主要目的还是可以便捷的编写代码， 欢迎大家提意见和扩充内容。


## Installation

```ruby
pod 'LGLExtension'
```

## Explanation

- 1、给`结构体（ LGL<Base>）`添加不同类的`便捷构造器和设置属性的方法`。
- 2、使用泛型`<Base>`使得可以接收不同的类。
- 3、每个类通过遵循协议` LGLCompatible`使得每个类都拥有 `LGL()`和 `LGL.self`,以便通过前缀 `lgl`来调用添加的方法。
- 4、 对原有的类侵入少。

## Use

- 1、使用说明：

  | 类  | 类方法初始化 |  实例（xxx）设置属性 |
  | --- |--- |--- |
  | UIView |   UIView.lgl.view(...) |  xxx.lgl.set(...) |
  | UILabel |   UILabel.lgl.label(...) |  xxx.lgl.set(...) |
  | UIImageView |   UIImageView.lgl.imagView(...) |  xxx.lgl.set(...) |
  | UITextField |   UITextField.lgl.textField(...) |  xxx.lgl.set(...) |
  | UIButton |   UIButton.lgl.button(...) |  xxx.lgl.set(...) |
  | UIColor |   UIColor.lgl.color(...) |   |
  | UIBarButtonItem |   UIBarButtonItem.lgl.item(...) |   |
  | UINavigationController |    |  xxx.lgl.set(...) |
  | UITabBarController |    |  xxx.lgl.set(...) |
  | UIImage |   |  xxx.lgl.set(...) |
  | NSRegularExpression | NSRegularExpression.lgl.isMatch(...) 、 NSRegularExpression.lgl.replacement(...)| - |
  | String | -| xxx.lgl.set(...)、 xxx.lgl.get(...) 、  xxx.lgl.isMatch(...) 、xxx.lgl.isCharacterSetWithStr(...)|

 `有些通过实例设置属性的可能不仅仅是 xxx.lgl.set(),  也有 xxx.lgl.setxxx(...)`

- 2、关于Frame的属性

| -  | - |  -|  -|
| :-: |:-: |:-: |:-: |
| x | y |width |height|
|centerX | centerY | origin | size|
| top| left | right | bottom |

## Example 

这里只列举部分使用举例，其他的类似。`UIButton`的添加点击依旧以`addTarget(...)`
- 1、设置颜色
```
//颜色使用一
let color1 = UIColor.lgl.color(0xFF69B4)
//颜色使用二
let color2 = UIColor.lgl.color("#7B68EE")
```

- 2、UILabel

``` 
//使用方式一 通过类名直接创建
let label = UILabel.lgl.label("这是UILabel1", color1, font)

//使用方式二 设置属性
let label2 = UILabel()
label2.lgl.set("这是UILabel2", color2, font)


 //切角
label.lgl.setRadius(.allCorners, 10)
label.lgl.setRadius([.topLeft, .bottomRight], 10)
//设置圆角和边框
label.lgl.setBorderRadius(10, true, color1, 2)
        
```

## Other

`LGLExtension `我会持续扩展方法，如果您也想要补充进来一些内容，欢迎随时联系我QQ：185226139。我会将您的名字添加到`Contribution`下面。

## Author

liguoliangiOS, 185226139@qq.com

## Contribution 

欢迎留下您的大名🙂！

## License

LGLExtension is available under the MIT license. See the LICENSE file for more info.
