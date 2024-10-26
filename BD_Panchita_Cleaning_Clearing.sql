Drop Database If Exists BD_Panchita_Cleaning_Clearing;
Create Database If Not Exists BD_Panchita_Cleaning_Clearing;
Use BD_Panchita_Cleaning_Clearing;

Create Table Usuario(
idusuario Int Primary Key Auto_Increment,
nombres Varchar(100) Not Null,
apellidos Varchar(100) Not Null,
fecha_nac Date Not Null,
email Varchar(300) Null,
telefono Char(9) Null,
username Varchar(100) Not Null Unique,
password Char(60) Not Null,
activo Bit Not Null);

Create Table Rol(
idrol Int Primary Key Auto_Increment,
nomrol Varchar(100) Not Null);

Create Table Usuario_Rol(
idusuario Int Not Null,
idrol Int Not Null,
Foreign Key (idusuario) References Usuario(idusuario),
Foreign Key (idrol) References Rol (idrol),
Primary Key (idusuario, idrol));

Create Table Sucursal(
idsucursal Int Primary Key Auto_Increment,
nomsucursal Varchar(100) Not Null,
direccion Varchar(100) Not Null,
nrosillas Int Not Null);

Create Table Mesa(
idmesa Int Primary Key Auto_Increment,
maxasientos Int Not Null,
idsucursal Int Not Null,
estado Enum('DISPONIBLE', 'NO DISPONIBLE', 'RETIRADO') Not Null,
Foreign Key (idsucursal) References Sucursal(idsucursal));

Create Table Solicitud_Reserva(
idsolirsv Int Primary Key Auto_Increment,
nrocomensales Int Not Null,
fecharsv Date Not Null,
horainicio Time Not Null,
horafin Time Null,
estado Enum('GENERADO', 'FINALIZADO', 'CANCELADO', 'INASISTIDO') Not Null,
idusuario Int Not Null,
idsucursal Int Not Null,
Foreign Key (idusuario) References Usuario (idusuario),
Foreign Key (idsucursal) References Sucursal (idsucursal));

