create or replace function conteo(integer) returns varchar
as
$$


select nombrecliente  from cliente
where cedulacliente = $1



$$
language sql

select conteo(1314750603)
