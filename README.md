# SDDouYu
高仿斗鱼直播, 代码不断更新中....

iOS如何提供自己的开发技术, 今天和一位朋友聊天说到‘如何提高提高自己的开发技术’？扪心自问，倒也没有哪些技术可以说是精通。

今天开始, 利用闲暇时间仿写 斗鱼, 也看看自己的水平到底如何

2016-5-11
1. 利用Charles看了一下直播类的app，斗鱼app抓包到的数据相对来说比较全面，就以这个为目标开始仿写吧
2. 今天写完了首页中的tableview(内嵌collectionview),点击效果也OK
tips: 如果一个控件左边是image，右边是lable，这样直接用button就可以满足基本的需求了。😊

2016-5-12
1. 今天又偷懒完善了一下首页的功能,抓包抓到斗鱼的数据,首页没有那么光秃秃了
2. 首页上面有一个轮播的小功能, 正好用到我之前开源的一个小组件SDBannberView(支持CocoaPods)。那么问题来了,有Bug😢😢😢
3. ReactiveCocoa看了好长时间了,就在这个项目中试一下吧
   ![image](https://github.com/momo13014/SDDouYu/blob/master/screenshot/douyu_20160512.gif)

Let's do IT!
