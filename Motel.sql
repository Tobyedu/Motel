/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDCLIENTE            INT                not null,
   NOMBRECLIENTE        VARCHAR(40)          null,
   APELLIDOCLIENTE      VARCHAR(40)          null,
   GENERO               VARCHAR(30)          null,
   CEDULACLIENTE        Int                 null,
   CORREOELECTRONICO    VARCHAR(40)          null,
   NUMEROTELEFONICO     INT                 null,
   constraint PK_CLIENTE primary key (IDCLIENTE)
);

insert into CLIENTE Values (123, 'Victor', 'Lopez', 'Masculino', 1314750603, 'emelecestodo@gmail.com', 0968099926);
insert into CLIENTE Values (124, 'Kelvin', 'Lopez', 'Masculino', 1314750604, 'barceestodo@gmail.com',  0968088827);
insert into CLIENTE Values (125, 'Ancode', 'Velez', 'Femenino',  1325896324,     'ancodeo@gmail.com',  0948089926);
insert into CLIENTE Values (126, 'Jeffer', 'Parrales', 'Masculino', 1314589654, 'fusilero@gmail.com',  0968033926);
/*==============================================================*/
/* Table: EMPLEDO                                               */
/*==============================================================*/
create table EMPLEDO (
   ID_EMPLEADO          INT                 not null,
   NOMBREEMPLEADO       VARCHAR(40)          null,
   APELLIDO_EMPLEADO    VARCHAR(40)          null,
   CEDULA_EMPLEADO      INT                  null,
   CORREO_EMPLEADO      VARCHAR(40)          null,
   EDAD_EMPLEADO        INT                  null,
   GENERO_EMPLEADO      VARCHAR(15)          null,
   constraint PK_EMPLEDO primary key (ID_EMPLEADO)
);
insert into EMPLEDO Values (222, 'Freddy', 'Crude',    1314456785, 'freddy@gmail.com', 30, 'Masculino');
insert into EMPLEDO Values (223, 'Maria', 'Pancracia', 1315556754, 'pancracia@gmail.com', 25, 'Femenino');


/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   IDHABITACION         INT                 not null,
   IDRESERVACIONES      INT                 null,
   NUMERO_HABITACION    INT                 null,
   ESTADO_HABITACION    VARCHAR(40)          null,
   DESCRIPCION_HABITACION VARCHAR(40)          null,
   NUMERO_CAMA          INT                 null,
   constraint PK_HABITACION primary key (IDHABITACION)
);
insert into HABITACION Values(111, 111, 2, 'Disponible', 'HABITACION VIP',1);
insert into HABITACION Values(122, 122, 3, 'Disponible', 'HABITACION SIMPLE', 2);
insert into HABITACION Values(133, 133, 4, 'Disponible', 'HABITACION MEDIA', 3);
insert into HABITACION Values(134, 134, 5, 'Disponible', 'HABITACION VIP', 4);

/*==============================================================*/
/* Table: METODO_PAGO                                           */
/*==============================================================*/
create table METODO_PAGO (
   ID                   INT                 not null,
   IDRESERVACIONES      INT                 null,
   EFECTIVO             FLOAT               null,
   TARJETA_CREDITO      FLOAT               null,
   constraint PK_METODO_PAGO primary key (ID)
);
insert into METODO_PAGO Values(144, 111, 20.50, 25.00);
insert into METODO_PAGO Values(145, 122, 25.50, 30.00);
insert into METODO_PAGO Values(146, 133, 30.50, 36.00);
insert into METODO_PAGO Values(147, 134, 35.50, 38.00);
/*==============================================================*/
/* Table: RELATIONSHIP_1                                        */
/*==============================================================*/
create table Cliente_Reservaciones (
   IDCLIENTE            INT                 not null,
   IDRESERVACIONES      INT                 not null,
   constraint PK_RELATIONSHIP_1 primary key (IDCLIENTE, IDRESERVACIONES)
);
insert into Cliente_Reservaciones Values (123, 111);
insert into Cliente_Reservaciones Values (124, 122);
insert into Cliente_Reservaciones Values (125, 133);
insert into Cliente_Reservaciones Values (126, 134);


/*==============================================================*/
/* Table: RESERVACIONES                                         */
/*==============================================================*/
create table RESERVACIONES (
   IDRESERVACIONES      INT                 not null,
   ID_EMPLEADO          INT                 null,
   FECHADERESERVACION   DATE                 null,
   DETALLE_RESERVACION  VARCHAR(50)          null,
   FECHA_INCIO          DATE                 null,
   FECHA_FINAL          DATE                 null,
   N_PERSONAS           INT     	 null,
   constraint PK_RESERVACIONES primary key (IDRESERVACIONES)
);
insert into RESERVACIONES Values (111, 222, '05/03/2020', 'Habitacion ocupada', '05/03/2020', '08/03/2020', 2);
insert into RESERVACIONES Values (122, 223, '07/04/2020', 'Habitacion ocuapda', '05/04/2020', '08/04/2020', 2);
insert into RESERVACIONES Values (133, 222, '07/05/2020', 'Habitacion ocuapda', '05/05/2020', '08/05/2020', 2);
insert into RESERVACIONES Values (134, 223, '09/06/2020', 'Habitacion ocuapda', '09/06/2020', '10/04/2020', 2);



/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS (
   ID_SERVICIO          INT                 not null,
   IDHABITACION         INT                 null,
   SERV_TVSATELITAL     VARCHAR(4)           null,
   SERV_INTERNET        VARCHAR(4)           null,
   SERV_PRESERVATIVOS   VARCHAR(4)           null,
   SERV_JUGUETES_SEX    VARCHAR(4)           null,
   SERV_LENCERIAS       VARCHAR(4)           null,
   constraint PK_SERVICIOS primary key (ID_SERVICIO)
);

insert into SERVICIOS Values(123, 111, null, 'SI', 'SI', null, 'SI');
insert into SERVICIOS Values(124, 122, 'SI', null, 'SI', 'SI', 'SI');
insert into SERVICIOS Values(125, 133, 'SI', null, 'SI', 'SI', null);
insert into SERVICIOS Values(126, 134, null, 'SI', null, 'SI', 'SI');

alter table HABITACION
   add constraint FK_HABITACI_RELATIONS_RESERVAC foreign key (IDRESERVACIONES)
      references RESERVACIONES (IDRESERVACIONES)
      on delete restrict on update restrict;

alter table METODO_PAGO
   add constraint FK_METODO_P_RELATIONS_RESERVAC foreign key (IDRESERVACIONES)
      references RESERVACIONES (IDRESERVACIONES)
      on delete restrict on update restrict;

alter table Cliente_Reservaciones
   add constraint FK_RELATION_RELATIONS_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE)
      on delete restrict on update restrict;

alter table Cliente_Reservaciones
   add constraint FK_RELATION_RELATIONS_RESERVAC foreign key (IDRESERVACIONES)
      references RESERVACIONES (IDRESERVACIONES)
      on delete restrict on update restrict;

alter table RESERVACIONES
   add constraint FK_RESERVAC_RELATIONS_EMPLEDO foreign key (ID_EMPLEADO)
      references EMPLEDO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table SERVICIOS
   add constraint FK_SERVICIO_RELATIONS_HABITACI foreign key (IDHABITACION)
      references HABITACION (IDHABITACION)
      on delete restrict on update restrict;
