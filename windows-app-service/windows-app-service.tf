
#### APP SERVICE #1 ###
provider "azurerm" {
  subscription_id = "00000000-0000-0000-0000-000000000000"
  features {}
}

resource "azurerm_service_plan" "win1" {
  name                = "yourappserviceplanname"
  resource_group_name = "yourresourcegroupname"
  location            = "eastus"
  os_type             = "Windows"
  sku_name            = "P1v2"
}


resource "azurerm_windows_web_app" "app1" {
  name                = "yourappservicename"
  resource_group_name = "yourresourcegroupname"
  location            = "eastus"
  service_plan_id     = azurerm_service_plan.win1.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
    # Node version on Windows App Service is actually controlled through this App Settings
    "WEBSITE_NODE_DEFAULT_VERSION"        = "~16"
  }

  site_config {
    application_stack {
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app#current_stack
      # Language stacks can be switched out based on the avaialble stacks in the above documentation
      current_stack = "node"
      node_version  = "16-LTS"
    }
  }

  depends_on = [
    azurerm_service_plan.win1
  ]
}

