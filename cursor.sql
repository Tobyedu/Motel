-- cursores Informacion sobre Descripcion de la habitacion y su estado si es disponible o ocupado

do $$
declare

	registro Record;
	cur_habitacion cursor for select * from "habitacion";

	begin 

	Open cur_habitacion;
	Fetch cur_habitacion into registro;
	Raise Notice 'estado_habitacion: %, descripcion_habitacion %', registro.estado_habitacion, registro.descripcion_habitacion;
	end$$

language 'plpgsql'; 
