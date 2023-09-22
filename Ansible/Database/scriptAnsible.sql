create database Mexihat;
USE Mexihat;
create table TipoSombrero(
TipoSombreroId int primary key auto_increment,
TipoSombreroNombre nvarchar(40)
);

create table ColorSombrero(
ColorSombreroId int primary key auto_increment,
ColorSombreroNombre nvarchar(40)
);
create table Disenos(
DisenoId int primary key auto_increment,
DisenoNombre nvarchar(40)
);

create table Sombrero(
SombreroId int primary key auto_increment,
TipoSombreroId int,
ColorSombreroId int,
DisenoId int
);

alter table Sombrero
add constraint Fk_TipoSombreroId_TipoSombrero_Sombrero
Foreign key (TipoSombreroId) references TipoSombrero(TipoSombreroId);
alter table Sombrero
add constraint Fk_ColorSombreroId_ColorSombrero_Sombrero
Foreign key (ColorSombreroId) references ColorSombrero(ColorSombreroId);
alter table Sombrero
add constraint Fk_DisenoId_Diseno_Sombrero
Foreign key (DisenoId) references Disenos(DisenoId);

DELIMITER $$
CREATE PROCEDURE insertar_TipoSombrero
(_TipoSombreroNombre NVARCHAR(40))
BEGIN
	SET @TipoSombreroId = (SELECT TipoSombreroId FROM TipoSombrero WHERE _TipoSombreroNombre = TipoSombreroNombre);
    IF @TipoSombreroId IS NULL THEN
		INSERT INTO TipoSombrero(TipoSombreroNombre) VALUES (_TipoSombreroNombre);	
        SELECT 1 as Code, 'El tipo de sombrero se registro exitosamente' as Message;
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
        SELECT 1 as Code, 'El tipo de sombrero se registró exitosamente' as Message;
	ELSEIF @ColorSombreroId IS NOT NULL THEN
		SELECT 1 as Code, 'El tipo de sombrero se registró exitosamente' as Message;
	END IF;
END $$

DELIMITER $$
CREATE PROCEDURE insertar_Diseno
(_DisenoNombre NVARCHAR(40))
BEGIN
	SET @DisenoId = (SELECT DisenoId FROM Disenos WHERE _DisenoNombre = DisenoNombre);
    IF @DisenoId IS NULL THEN
		INSERT INTO Disenos(DisenoNombre) VALUES (_DisenoNombre);	
        SELECT 1 as Code, 'El tipo de sombrero se registró exitosamente' as Message;
	ELSEIF @DisenoId IS NOT NULL THEN
		SELECT 1 as Code, 'El tipo de sombrero se registró exitosamente' as Message;
	END IF;
END $$
insert into TipoSombrero(TipoSombreroNombre) values('Cubano');
