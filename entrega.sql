
  CREATE TABLE "ENTREGA" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"LAT_ORIGEM" NUMBER, 
	"LON_ORIGEM" NUMBER, 
	"LAT_DESTINO" NUMBER, 
	"LON_DESTINO" NUMBER, 
	"PESO_MERCADORIA" NUMBER, 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   ) ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_AFTER_INSERT_ENTREGA" 
AFTER INSERT ON ENTREGA
FOR EACH ROW
DECLARE
    v_motoboy_id NUMBER;
BEGIN
    -- Aqui você pode definir uma lógica para selecionar um motoboy disponível.
    -- Para simplificação, estou assumindo que você quer associar o primeiro motoboy disponível.
    SELECT ID INTO v_motoboy_id
    FROM MOTOBOY
    WHERE ROWNUM = 1;

    INSERT INTO ENTREGA_INFO (ENTREGA_ID, MOTOBOY_ID, HORARIO_INICIO, HORARIO_PREVISTO_ENTREGA, STATUS)
    VALUES (:NEW.ID, v_motoboy_id, SYSDATE, NULL, 'ABERTA');
END;
/
ALTER TRIGGER "TRG_AFTER_INSERT_ENTREGA" ENABLE;