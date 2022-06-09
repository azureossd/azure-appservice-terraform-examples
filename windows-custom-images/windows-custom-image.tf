
#### APP SERVICE #1 ###
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  features {}
}

resource "azurerm_service_plan" "win1" {
  name                = "yourappserviceplanname"
  resource_group_name = "yourresourcegroupname"
  location            = "eastus"
  os_type             = "WindowsContainer"
  sku_name            = "P1v3"
}


resource "azurerm_windows_web_app" "app1" {
  name                = "yourappservicename"
  resource_group_name = "yourresourcegroupname"
  location            = "eastus"
  service_plan_id     = azurerm_service_plan.win1.id

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"          = "yourcontainerregistry.azurecr.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"     = "yourContainerRegistryUsername"
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = "yourContainerRegistryPassword"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  site_config {
    application_stack {
      # dotnet version is needed or else the site will indefinitely throw HTTP 500's
      # See this: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app#current_stack
      dotnet_version            = "v4.0"
      docker_container_name     = "yourwindowscontainerimage"
      docker_container_tag      = "yourwindowscontainertag"
      docker_container_registry = "yourcontainerregistry.azurecr.io"
    }
  }

  depends_on = [
    azurerm_service_plan.win1
  ]
}

