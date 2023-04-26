resource "azurerm_resource_group" "tetris-resources" {
  name     = "tetris-deployment"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks-cluster-tetris" {
  name                = "aks-cluster-tetris"
  location            = azurerm_resource_group.tetris-resources.location
  resource_group_name = azurerm_resource_group.tetris-resources.name
  dns_prefix          = "tet_aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Testing"
  }
}
