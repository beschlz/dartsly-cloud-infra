# Module Domain Cert

This module can be used to setup an AWS Route 53 Hosted Zone with a domain bought from Google Domains. Since Google is the only registrar that sells .app and .dev TLDs i bought them there. The rest of the infrastructure is hosted in AWS.

1. Create and Hosted Zone in Route53
2. Change the Nameservers in Google Domains to the ones Route53 provides 