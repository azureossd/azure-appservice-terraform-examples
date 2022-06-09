
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
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
  }

  site_config {
    application_stack {
      # Python versions can be seen here - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app#python_version
      # Language stacks can be switched out based on the avaialble stacks in the above documentation
      python_version = "3.9"
    }
  }

  depends_on = [
    azurerm_service_plan.linux1
  ]
}

