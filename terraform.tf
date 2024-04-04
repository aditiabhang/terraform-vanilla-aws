terraform {
  cloud {
    organization = "aditi-abhang"

    workspaces {
      name = "repro-workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }

  required_version = ">= 1.2.0"
}

provider "null" {
  # Configuration options
}

provider "aws" {
  region = "us-east-2"
}

variable "name_length" {
  description = "The number of words in the pet name"
  default     = "3"
}

resource "random_pet" "pet_name" {
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}
