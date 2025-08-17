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

//
// Create a new Serverless Container.
//
resource "yandex_serverless_container" "testcontainermibon" {
  name               = "somenamemibon2025"
  description        = "any description"
  memory             = 256
  execution_timeout  = "15s"
  cores              = 1
  core_fraction      = 100
  service_account_id = var.sa_id
  
  image {
    url = "cr.yandex/crprpai76362s82qgl49/bondarevsky:latest"
  }
}

//
// Create a new Serverless Container with Image digest.
//
resource "yandex_serverless_container" "test-container-with-digest" {
  name   = "somenamemibon2025123"
  memory = 128
  image {
    url    = "cr.yandex/crprpai76362s82qgl49/bondarevsky:latest"
  }
}


