Pod::Spec.new do |s|
  s.name             = 'GradientAnimatorView'
  s.version          = '1.1'
  s.summary          = 'A custom UIView with an ability to animate a linear gradient layer for a given set of colors.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wimansha/GradientAnimator'
  s.license          = 'MIT'
  s.author           = { 'Wimansha Chathuranga' => 'ewimansha@gmail.com' }
  s.source           = { :git => 'https://github.com/wimansha/GradientAnimator.git', :commit => 'da383506a0034bd90854099760361c9467008129' }
  #s.source           = { :git => 'https://github.com/wimansha/GradientAnimator.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Lib/**/*.{h,m,c}'

end
