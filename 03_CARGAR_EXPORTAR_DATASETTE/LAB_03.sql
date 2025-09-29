-- SQLBook: Markup
# [Laboratorio Práctico: Cargar y Exportar usando Datasette](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/Datasetteoptionallabs/Week2/Upload_and_Export_using_Datasette.md.html)

En este laboratorio, aprenderás cómo cargar y exportar datos en una tabla usando Datasette.

## Objetivos
Después de completar este laboratorio, podrás usar Datasette:

Subir un archivo CSV a una tabla en Datasette.
Exportar datos desde Datasette.

## Base de Datos
El primer conjunto de datos utilizado en este laboratorio proviene de la siguiente fuente: https://dataplatform.cloud.ibm.com/exchange/public/entry/view/5562ced564e776edc5f91e13d48d8309?context=cpdaas. Este conjunto de datos es publicado por IBM y contiene datos puntuales para una lista de muestra de hospitales en los EE. UU.

Ten en cuenta que estos son datos de muestra para fines de demostración de SQL y no son necesariamente actuales o precisos.
-- SQLBook: Markup
## Ejercicio 1: Cargar datos en un Datasette creando una tabla.

En este ejercicio, pasarás por un ejemplo de cómo cargar un archivo CSV y crear una tabla utilizando la herramienta Datasette.

1. Una vez que la herramienta Datasette esté lanzada usando la herramienta abierta, haz clic en la Herramienta de Navegación y luego selecciona la opción Agregar Conjuntos de Datos en la esquina derecha.

![alt text](images/image.png)
-- SQLBook: Markup
2. Luego serás redirigido a una página donde debes ingresar la URL completa del conjunto de datos CSV en el cuadro de texto.

Haz clic derecho en el enlace
([Hospitals.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/hospitals.csv)) y copia la dirección del enlace.

Ingresa la URL copiada en el cuadro de texto y haz clic en Crear.

![alt text](images/image-1.png)
-- SQLBook: Markup
3. Luego, esto creará la tabla HOSPITALES con los datos cargados desde el archivo CSV.

Una consulta select relacionada con la tabla aparecerá por defecto en la sección del área de texto.

Haz clic en el botón **Enviar Consulta** para ver los resultados.

![alt text](images/image-2.png)
-- SQLBook: Markup
4. Has creado y cargado con éxito la tabla HOSPITALES.

![alt text](images/image-3.png)
-- SQLBook: Markup
5. Modifica tu consulta select como se indica a continuación para obtener el número total de registros en la tabla.

```sql
    SELECT count(*) FROM hospitals;
```

![alt text](images/image-4.png)
-- SQLBook: Markup
## Ejercicio 2: Exportar una tabla desde Datasette.
En el Ejercicio 1, aprendiste cómo subir datos desde un archivo a una base de datos de Datasette. Ahora, en este ejercicio, exportarás una tabla de la base de datos a un archivo CSV.

1. Primero, haz clic en el enlace de inicio en la parte superior de la página en la herramienta.

![alt text](images/image-5.png)
-- SQLBook: Markup

2. Haz clic en el enlace de la tabla hospitales como se destaca a continuación:

![alt text](images/image-6.png)
-- SQLBook: Markup
3. Haz clic derecho en el CSV y copia la dirección del enlace.

![alt text](images/image-7.png)
-- SQLBook: Markup

4. Pega la URL en una nueva pestaña y presiona ENTER. Ahora esto mostrará todos los datos presentes en la tabla.

![alt text](images/image-8.png)
-- SQLBook: Markup
5. Para guardar el archivo, haz clic derecho y selecciona GUARDAR COMO.

![alt text](images/image-9.png)
-- SQLBook: Markup
6. Ingresa Nombre-archivo.csv, selecciona Todos los archivos del menú desplegable y haz clic en GUARDAR.

![alt text](images/image-10.png)
-- SQLBook: Markup
7. inalmente, tu archivo CSV descargado aparecerá como se muestra a continuación:

![alt text](images/image-11.png)