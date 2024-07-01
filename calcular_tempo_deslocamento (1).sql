create or replace FUNCTION calcular_tempo_deslocamento(
    p_distancia_km IN NUMBER,
    v_velocidade_media_km_h IN NUMBER DEFAULT 50 -- Velocidade média em km/h
) RETURN NUMBER
AS
BEGIN
    RETURN p_distancia_km / v_velocidade_media_km_h * 60; -- Tempo em minutos
END calcular_tempo_deslocamento;
/