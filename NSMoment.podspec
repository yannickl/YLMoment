Pod::Spec.new do |s|
  s.name         = 'NSMoment'
  s.version      = ‘0.1.0’
  s.platform     = :ios, '5.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' } 
  s.summary      = ‘Provides an high abstraction level for parsing, validating, manipulating, and formatting the dates in Objective-C.'
  s.homepage     = 'https://github.com/YannickL/NSMoment'
  s.authors      = { 'Yannick Loriot' => 'http://yannickloriot.com' }
  s.source       = { :git => 'https://github.com/YannickL/NSMoment.git',
                     :tag => ‘0.1.0’ }
  s.source_files = ['NSMoment/*.{h,m}']
  s.requires_arc = true
end