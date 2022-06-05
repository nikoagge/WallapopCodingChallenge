platform :ios, '13.0'

def common_pods
    use_frameworks!
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'Moya/RxSwift', '~> 14.0'
end

def common_pods_for_testing
    use_frameworks!
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'Moya/RxSwift', '~> 14.0'
    pod 'iOSSnapshotTestCase'
end

target 'WallapopCodingChallenge' do
	common_pods
end

target 'WallapopCodingChallengeTests' do
	common_pods_for_testing
end

target 'WallapopCodingChallengeUITests' do
	common_pods_for_testing
end

post_install do |installer|
    
    # Disable code coverage for all Pods and Pods Project
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
        end
    end
    installer.pods_project.build_configurations.each do |config|
        config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
    end
end