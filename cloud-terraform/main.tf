terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
}

variable "folder_id" {
 type = string
 description = "YC Folder ID"
}

variable "sa_id" {
 type = string
 description = "YC SA ID"
}

resource "yandex_serverless_container" "my_container" {
  name        = "my-first-container"
  description = "A sample serverless container"
  folder_id   = var.folder_id # Replace with your Yandex Cloud folder ID

  # Define the revision for the container
  revision {
    image {
      url     = "cr.yandex/crprpai76362s82qgl49/bondarevsky:latest" # Replace with your Container Registry image URL
      digest  = "sha256:your_image_digest" # Optional: specify image digest for immutability
      command = ["/app/start.sh"] # Optional: command to execute within the container
      args    = ["--env", "production"] # Optional: arguments for the command
    }

    resources {
      memory = 128 # Memory in MB
      cores  = 1   # Number of cores
    }

    execution_timeout = "10s" # Timeout for container execution
    service_account_id = var.sa_id # Replace with your service account ID
  }
}
