create database Mexihat;
USE Mexihat;
create table TipoSombrero(
TipoSombreroId int primary key,
TipoSombreroNombre nvarchar(40)
);

create table ColorSombrero(
ColorSombreroId int primary key,
ColorSombreroNombre nvarchar(40)
);
create table Diseños(
DiseñoId int primary key,
DiseñoNombre nvarchar(40)
);

create table Sombrero(
SombreroId int primary key,
TipoSombreroId int,
ColorSombreroId int,
DiseñoId int
);

alter table Sombrero
add constraint Fk_TipoSombreroId_TipoSombrero_Sombrero
Foreign key (TipoSombreroId) references TipoSombrero(TipoSombreroId);
alter table Sombrero
add constraint Fk_ColorSombreroId_ColorSombrero_Sombrero
Foreign key (ColorSombreroId) references ColorSombrero(ColorSombreroId);
alter table Sombrero
add constraint Fk_DiseñoId_Diseño_Sombrero
Foreign key (DiseñoId) references Diseño(DiseñoId);
drop procedure insertar_TipoSombrero;
DELIMITER $$
CREATE PROCEDURE insertar_TipoSombrero
(_TipoSombreroNombre NVARCHAR(40))
BEGIN
	SET @TipoSombreroId = (SELECT TipoSombreroId FROM TipoSombrero WHERE _TipoSombreroNombre = TipoSombreroNombre);
    IF @TipoSombreroId IS NULL THEN
		INSERT INTO TipoSombrero(TipoSombreroNombre) VALUES (_TipoSombreroNombre);	
        SELECT 1 as Code, 'El tipo de sombrero se registró exitosamente' as Message;
	ELSEIF @TipoSombreroId IS NOT NULL THEN
		SELECT 0 as Code, 'El tipo de sombrero ya se encuentra registrado' as Message;
	END IF;
END $$

DELIMITER $$
CREATE PROCEDURE insertar_ColorSombrero
(_ColorSombreroNombre NVARCHAR(40))
BEGIN
	SET @ColorSombreroId = (SELECT ColorSombreroId FROM ColorSombrero WHERE _ColorSombreroNombre = ColorSombreroNombre);
    IF @ColorSombreroId IS NULL THEN
		INSERT INTO ColorSombrero(ColorSombreroNombre) VALUES (_ColorSombreroNombre);	
	ELSEIF @ColorSombreroId IS NOT NULL THEN
		SELECT 'El color de sombrero ya se encuentra registrado';
	END IF;
END $$

DELIMITER $$
CREATE PROCEDURE insertar_Diseño
(_DiseñoNombre NVARCHAR(40))
BEGIN
	SET @DisenoId = (SELECT DiseñoId FROM Diseños WHERE _DiseñoNombre = DiseñoNombre);
    IF @DisenoId IS NULL THEN
		INSERT INTO Diseños(DiseñoNombre) VALUES (_DiseñoNombre);	
	ELSEIF @DisenoId IS NOT NULL THEN
		SELECT 'El diseño ya se encuentra registrado';
	END IF;
END $$

call insertar_TipoSombrero("Bombín");

delete from Diseños where DiseñoNombre = ''