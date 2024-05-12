# Ejercicio 01

## Authenticate using the Azure CLI
Ejecutamos el comando az login e iniciamos sesión con el navegador.

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/b74f4ee2-d522-42bd-9841-2c760d3b28a4)

## Rescatar valores usando azure CLI

**Obtener información de la suscripción e indicar la suscripción que vamos a usar**

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/ab4e8a17-b913-4f08-9763-6126704fa1f8)

**Obtener valores del servicio principal**

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/2ddd3add-11e4-4f0f-83ce-eb6813570fc5)

**Crear variables temporales**

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/137ba2c8-673c-461a-8475-f4ab7813f0c2)

## Write configuration
Creamos la configuración del nuevo recurso

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/ba98358a-e1d9-4200-8d82-a1d58339234e)

## Initialize your Terraform configuration
Iniciamos el recurso con ```terraform init```

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/8f8ef1e3-a0d0-4f5c-a649-e531299331cc)

## Format and validate the configuration
Comprobamos el archivo de configuración con ```terraform fmt``` y con ```terraform validate```

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/90b0ae29-1ad8-4d1e-a7c2-85bea5c1835f)

## Apply your Terraform Configuration
Usamos el comando ```terraform apply``` para aplicar la configuración

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/c4196e58-a77c-48ab-a18d-fa591a35fee7)

## Inspect your state
Comprobamos el estado con el comando ```terraform show``` y con ```terraform state list```

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/8082f92c-21f4-4983-a7c4-c9e62e22dee3)


