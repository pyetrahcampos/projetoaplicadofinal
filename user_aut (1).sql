create or replace FUNCTION user_aut    (
    
 p_username IN VARCHAR2, --User_Name
 p_password IN VARCHAR2 -- Password
)
 RETURN BOOLEAN
AS
 lc_pwd_exit VARCHAR2 (1);
BEGIN
 -- Validate whether the user exits or not
 SELECT 'Y'
 INTO lc_pwd_exit
 FROM USUARIO
 WHERE upper(NOME) = upper(p_username) AND SENHA = p_password
;
RETURN TRUE;
EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
 RETURN FALSE;
END user_aut;
/