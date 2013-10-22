Pod::Spec.new do |s|
  s.name         = 'NSMoment'
  s.version      = '1.0.0'
  s.platform     = :ios, '5.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' } 
  s.summary      = 'An inspiration of moment.js for Objective-C.'
  s.homepage     = 'https://github.com/YannickL/NSMoment'
  s.authors      = { 'Yannick Loriot' => 'http://yannickloriot.com' }
  s.source       = { :git => 'https://github.com/YannickL/NSMoment.git',
                     :tag => '1.0.0' }
  s.source_files = ['NSMoment/*.{h,m}']
  s.requires_arc = true
end