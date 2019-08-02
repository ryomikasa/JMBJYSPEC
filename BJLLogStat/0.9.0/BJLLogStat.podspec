Pod::Spec.new do |s|
  s.name = 'BJLLogStat'
  # !!!: update
  s.version = '0.9.0'
  s.summary = 'BJLLogStat.'
  s.license = 'MIT'
  s.authors = {"binluo"=>"luobin02@baijiahulian.com"}
  s.homepage = 'https://github.com/baijia/'
  s.requires_arc = true
  # !!!: update
  s.source = { :http => 'https://img.baijiayun.com/0baijiatools/f344879abeea8e1772c4cc46047c85da/BJLLogStat.framework.zip' }
  s.ios.deployment_target    = '8.0'
  s.ios.vendored_frameworks  = 'BJLLogStat.framework'
  s.library = "sqlite3"
  # !!!: update
  s.dependency "BJLiveBase/Networking", "~> 1.3.0"
end
