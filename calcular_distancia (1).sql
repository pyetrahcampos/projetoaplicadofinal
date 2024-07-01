create or replace FUNCTION calcular_distancia(
    p_lat_origem IN NUMBER,
    p_lon_origem IN NUMBER,
    p_lat_destino IN NUMBER,
    p_lon_destino IN NUMBER
) RETURN NUMBER
AS
    v_raio_terra CONSTANT NUMBER := 6371; -- Raio da Terra em km
    v_lat_origem_rad NUMBER := p_lat_origem * (3.141592653589793 / 180);
    v_lon_origem_rad NUMBER := p_lon_origem * (3.141592653589793 / 180);
    v_lat_destino_rad NUMBER := p_lat_destino * (3.141592653589793 / 180);
    v_lon_destino_rad NUMBER := p_lon_destino * (3.141592653589793 / 180);
    v_delta_lat NUMBER := v_lat_destino_rad - v_lat_origem_rad;
    v_delta_lon NUMBER := v_lon_destino_rad - v_lon_origem_rad;
    v_distancia NUMBER := 2 * v_raio_terra * 
        ASIN(SQRT(SIN(v_delta_lat / 2) * SIN(v_delta_lat / 2) +
                  COS(v_lat_origem_rad) * COS(v_lat_destino_rad) * 
                  SIN(v_delta_lon / 2) * SIN(v_delta_lon / 2)));
BEGIN
    RETURN v_distancia;
END calcular_distancia;
/