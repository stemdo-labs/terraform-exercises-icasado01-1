# Ejercicio 03
## Añadir variables nuevas
Añadimos las variables al archivo variables.tf

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/639ae530-2293-4ee1-ba44-2d4e5eba9042)

## Definir el valor de las variables
Definimos el valor de cada variable que hemos añadido

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/909f2207-935a-4430-a35f-122804c1708f)

## Archivo locals.tf
En este archivo definimos el merge de las variables en caso de que indiquemos la variable opcional vnet_tags

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/eb1e1b1f-08e3-41a1-90d0-a9d4d86aa741)

## Archivo main.tf
En el archivo main, añadimos las nuevas variables haciendo referencia a local.tags

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/dc3c0c71-c04a-48d2-89ac-6f97d417ec71)

## Resultado
**Sin definir la variable opcional *vnet_tags***

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/8e0963d7-0816-4c6a-b2a2-2300966074e3)

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/0ce71901-3158-4794-b061-b25b51a9f49c)

**Si definimos la variable *vnet_tags***

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/e360902d-169a-40fe-a57b-39afe7d0ac57)

**Si definimos un tag que ya exista en *vnet_tags***

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/11220559-270f-4ba6-9923-99c320374854)
