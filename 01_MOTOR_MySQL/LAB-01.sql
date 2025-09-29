/*markdown
# Laboratorio Práctico: Motores de Almacenamiento MySQL y Tablas del Sistema

En este laboratorio, utilizarás la Interfaz de Línea de Comando (CLI) de MySQL para llevar a cabo una variedad de funciones relacionadas con la selección y comprensión de algunos de los motores de almacenamiento alternativos disponibles en MySQL. Luego continuarás explorando las tablas del sistema en MySQL que contienen metadatos sobre los objetos en el servidor.


## Objetivos
Después de completar este laboratorio, podrás utilizar la interfaz de línea de comando de MySQL para:

- Crear tablas utilizando motores de almacenamiento alternativos.
- Consultar las tablas del sistema de MySQL para recuperar metadatos sobre los objetos en la base de datos.
*/

/*markdown
## Base de Datos Utilizada en este Laboratorio
La base de datos World utilizada en este laboratorio proviene de la siguiente fuente: https://dev.mysql.com/doc/world-setup/en/ bajo la Licencia CC BY 4.0 con Copyright 2021 - Statistics Finland.

Utilizarás una versión modificada de la base de datos para el laboratorio, así que para seguir las instrucciones del laboratorio con éxito, por favor utiliza la base de datos proporcionada con el laboratorio, en lugar de la base de datos de la fuente original.

El siguiente diagrama ERD muestra el esquema de la base de datos World:

![alt text](image/image.png)

La primera fila es el nombre de la tabla, la segunda es la clave primaria y los elementos restantes son atributos adicionales.
*/

/*markdown
## Ejercicio 1: Crea tu base de datos

1. Ve a Skills Network Toolbox haciendo clic en el ícono que se muestra a continuación desde el IDE en la nube lanzado lado a lado.

2. En el menú desplegable Bases de datos, haz clic en MySQL para abrir la pestaña de sesión del servicio MySQL.

3. Haz clic en el botón Crear y espera hasta que se inicie la sesión del servicio MySQL.

![alt text](image/image-1.png)

El servidor MySQL tardará unos momentos en iniciarse. Una vez que esté listo, verás la etiqueta verde “Activo” cerca de la parte superior de la ventana.

![alt text](image/image-2.png)

Desplázate hacia abajo y copia la contraseña.

![alt text](image/image-3.png)

- **NOTA**: Siempre que necesites ingresar la contraseña de tu sesión del servicio MySQL desde la pestaña de sesión del servicio MySQL en cualquier paso del laboratorio, copia la contraseña haciendo clic en el pequeño botón de copiar a la derecha del bloque de contraseña. Pega la contraseña en la terminal usando Ctrl + V (Mac: ⌘ + V) y presiona Enter en el teclado. Por razones de seguridad, no verás la contraseña mientras se ingresa en la terminal.

4. Haz clic en el botón Nueva Terminal desde la pestaña de sesión del servicio mysql. Ahora necesitas obtener dos archivos de script mysql para el almacenamiento de sesión del usuario en la nube. Copia el comando a continuación haciendo clic en el pequeño botón de copiar en la parte inferior derecha del bloque de código. Luego pégalo en la terminal en el indicador de línea de comando usando Ctrl + V (Mac: ⌘ + V) y Enter en el teclado. Haz esto para cada uno de los comandos a continuación uno a la vez.

[world_mysql_script.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql)

```bash
    wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql
```

5. Inicia una sesión de línea de comandos mysql haciendo clic en el botón MySQL CLI desde la pestaña de sesión del servicio mysql.

![alt text](image/image-4.png)

*/

/*markdown

6. Crea una nueva base de datos world utilizando el comando a continuación en la terminal:

```bash
    CREATE DATABASE world;
```

![alt text](image/image-5.png)
*/

CREATE DATABASE world;

/*markdown
7. ara usar la nueva base de datos world, utiliza el comando a continuación en la terminal:

```bash
    USE world;
```
*/

USE world;

/*markdown
8. Ejecuta el script mysql world (world_mysql.sql) para completar el proceso de creación de la base de datos world utilizando el comando a continuación en la terminal:

```bash
    SOURCE world_mysql_script.sql;
```
*/

/*markdown
9. Para listar todos los nombres de las tablas de la base de datos world, utiliza el comando a continuación en la terminal:

```bash
SHOW TABLES;
```

![alt text](image/image-6.png)
*/

/*markdown
## Ejercicio 2: Gestionar Motores de Almacenamiento MySQL

En MySQL, **Motores de Almacenamiento** son componentes que manejan operaciones SQL para diferentes tipos de tablas. El motor de almacenamiento predeterminado y más versátil en MySQL es InnoDB. Cuando creas una nueva tabla en MySQL usando el comando ``CREATE TABLE`` en la interfaz de línea de comandos, se crea una tabla InnoDB por defecto. Este es el más útil y se recomienda para la mayoría de las aplicaciones generales, excepto en algunos casos especializados.

Como se detalla en la [documentación de MySQL](https://dev.mysql.com/doc/refman/8.0/en/storage-engines.htmlhttps://dev.mysql.com/doc/refman/8.0/en/storage-engines.html), MySQL está construido con una arquitectura de motor de almacenamiento plugable que permite que los motores de almacenamiento se carguen y descarguen fácilmente de un servidor MySQL en ejecución.

1. Para ver una lista de los Motores de Almacenamiento soportados en tu servidor MySQL, ingresa el siguiente comando en la interfaz de línea de comandos de MySQL:

```bash
    SHOW ENGINES;
```

![alt text](image/image-7.png)

Como puedes ver, hay varias columnas. La primera columna da el nombre del Motor de Almacenamiento y la siguiente columna nos indica si ese motor es soportado en tu servidor MySQL. Como puedes ver, el motor InnoDB está listado como el DEFAULT.
*/

show engines;

/*markdown

## El Motor de Almacenamiento CSV
Del comando ``SHOW ENGINES;`` que ejecutaste anteriormente, puedes ver que el motor CSV es soportado en el servidor MySQL en ejecución actual. Los archivos CSV, que son las siglas de Comma Separated Values (Valores Separados por Comas), son archivos de texto delimitados que utilizan una coma para separar los valores.

Vamos a intentar crear una tabla en nuestra base de datos utilizando el motor de almacenamiento CSV.

2. Para crear una nueva tabla con un motor de almacenamiento diferente al motor InnoDB predeterminado, especificamos el motor de almacenamiento que deseamos usar dentro del comando `CREATE TABLE`. Vamos a crear una nueva tabla llamada “test_csv” utilizando el motor CSV ingresando el siguiente comando en la CLI:

```bash
    CREATE TABLE csv_test (i INT NOT NULL, c CHAR(10) NOT NULL) ENGINE = CSV;
```
*/

USE world;
DROP TABLE IF EXISTS csv_test;
CREATE TABLE csv_test (i INT NOT NULL, c CHAR(10) NOT NULL) ENGINE = CSV;

/*markdown
3. Confirmemos que la tabla se creó correctamente con el siguiente comando:

```bash
    SHOW TABLES;
```

![alt text](image/image-8.png)
*/

SHOW TABLES;

/*markdown
4. Vamos a agregar algunos datos de muestra en nuestra tabla. Añadiremos tres entradas con el siguiente comando:

```bash
    INSERT INTO csv_test VALUES(1,'data one'),(2,'data two'),(2,'data three');
```
*/

INSERT INTO csv_test  
VALUES
        (1, 'data one'),
        (2, 'data twoo'),
        (2, 'data three');

/*markdown
5. Echa un vistazo a los nuevos valores que ingresaste con la CLI:

```bash
    SELECT * FROM csv_test;
```

![alt text](image/image-9.png)


*/

SELECT * FROM csv_test;

/*markdown
Como puedes ver, los motores de almacenamiento CSV funcionan de muchas de las mismas maneras que los motores InnoDB predeterminados, sin embargo, hay algunas limitaciones. Estas incluyen la falta de soporte para indexación o particionamiento.

Como viste por ti mismo en la salida del comando ``SHOW ENGINES;``, hay muchos motores de almacenamiento diferentes. ¡Te animamos a explorar y experimentar con ellos tú mismo! Puedes leer más sobre sus casos de uso específicos y limitaciones en la [documentación de MySQL](https://dev.mysql.com/doc/refman/8.0/en/storage-engines.html).
*/

/*markdown
## Ejercicio 3: Navegar por las Tablas del Sistema MySQL
El servidor MySQL contiene una base de datos llamada ``mysql``. Esta es la base de datos del sistema que contiene información requerida para que el servidor funcione, como metadatos sobre todas las demás tablas en la base de datos. Esta base de datos es uno de los casos especiales donde no se utiliza el motor de almacenamiento InnoDB por defecto. En su lugar, las tablas en la base de datos ``mysql`` utilizan el motor de almacenamiento MyISAM. En general, consultamos las tablas del sistema y rara vez las modificamos directamente.

Las tablas en la base de datos ``mysql`` se dividen en varias categorías, algunas de las cuales incluyen:

- Tablas del Sistema de Concesiones
- Tablas del Sistema de Información de Objetos
- Tablas del Sistema de Registros
- Tablas del Sistema de Ayuda del Lado del Servidor

Para tu referencia, una lista exhaustiva de las categorías se puede encontrar en la [Sección 5.7](https://dev.mysql.com/doc/refman/5.7/en/system-schema.html) de la documentación de MySQL.

## Categoría de Tablas del Sistema de Concesiones
Echemos un vistazo más profundo a la categoría de **Tablas del Sistema de Concesiones**. Contienen información sobre las cuentas de usuario y los privilegios otorgados a ellas.

1. Primero, veamos todas las bases de datos en el servidor MySQL ingresando el siguiente comando en la CLI:

```sql
SHOW DATABASES;
```

![alt text](image/image-10.png)
*/

SHOW DATABASES;

/*markdown
2. Ahora conéctate a los datos de mysql ingresando:

```sql
    USE mysql;
```
*/

USE mysql;

/*markdown
3. Echa un vistazo a todas las tablas en la base de datos ingresando lo siguiente en la CLI:

```sql
    SHOW TABLES;
```
*/

SHOW TABLES;

/*markdown
4. La tabla user contiene cuentas de usuario, privilegios globales y otras columnas no relacionadas con privilegios. Hay muchas columnas en esta tabla y es un poco difícil de ver, así que echemos un vistazo solo a la primera columna que lista los nombres de los usuarios en la base de datos. Ingresa lo siguiente en la CLI:

```sql
    SELECT User from user;
```

![alt text](image/image-11.png)
*/

SELECT User FROM user;

/*markdown
5. Vamos a agregar un nuevo usuario a la base de datos y ver si el cambio se refleja en la tabla de usuarios. Profundizaremos sobre cómo agregar usuarios a una base de datos más adelante en el curso en el Laboratorio Práctico: Gestión de Usuarios MySQL, Control de Acceso y Cifrado, pero por ahora, simplemente ejecutaremos un comando simple en la CLI que creará un nuevo usuario llamado “test_user”:

```sql
    CREATE USER test_user;
```
*/

CREATE USER test_user;

/*markdown
6. **Inténtalo tú mismo**: Confirma que la tabla user en la base de datos mysql se actualizó automáticamente para reflejar la adición del nuevo usuario que creaste. Ingresa el comando apropiado en la CLI para mostrar la columna User en la tabla de usuarios.

<details><summary>Pista (Haz clic aquí) </summary>

> Echa un vistazo al comando que ingresaste en el paso 4.
</details>
<br>
<details><summary>Solución (Haz clic aquí) </summary>

 ```sql   
    SELECT User from user;
```

![alt text](image/image-12.png)

</details>
*/

SELECT User FROM user;

/*markdown
## Consultar las Tablas de la Base de Datos ``INFORMATION_SCHEMA``

El ``INFORMATION_SCHEMA`` es una base de datos que se encuentra dentro de cada servidor MySQL. Contiene metadatos sobre el servidor MySQL, como el nombre de una base de datos o tabla, el tipo de datos de una columna o los privilegios de acceso. Ten en cuenta que esta base de datos contiene tablas de solo lectura, por lo que no puedes usar directamente ningún comando ``INSERT``, ``UPDATE`` o ``DELETE`` en ellas. Vamos a conectarnos a la base de datos.

1. **INTÉNTALO TÚ MISMO:** Usando la CLI de MySQL, visualiza todas las bases de datos en el servidor.

    <details><summary>Pista (Haz clic aquí) </summary>

    > Ya hiciste esto en el Paso 1 de la sección anterior sobre la categoría de Tablas del Sistema de Concesiones. Siéntete libre de referirte a eso para obtener orientación.
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql   
        SHOW DATABASES;
    ```

    ![alt text](image/image-13.png)

    Como puedes ver, la base de datos ``information_schema`` está allí por defecto.
    </details>
*/

SHOW DATABASES;

/*markdown
2. **Inténtalo tú mismo**: Ingresa el comando relevante en la CLI para conectarte a la base de datos ``information_schema``.

    <details><summary>Pista (Haz clic aquí) </summary>

    > Recuerda el comando que ingresaste en la sección anterior para conectarte a la base de datos `mysql`. ¿Cómo se puede modificar para conectarse a la base de datos `information_schema`?
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql 
        USE information_schema;
    ```
    </details>
*/

USE information_schema;

/*markdown
3. En la base de datos ``information_schema``, existe una tabla llamada ``COLUMNS`` que contiene metadatos sobre las columnas de todas las tablas y vistas en el servidor. Una de las columnas de esta tabla contiene los nombres de todas las demás columnas en cada tabla. Vamos a ver los nombres de las columnas en la tabla ``country`` de la base de datos ``world`` ingresando el siguiente comando en la CLI:

```sql 
    SELECT COLUMN_NAME FROM COLUMNS WHERE TABLE_NAME = 'country';
```

![alt text](image/image-14.png)
*/

SELECT COLUMN_NAME 
FROM COLUMNS
WHERE TABLE_NAME = 'country';

/*markdown
4. Otro punto de interés en la base de datos ``information_schema`` es la tabla ``TABLES``, que contiene metadatos sobre todas las tablas en el servidor. Una de las columnas de esta tabla contiene información sobre el tipo de motor de almacenamiento de una tabla. Para relacionar esto con nuestra discusión anterior sobre motores de almacenamiento, ejecuta el siguiente comando en la CLI para ver el tipo de motor de almacenamiento para las tablas ‘country’, ‘city’, ‘countrylanguage’ y finalmente la tabla ‘csv_test’ que creaste:

```sql 
    SELECT table_name, engine FROM INFORMATION_SCHEMA.TABLES 
    WHERE table_name = 'country' OR table_name = 'city' 
    OR table_name = 'countrylanguage' OR table_name = 'csv_test';
```

![alt text](image/image-15.png)

Como se esperaba, las tres primeras tablas mencionadas utilizan el motor de almacenamiento InnoDB por defecto, mientras que la tabla ‘csv_test’ utiliza el motor de almacenamiento CSV.
*/

SELECT table_name, engine 
FROM information_schema.TABLES
WHERE table_name = 'country' OR table_name = 'city' OR table_name = 'countrylanguage' OR table_name = 'csv_test';

/*markdown
5. Finalmente, la tabla ``TABLES`` en la base de datos ``information_schema`` contiene información sobre el tamaño de una tabla dada en bytes. Esta información se almacena en dos columnas: **data_length** y **index_length**, que almacenan el tamaño de los datos en la tabla y el tamaño del archivo de índice para esa tabla, respectivamente. Por lo tanto, el tamaño total de la tabla es la suma de los valores en estas dos columnas. Este valor se daría en bytes; sin embargo, si deseas usar una unidad más conveniente, la suma se puede convertir a kB dividiendo por 1024. Puedes encontrar el tamaño de las tablas (en kB) que consultaste en el paso anterior con el siguiente comando en la CLI:

```sql 
    SELECT table_name, (data_length + index_length)/1024 FROM INFORMATION_SCHEMA.TABLES 
    WHERE table_name = 'country' OR table_name = 'city' 
    OR table_name = 'countrylanguage' OR table_name = 'csv_test';
```

![alt text](image/image-16.png)
*/

SELECT table_name, (data_length + index_length)/1024 AS 'TAMAÑO EN KB'
FROM information_schema.tables
WHERE table_name = 'country' OR table_name = 'city' OR table_name = 'countrylanguage' OR table_name = 'csv_test';

/*markdown
## Ejercicio 4: ¡Pruébalo tú mismo!
En este ejercicio práctico, reunirás lo que aprendiste sobre motores de almacenamiento en MySQL para crear primero una nueva tabla utilizando el motor de almacenamiento MyISAM, que no es el predeterminado. Luego aplicarás lo que aprendiste sobre las tablas del sistema de MySQL para obtener metadatos sobre tu tabla recién creada.

1. Pruébalo tú mismo: Primero, conéctate a la base de datos ``world`` utilizando la CLI:

    <details><summary>Sugerencia (Haz clic aquí) </summary>

    > El comando para conectarse a una base de datos tiene la siguiente forma general:

    ```sql
        USE <nombre de la base de datos>;
    ```
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql
        USE world;
    ```
    </details>
    <br>
*/

USE World;

/*markdown
2. Pruébalo tú mismo: Crea una nueva tabla llamada ``MyISAM_test`` que utilice el motor de almacenamiento ``MYISAM``.

    <details><summary>Sugerencia (Haz clic aquí) </summary>

    > Recuerda que hiciste algo muy similar en el Ejercicio 2 cuando creaste una nueva tabla utilizando el motor de almacenamiento csv. ¿Qué puedes cambiar en el comando que usaste para realizar esta tarea?
    Para ahorrarte el desplazamiento, aquí está el comando que usaste en el Ejercicio 2 para crear csv_test:

    ```sql
        CREATE TABLE csv_test (i INT NOT NULL, c CHAR(10) NOT NULL) ENGINE = CSV;
    ```
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql
        CREATE TABLE MyISAM_test (i INT NOT NULL, c CHAR(10) NOT NULL) ENGINE = MYISAM;
    ```

    Esto creará una tabla vacía llamada ``MyISAM_test`` donde la primera columna, llamada ``i``, eventualmente contendrá un entero, y la segunda columna, llamada ``c``, contendrá hasta 10 caracteres.
    </details>
    <br>
*/

DROP TABLE IF EXISTS MyISAM_test;
CREATE TABLE MyISAM_test (i INT NOT NULL, c CHAR(10) NOT NULL) ENGINE = MYISAM;

/*markdown
3. Pruébalo tú mismo: A continuación, querrás consultar una tabla en la base de datos ``information_schema``, pero antes de eso, tendrás que conectarte a la base de datos primero. Usa la CLI para conectarte a la base de datos ``information_schema``.

    <details><summary>Sugerencia (Haz clic aquí) </summary>

    > Recuerda lo que hiciste en el Paso 1 de este ejercicio práctico. Este paso es muy similar.
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql
        USE information_schema;
    ```
    </details>

    <br>
*/

USE information_schema;

/*markdown
4. Pruébalo tú mismo: Usando la CLI, consulta la tabla ``TABLES`` en la base de datos ``information_schema`` para mostrar las columnas ``table_name`` y engine de todas las tablas que tienen ``table_schema = 'world'``. Confirma que la tabla que creaste en este ejercicio está allí y tiene el motor de almacenamiento correcto.

    <details><summary>Sugerencia (Haz clic aquí) </summary>

    > Para consultar columnas específicas en una tabla basándote en alguna condición, usa un comando de la forma:

    ```sql
        SELECT <columna_1>, <columna_2>, ... FROM <nombre de la tabla> WHERE <condición>;
    ```

    **Sugerencia adicional**: En este caso, el nombre de la tabla debería ser ``INFORMATION_SCHEMA.TABLES``.
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql
        SELECT table_name, engine FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = 'world';
    ```

    ![alt text](image/image-17.png)

    Como puedes ver, la tabla ``MyISAM_test`` está allí y utiliza el motor de almacenamiento MyISAM como se esperaba.
    </details>
    <br>
*/

SELECT table_name, engine
FROM information_schema.TABLES
WHERE table_schema = 'world'

/*markdown
  
## Conclusión
¡Felicidades! Has completado este laboratorio práctico y ahora entiendes los conceptos básicos de los motores de almacenamiento de MySQL y tienes las habilidades para crear nuevas tablas con motores de almacenamiento alternativos para casos de uso especializados. Además, has adquirido cierta familiaridad con las tablas del sistema en MySQL y cómo consultarlas para recuperar metadatos sobre otros objetos en tu base de datos.
*/