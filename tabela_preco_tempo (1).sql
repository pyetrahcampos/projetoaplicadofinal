
  CREATE TABLE "TABELA_PRECO_TEMPO" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"TEMPO_MIN" NUMBER, 
	"TEMPO_MAX" NUMBER, 
	"PRECO_TEMPO" NUMBER, 
	 CONSTRAINT "PK_TABELA_PRECO_TEMPO" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   ) ;