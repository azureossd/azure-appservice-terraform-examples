
#### APP SERVICE #1 ###
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  features {}
}

resource "azurerm_service_plan" "linux1" {
  name                = "yourappserviceplanname"
  resource_group_name = "yourresourcegroupname"
  location            = "eastus"
  os_type             = "Linux"
  sku_name            = "P1v2"
}


resource "azurerm_linux_web_app" "app1" {
  name                = "yourappservicename"
  resource_group_name = "yourresourcegroupname"
  location            = "eastus"
  service_plan_id     = azurerm_service_plan.linux1.id

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"          = "yourcontainerregistry.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"     = "yourContainerRegistryUsername"
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = "yourContainerRegistryPassword"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  site_config {
    application_stack {
      docker_image    = "yourcontainerregistry.azurecr.io/yourimage"
      docker_image_tag = "yourimagetag"
    }
  }

  depends_on = [
    azurerm_service_plan.linux1
  ]
}

