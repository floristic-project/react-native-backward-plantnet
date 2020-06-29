
Pod::Spec.new do |s|
  s.name         = "RNBackwardPlantnet"
  s.version      = "1.0.0"
  s.summary      = "RNBackwardPlantnet"
  s.description  = <<-DESC
                  Provide migration utility from PlantNet mobile app v2 (native) to v3. 
                   DESC
  s.homepage     = "https://github.com/floristic-project/react-native-backward-plantnet"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNBackwardPlantnet.git", :tag => "master" }
  s.source_files  = "RNBackwardPlantnet/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  
