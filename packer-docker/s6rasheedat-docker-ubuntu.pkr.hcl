packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:latest"
  commit = true
}

build {
  name    = "ubuntu-p_test-rasheedat"
  sources = ["source.docker.ubuntu"]
  provisioner "shell" {
    script = "docker-script.sh"

  }
  post-processors {
    post-processor "docker-tag" {
      repository = "rasheedata/docker-packer"
      tag        = ["v3.0.0"]
    }

    post-processor "docker-push" {
      login          = true
      login_username = "rasheedata"
      login_password = "{{ env `LOGIN_PASSWORD` }}"
    }
  }
}