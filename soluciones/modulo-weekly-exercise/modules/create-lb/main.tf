resource "azurerm_lb" "my_lb"{
  name = var.load_balancer_name
  location = var.location
  resource_group_name = var.resource_group
  sku = "Standard"

  frontend_ip_configuration {
    name = "frontend-ip"
    subnet_id = module.create-network.subnet_id[0]
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "my_lb_pool" {
  depends_on = [ azurerm_lb.my_lb ]
  loadbalancer_id = azurerm_lb.my_lb.id
  name = "test-pool"
}

resource "azurerm_lb_probe" "my_lb_probe" {
  depends_on = [ azurerm_lb.my_lb ]
  loadbalancer_id = azurerm_lb.my_lb.id
  name = "test-probe"
  port = 80
}

resource "azurerm_lb_rule" "my_lb_rule" {
  depends_on = [ azurerm_lb_probe.my_lb_probe, azurerm_lb_backend_address_pool.my_lb_pool ]
  loadbalancer_id = azurerm_lb.my_lb.id
  name = "test-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  disable_outbound_snat = true
  frontend_ip_configuration_name = "frontend-ip"
  probe_id = azurerm_lb_probe.my_lb_probe.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.my_lb_pool.id]
}