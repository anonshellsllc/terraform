provider "cloudflare" {
  # email pulled from $CLOUDFLARE_EMAIL
  # token pulled from $CLOUDFLARE_TOKEN
}

variable "domain" {
  default = "lulz.sh"
}

resource "cloudflare_record" "www" {
  domain  = "${var.domain}"
  name    = "triton"
  value   = "178.79.160.236"
  type    = "A"
  proxied = true
}

resource "cloudflare_zone_settings_override" "lulz-sh-settings" {
  name = "${var.domain}"

  settings {
    tls_1_3 = "on"
    automatic_https_rewrites = "on"
    ssl = "strict"
    waf = "on"
  }
}
