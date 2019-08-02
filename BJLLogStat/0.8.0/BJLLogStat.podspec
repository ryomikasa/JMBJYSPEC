Pod::Spec.new do |s|
  s.name = 'BJLLogStat'
  s.version = '0.8.0'
  s.summary = 'BJLLogStat.'
  s.license = 'MIT'
  s.authors = {"binluo"=>"luobin02@baijiahulian.com"}
  s.homepage = 'http://git.baijiashilian.com/'
  s.description = '统计SDK'
  s.requires_arc = true
  s.source = { :http => 'https://img.baijiayun.com/0baijiatools/f4a948fb6720aac11bc75769f07856e2/LogStat-0.8.0.zip' }
  s.ios.deployment_target    = '8.0'
  s.ios.vendored_frameworks  = 'LogStat-0.8.0/BJLLogStat.framework'
  s.dependency 'AFNetworking'
  s.dependency 'FMDB'
end
