#
# Be sure to run `pod lib lint TinkoffTickets.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TinkoffTickets'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TinkoffTickets.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Omar Minkailov/TinkoffTickets'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Omar Minkailov' => 'omar.min@mail.ru' }
  s.source           = { :git => 'https://github.com/Omar Minkailov/TinkoffTickets.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'

  s.source_files = 'TinkoffTickets/Classes/**/*'
  s.resources = 'TinkoffTickets/Resources/**/*'

  s.dependency 'R.swift', '~> 5.1.0'

  r_swift_script = '"$PODS_ROOT/R.swift/rswift" generate --accessLevel public "$PODS_TARGET_SRCROOT/TinkoffTickets/Classes/R.generated.swift"'
  s.script_phases = [{
      :name => 'R.swift',
      :input_files => ['$TEMP_DIR/rswift-lastrun'],
      :output_files => ['$PODS_TARGET_SRCROOT/TinkoffTickets/Classes/R.generated.swift'],
      :script => r_swift_script,
      :execution_position => :before_compile
  }]
end
