﻿﻿-- -------------------------------------------------------------------------------
-- COMANDOS BASE DE DATOS
-- -------------------------------------------------------------------------------

-- Crear una base desde SSMS

-- Crear una base de datos vía T-SQL ósea mediante click click, interfaz gráfica
CREATE DATABASE Prueba -- este comando create database ...  la crea mediante código

-- Alterar una Base de Datos desde el SSMS

-- Modificar una propiedad de la Base de Datos    -- se puede hacer como todo mediante código o mediante interfaz grafica,
ALTER DATABASE Prueba SET READ_ONLY        --hacia click derecho en mi db y ponía propiedades, y cambiaba en options abajo de todo la opción que dice DATABASE -READ_ONLY
ALTER DATABASE Prueba SET READ_WRITE       --  Falso por defecto, ósea solo lectura por defecto y si le pongo True ya la cambie manualente por 

Mediante Codigo para alterar la DB uso el comando ALTER DATABASE... Y es mas fácil. 
-- Eliminar una Base de Datos desde el SSMS

-- Eliminar una base de datos
DROP DATABASE Prueba;   -- al hacerlo via interfaz grafica, hay un truco que  arriba hay una ventanita que dice script, si haces click ahi te dice en que query queres que
                        -- te genere el código para eliminar (drop) esa DB. truco por si no te acordas como se hace via cod.

-- -------------------------------------------------------------------------------
-- COMANDOS TABLAS
-- -------------------------------------------------------------------------------

-- Seleccionar la base a operar
USE Prueba;

-- Crear la tabla Almacenes desde el SSMS
-- Codigo (Cadena de Texto de 4 caracteres, Obligatorio y clave primaria)
-- Nombre (Cadena de Texto hasta 30 caracteres y Obligatorio)
-- Ubicación (Cadena de Texto hasta 30 caracteres y Opcional)


-- Crear Tabla
CREATE TABLE Productos (
        idProducto INT NOT NULL IDENTITY(1,1),
        Nombre VARCHAR(30) NOT NULL ,
        Precio DECIMAL(16,2) NOT NULL ,
        Marca VARCHAR(20) NOT NULL ,
        Categoria VARCHAR(20),
        Presentacion VARCHAR(30),
        Stock INT,
        PRIMARY KEY (idProducto)
);


-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'

-- Agregar un campo a la tabla Almacenes desde el SSMS
-- EsTercero (BIT, Obligatorio y por defecto False)

-- Alterar una tabla (Agregar un Nuevo Campo)
ALTER TABLE Productos ADD Disponible BIT NOT NULL;

-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'

-- Cambiar el campo EsTercero por EsPropio (por defecto True) a la tabla Almacenes desde el SSMS

-- Alterar una tabla (Cambiar un Campo)
ALTER TABLE Productos ALTER COLUMN Categoria INT NOT NULL;

-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'


-- Eliminar el campo EsPropio en la tabla Almacenes desde el SSMS

-- Alterar una tabla (Eliminar un Campo)
ALTER TABLE Productos DROP COLUMN Disponible;

-- Ver detalle de la estructura de la tabla Productos
sp_columns 'Productos'


-- Eliminar la tabla Almacenes desde el SSMS

-- Eliminar una Tabla
DROP TABLE Productos;
DROP TABLE IF EXISTS Productos;


-- -------------------------------------------------------------------------------
-- INSERT
-- -------------------------------------------------------------------------------

-- creamos la tabla clientes

CREATE TABLE clientes (
	codigo int IDENTITY(1,1),
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	cuit varchar(11),
	direccion varchar(50),
	edad tinyint,
	PRIMARY KEY (codigo)
);


-- Insert forma Clásica
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Lionel','Messi','xxxxx','Peru 323',32);


-- Hacer un Insert vía SSMS (Hernan Crespo)


-- Insert simplificada/masiva
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad)
VALUES ('Carlos','Tevez','xxxxx','Chile 320',36),
	   ('Diego','Maradona','xxxxx','Venezuela 567',59),
	   ('Juan','Riquelme','xxxxx','Uruguay 680',41),
	   ('Gabriel','Batistuta','xxxxx','Colombia 1211',51),
	   ('Mario','Kempes','xxxxx','Chile 111',65),
	   ('Javier','Masherano','xxxxx','Brasil 954',35),
	   ('Oscar','Ruggeri','xxxxx','Canada 2322',58),
	   ('Javier','Zanetti','xxxxx','Mexico 1986',46),
	   ('Diego','Simeone','xxxxx','Costa Rica 1345',49);


-- verificamos el ingreso de los registros
SELECT * FROM clientes;

-- ----------------------------------------------------------------------------------------
-- Insert de valores NULL
-- ----------------------------------------------------------------------------------------

--Error
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES (NULL,'Veron','xxxxx','Estados Unidos 1223',44);


--Corregido (Chequear IDENTITY)
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Juan','Veron','xxxxx','Estados Unidos 1223',44);


--Direccion si acepta NULL
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Pablo','Aimar','xxxxx',NULL,40);


--Ejemplo de cadena sin caracteres
INSERT INTO clientes (nombre,apellido,cuit,direccion,edad) 
VALUES ('Claudio','Caniggia','xxxxx','',53);


-- verificamos el ingreso de los registros
SELECT * FROM clientes;


------------------------------------------------------------------------------------------------------------
--MÁS INSERT
------------------------------------------------------------------------------------------------------------

-- creamos la tabla MejoresClubes
CREATE TABLE MejoresClubes (
	IdClub char(3),
	Nombre varchar(20),
	Pais varchar(20)
)

-- Insertar una sola fila de datos (especificando los campos)
INSERT INTO MejoresClubes(IdClub,Nombre,Pais) 
VALUES('FCB','FC Barcelona','España')

-- Insertar una sola fila de datos (SIN especificar los campos)
INSERT INTO MejoresClubes 
VALUES('CAB','CA Boca Juniors','Argentina')


-- verificamos el ingreso de los registros
SELECT * FROM MejoresClubes


-- Insertar varias filas de datos (especificando los campos)
INSERT INTO MejoresClubes(IdClub,Nombre,Pais) 
VALUES ('MIL','AC Milan','Italia'),
	   ('MUN','FC Bayern München','Alemania'),
	   ('UNI','Manchester United','Inglaterra')

-- Insertar varias filas de datos (SIN especificar los campos)
INSERT INTO MejoresClubes 
VALUES ('FLA','Flamengo','Brasil'),
	   ('TAC','Deportivo Tachira','Venezuela'),
	   ('CHA','CA Chacarita Juniors','Argentina')


-- verificamos el ingreso de los registros
SELECT * FROM MejoresClubes


-- Insertar datos que no están en el mismo orden que las columnas de la tabla
INSERT INTO MejoresClubes(Pais,Nombre,IdClub) 
VALUES('Holanda','AFC Ajax','AJA')

-- verificamos el ingreso de los registros
SELECT * FROM MejoresClubes



-- creamos la tabla TablaEjemplo
CREATE​ ​TABLE​ TablaEjemplo(
	Saludo ​AS​ ​'Hola '​ + Nombre,
	Nombre ​varchar​(30) CONSTRAINT​ default_name ​DEFAULT​ (​'Lionel'​),
	Vers rowversion,
	Valor ​varchar​(40) ​NULL
)    

-- Insertar datos en una tabla con columnas que tienen valores predeterminados
INSERT​ ​INTO​ TablaEjemplo (Valor) VALUES​ (​'1er INSERT'​)
INSERT​ ​INTO​ TablaEjemplo (Nombre, Valor) VALUES​ (​'Luis Suarez'​, ​'2do INSERT'​)
INSERT​ ​INTO​ TablaEjemplo (Nombre) VALUES​ (​'Ivan Rakitic'​)
INSERT​ ​INTO​ TablaEjemplo ​DEFAULT​ ​VALUES​
INSERT INTO TablaEjemplo(Saludo,Nombre,Vers,Valor) VALUES('Chao','Ale','xxxx','Intento fallido')

-- verificamos el ingreso de los registros
SELECT * FROM TablaEjemplo


-- creamos la tabla EstadioFutbol
CREATE​ ​TABLE​ EstadioFutbol(
	Codigo ​INT​ ​IDENTITY​,
	Nombre ​VARCHAR​(30)
)

-- Insertar datos en una tabla con una columna de identidad 
INSERT​ INTO EstadioFutbol ​VALUES​ (​'Camp Nou'​)
INSERT​ INTO EstadioFutbol (Nombre) ​VALUES​ (​'La Bombonera'​)
SET​ IDENTITY_INSERT EstadioFutbol ​ON​
INSERT​ ​INTO​ EstadioFutbol (Codigo,Nombre) VALUES​ (99, ​'Giuseppe Meazza'​)
SET​ IDENTITY_INSERT EstadioFutbol ​OFF
INSERT​ ​INTO​ EstadioFutbol (Codigo,Nombre) VALUES​ (77, ​'Santiago Bernabeu'​)

-- verificamos el ingreso de los registros
SELECT * FROM EstadioFutbol


-- -------------------------------------------------------------------------------
-- IMPORT / EXPORT
-- -------------------------------------------------------------------------------

-- Exportar los datos de la tabla Person de AdventureWorks a CSV

-- Importar los datos desde el CSV a la base de datos de Pruebas