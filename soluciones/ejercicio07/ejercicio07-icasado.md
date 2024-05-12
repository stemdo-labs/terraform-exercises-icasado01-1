# Ejercicio 7

## Módulos anidados
Este proyecto tiene la siguiente estructura

```
ejercicio07/
|-- modules/
|   |--create-vnet/
|       |--modules/
|       |  |--create-subnets 
|       
|-- main.tf
|-- variables.tf
|-- locals.tf
|-- terraform.tfvars
```
**main.tf**

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/084ee95c-eb85-44e4-8f5f-921e1edb6bdd)

**modules/create-vnet/main.tf**

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/e5ecaa4e-9c75-454a-a0fb-2152e9679f1b)

**modules/create-vnet/modules/create-subnets/main.tf**

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/cfab803b-da95-4f9d-a416-611c95468f4c)

## Planificar módulo

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/90277bed-6c5d-4ff5-a32b-6b7601a60669)

## Construir el módulo

****![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/8877a4b0-2c52-408f-820a-a1e72c8f2587)

## Destruir el módulo

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/df0f1097-cdcc-4bd5-9bb6-91baf555b870)
