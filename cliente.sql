
  CREATE TABLE "CLIENTE" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"NOME" VARCHAR2(100) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100) NOT NULL ENABLE, 
	"TELEFONE" VARCHAR2(15), 
	"SENHA" VARCHAR2(100) NOT NULL ENABLE, 
	"TIPO_USUARIO" VARCHAR2(50) DEFAULT 'CLIENTE', 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UC_EMAIL" UNIQUE ("EMAIL")
  USING INDEX  ENABLE
   ) ;