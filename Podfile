platform :ios, '10.0'
inhibit_all_warnings!

def test_pod
  pod 'iOSSnapshotTestCase', '5.0.2'
  pod 'Quick'
  pod 'Nimble'
end

target 'NatDSTests' do
  use_frameworks!
  test_pod
end
