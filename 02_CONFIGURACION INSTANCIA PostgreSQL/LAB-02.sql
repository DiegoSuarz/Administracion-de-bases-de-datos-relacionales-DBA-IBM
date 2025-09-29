/*markdown
# [Configuración de la Instancia de PostgreSQL y Catálogo del Sistema](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/labs/PostgreSQL/Lab%20-%20PostgreSQL%20Instance%20Configuration%20and%20System%20Catalog/instructions.md.html)

En este laboratorio, obtendrás experiencia práctica en la personalización de la configuración de una instancia de servidor PostgreSQL, tanto a través de la interfaz de línea de comandos (CLI) como editando los archivos de configuración. Además, aprenderás a navegar y consultar el catálogo del sistema de PostgreSQL, que es una serie de tablas que almacenan metadatos sobre los objetos en la base de datos.

## Objetivos
Después de completar este laboratorio, podrás:

- Personalizar los parámetros de configuración de tu instancia de servidor PostgreSQL
- Consultar el catálogo del sistema para recuperar metadatos sobre los objetos de la base de datos

## Base de Datos Utilizada en Este Laboratorio
En este laboratorio, utilizarás una base de datos de https://postgrespro.com/education/demodb distribuida bajo la [licencia de PostgreSQL](https://www.postgresql.org/about/licence/). Almacena un mes de datos sobre vuelos de aerolíneas en Rusia y está organizada de acuerdo con el siguiente esquema:

![alt text](image/image.png)
*/

/*markdown
## Lanzando PostgreSQL en Cloud IDE
Para comenzar con este laboratorio, lanza PostgreSQL utilizando el Cloud IDE. Puedes hacerlo siguiendo estos pasos:

1. Haz clic en el botón de extensión de Skills Network en el panel izquierdo.

2. Abre el menú desplegable **DATABASES** y haz clic en **PostgreSQL**.

3. Haz clic en el botón Start. PostgreSQL puede tardar unos momentos en iniciarse.

> Nota: Si la base de datos de PostgreSQL no funciona correctamente, es posible que debas detenerla y reiniciarla en caso de que no se inicialice.

## Descargando y Creando la Base de Datos
Primero, necesitarás descargar la base de datos.

1. Abre una nueva terminal haciendo clic en el botón New Terminal cerca de la parte inferior de la interfaz.

![alt text](image/image-1.png)


*/

/*markdown
2. Ejecuta el siguiente comando en la terminal:

```bash
    wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/example-guided-project/flights_RUSSIA_small.sql
```

El archivo que descargaste es una copia de seguridad completa de un mes de datos de vuelos en Rusia. Ahora, puedes realizar una restauración completa del conjunto de datos abriendo primero el CLI de PostgreSQL.

*/

/*markdown

3. Cerca de la parte inferior de la ventana, haz clic en el botón “Postgres CLI” para lanzar la interfaz de línea de comandos.

![alt text](image/image-2.png)
*/

/*markdown


4. En el CLI de PostgreSQL, ingresa el comando \i <file_name>. En tu caso, el nombre del archivo será el nombre del archivo que descargaste, ``flights_RUSSIA_small.sql``. Esto restaurará los datos en una nueva base de datos llamada ``demo``.

```bash
    \i flights_RUSSIA_small.sql
```

Las restauraciones pueden tardar unos momentos en completarse.


*/

/*markdown
Verifica que la base de datos se haya creado correctamente ingresando el siguiente comando:

```bash
    \dt
```

Deberías ver la siguiente salida mostrando todas las tablas que son parte del esquema ``bookings`` en la base de datos ``demo``.

![alt text](image/image-3.png)
*/

/*markdown
## Ejercicio 1: Configura tu instancia de servidor PostgreSQL
Una instancia de servidor PostgreSQL tiene un archivo correspondiente llamado ``postgresql.conf`` que contiene los parámetros de configuración para el servidor. Al modificar este archivo, puedes habilitar, deshabilitar o personalizar de otra manera los ajustes de tu instancia de servidor PostgreSQL para que se adapten mejor a tus necesidades como administrador de bases de datos. Aunque puedes modificar manualmente este archivo ``postgresql.conf`` y reiniciar el servidor para que los cambios surtan efecto, también puedes editar algunos parámetros de configuración directamente desde la interfaz de línea de comandos (CLI).

En este ejercicio, personalizarás los ajustes de configuración para la instancia de PostgreSQL utilizando la CLI.

1. Primero, echemos un vistazo a la configuración actual del parámetro ``wal_level``. Puedes hacerlo ingresando el siguiente comando en la CLI:

```sql
    SHOW wal_level;
```

Sin entrar en demasiados detalles, el parámetro wal_level dicta cuánta información se escribe en el registro de escritura anticipada (WAL), que puede ser utilizado para la archivación continua. Si estás interesado, puedes encontrar más información en la documentación oficial de PostgreSQL.
*/

SHOW wal_level;

/*markdown
2. El comando ``ALTER SYSTEM`` es una forma de modificar los valores predeterminados globales de una instancia de PostgreSQL sin tener que editar manualmente el archivo de configuración. Intentémoslo y cambiemos el parámetro ``wal_level`` a ``logical``. Para cambiar el parámetro, ingresa el siguiente comando en la CLI:

```sql1
    ALTER SYSTEM SET wal_level = 'logical';
```

*/

ALTER SYSTEM SET wal_level = 'logical';

/*markdown

3. Inténtalo tú mismo: Usa la CLI para verificar la configuración actual de ``wal_level``.

    <details><summary>Pista (Haz clic aquí)</summary>

    > Recuerda que realizaste esta acción exacta anteriormente en este ejercicio; siéntete libre de mirar atrás como referencia.
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí)</summary>

    ```sql
        SHOW wal_level;
    ```

    ![alt text](image/image-4.png)

    En el Paso 2, cambiaste el parámetro ``wal_level`` de ``replica`` a ``logical``, sin embargo, el comando que acabas de ingresar muestra que el parámetro sigue configurado como ``replica``. ¿Por qué podría ser esto? Resulta que algunos parámetros de configuración requieren un reinicio del servidor antes de que cualquier cambio surta efecto; el ``wal_level`` es uno de esos parámetros.

    </details>
    <br>
*/

SHOW wal_level;

/*markdown
4. Detén el servidor PostgreSQL haciendo clic en el botón “Detener” y cierra todas las pestañas de CLI y terminal.
Detener el servidor PostgreSQL

![alt text](image/image-5.png)
*/

/*markdown
5. Ahora reinicia el servidor PostgreSQL haciendo clic en el botón “Iniciar”. Puede tardar unos momentos en volver a arrancar. Cuando lo haga, vuelve a abrir la CLI de PostgreSQL.

![alt text](image/image-6.png)
*/

/*markdown
6. Cuando ejecutaste el comando ``ALTER SYSTEM`` en el Paso 2 de este ejercicio, se creó un nuevo archivo llamado p``ostgres.auto.conf``. Puedes abrir el archivo primero abriendo el explorador de archivos en Cloud IDE y luego haciendo clic en ``postgres > data > pgdata> postgresql.conf``.

![alt text](image/image-7.png)


![alt text](image/image-8.png)

Este archivo fue modificado automáticamente para contener el nuevo parámetro que configuraste usando el comando `ALTER SYSTEM` en el Paso 2. Cuando iniciaste nuevamente el servidor PostgreSQL, leerá este archivo y configurará el parámetro `wal_level` a `logical`.
*/

/*markdown
7. Finalmente, y por última vez en este laboratorio, confirmemos la configuración actual del parámetro ``wal_level``. Ingresa lo siguiente en la CLI:

```sql
    SHOW wal_level;
```

![alt text](image/image-9.png)

Puedes ver que el parámetro se cambió correctamente después del reinicio.
*/

SHOW wal_level;

/*markdown
8. Para una configuración de instancia más avanzada donde se requieren muchos cambios de parámetros, usar una serie de comandos ``ALTER SYSTEM`` puede ser engorroso. En su lugar, puedes editar el archivo ``postgresql.conf`` directamente. Puedes volver a usar el explorador de archivos de Cloud IDE para abrir ``postgres > data > pgdata> postgresql.conf``.

![alt text](image/image-10.png)

Puedes editar el archivo de configuración directamente en el explorador de archivos de Cloud IDE.

![alt text](image/image-11.png)
*/

/*markdown
## Ejercicio 2: Navegar el Catálogo del Sistema
El catálogo del sistema almacena metadatos de esquema, como información sobre tablas y columnas, así como información interna de contabilidad. En PostgreSQL, los catálogos del sistema son tablas regulares en las que puedes agregar columnas e insertar y actualizar valores. Al modificar directamente los catálogos del sistema, puedes causar problemas graves en tu sistema, por lo que generalmente se recomienda evitar hacerlo. En cambio, los catálogos del sistema se actualizan automáticamente al realizar otros comandos SQL. Por ejemplo, si ejecutas un comando ``CREATE DATABASE``, se crea una nueva base de datos en el disco y se inserta automáticamente una nueva fila en la tabla del catálogo del sistema ``pg_database``, almacenando metadatos sobre esa base de datos.

Primero, necesitas conectarte a la base de datos ingresando el siguiente comando:

```sql
    \connect demo
```

Exploramos algunas de las tablas del catálogo del sistema en PostgreSQL.

1. Comencemos con una consulta simple de ``pg_tables``, que es un catálogo del sistema que contiene metadatos sobre cada tabla en la base de datos. Consultémoslo para mostrar metadatos sobre todas las tablas que pertenecen al esquema ``bookings`` en la base de datos ``demo`` ingresando el siguiente comando en la CLI:

```sql
    SELECT * FROM pg_tables WHERE schemaname = 'bookings';
```

![alt text](image/image-12.png)
*/

SELECT datname FROM pg_database;


SELECT * FROM pg_tables WHERE schemaname = 'bookings';

/*markdown
Como puedes ver, las 8 tablas que pertenecen al esquema ``bookings`` se muestran con varias piezas de metadatos, como el propietario de la tabla y otros parámetros.

>Nota:
>Si encuentras una palabra clave negra "END" en tu pantalla, como se muestra en la imagen a continuación

![alt text](image/image-13.png)

>Esto indica que has llegado al final de la sesión actual.
>Para salir de la sesión:
- Simplemente escribe :/q en el símbolo del sistema. Esto cerrará la sesión actual y te devolverá al símbolo "demo=#".

2. Supongamos que, como administrador de la base de datos, deseas habilitar la seguridad a nivel de fila para la tabla ``boarding_passes`` en la base de datos ``demo``. Cuando la seguridad a nivel de fila está habilitada en una tabla, todo acceso normal a la tabla para seleccionar o modificar filas debe ser especificado por una política de seguridad de filas. Dado que las políticas de seguridad de filas no son el enfoque de este laboratorio, no profundizaremos en la especificación de una política, sino que simplemente la habilitaremos para fines de demostración. Sin embargo, si deseas aprender más sobre este tema, puedes consultar la [documentación de PostgreSQL](https://www.postgresql.org/docs/9.5/ddl-rowsecurity.html). Para habilitar la seguridad a nivel de fila en la tabla ``boarding_passes``, ingresa el siguiente comando en la CLI:

```sql
    ALTER TABLE boarding_passes ENABLE ROW LEVEL SECURITY;
```
*/

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');

ALTER TABLE boarding_passes ENABLE ROW LEVEL SECURITY;

/*markdown
3. Inténtalo tú mismo: Usa la CLI para consultar ``pg_tables`` y mostrar metadatos sobre las tablas que pertenecen al esquema ``bookings`` y confirmar que la seguridad a nivel de fila para ``boarding_passes`` fue habilitada con éxito.

    <details><summary>Sugerencia (Haz clic aquí) </summary>

    > Recuerda el comando que ingresaste anteriormente en este ejercicio para consultar pg_tables.
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql
        SELECT * FROM pg_tables WHERE schemaname = 'bookings';
    ```

    ![alt text](image/image-14.png)

    Como puedes ver, la ``boarding_passes`` tiene ``t``, por “verdadero”, bajo la columna ``rowsecurity``, lo que nos indica que la seguridad a nivel de fila fue habilitada con éxito.
    </details>
    <br>
*/

SELECT *
FROM pg_tables 
WHERE schemaname = 'bookings';

/*markdown
4. Conectemos tu trabajo en la sección anterior sobre la configuración de la instancia de PostgreSQL con los catálogos del sistema. Anteriormente, usaste declaraciones ``SHOW`` para mostrar parámetros de configuración. También hay un catálogo del sistema llamado ``pg_settings`` que almacena datos sobre los parámetros de configuración del servidor PostgreSQL. Consultemos con el siguiente comando:

```sql
    SELECT name, setting, short_desc FROM pg_settings WHERE name = 'wal_level';
```

![alt text](image/image-15.png)
*/

SELECT name, setting, short_desc
FROM pg_settings
WHERE name = 'wal_level'

/*markdown
De la consulta, ves los mismos resultados de la declaración ``SHOW`` en el Ejercicio 1 y más. De hecho, ``pg_tables`` contiene muchos más datos sobre un parámetro dado de los que están disponibles desde la declaración ``SHOW`` (una lista completa se puede encontrar en la [documentación](https://www.postgresql.org/docs/10/view-pg-settings.html)), por lo que la consulta SQL algo más complicada tiene sus beneficios.
*/

/*markdown
## Ejercicio 3: ¡Inténtalo tú mismo!
Ahora que has visto algunos ejemplos de cómo configurar una instancia de PostgreSQL y navegar por los catálogos del sistema, es hora de poner en práctica lo que has aprendido y probarlo tú mismo.

En este ejercicio práctico, supón que deseas cambiar el nombre de ``aircrafts_data`` a ``aircraft_fleet``.

1. **Inténtalo tú mismo**: Primero, intenta cambiar el nombre de la tabla editando directamente la tabla ``pg_tables`` de los catálogos del sistema.

    <details><summary>Sugerencia (Haz clic aquí) </summary>

    > Para cambiar una entrada en una tabla, puedes usar un comando SQL de la siguiente forma: ``UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;``
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql
        UPDATE pg_tables SET tablename = 'aircraft_fleet' WHERE tablename = 'aircrafts_data';
    ```

    ![alt text](image/image-16.png)

    Como puedes ver, el comando SQL para actualizar una tabla directamente desde el catálogo del sistema resulta en un error. Esta es una buena salvaguarda para ti como administrador de bases de datos, ya que como se discutió anteriormente en el laboratorio, cambiar valores individuales en un catálogo del sistema directamente puede desorganizar gravemente tu base de datos. Intentemos un enfoque diferente.

    </details>
    <br>
*/

UPDATE pg_tables 
SET tablename = 'aircraft_fleet'
WHERE tablename = 'aircraft_data'

/*markdown
2. Para cambiar correctamente el nombre de ``aircrafts_data``, ingresa el siguiente comando en la CLI:

```sql
    ALTER TABLE aircrafts_data RENAME TO aircraft_fleet;
```
*/

ALTER TABLE aircrafts_data 
RENAME TO aircrafts_fleet;

/*markdown
3. **Inténtalo tú mismo**: Para confirmar que la tabla fue renombrada con éxito, consulta ``pg_tables`` desde el catálogo del sistema por ``schemaname`` ‘bookings’ para mostrar la columna ``tablename``.

    <details><summary>Sugerencia (Haz clic aquí) </summary>

    > Para consultar una tabla y mostrar una columna específica para las filas que satisfacen una condición, utiliza un comando SQL de la siguiente forma: ``SELECT column1, column2, ... FROM table_name WHERE condition;``
    </details>
    <br>
    <details><summary>Solución (Haz clic aquí) </summary>

    ```sql
        SELECT tablename FROM pg_tables WHERE schemaname = 'bookings';
    ```

    ![alt text](image/image-17.png)

    Como puedes ver, la tabla fue renombrada con éxito a ``aircraft_fleet`` y los cambios se reflejan automáticamente en el catálogo del sistema.
    </details>
    <br>
*/

SELECT tablename 
FROM pg_tables 
WHERE schemaname = 'bookings';

/*markdown
## Conclusión
¡Felicidades por completar este laboratorio sobre administración de bases de datos con PostgreSQL! Ahora tienes algunos conocimientos básicos sobre cómo configurar una instancia de PostgreSQL y personalizarla para tus casos de uso específicos. Además, ahora tienes la capacidad de consultar el catálogo del sistema para recuperar metadatos sobre objetos de la base de datos y estás listo para pasar a la siguiente lección.
*/