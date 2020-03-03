platform :ios, '13.0'
use_frameworks!

target 'TinkoffProject' do

  pod 'SwiftLint'
  pod 'R.swift'
  pod 'TinkoffAuth', :path => 'LocalPods/TinkoffAuth'
#  pod 'TinkoffTickets', :path => 'LocalPods/TinkoffTickets'

end

pre_install do |installer|
    installer.pod_targets.flat_map do |pod_target|
        if pod_target.pod_target_srcroot.include? 'Development Pods'
            pod_target_srcroot = pod_target.pod_target_srcroot
            pod_target_path = pod_target_srcroot.sub('${PODS_ROOT}/..', '.')
            pod_target_sources_path = pod_target_path + '/' + pod_target.name + '/Sources'
            generated_file_path = pod_target_sources_path + '/R.generated.swift'
            File.new(generated_file_path, 'w')
        end
    end
end
