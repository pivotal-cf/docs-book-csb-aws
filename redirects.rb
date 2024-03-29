# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.vmware.com$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.vmware.com' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from docs.pivotal.io/csb-aws/1-2 to docs.vmware.com build service docs

r301  %r{/csb-aws/1-2/index.html}, "https://docs.vmware.com/en/Tanzu-Cloud-Service-Broker-for-AWS/1.2/csb-aws/GUID-index.html"
r301  %r{/csb-aws/1-2/}, "https://docs.vmware.com/en/Tanzu-Cloud-Service-Broker-for-AWS/1.2/csb-aws/GUID-index.html"
r301  %r{/csb-aws/1-2}, "https://docs.vmware.com/en/Tanzu-Cloud-Service-Broker-for-AWS/1.2/csb-aws/GUID-index.html"
r301  %r{/csb-aws/1-2/(.*)}, "https://docs.vmware.com/en/Tanzu-Cloud-Service-Broker-for-AWS/1.2/csb-aws/GUID-$1"
