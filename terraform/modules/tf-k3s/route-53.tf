
resource "aws_route53_record" "k3s-route53-record" {
  zone_id = "Z03689943F24I9NF087LL"
  type = "A"
  name = "kube.bschulz.dev"
  ttl = 3000
  records = [ "142.250.184.238" ]
}
