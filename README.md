<h1 align="center">점수판!!!</h1>

![title](https://img.shields.io/badge/iOS-13.0-orange)

[![점수판!!!](https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store-kr.svg)](https://apps.apple.com/us/app/점수판/id1501335416?l=ko&ls=1)

## Contents

[toc]

## Concept

- 부모님이 취미로 탁구를 하고 싶어하시는 것을 듣고 탁구 점수판을 참고하여 만들었습니다.
- 일반적인 점수에도 사용할 수 있게 점수를 올리고 내리는 기능만을 넣었습니다.



## Code

- 화면 회전 처리

```swift
    /// 화면 회전 가능 여부
    override var shouldAutorotate: Bool {
        return true
    }
    
    /// 원하는 화면 회전 방향
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }    
```

화면 회전을 설정해주지만 이것은 navigation의 RootView에서만 작용합니다. 즉, push된 view에서 사용한다고 해도 작용하지 않습니다.

하지만 이것은 navigation의 RootView에서만 작용합니다. 즉, push된 view에서 사용한다고 해도 작용하지 않습니다.



```swift
let value = UIDeviceOrientation.landscapeLeft.rawValue
UIDevice.current.setValue(value, forKey: "orientation")
```

점수판 화면에서는 landscape를 해야합니다. 그래서, 화면 이동시에 화면을 강제로 회전시키기 위해서 디바이스에게 원하는 방향을 알려줍니다.



``` swift
// AppDelegate
func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
  if self.shouldSupportLandScape {
  	return UIInterfaceOrientationMask.landscape
  } else {
  	return UIInterfaceOrientationMask.portrait
  }
}

// 각 화면에서의 처리
let appDelegate = UIApplication.shared.delegate as! AppDelegate
appDelegate.shouldSupportLandScape = false
```

하지만 점수판 view인 상태에서, background에서 foreground로 전환할때 portrait인 상태로 보이게 됩니다.

왜냐하면 rootView는 portrait인 상태이기 때문에 foreground로 전환되면서 rootView의 supportedInterfaceOrientations를 실행하기 때문입니다.

그래서, 각 화면에서 앱의 orientation선택지를 하나로 고정해서 그 화면에서는 어떤 상태에서든 고정된 상태로 작성했습니다.