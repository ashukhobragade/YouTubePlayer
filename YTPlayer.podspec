Pod::Spec.new do |s|
  s.name         = "YTPlayer"
  s.version      = "1.0.1"
  s.summary      = "Swift library for embedding and controlling YouTube videos in your iOS applications"
  s.homepage     = "https://github.com/ashukhobragade/YouTubePlayer"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Ashish Khobragade" => "" }
  s.social_media_url   = ""
  s.platform     = :ios, "13.0"
  s.swift_version = '5.0'
  s.source       = { :git => "https://github.com/ashukhobragade/YouTubePlayer.git", :tag => "v#{s.version}" }
  s.source_files  = "YouTubePlayer/**/*.{swift,h,m}"
  s.exclude_files = "Classes/Exclude"
  s.resources = 'YouTubePlayer/**/*.html'
end
