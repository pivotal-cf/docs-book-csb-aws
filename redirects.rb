# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.vmware.com$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.vmware.com' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}
