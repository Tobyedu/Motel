-- trigger de habitaciones disponibles 
create or replace function f() returns Trigger
as
$$
	declare 
	cap varchar;
begin
	select numero_habitacion into cap from habitacion where estado_habitacion like 'Disponible';
	if (new.estado_habitacion = 'Ocupado') then
          raise exception 'No se puede ocupar la habitacion, intente con la habitacion: %', cap;
     end if;

     return new;
    
End
$$
language plpgsql;  

create trigger f before insert on habitacion
for each row 
execute procedure f();

insert into HABITACION Values(4, 111, 5, 'Ocupado', 'HABITACION MEDIA',1);
