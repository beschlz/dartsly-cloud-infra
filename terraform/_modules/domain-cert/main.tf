resource "aws_route53_zone" "dartsly-hosted-zone" {
  name = var.domain_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "k3s-route53-record" {
  zone_id = aws_route53_zone.dartsly-hosted-zone.zone_id
  type    = "A"
  name    = "kube.${var.domain_name}"
  ttl     = 3000
  records = ["142.250.184.238"] // Placeholder, now transfers to google com
}

resource "aws_acm_certificate" "dartsly-certificate" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  subject_alternative_names = ["www.${var.domain_name}"]
}

resource "aws_acm_certificate_validation" "cert-validation" {
  certificate_arn         = aws_acm_certificate.dartsly-certificate.arn
  validation_record_fqdns = [aws_route53_record.k3s-route53-record.fqdn]
}

resource "aws_route53_record" "cert-validation-records" {
  for_each = {
    for dvo in aws_acm_certificate.dartsly-certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.dartsly-hosted-zone.zone_id
}

