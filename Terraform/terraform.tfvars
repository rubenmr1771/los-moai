#####################
# Variables comunes #
#####################
company             = "los-moai"
app_name            = "vm-test-ubuntu-moai"
environment         = "dev"
location            = "westeurope"
resource_group_name = "rg_FCT_Capgemini_2023_Losmoai"
count-number        = 2

######################
# Credenciales Azure #
######################
azure-tenant-id       = "41ab59d4-05c4-4f27-b1b3-304baaf3c44a"
azure-subscription-id = "8df38d37-e466-425f-b08b-9b9970aea6c5"
//azure-client-id       = ""
//azure-client-secret   = ""

#######
# Red #
#######
network-vnet-cidr   = "10.7.0.0/16"
network-subnet-cidr = "10.7.1.0/24"

##################
# Información VM #
##################
linux_vm_size        = "Standard_D2s_V3"
linux_admin_username = "moaisupremo"