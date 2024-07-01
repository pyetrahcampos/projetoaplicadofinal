create or replace FUNCTION calcular_valor_motoboy(
    p_valor_total_frete IN NUMBER
) RETURN NUMBER
AS
    v_percentual_motoboy CONSTANT NUMBER := 0.70; -- Percentual que o motoboy recebe (70%)
    v_valor_motoboy NUMBER;
BEGIN
    v_valor_motoboy := p_valor_total_frete * v_percentual_motoboy;
    RETURN v_valor_motoboy;
END calcular_valor_motoboy;
/