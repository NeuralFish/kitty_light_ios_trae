# kitty_light_ios_trae
为尝试最新的 code 开发工具，我尝试使用 Trae 从 0 开始实现了复刻了一个 iOS 版本的小猫补光灯。
以下为成品：
![iOS 模拟器截图](/images/scrren.png)
![更多功能](/images/more.png)

# chatlog
下面是我和 Trae 的聊天记录，同时每次聊天结束后，我都把对应的修改记录 commit 到当前 repo 上，方便大家理解 Trae 的修改过程。

1. 
我想开发一个 ios app

2. 
怎么运行呢

3. 
```
failure in void __BKSHIDEvent__BUNDLE_IDENTIFIER_FOR_CURRENT_PROCESS_IS_NIL__(NSBundle *__strong) (BKSHIDEvent.m:90) : missing bundleID for main bundle NSBundle </Users/neuralfish/Library/Developer/Xcode/DerivedData/kitty_light_ios_trae-atlrdjbdsifwmsgpuwiafezisrkc/Build/Products/Debug-iphonesimulator> (loaded): {

}
```

4.
resource 'Info.plist' in target 'KittyLight' is forbidden; Info.plist is not supported as a top-level resource file in the resources bundle

5.
![](/images/main.PNG)
我想实现的是这样一个界面，上面有一排颜色，下面可以调整颜色，然后最下面有两排调整饱和度和亮度的进度条，调整这些配置之后，iPhone的屏幕就会显示出对应的颜色和亮度