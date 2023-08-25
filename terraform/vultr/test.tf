variable "vultr_api_key" {
	type = string
}

# resource "vultr_instance" "test_instance" {
#     plan = "vc2-1c-1gb"
#     region = "sea"
#     os_id = 167
# }

resource "vultr_kubernetes" "haenu" {
  # (resource arguments)
	# region = "sel"
	# label = "haenu"
	# version = "v1.27.2+1"
}