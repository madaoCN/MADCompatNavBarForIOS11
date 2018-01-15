# MADCompatNavBarForIOS11
更新iOS11后, 不少地方需要进行适配，本文主要讲下UISearchBar的适配，首先我们来看两张图对比

![iOS10下的导航栏样式](http://upload-images.jianshu.io/upload_images/1749699-99d952e743412d59.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)

![iOS11下的导航栏样式](http://upload-images.jianshu.io/upload_images/1749699-f2ca886d1537b0c2.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)

我们发现设置 __navigationItem.titleView__ 和 直接__addSubview__ 的 __UISearchbar__样式发生了明显的变化，新版本的圆角有差异，而且 __UITextField__输入的高度明显更高些

更有意思的是，设置__iOS11__下设置__navigationItem.titleView__  为  __UISearchbar__ ，导航栏的高度和__UISearchbar__ 高度也相应的从 __44__ 变成了 __56__

![iOS11下SearchBar高度](http://upload-images.jianshu.io/upload_images/1749699-1df567d7f0511a3a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)


为解决一致性问题, 我们需要解决两个问题
> 1、__导航栏和UISearchbar高度__
>2、__UISearchbar的UITextFiled高度__

对于第一点可以使用设置约束的方法来解决
```swift
// iOS11版本以后 高度限制为44
if (IOS11_ORLATER) {
[self.heightAnchor constraintEqualToConstant:44].active = YES;
}
```

对于第二点，可以动态设置__UISearchbar__的__UITextFiled__高度
```swift
// 设置边距
CGFloat top = 8;
CGFloat bottom = top;
CGFloat left = 12;
CGFloat right = left;
_insets = UIEdgeInsetsMake(top, left, bottom, right);

.....
// 获取UITextField实例
NSArray *subviewArr = self.subviews;
for(int i = 0; i < subviewArr.count ; i++) {
    UIView *viewSub = [subviewArr objectAtIndex:i];
    NSArray *arrSub = viewSub.subviews;
    for (int j = 0; j < arrSub.count ; j ++) {
        id tempId = [arrSub objectAtIndex:j];
        if([tempId isKindOfClass:[UITextField class]]) {
            _searchField = (UITextField *)tempId;
        }
    }
}
.....
// 动态设置UITextField的frame
if (IOS11_ORLATER) {
      // iOS11版本以后进行适配
      CGRect frame = searchField.frame;
      CGFloat offsetX = frame.origin.x - _insets.left;
      CGFloat offsetY = frame.origin.y - _insets.top;
      frame.origin.x = _insets.left;
      frame.origin.y = _insets.top;
      frame.size.height += offsetY * 2;
      frame.size.width += offsetX * 2;
      searchField.frame = frame;
}
```

最终效果：
![iOS11下的适配导航栏样式](http://upload-images.jianshu.io/upload_images/1749699-b76d1518e3367376.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)
