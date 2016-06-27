# TWAlertView

[![Version](https://img.shields.io/cocoapods/v/TWAlertView.svg?style=flat)](http://cocoapods.org/pods/TWAlertView)
[![License](https://img.shields.io/cocoapods/l/TWAlertView.svg?style=flat)](http://cocoapods.org/pods/TWAlertView)
[![Platform](https://img.shields.io/cocoapods/p/TWAlertView.svg?style=flat)](http://cocoapods.org/pods/TWAlertView)

This pod is inspired by UIAlertController. TWAlertView will automatically recognise the top most view controller to display the alert, making showing a simple alert a hazzel free task.

## Usage

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
// Override point for customization after application launch.
    [TWAlertView showAlert:@"Hello" message:@"What do you like to do today?" buttonsArray:[NSArray arrayWithObjects:@"Socialise",@"Code", nil] callback:^(NSError *error, int buttonIndex) {
        if (error) {
            NSLog(@"%@",error.debugDescription);
        }else{
            switch (buttonIndex) {
            case 0:
                [self socialise];
                break;
            case 1:
                [self code];
                break;
            default:
                break;
            }
        }
    }];


    return YES;
}

- (void)socialise{
    [TWAlertView showAlert:@"Warning!" message:@"Are you sure you want to compromise your valuable time?"];
}

- (void)code{
    [TWAlertView showAlert:@"Nice!" message:@"Good choice buddy"];
}

```

## Installation

TWAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TWAlertView', '0.1.2'
```

## License

TWAlertView is available under the MIT license. See the LICENSE file for more info.

## Todo

- Support action sheet style
