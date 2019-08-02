Pod::Spec.new do |s|
  s.name = 'LogStat'
  s.version = '0.7.3'
  s.summary = 'LogStat.'
  s.license = 'MIT'
  s.authors = {"binluo"=>"luobin02@baijiahulian.com"}
  s.homepage = 'http://git.baijiashilian.com/'
  s.description = '统计SDK'
  s.requires_arc = true
  s.source = { :http => 'https://img.baijiayun.com/0baijiatools/8f7ac3770fdbf297a4931557b64386a9/LogStat-0.7.3.zip' }
  s.ios.deployment_target    = '7.0'
  s.ios.vendored_frameworks  = 'LogStat-0.7.3/LogStat.framework'
  s.dependency 'AFNetworking'
  s.dependency 'FMDB'
end
