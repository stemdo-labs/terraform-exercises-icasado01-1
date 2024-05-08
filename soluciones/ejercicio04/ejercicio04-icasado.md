# Ejercicio 4

## Condiciones
### `owner_tag`, `environment_tag` y `vnet_name` no pueden ser cadenas vacías ni ***nullable***.

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/c9b3b070-e2e3-47d8-ad9b-a41026075a0e)

### En environment_tags, los valores de los tags solo pueden contener uno de los siguientes valores, sin tener en cuenta mayúsculas o minúsculas (es decir, tanto 'dev', como 'DEv', como 'DEV' son valores aceptados): 'DEV', 'PRO', 'TES', 'PRE'.
  
Convertimos el valor en minúsculas para evitar problemas con el case sensitive

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/a4308e9d-38f9-429c-b35a-be1d258c4033)

**Pruebas**

Usando 'DEV' como tag:

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/99b470ac-ff29-4318-b845-646d7e7c8c0c)

Usando 'hola' como tag:

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/0359ba32-2967-4b4e-a76d-93f0d2460cba)

Usando 'pRo' como tag:

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/674c0f91-c964-4d4a-be9c-abcf93af18da)

### vnet_tags no pueder null y además ninguno de los valores del mapa puede ser null o cadena vacía.

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/0bd02db8-e435-4270-8e33-e6f44a55a1eb)

### Validar la variable vnet_name
**Opción 2**

Verifica que la variable empiece por 'vnet' y acabe por 'tfexercise' seguido de dos dígitos (no verifica que entre esas dos condiciones, existan al menos dos caracteres[a-z])

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/8263235a-a87a-41cf-874e-9b1d07ebb6e9)

- Empieza por 'vnet' y termina con dos dígitos, pero no tiene 'tfexercise'
  
![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/ced15f14-d0a2-4301-8af1-67927f14d5e4)

- No termina con dos dígitos

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/e97182c5-4f23-444f-af47-c13af4f41e6f)

- No empieza por vnet

![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/564025d3-0cef-421b-b724-aa355a1dfb02)

- Se cumple todo


![image](https://github.com/stemdo-labs/terraform-exercises-icasado01-1/assets/166407751/71aa551d-a79e-4f17-8cd6-9e0d1e8040fb)
