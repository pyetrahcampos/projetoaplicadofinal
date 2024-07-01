create or replace FUNCTION calcular_frete(
    p_peso IN NUMBER,
    p_distancia_km IN NUMBER,
    p_tempo_deslocamento_min IN NUMBER
) RETURN NUMBER
AS
    v_valor_peso NUMBER := 0;
    v_valor_distancia NUMBER := 0;
    v_valor_tempo NUMBER := 0;
    v_total NUMBER := 0;
BEGIN
    -- Buscar o valor do peso na tabela TABELA_VALOR_PESO
    SELECT VALOR INTO v_valor_peso
    FROM TABELA_VALOR_PESO
    WHERE p_peso BETWEEN PESO_MIN AND PESO_MAX;

    -- Buscar o valor do preço por km na tabela TABELA_PRECO_KM
    SELECT PRECO_KM INTO v_valor_distancia
    FROM TABELA_PRECO_KM
    WHERE p_distancia_km BETWEEN KM_MIN AND KM_MAX;

    -- Buscar o valor do preço por tempo na tabela TABELA_PRECO_TEMPO
    SELECT PRECO_TEMPO INTO v_valor_tempo
    FROM TABELA_PRECO_TEMPO
    WHERE p_tempo_deslocamento_min BETWEEN TEMPO_MIN AND TEMPO_MAX;

    -- Calcular o total do frete
    v_total := v_valor_peso + v_valor_distancia + v_valor_tempo;

    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0; -- Tratar caso não encontre valores nas tabelas
END calcular_frete;
/