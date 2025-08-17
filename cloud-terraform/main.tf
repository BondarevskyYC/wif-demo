terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}



variable "folder_id" {
 type = string
 description = "YC Folder ID"
}

variable "sa_id" {
 type = string
 description = "YC SA ID"
}

provider "yandex" {
  zone = "ru-central1-a"
  folder_id = var.folder_id
}

resource "yandex_serverless_container" "my_container2" {
  name = "my-serverless-app-2026"
  image {
    url = "cr.yandex/crprpai76362s82qgl49/bondarevsky:latest"
  }
  cores           = 1
  memory          = 256
  concurrency     = 4
  execution_timeout = "60s"
  service_account_id = var.sa_id
  environment = {
    MY_ENV_VAR = "some_value"
  }
}

resource "yandex_serverless_container" "my_container" {
  name        = "my-bondarevsky-container-2026"
  description = "A sample serverless container"
  folder_id   = var.folder_id # Replace with your Yandex Cloud folder ID

  # Define the revision for the container
  revision {
    image {
      url     = "cr.yandex/crprpai76362s82qgl49/bondarevsky:latest" 
    }

    resources {
      memory = 128 # Memory in MB
      cores  = 1   # Number of cores
    }

    execution_timeout = "10s" # Timeout for container execution
    service_account_id = var.sa_id # Replace with your service account ID
  }
}
