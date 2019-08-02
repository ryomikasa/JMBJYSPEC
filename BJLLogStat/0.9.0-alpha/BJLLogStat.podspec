Pod::Spec.new do |s|
  s.name = 'BJLLogStat'
  s.version = '0.9.0-alpha'
  s.summary = 'BJLLogStat.'
  s.license = 'MIT'
  s.authors = {"binluo"=>"luobin02@baijiahulian.com"}
  s.homepage = 'http://git.baijiashilian.com/'
  s.description = '统计SDK'
  s.requires_arc = true
  s.source = { :http => 'https://img.baijiayun.com/0baijiatools/3ed2a998a1d08d1ef8eb871bc4250941/LogStat-0.9.0-alpha.zip' }
  s.ios.deployment_target    = '8.0'
  s.ios.vendored_frameworks  = 'LogStat-0.9.0-alpha/BJLLogStat.framework'
  s.library = "sqlite3"
  s.dependency "BJLiveBase/Networking", "~> 1.3.0-alpha"
end
