
  CREATE TABLE "ENTREGA_INFO" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"ENTREGA_ID" NUMBER NOT NULL ENABLE, 
	"MOTOBOY_ID" NUMBER NOT NULL ENABLE, 
	"HORARIO_INICIO" DATE, 
	"HORARIO_PREVISTO_ENTREGA" DATE, 
	"STATUS" VARCHAR2(50), 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "ENTREGA_INFO" ADD FOREIGN KEY ("ENTREGA_ID")
	  REFERENCES "ENTREGA" ("ID") ENABLE;
  ALTER TABLE "ENTREGA_INFO" ADD FOREIGN KEY ("MOTOBOY_ID")
	  REFERENCES "MOTOBOY" ("ID") ENABLE;