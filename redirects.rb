# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.vmware.com$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.vmware.com' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from docs.pivotal.io/csb-aws/index.html to docs.vmware.com Cloud Service Broker for AWS docs

r301  %r{/csb-aws/index.html}, "https://docs-staging.vmware.com/en/Cloud-Service-Broker-for-AWS/1.1/cloud-service-broker-aws/GUID-index.html"
r301  %r{/csb-aws/}, "https://docs-staging.vmware.com/en/Cloud-Service-Broker-for-AWS/1.1/cloud-service-broker-aws/GUID-index.html"
r301  %r{/csb-aws/(.*)}, "https://docs-staging.vmware.com/en/Cloud-Service-Broker-for-AWS/1.1/cloud-service-broker-aws/GUID-index.html"
