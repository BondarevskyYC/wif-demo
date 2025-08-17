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



resource "yandex_serverless_container" "serverless_container" {
  name               = "mibon1"
  memory             = 128
  service_account_id = var.sa_id
  image {
    url = "cr.yandex/crprpai76362s82qgl49/bondarevsky:latest"
  }
}

resource "yandex_serverless_container" "test-container-with-digest" {
  name   = "mibon2"
  service_account_id = var.sa_id
  memory = 128
  image {
    url    = "cr.yandex/crprpai76362s82qgl49/bondarevsky:latest"
  }
}


