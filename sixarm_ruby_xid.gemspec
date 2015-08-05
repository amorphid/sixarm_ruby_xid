# -*- coding: utf-8 -*-

Gem::Specification.new do |s|
  s.name           = 'sixarm_ruby_xid'
  s.summary        = 'SixArm.com » Ruby » XID: Xeno Identifier'
  s.description    = 'XID generates a new random id, suitable for foreign keys, security authentication, unique tracking, etc.'
  s.version        = '3.4.2'

  s.author         = 'SixArm'
  s.email          = 'sixarm@sixarm.com'
  s.homepage       = 'http://sixarm.com/'
  s.licenses       = %w(BSD GPL MIT PAL Various)

  s.signing_key    = '/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem'
  s.cert_chain     = ['/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem']

  s.platform       = Gem::Platform::RUBY
  s.require_path   = 'lib'
  s.has_rdoc       = true

  s.files = [
    'Rakefile',
    'lib/sixarm_ruby_xid.rb'
  ]

  s.test_files = [
    'test/sixarm_ruby_xid_test.rb'
  ]

  s.add_development_dependency('minitest', '>= 5.7.0', '< 6')
  s.add_development_dependency('rake', '> 10.4.2', '< 11')
  s.add_development_dependency('simplecov', '>= 0.10.0', '< 2')
  s.add_development_dependency('coveralls', '>= 0.8.2', '< 2')
end
