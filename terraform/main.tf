variable "aws_access_key" {}

variable "aws_account_id" {}

variable "aws_region" {
  default = "ap-northeast-1"
}

variable "aws_secret_key" {}

provider "aws" {
  access_key = "${var.aws_access_key}"
  region = "${var.aws_region}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_route53_zone" "primary" {
  name = "c4se.jp"
}

resource "aws_route53_record" "primary_root_a_record" {
  name = "c4se.jp"
  records = ["219.94.162.102"]
  ttl = "300"
  type = "A"
  zone_id = "${aws_route53_zone.primary.zone_id}"
}
