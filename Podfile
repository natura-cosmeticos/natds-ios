platform :ios, '10.0'
inhibit_all_warnings!

workspace 'NatDS'

project 'NatDS.xcodeproj'
project 'SampleApp/NatDS-SampleApp.xcodeproj'

def test_pod
  pod 'Quick'
  pod 'Nimble'
end

target 'NatDSTests' do
project 'NatDS.xcodeproj'
  use_frameworks!
  test_pod
end

target 'NatDSSnapShotTests' do
project 'NatDS.xcodeproj'
  use_frameworks!
  pod 'SnapshotTesting'
end

target 'NatDS-SampleApp' do
project 'SampleApp/NatDS-SampleApp.xcodeproj'
  use_frameworks!
end
