# BeerApp

iOS Code Challenge

## Requirements
* iOS 13.0+
* Xcode 11+
* Swift 5.0

## Compatibility
This demo is expected to be run using Swift 5.0 and Xcode 11+

## Objective
This is a simple app used for getting and search beers

Data source: https://punkapi.com/documentation/v2

## Usage
- Clone this repository
- Run the pod install `pod install`
- Open `BeerApp.xcworkspace`
- Launch in Simulator
- For run the app in a real device you'll need a provisiong profile (wildcard recommended) 

## Stack
- Solid principles
- MVVM + Rx

## 3rd Party Libraries
 - **`RxSwift`** - Swift version of Rx 
 - **`RxCocoa`** - A framework that makes Cocoa APIs used in iOS and OS X easier to use with reactive techniques.
 - **`Alamofire`** - Probably best networking framework
 - **`AlamofireImage`** - Extension for getting images with Alamofire
 - **`JGProgressHUD`** - Nice and easy loading HUD

 ## TODO:
 - Include Dependency Injection for DataManager
 - Improve UI
 - Add UnitTesting
 - Add UI test
 - Include Fastlane to automate your development and release process
 - Improve networking system instead of call Alamofire directly from DataManager
