Pod::Spec.new do |s|
  s.name = 'BJLLogStat'
  
  # !!!: update
  s.version = '0.9.1'
  
  s.summary = 'BJLLogStat.'
  s.license = 'MIT'
  s.authors = {"binluo"=>"luobin02@baijiahulian.com"}
  s.homepage = 'https://github.com/baijia/'
  s.requires_arc = true
  
  # !!!: update
  s.source = { :http => 'https://img.baijiayun.com/0baijiatools/d0d9ebdd7d9f584b9ac5c0627a862e73/BJLLogStat.framework.zip' }
  
  s.ios.deployment_target    = '8.0'
  s.ios.vendored_frameworks  = 'BJLLogStat.framework'
  s.library = "sqlite3"
  
  # !!!: update
  s.dependency "BJLiveBase/Networking", "~> 1.3.1"
  
end
