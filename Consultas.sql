SELECT 
  habitacion.descripcion_habitacion, 
  count(servicios.serv_tvsatelital) as tvsatelital, 
  count(servicios.serv_internet) as internet, 
  count(servicios.serv_preservativos) as Preservativos, 
  count(servicios.serv_juguetes_sex) as Juguetes_sexuales, 
  count(servicios.serv_lencerias) as Lencerias
  
FROM 
  public.cliente, 
  public.cliente_reservaciones, 
  public.empledo, 
  public.metodo_pago, 
  public.reservaciones, 
  public.servicios, 
  public.habitacion
WHERE 
  cliente.idcliente = cliente_reservaciones.idcliente AND
  reservaciones.idreservaciones = cliente_reservaciones.idreservaciones AND
  reservaciones.id_empleado = empledo.id_empleado AND
  reservaciones.idreservaciones = metodo_pago.idreservaciones AND
  habitacion.idhabitacion = servicios.idhabitacion AND
  habitacion.idreservaciones = reservaciones.idreservaciones



  GROUP BY (habitacion.descripcion_habitacion);

//////// 2da consulta //////////

SELECT 
  count(reservaciones.fechadereservacion) as SumaFecha, 
  habitacion.descripcion_habitacion as TipodeHabitacion
FROM 
  public.cliente, 
  public.cliente_reservaciones, 
  public.empledo, 
  public.metodo_pago, 
  public.reservaciones, 
  public.servicios, 
  public.habitacion
WHERE 
  cliente.idcliente = cliente_reservaciones.idcliente AND
  reservaciones.idreservaciones = cliente_reservaciones.idreservaciones AND
  reservaciones.id_empleado = empledo.id_empleado AND
  reservaciones.idreservaciones = metodo_pago.idreservaciones AND
  habitacion.idhabitacion = servicios.idhabitacion AND
  habitacion.idreservaciones = reservaciones.idreservaciones

GROUP BY (TipodeHabitacion)


/////////////Consulta 3////////////
SELECT 
  empledo.nombreempleado as empleado, 
  count(cliente.nombrecliente) as cliente, 
  reservaciones.fechadereservacion as fechasuma
FROM 
  public.cliente, 
  public.cliente_reservaciones, 
  public.empledo, 
  public.metodo_pago, 
  public.reservaciones, 
  public.servicios, 
  public.habitacion
WHERE 
  cliente.idcliente = cliente_reservaciones.idcliente AND
  reservaciones.idreservaciones = cliente_reservaciones.idreservaciones AND
  reservaciones.id_empleado = empledo.id_empleado AND
  reservaciones.idreservaciones = metodo_pago.idreservaciones AND
  habitacion.idhabitacion = servicios.idhabitacion AND
  habitacion.idreservaciones = reservaciones.idreservaciones

  GROUP BY (empleado, fechasuma)


//////////////////////CONSULTA 4 /////////////////

SELECT 
  count(metodo_pago.efectivo) as PagoEfectivo, 
  count(metodo_pago.tarjeta_credito) as PagoTarjeta, 
  cliente.nombrecliente as cliente
FROM 
  public.cliente, 
  public.cliente_reservaciones, 
  public.empledo, 
  public.metodo_pago, 
  public.reservaciones, 
  public.servicios, 
  public.habitacion
WHERE 
  cliente.idcliente = cliente_reservaciones.idcliente AND
  reservaciones.idreservaciones = cliente_reservaciones.idreservaciones AND
  reservaciones.id_empleado = empledo.id_empleado AND
  reservaciones.idreservaciones = metodo_pago.idreservaciones AND
  habitacion.idhabitacion = servicios.idhabitacion AND
  habitacion.idreservaciones = reservaciones.idreservaciones

  GROUP BY (cliente)