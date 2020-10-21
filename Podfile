# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

# Pods
def default_pods
  pod 'JGProgressHUD'
  pod 'Alamofire', '~> 4.9'
  pod 'AlamofireImage', '~> 3.6.0'
  pod 'RxSwift'
  pod 'RxCocoa'
end

# Pods for BeerApp
target 'BeerApp' do
  default_pods
end  

  
# Pods for testing
target 'BeerAppTests' do
  inherit! :search_paths    
  default_pods
end