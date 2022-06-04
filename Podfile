platform :ios, '13.0'

def common_pods
    use_frameworks!
    pod 'Alamofire', '~> 4.4'
    pod 'Kingfisher', '~> 4.8'
end

target 'WallapopCodingChallenge' do
	common_pods
end

target 'WallapopCodingChallengeTests' do
	common_pods
end

target 'WallapopCodingChallengeUITests' do
	common_pods
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