delimiter //
drop procedure if exists mk_condominio// 
create procedure mk_condominio(
	in id text,
	in nombre text,
	in zona text,
	in ciudad text,
	in contacto text,
	in cargo text,
	in telefono text,
	in correo text,
	in fechainicio text,
	in fechacobranza text,
	in preciobase text,
	in precioadicional text,
	in imagen text,
	in enabled text,
	in adicionadopor text,
	in fechaadicion text,
	in modificadopor text,
	in fechamodificacion text
)
begin
	if (id = 0) then
		insert into cb_configuracion_condominio (
			cb_condominio_nombre,
			cb_condominio_zona,
			cb_condominio_ciudad,
			cb_condominio_contacto,
			cb_condominio_cargo,
			cb_condominio_telefono,
			cb_condominio_correo,
			cb_condominio_fechainicio,
			cb_condominio_fechacobranza,
			cb_condominio_preciobase,
			cb_condominio_precioadicional,
			cb_condominio_imagen,
			cb_condominio_enabled,
			cb_condominio_adicionadopor,
			cb_condominio_fechaadicion,
			cb_condominio_modificadopor,
			cb_condominio_fechamodificacion		) values (
			nombre,
			zona,
			ciudad,
			contacto,
			cargo,
			telefono,
			correo,
			fechainicio,
			fechacobranza,
			preciobase,
			precioadicional,
			imagen,
			enabled,
			adicionadopor,
			fechaadicion,
			modificadopor,
			fechamodificacion);
else
update cb_configuracion_condominio c
set
cb_condominio_nombre = nombre,
cb_condominio_zona = zona,
cb_condominio_ciudad = ciudad,
cb_condominio_contacto = contacto,
cb_condominio_cargo = cargo,
cb_condominio_telefono = telefono,
cb_condominio_correo = correo,
cb_condominio_fechainicio = fechainicio,
cb_condominio_fechacobranza = fechacobranza,
cb_condominio_preciobase = preciobase,
cb_condominio_precioadicional = precioadicional,
cb_condominio_imagen = imagen,
cb_condominio_enabled = enabled,
cb_condominio_adicionadopor = adicionadopor,
cb_condominio_fechaadicion = fechaadicion,
cb_condominio_modificadopor = modificadopor,
cb_condominio_fechamodificacion = fechamodificacion
where cb_condominio_id = id;
end if;
end//

drop procedure if exists del_condominio//
create procedure del_condominio(in id int)
begin
delete
from cb_configuracion_condominio
where cb_condominio_id = id;
end//

drop procedure if exists get_condominio//
create procedure get_condominio(in id int)
begin
select
cb_condominio_nombre,
cb_condominio_zona,
cb_condominio_ciudad,
cb_condominio_contacto,
cb_condominio_cargo,
cb_condominio_telefono,
cb_condominio_correo,
cb_condominio_fechainicio,
cb_condominio_fechacobranza,
cb_condominio_preciobase,
cb_condominio_precioadicional,
cb_condominio_imagen,
cb_condominio_enabled,
cb_condominio_adicionadopor,
cb_condominio_fechaadicion,
cb_condominio_modificadopor,
cb_condominio_fechamodificacion
from cb_configuracion_condominio c
where cb_condominio_id = id;
end//

drop procedure if exists get_condominios//
create procedure get_condominios()
begin
select
cb_condominio_nombre,
cb_condominio_zona,
cb_condominio_ciudad,
cb_condominio_contacto,
cb_condominio_cargo,
cb_condominio_telefono,
cb_condominio_correo,
cb_condominio_fechainicio,
cb_condominio_fechacobranza,
cb_condominio_preciobase,
cb_condominio_precioadicional,
cb_condominio_imagen,
cb_condominio_enabled,
cb_condominio_adicionadopor,
cb_condominio_fechaadicion,
cb_condominio_modificadopor,
cb_condominio_fechamodificacion
from cb_configuracion_condominio c;
end//
use cb_qsm//
drop procedure if exists mk_vivienda// 
create procedure mk_vivienda(
	in id int,
	in codificacion text,
	in familia text,
	in direccion text,
	in telefono int,
	in cantidad text,
	in uso text,
	in fkcondominio text,
	in enabled int,
	in adicionadopor text,
	in fechaadicion text,
	in modificadopor text,
	in fechamodificacion text
)
begin
	if (id = 0) then
		insert into cb_configuracion_vivienda (
			cb_vivienda_codificacion,
			cb_vivienda_familia,
			cb_vivienda_direccion,
			cb_vivienda_telefono,
			cb_vivienda_cantidad,
			cb_vivienda_uso,
			cb_vivienda_fkcondominio,
			cb_vivienda_enabled,
			cb_vivienda_adicionadopor,
			cb_vivienda_fechaadicion,
			cb_vivienda_modificadopor,
			cb_vivienda_fechamodificacion		) values (
			codificacion,
			familia,
			direccion,
			telefono,
			cantidad,
			uso,
			fkcondominio,
			enabled,
			adicionadopor,
			fechaadicion,
			modificadopor,
			fechamodificacion);
else
update cb_configuracion_vivienda v
set
cb_vivienda_codificacion = codificacion,
cb_vivienda_familia = familia,
cb_vivienda_direccion = direccion,
cb_vivienda_telefono = telefono,
cb_vivienda_cantidad = cantidad,
cb_vivienda_uso = uso,
cb_vivienda_fkcondominio = fkcondominio,
cb_vivienda_enabled = enabled,
cb_vivienda_adicionadopor = adicionadopor,
cb_vivienda_fechaadicion = fechaadicion,
cb_vivienda_modificadopor = modificadopor,
cb_vivienda_fechamodificacion = fechamodificacion
where cb_vivienda_id = id;
end if;
end//

call mk_vivienda(2, "103", "Duran", "Banzer", 3221537, 3, 0, 
	1, 1, "Administrador", "2018-05-21 15:31:34", null, null)//

drop procedure if exists del_vivienda//
create procedure del_vivienda(in id int)
begin
delete
from cb_configuracion_vivienda
where cb_vivienda_id = id;
end//

drop procedure if exists get_vivienda//
create procedure get_vivienda(in id int)
begin
select
cb_vivienda_codificacion,
cb_vivienda_familia,
cb_vivienda_direccion,
cb_vivienda_telefono,
cb_vivienda_cantidad,
cb_vivienda_uso,
cb_vivienda_fkcondominio,
cb_vivienda_enabled,
cb_vivienda_adicionadopor,
cb_vivienda_fechaadicion,
cb_vivienda_modificadopor,
cb_vivienda_fechamodificacion
from cb_configuracion_vivienda v
where cb_vivienda_id = id;
end//

drop procedure if exists get_viviendas//
create procedure get_viviendas()
begin
select
cb_vivienda_codificacion,
cb_vivienda_familia,
cb_vivienda_direccion,
cb_vivienda_telefono,
cb_vivienda_cantidad,
cb_vivienda_uso,
cb_vivienda_fkcondominio,
cb_vivienda_enabled,
cb_vivienda_adicionadopor,
cb_vivienda_fechaadicion,
cb_vivienda_modificadopor,
cb_vivienda_fechamodificacion
from cb_configuracion_vivienda v;
end//

drop procedure if exists mk_familia// 
create procedure mk_familia(
	in id text,
	in nombre text,
	in apellido text,
	in celular text,
	in correo text,
	in ci text,
	in genero text,
	in fkvivienda text,
	in token text,
	in codigo text,
	in activo text,
	in adicional text,
	in enabled text,
	in adicionadopor text,
	in fechaadicion text,
	in modificadopor text,
	in fechamodificacion text
)
begin
	if (id = 0) then
		insert into cb_configuracion_familia (
			cb_familia_nombre,
			cb_familia_apellido,
			cb_familia_celular,
			cb_familia_correo,
			cb_familia_ci,
			cb_familia_genero,
			cb_familia_fkvivienda,
			cb_familia_token,
			cb_familia_codigo,
			cb_familia_activo,
			cb_familia_adicional,
			cb_familia_enabled,
			cb_familia_adicionadopor,
			cb_familia_fechaadicion,
			cb_familia_modificadopor,
			cb_familia_fechamodificacion		) values (
			nombre,
			apellido,
			celular,
			correo,
			ci,
			genero,
			fkvivienda,
			token,
			codigo,
			activo,
			adicional,
			enabled,
			adicionadopor,
			fechaadicion,
			modificadopor,
			fechamodificacion);
else
update cb_configuracion_familia f
set
cb_familia_nombre = nombre,
cb_familia_apellido = apellido,
cb_familia_celular = celular,
cb_familia_correo = correo,
cb_familia_ci = ci,
cb_familia_genero = genero,
cb_familia_fkvivienda = fkvivienda,
cb_familia_token = token,
cb_familia_codigo = codigo,
cb_familia_activo = activo,
cb_familia_adicional = adicional,
cb_familia_enabled = enabled,
cb_familia_adicionadopor = adicionadopor,
cb_familia_fechaadicion = fechaadicion,
cb_familia_modificadopor = modificadopor,
cb_familia_fechamodificacion = fechamodificacion
where cb_familia_id = id;
end if;
end//

drop procedure if exists del_familia//
create procedure del_familia(in id int)
begin
delete
from cb_configuracion_familia
where cb_familia_id = id;
end//

drop procedure if exists get_familia//
create procedure get_familia(in id int)
begin
select
cb_familia_nombre,
cb_familia_apellido,
cb_familia_celular,
cb_familia_correo,
cb_familia_ci,
cb_familia_genero,
cb_familia_fkvivienda,
cb_familia_token,
cb_familia_codigo,
cb_familia_activo,
cb_familia_adicional,
cb_familia_enabled,
cb_familia_adicionadopor,
cb_familia_fechaadicion,
cb_familia_modificadopor,
cb_familia_fechamodificacion
from cb_configuracion_familia f
where cb_familia_id = id;
end//

drop procedure if exists get_familias//
create procedure get_familias()
begin
select
cb_familia_nombre,
cb_familia_apellido,
cb_familia_celular,
cb_familia_correo,
cb_familia_ci,
cb_familia_genero,
cb_familia_fkvivienda,
cb_familia_token,
cb_familia_codigo,
cb_familia_activo,
cb_familia_adicional,
cb_familia_enabled,
cb_familia_adicionadopor,
cb_familia_fechaadicion,
cb_familia_modificadopor,
cb_familia_fechamodificacion
from cb_configuracion_familia f;
end//

drop procedure if exists mk_parametro// 
create procedure mk_parametro(
	in id text,
	in correo text,
	in telefono text,
	in celular text,
	in permanencia text,
	in ci text,
	in placa text,
	in cantidad text,
	in fkcondominio text,
	in enabled text
)
begin
	if (id = 0) then
		insert into cb_configuracion_parametro (
			cb_parametro_correo,
			cb_parametro_telefono,
			cb_parametro_celular,
			cb_parametro_permanencia,
			cb_parametro_ci,
			cb_parametro_placa,
			cb_parametro_cantidad,
			cb_parametro_fkcondominio,
			cb_parametro_enabled		) values (
			correo,
			telefono,
			celular,
			permanencia,
			ci,
			placa,
			cantidad,
			fkcondominio,
			enabled);
else
update cb_configuracion_parametro p
set
cb_parametro_correo = correo,
cb_parametro_telefono = telefono,
cb_parametro_celular = celular,
cb_parametro_permanencia = permanencia,
cb_parametro_ci = ci,
cb_parametro_placa = placa,
cb_parametro_cantidad = cantidad,
cb_parametro_fkcondominio = fkcondominio,
cb_parametro_enabled = enabled
where cb_parametro_id = id;
end if;
end//

drop procedure if exists del_parametro//
create procedure del_parametro(in id int)
begin
delete
from cb_configuracion_parametro
where cb_parametro_id = id;
end//

drop procedure if exists get_parametro//
create procedure get_parametro(in id int)
begin
select
cb_parametro_correo,
cb_parametro_telefono,
cb_parametro_celular,
cb_parametro_permanencia,
cb_parametro_ci,
cb_parametro_placa,
cb_parametro_cantidad,
cb_parametro_fkcondominio,
cb_parametro_enabled
from cb_configuracion_parametro p
where cb_parametro_id = id;
end//

drop procedure if exists get_parametros//
create procedure get_parametros()
begin
select
cb_parametro_correo,
cb_parametro_telefono,
cb_parametro_celular,
cb_parametro_permanencia,
cb_parametro_ci,
cb_parametro_placa,
cb_parametro_cantidad,
cb_parametro_fkcondominio,
cb_parametro_enabled
from cb_configuracion_parametro p;
end//

