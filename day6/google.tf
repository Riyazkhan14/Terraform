provider "google" {
   region = "asia-south2"
   project = "myteraform"
   credentials = "myteraform-key.json"
}


resource "google_compute_instance" "os1" {
	name = "os1"
	machine_type = "e2-micro"
	zone = "asia-south2-a" 
boot_disk {
	initialize_params {
		image = "debian-cloud/debian-11"
}
}
network_interface {
	network = "default"
}
}
