create or replace TRIGGER trg_after_insert_entrega
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