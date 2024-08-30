terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.13"  # Убедитесь, что используете актуальную версию
    }
  }
}

provider "yandex" {
  token     = "y0_AgAAAABpz355AATuwQ............-84jrYfKZA"
  cloud_id  = "b1gkrl9mfer1a......"
  folder_id = "b1gojdb2a.......ljt"
}

resource "yandex_compute_instance" "vm_instance" {
  count = 3
  name  = "instance-${count.index + 1}"
  zone = "ru-central1-d"
  platform_id = "standard-v2"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8j0uq7qcvtb65fbffl"  # Замените на актуальный image_id
    }
  }

  network_interface {
    subnet_id = "fl8e3n200......vcgba"  # Замените на ваш subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
    ssh-keys  = "andrew:${file("/home/andrew/.ssh/id_rsa.pub")}"
  }
}


output "instance_ips" {
  value = [for instance in yandex_compute_instance.vm_instance : instance.network_interface[0].nat_ip_address]
}
