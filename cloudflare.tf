provider "cloudflare" {
  # email pulled from $CLOUDFLARE_EMAIL
  # token pulled from $CLOUDFLARE_TOKEN
}

variable "domain" {
  default = "educate.sh"
}
# go to CF for detailed docs.  not me.
resource "cloudflare_record" "evil" {
  domain  = "${var.domain}"
  name    = "zeus"
  value   = "" # HOST IP 
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
    # TODO: // add access and hsts
  }
}
