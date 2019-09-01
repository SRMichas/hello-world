create database Burros
go
use Burros
go
create table Usuario (
	UsID int not null,
	Usnombre varchar(40) not null,
	UsapeMat varchar(30) null,
	UsapePat varchar(30) not null,
	Uscorreo varchar(50) not null,
	Uscontrasena varchar(100) not null,
	UsNickName varchar(50) not null
)
go
create table Burrito(
	BId int not null,
	BNombre varchar(50) not null,
	BDescripcion varchar (750) not null,
	BCategoria int not null,
	BStack int not null,
	BPopularidad int not null,
	BPrecio decimal (12,2) not null
)
go
create table Orden (
	Folio int not null,
	USID int not null,
	edo int not null,
	fecha datetime not null
	)
go
create table DetalleOrden(
	Folio int not null,
	BID int not null,
	Catidad int not null,
	)
go
create table Carrito(
	UsID int not null,
	BID int not null,
	Cant int not null
)
go
create table Favoritos(
	UsID int not null,
	BID int not null
	)
go
create table Estado(
	edoID int not null,
	edoNombre varchar(30) not null
	)
go
	alter table Usuario add constraint pk_user primary key (UsID)
	alter table Burrito add constraint pk_burro primary key (BId)
	alter table Orden add constraint pk_orden primary key (Folio)
	alter table Favoritos add constraint pk_fav primary key (UsID,BID)
	alter table Carrito add constraint pk_car primary key (UsID,BID)
	alter table DetalleOrden add constraint pk_det_ord primary key (Folio,BID)
	alter table Estado add constraint pk_edo primary key (edoID)
go
	alter table Orden add constraint fk_usID foreign key (USID) references Usuario (UsID),
	constraint fk_ord_edo foreign key (edo) references Estado(edoID)

	alter table DetalleOrden add constraint fk_detord_folio foreign key (Folio) 
	references Orden (Folio),constraint fk_detord_BID foreign key (BID) references Burrito(BId)

	alter table Carrito add constraint fk_carr_UsID foreign key (UsID) 
	references Usuario (UsID), constraint fk_carr_BID foreign key (BID) references Burrito (BId)

	alter table Favoritos add constraint fk_fav_UsID foreign key (UsID) 
	references Usuario (UsID), constraint fk_fav_BID foreign key (BID) references Burrito(BId)
GO
	INSERT into Usuario VALUES (1, 'Juan', NULL, 'Mangano', 'juanito@hotmail.com', 'hola','Juanitillo')
GO
	INSERT into Estado VALUES (1, 'Completado'), (2, 'Cancelado'), (3, 'En proceso'),(4, 'a'),(5, 'a')
GO
	INSERT INTO Burrito VALUES (1, 'Cochinita', 'Para los amantes de los burritos, esta versi�n de cochinita pibil, frijoles refritos con tocino y aguacate. Acompa�ados con cebollas moradas encurtidas y la cl�sica salsa negra de habanero. �Te fascinar�n! ', 0, 10, 45, CAST(12.00 AS Decimal(12, 2)))
	,(2, 'Machaca con Huevo', 'Burrito de  machaca con huevo es una muy buena opci�n para desayunar algo rico, f�cil y diferente. Preparado con huevo con la machaca, jitomate y chile serrano. Te encatar�.', 0, 12, 50, CAST(10.00 AS Decimal(12, 2)))
	,(3, 'Pollo', 'Un fabuloso burrito de pollo deliciosamente saludable. La mezcla de pico de gallo combina perfecto con la tortilla y el pollo. Es ideal para la cena o el desayuno. ', 0, 11, 23, CAST(12.00 AS Decimal(12, 2)))
	,(4, 'Picadillo', 'Burritos rellenos de picadillo y acomp��ados con un poco de arroz a la mexicana y frijoles refritos, �No hay nada m�s rico! ', 0, 8, 56, CAST(10.00 AS Decimal(12, 2)))
	, (5, 'Bisteck', 'Burritos rellenos de Bisteck, una buena opci�n para calmar ese antojo que aparece. ��Qu� esperas?!', 0, 5, 89, CAST(12.00 AS Decimal(12, 2)))
	, (6, 'Chorizo', 'Una excelente opci�n para la hora de la comida cuando te agarran las prisas es este burrito de chorizo con frijoles negros y jitomate. Preparado con una salsa de chile de �rbol para acompa�arlos: �F�c�l, r�pido y econ�mico! ', 0, 3, 100, CAST(10.00 AS Decimal(12, 2)))
	, (7, 'Frijol', 'Para un snack r�pido y que te puedes llevar a la oficina y calentarlo all� o comerlo fr�o', 0, 1, 45, CAST(12.00 AS Decimal(12, 2)))
	, (8, 'Chicarr�', 'Burritos de chicarr�n en salsa verde ideal para aplacar esa CERDA hambre que tienes. �Compralo ya!', 0, 19, 48, CAST(10.00 AS Decimal(12, 2)))
	, (9, 'Arrachera', 'Lo mejor para una tarde de antojos espontaneos. An�mate a conseguirlos! A disfrutar! ', 0, 14, 76, CAST(12.00 AS Decimal(12, 2)))
	, (10, 'Pollo & Philadelphia', 'Burritos rellonos de pollo con queso crema, te invito a que la pruebes y descubras su gran sabor. ', 0, 11, 81, CAST(10.00 AS Decimal(12, 2)))
	, (11, 'Vegetariano', 'Para los que est�n a dieta o no quieren consumir carne, prueba estos burritos vegetarianos s�per ricos. ', 0, 12, 23, CAST(12.00 AS Decimal(12, 2)))
	, (12, 'Jam�n con Queso', 'Deliciosos burritos f�ciles de jam�n con queso. Tienen un sabor riqu�simo y son perfectos para el antojo. ', 0, 3, 10, CAST(10.00 AS Decimal(12, 2)))
	, (13, 'Teotihuac�', 'Ricos burritos estilo teotihuac�n van acompa�ados con frijoles, la tortilla es de ma�z pero puedes usar tortilla de harina o de nopal, te quedar�n deliciosos. ', 0, 5, 48, CAST(11.00 AS Decimal(12, 2)))
	, (14, 'Pecado', 'Burritos rellenos de Pescado marinados en salsa especial ideal para pasar un rato nadando es su sabor', 0, 7, 50, CAST(13.00 AS Decimal(12, 2)))
	, (15, 'Asada', 'Burritos de Carne Asada al mero estilo norte�o, ideales para satisfacer al pariente interior. �Aj�a!', 0, 10, 52, CAST(15.00 AS Decimal(12, 2)))
GO
	INSERT Carrito VALUES (1, 2,2),(1, 6,4),(1, 10,2),(1, 14,1)
GO
	INSERT Favoritos VALUES (1, 5),(1, 12)
GO
	insert Orden values (1,1,1,convert(datetime,'12-06-2019',103)),
	(2,1,3,convert(datetime,'21-06-2019',103)),
	(3,1,3,convert(datetime,'04-06-2019',103))
GO
	insert DetalleOrden values (1,1,3),(1,4,1),(1,7,4),(2,1,3),(2,5,2),(3,1,5),(2,9,4)