
# https://github.com/microdc/terraform-stacks/blob/master/LICENSE
#
variable "environment" { }
variable "public_zone_id" { }
variable "kubernetes_api_elb" { }

resource "aws_route53_record" "kubernetes_api_external" {
  zone_id = "${var.public_zone_id}"
  name    = "api${var.environment == "prod" ? "" : ".${var.environment}"}"
  type    = "CNAME"
  ttl     = "60"
  records = ["${var.kubernetes_api_elb}"]
}
