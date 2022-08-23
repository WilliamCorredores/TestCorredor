create or replace PACKAGE BODY "P_CAB_ALTERNO" AS

  PROCEDURE P_CONSULTA_GENERAL_DECRETO661 (
                            P_NUM_IDEN        IN VARCHAR2,
                            P_TID_CODIGO      IN VARCHAR2,
                            P_PRODUCTO        IN VARCHAR2,
                            P_GRUPO_PRODUCTO  IN VARCHAR2,
                            --
                            P_PRODUCTO_PERMITIDO    OUT VARCHAR2,
         --*********************************************************************************  
                            P_REQUIERE_EXIMENTE     OUT VARCHAR2,
                            P_REQUIERE_REPERFILARSE OUT VARCHAR2,
                            IO_CURSOR1     OUT SYS_REFCURSOR, -- EXIMENTES
                            --
                            -- ESTRUCTURA DE EXIMENTES
                            --P_EXI_FECHA             OUT DATE,
                            --P_EXI_NUM_IDEN          OUT VARCHAR2,
                            --P_EXI_TID_CODIGO        OUT VARCHAR2,
                            --P_EXI_PRODUCTO          OUT VARCHAR2,
                            --P_EXI_ORDEN             OUT NUMBER,
                            --P_EXI_TIPO_ORDEN        OUT NUMBER,
                            --P_EXI_MEDIO_RECEPCION   OUT VARCHAR2,                                                                                                                                                                                   
                            --P_EXI_DETALLE_MEDIO_REC OUT VARCHAR2,
                            --P_EXI_FECHA_RECEPCION   OUT DATE,
                            --P_EXI_HORA_RECEPCION    OUT VARCHAR2,                                                                                                                                                                                   
                            --P_EXI_ORD_NUM_IDEN      OUT VARCHAR2,
                            --P_EXI_ORD_TID_CODIGO    OUT VARCHAR2,
                            --P_EXI_ESTADO            OUT VARCHAR2,
                            --P_EXI_FECHA_VIGENCIA    OUT DATE,
       --*********************************************************************************  
                            --
                            P_REQUIERE_RENUNCIA     OUT VARCHAR2,
                            IO_CURSOR2     OUT SYS_REFCURSOR, -- RENUNCIA
                            --
                            -- ESTRCUTURA DE RENUNCIAS
                            --P_REN_NUM_IDEN          OUT VARCHAR2,
                            --P_REN_TID_CODIGO        OUT VARCHAR2,
                            --P_REN_ORD_NUM_IDEN      OUT VARCHAR2,
                            --P_REN_ORD_TID_CODIGO    OUT VARCHAR2,
                            --P_REN_ASESOR_NUM_IDEN   OUT VARCHAR2,
                            --P_REN_ASESOR_TID_CODIGO OUT VARCHAR2,
                            --P_REN_PRODUCTO          OUT VARCHAR2,
                            --P_REN_GRUPO_PRODUCTO    OUT VARCHAR2,
                            --P_REN_ACEPTA            OUT VARCHAR2,
                            --P_REN_ENVIO_CORREO      OUT VARCHAR2,
                            --P_REN_OPERACION_CANAL   OUT VARCHAR2,
                            --P_REN_FECHA_OPERACION   OUT DATE,
                            --P_REN_HORA_OPERACION    OUT VARCHAR2,
                            --P_REN_MEDIO_RECEPCION   OUT VARCHAR2,                                                                                                                                                                                   
                            --P_REN_DETALLE_MEDIO_REC OUT VARCHAR2,                                                                                                                                                                                   
                            --P_REN_OBSERVACIONES     OUT VARCHAR2,
                            --
        --*********************************************************************************  
                            P_CONT_COMISION_ACEPTA  OUT VARCHAR2,
                            P_CONT_COMISION_CORREO  OUT VARCHAR2,
                            IO_CURSOR3     OUT SYS_REFCURSOR, -- CONTRATO COMISION
                            --
                            -- ESTRUCTURA CONTRATO DE COMISION RV
                            --P_CCO_NUM_IDEN          OUT VARCHAR2,
                            --P_CCO_TID_CODIGO        OUT VARCHAR2,
                            --P_CCO_ORD_NUM_IDEN      OUT VARCHAR2,
                            --P_CCO_ORD_TID_CODIGO    OUT VARCHAR2,
                            --P_CCO_ASESOR_NUM_IDEN   OUT VARCHAR2,
                            --P_CCO_ASESOR_TID_CODIGO OUT VARCHAR2,
                            --P_CCO_PRODUCTO          OUT VARCHAR2,
                            --P_CCO_GRUPO_PRODUCTO    OUT VARCHAR2,
                            --P_CCO_ACEPTA            OUT VARCHAR2,
                            --P_CCO_ENVIO_CORREO      OUT VARCHAR2,
                            --P_CCO_OPERACION_CANAL   OUT VARCHAR2,
                            --P_CCO_FECHA_OPERACION   OUT DATE,
                            --P_CCO_HORA_OPERACION    OUT VARCHAR2,
                            --P_CCO_MEDIO_RECEPCION   OUT VARCHAR2,                                                                                                                                                                                   
                            --P_CCO_DETALLE_MEDIO_REC OUT VARCHAR2,                                                                                                                                                                                   
                            --P_CCO_OBSERVACIONES     OUT VARCHAR2,
                            --
                            P_CONTRAPARTE_ACEPTA_OTC OUT VARCHAR2,
                            P_CONTRAPARTE_CORREO_OTC OUT VARCHAR2,
                            IO_CURSOR4     OUT SYS_REFCURSOR, -- CONTRAPARTE OTC
      --*********************************************************************************  
                            --
                            -- ESTRUCTURA CONTRAPARTE OTC
                            --P_OTC_NUM_IDEN          OUT VARCHAR2,
                            --P_OTC_TID_CODIGO        OUT VARCHAR2,
                            --P_OTC_ORD_NUM_IDEN      OUT VARCHAR2,
                            --P_OTC_ORD_TID_CODIGO    OUT VARCHAR2,
                            --P_OTC_ASESOR_NUM_IDEN   OUT VARCHAR2,
                            --P_OTC_ASESOR_TID_CODIGO OUT VARCHAR2,
                            --P_OTC_PRODUCTO          OUT VARCHAR2,
                            --P_OTC_GRUPO_PRODUCTO    OUT VARCHAR2,
                            --P_OTC_ACEPTA            OUT VARCHAR2,
                            --P_OTC_ENVIO_CORREO      OUT VARCHAR2,
                            --P_OTC_OPERACION_CANAL   OUT VARCHAR2,
                            --P_OTC_FECHA_OPERACION   OUT DATE,
                            --P_OTC_HORA_OPERACION    OUT VARCHAR2,
                            --P_OTC_MEDIO_RECEPCION   OUT VARCHAR2,                                                                                                                                                                                   
                            --P_OTC_DETALLE_MEDIO_REC OUT VARCHAR2,                                                                                                                                                                                   
                            --P_OTC_OBSERVACIONES     OUT VARCHAR2,
                            --
                            P_CLOB         OUT CLOB) AS
  BEGIN
   P_PRODUCTO_PERMITIDO:='S';
  P_REQUIERE_EXIMENTE:='S';
  P_REQUIERE_REPERFILARSE :='N';
    OPEN IO_CURSOR1 FOR
      SELECT '02-02-2021',P_NUM_IDEN,P_TID_CODIGO,P_PRODUCTO,25894,'C','TEL','EXT 6578','20-03-2022','10:25','19856785','CC','VIG','20-03-2023'
      FROM DUAL
      WHERE 1=1       
      ORDER BY 1;
    
    P_REQUIERE_RENUNCIA :='S';  
    OPEN IO_CURSOR2 FOR    
      SELECT P_NUM_IDEN,P_TID_CODIGO,'51897654','CC','1032875428','CC',P_PRODUCTO,NULL,'S','S','CCO','05-08-2021','14:22','TEL','EXT 9875',NULL
        FROM DUAL
      WHERE 1=1        
      ORDER BY 1;   
    
    P_CONT_COMISION_ACEPTA :='S';
      P_CONT_COMISION_CORREO:='S';
    OPEN IO_CURSOR3 FOR
    SELECT P_NUM_IDEN,P_TID_CODIGO,'1025987528','CC','79582635','CC',P_PRODUCTO,NULL,'S','S','CCO','08-09-2021','15:45','TEL','EXT 6999',NULL
        FROM DUAL
      WHERE 1=1
    ORDER BY 1;
    
    P_CONTRAPARTE_ACEPTA_OTC:='S';
      P_CONTRAPARTE_CORREO_OTC :='N';
    OPEN IO_CURSOR4 FOR
    
                    
                          
      SELECT P_NUM_IDEN,P_TID_CODIGO,'19245896','CC','1033589652','CC',P_PRODUCTO,NULL,'S','S','OTC','25-06-2021','16:10','TEL','EXT 4758',NULL
             TID_DESCRIPCION
      FROM DUAL
      WHERE 1=1       
      ORDER BY 1;  
  P_CLOB := NULL; 
  
  END P_CONSULTA_GENERAL_DECRETO661;

  PROCEDURE P_REGISTRO_RENUNCIA_DEC661 (
                            P_TIPO_OPERACION       IN NUMBER,  -- 1-Renuncia / 2-Solo ejecucion / 3- Contraparte OTC
                            P_CLI_NUM_IDEN         IN VARCHAR2,
                            P_CLI_TID_CODIGO       IN VARCHAR2,
                            P_ORDENANTE_NUM_IDEN   IN VARCHAR2,
                            P_ORDENANTE_TID_CODIGO IN VARCHAR2,
                            P_ASESOR_NUM_IDEN      IN VARCHAR2,
                            P_ASESOR_TID_CODIGO    IN VARCHAR2,
                            P_PRODUCTO             IN VARCHAR2,
                            P_GRUPO_PRODUCTO       IN VARCHAR2,
                            P_ACEPTA               IN VARCHAR2,
                            P_ENVIAR_CORREO        IN VARCHAR2,
                            P_OPERACION_EN_CANAL   IN VARCHAR2,
                            P_FECHA_OPERACION      IN DATE,
                            P_HORA_OPERACION       IN VARCHAR2,
                            P_CANAL_RECEPCION      IN VARCHAR2,
                            P_DETALLE_RECEPCION    IN VARCHAR2,
                            P_OBSERVACIONES        IN VARCHAR2,
                            P_ID_OPERACION         IN VARCHAR2,
                            --
                            P_CORREO_NOTIFICACION  OUT VARCHAR2,
                            P_NOMBRE_CLIENTE       OUT VARCHAR2,
                            P_NOMBRE_FONDO         OUT VARCHAR2,
                            P_EMPRESA_ADMON_FONDO  OUT VARCHAR2,
                            P_CODIGO_PLANTILLA     OUT VARCHAR2,
                            P_CLOB                 OUT CLOB) AS

    CURSOR C_CLIENTE IS
      SELECT NVL(P_CORREOS_COEASY.P_CORREO(P_ID => P_CLI_TID_CODIGO ,
                                       P_NIT => P_CLI_NUM_IDEN ,
                                       P_TIPO => 'P'),'EL CLIENTE NO TIENE DEFINIDO CORREO!.'),
            DECODE(PER_TIPO,'PNA',PER_NOMBRE||' '||PER_PRIMER_APELLIDO||' '||PER_SEGUNDO_APELLIDO,PER_RAZON_SOCIAL)
            
      FROM PERSONAS,CUENTAS_CLIENTE_CORREDORES
      WHERE PER_NUM_IDEN = CCC_PER_NUM_IDEN
        AND PER_TID_CODIGO = CCC_PER_TID_CODIGO
        AND CCC_CLI_PER_NUM_IDEN = P_CLI_NUM_IDEN
        AND CCC_CLI_PER_TID_CODIGO = P_CLI_TID_CODIGO
        ; 
    CURSOR C_FONDOS IS
      SELECT FON_RAZON_SOCIAL
     FROM FONDOS
     WHERE FON_CODIGO = P_GRUPO_PRODUCTO; 
          
   V_MSJ VARCHAR2(2000);
   V_CONSEC DECRETO_661_EVENTOS.DEC_CONSECUTIVO%TYPE;
   V_SALIDA CLOB;
  BEGIN
   V_MSJ :='Borrando tabla log errores GL_CAB_ERROR';   
   DELETE GL_CAB_ERROR;
   SELECT NVL(MAX(DEC_CONSECUTIVO),0)+1
   INTO V_CONSEC
   FROM DECRETO_661_EVENTOS;
   V_MSJ :='Insertando datos en decreto 661';
   INSERT INTO DECRETO_661_EVENTOS(DEC_CONSECUTIVO,DEC_TIPO,DEC_ESTADO,DEC_PRODUCTO,DEC_ACTIVO_PRODUCTO,DEC_OPERACION_CANAL,
   DEC_ACEPTACION,DEC_ACEP_NOTIFICACION,DEC_PER_TID_CODIGO_CLIENTE,DEC_PER_NUM_IDEN_CLIENTE,DEC_FECHA_INICIO,DEC_FECHA_FIN,
   DEC_PER_NUM_IDEN_ORDENANTE,DEC_PER_TID_CODIGO_ORDENANTE,DEC_PER_NUM_IDEN_COMERCIAL,DEC_PER_TID_CODIGO_COMERCIAL,DEC_OBSERVACIONES,
   DEC_CANAL_RECEPCION,DEC_DETALLE_RECEPCION,DEC_USUARIO_REGISTRO,DEC_MAQUINA_REGISTRO,DEC_FECHA_REGISTRO,DEC_HORA_REGISTRO)
   VALUES
   (V_CONSEC,P_TIPO_OPERACION,'VIG',P_PRODUCTO,P_GRUPO_PRODUCTO,P_OPERACION_EN_CANAL,P_ACEPTA,P_ENVIAR_CORREO,P_CLI_TID_CODIGO,
    P_CLI_NUM_IDEN,P_FECHA_OPERACION,sysdate,P_ORDENANTE_NUM_IDEN,P_ORDENANTE_TID_CODIGO,P_ASESOR_NUM_IDEN,P_ASESOR_TID_CODIGO,                       
    P_OBSERVACIONES,P_CANAL_RECEPCION,P_DETALLE_RECEPCION,'SIN DEFINIR','SIN DEFINIR',SYSDATE, P_HORA_OPERACION);                       
   P_EMPRESA_ADMON_FONDO := 'CORREDORES DAVIVIENDA'; 
   P_CODIGO_PLANTILLA := '140'; 
--SIN DEFINIR:DEC_FECHA_FIN, 
   V_MSJ :='Consultando datos del cliente';
   OPEN C_CLIENTE;
      FETCH C_CLIENTE INTO P_CORREO_NOTIFICACION,P_NOMBRE_CLIENTE ;
      CLOSE C_CLIENTE;
  IF P_PRODUCTO = 'FON' THEN  
  V_MSJ :='Consultando datos del fondo';
  OPEN C_FONDOS;
      FETCH C_FONDOS INTO P_NOMBRE_FONDO;
      CLOSE C_FONDOS;
  END IF;
  commit;
  /*IF P_CLOB IS NOT NULL THEN
     RAISE_APPLICATION_ERROR(-20900, 'Existen errores de registro de renuncia:'||P_CLOB);
   END IF; */ 
  EXCEPTION WHEN OTHERS THEN 
     P_CLOB:= 'Error '||V_MSJ ||'*** P_REGISTRO_RENUNCIA_DEC661*** '||SQLERRM;
  END P_REGISTRO_RENUNCIA_DEC661;
  /*PROCEDURE P_CONSULTA_EXIMIENTE(
                            P_CLI_NUM_IDEN         IN VARCHAR2,
                            P_CLI_TID_CODIGO       IN VARCHAR2, 
                            P_PRODUCTO             IN VARCHAR2,
                            P_GRUPO_PRODUCTO       IN VARCHAR2,
              P_PRODUCTO_PERMITIDO   OUT VARCHAR2,
      --*********************************************************************************         
              IO_CURSOR1     OUT SYS_REFCURSOR, -- EximenteDTO
                --
                -- ESTRUCTURA DE EximenteDTO
                --P_REQUIERE_EXIMENTE     OUT VARCHAR2,
                --P_REQUIERE_REPERFILARSE   OUT VARCHAR2,
                --IO_CURSOR11     OUT SYS_REFCURSOR  "List (of EximentesDTO)"
                  --
                  -- ESTRUCTURA DE List (of EximentesDTO)
                  --P_EXI_FECHA       OUT DATE,
                  --P_EXI_NUM_IDEN      OUT VARCHAR2,
                  --P_EXI_TID_CODIGO      OUT VARCHAR2,
                  --P_EXI_PRODUCTO      OUT VARCHAR2,
                  --P_EXI_ORDEN       OUT NUMBER,
                  --P_EXI_TIPO_ORDEN      OUT VARCHAR2,   
                  --P_EXI_MEDIO_RECEPCION   OUT VARCHAR2, 
                  --P_EXI_DETALLE_MEDIO_REC OUT VARCHAR2,
                  --P_EXI_FECHA_RECEPCION   OUT DATE,
                  --P_EXI_HORA_RECEPCION    OUT VARCHAR2,
                  --P_EXI_ORD_NUM_IDEN    OUT VARCHAR2,
                  --P_EXI_ORD_TID_CODIGO    OUT VARCHAR2,
                  --P_EXI_ESTADO        OUT VARCHAR2,
                  --P_EXI_FECHA_VIGENCIA    OUT DATE,
      --*********************************************************************************  
               IO_CURSOR2     OUT SYS_REFCURSOR, -- RenunciaDTO
                --
                -- ESTRUCTURA DE RenunciaDTO
                --P_REQUIERE_RENUNCIA OUT VARCHAR2,
                --IO_CURSOR21     OUT SYS_REFCURSOR  "List (of RenunciasDTO)"
                  --
                  -- ESTRUCTURA DE List (of RenunciasDTO)
                  --P_REN_NUM_IDEN      OUT VARCHAR2,
                  --P_REN_TID_CODIGO      OUT VARCHAR2,
                  --P_REN_ORD_NUM_IDEN    OUT VARCHAR2,
                  --P_REN_ORD_TID_CODIGO    OUT VARCHAR2,
                  --P_REN_ASESOR_NUM_IDEN   OUT VARCHAR2,
                  --P_REN_ASESOR_TID_CODIGO OUT VARCHAR2,
                  --P_REN_PRODUCTO      OUT VARCHAR2,
                  --P_REN_GRUPO_PRODUCTO    OUT VARCHAR2,
                  --P_REN_ACEPTA        OUT VARCHAR2,
                  --P_REN_ENVIO_CORREO    OUT VARCHAR2,
                  --P_REN_OPERACION_CANAL   OUT VARCHAR2,
                  --P_REN_FECHA_OPERACION   OUT DATE,
                  --P_REN_HORA_OPERACION    OUT VARCHAR2,
                  --P_REN_MEDIO_RECEPCION   OUT VARCHAR2,
                  --P_REN_DETALLE_MEDIO_REC OUT VARCHAR2,
                  --P_REN_OBSERVACIONES   OUT VARCHAR2
      --*********************************************************************************  
              IO_CURSOR3     OUT SYS_REFCURSOR, -- SoloEjecucionDTO
                --
                -- ESTRUCTURA DE SoloEjecucionDTO
                --IO_CURSOR31     OUT SYS_REFCURSOR,  "ContratoComisionRVDTO"
                --IO_CURSOR32     OUT SYS_REFCURSOR  "CCContraparteOTCDTO"
                  --
                  -- ESTRUCTURA DE IO_CURSOR31  ContratoComisionRVDTO
                  --P_CONT_COMISION_ACEPTA    OUT VARCHAR2,
                  --P_CONT_COMISION_CORREO  OUT VARCHAR2,
                  --IO_CURSOR311     OUT SYS_REFCURSOR   "List (of ContratosComisionRV)"
                    -- ESTRUCTURA DE ContratosComisionRV
                    --P_CCO_NUM_IDEN      OUT VARCHAR2,
                    --P_CCO_TID_CODIGO      OUT VARCHAR2,
                    --P_CCO_ORD_NUM_IDEN    OUT VARCHAR2,
                    --P_CCO_ORD_TID_CODIGO    OUT VARCHAR2,
                    --P_CCO_ASESOR_NUM_IDEN   OUT VARCHAR2,
                    --P_CCO_ASESOR_TID_CODIGO OUT VARCHAR2,
                    --P_CCO_PRODUCTO      OUT VARCHAR2,
                    --P_CCO_GRUPO_PRODUCTO    OUT VARCHAR2,
                    --P_CCO_ACEPTA        OUT VARCHAR2,
                    --P_CCO_ENVIO_CORREO    OUT VARCHAR2,
                    --P_CCO_OPERACION_CANAL   OUT VARCHAR2,
                    --P_CCO_FECHA_OPERACION   OUT DATE,
                    --P_CCO_HORA_OPERACION    OUT VARCHAR2,
                    --P_CCO_MEDIO_RECEPCION   OUT VARCHAR2,
                    --P_CCO_DETALLE_MEDIO_REC OUT VARCHAR2,
                    --P_CCO_OBSERVACIONES     OUT VARCHAR2
                  --
                  -- ESTRUCTURA DE IO_CURSOR32 CCContraparteOTCDTO
                  --P_CONTRAPARTE_ACEPTA_OTC  OUT VARCHAR2,
                  --P_CONTRAPARTE_CORREO_OTC  OUT VARCHAR2,
                  --IO_CURSOR321     OUT SYS_REFCURSOR  "List (of CsCContraparteOTCDTO)"
                    -- ESTRUCTURA DE CsCContraparteOTCDTO
                    --P_OTC_NUM_IDEN      OUT VARCHAR2,
                    --P_OTC_TID_CODIGO      OUT VARCHAR2,
                    --P_OTC_ORD_NUM_IDEN    OUT VARCHAR2,
                    --P_OTC_ORD_TID_CODIGO    OUT VARCHAR2,
                    --P_OTC_ASESOR_NUM_IDEN   OUT VARCHAR2,
                    --P_OTC_ASESOR_TID_CODIGO OUT VARCHAR2,
                    --P_OTC_PRODUCTO      OUT VARCHAR2,
                    --P_OTC_GRUPO_PRODUCTO    OUT VARCHAR2,
                    --P_OTC_ACEPTA        OUT VARCHAR2,
                    --P_OTC_ENVIO_CORREO    OUT VARCHAR2,
                    --P_OTC_OPERACION_CANAL   OUT VARCHAR2,
                    --P_OTC_FECHA_OPERACION   OUT DATE,
                    --P_OTC_HORA_OPERACION    OUT VARCHAR2,
                    --P_OTC_MEDIO_RECEPCION   OUT VARCHAR2,
                    --P_OTC_DETALLE_MEDIO_REC OUT VARCHAR2,
                    --P_OTC_OBSERVACIONES   OUT VARCHAR2
      --*********************************************************************************  
              IO_CURSOR4     OUT SYS_REFCURSOR, -- ErrorDTO
              --
                            -- ESTRUCTURA DE ErrorDTO
                            --P_CODIGO_ERROR      OUT VARCHAR2,
              --P_DECRIPCION_ERROR        OUT VARCHAR2
                            P_CLOB                 OUT CLOB)AS
  BEGIN
    -- TAREA Se necesita implementación 
    NULL;
  END  P_CONSULTA_EXIMIENTE;*/
  -- Procedimiento para consultar las condiciones de Clasificacion de Perfil
  PROCEDURE P_CONSULTA_PERFIL_CLASIFICA(P_ENT_CANAL                   	IN  NUMBER	,
                                        P_ENT_TIPO_CONSULTA	            IN	NUMBER	,
                                        P_ENT_PRODUCTO_FONDO	          IN	VARCHAR2	,
                                        P_ENT_CODIGO_PRODUCTO	          IN	VARCHAR2	,
                                        P_ENT_TIPO_IDENTIFICACION	      IN  VARCHAR2	,
                                        P_ENT_IDENTIFICACION_CLIENTE 	  IN  VARCHAR2	,
                                        P_SAL_CANTIDAD_DATOS_PRODUCTOS	OUT	NUMBER,
                                        P_SAL_PERFIL_CLIENTE	          OUT	VARCHAR2	,
                                        P_SAL_TIPO_INVERSIONISTA	      OUT	VARCHAR2	,
                                        P_SAL_REQUIERE_VALIDACION	      OUT VARCHAR2	,
                                        P_SAL_REQUIERE_AUTORIZACION	    OUT VARCHAR2	,
                                        P_SAL_DESCRIPCION_661	          OUT VARCHAR2	,
                                        P_SAL_CONTROL_RENUNCIA	        OUT NUMBER	,
                                        P_SAL_CONTROL_AUTORIZACION	    OUT NUMBER	,
                                        --P_CLOB         OUT CLOB,
                                        IO_CURSOR1                      OUT SYS_REFCURSOR)
  AS
  BEGIN
   OPEN io_cursor1 FOR
    SELECT  'CORREDORES DAVIVIENDA ' SOCIEDAD_ADMINISTRADORA,
            '2' CODIGO_COMPANIA,
            PRDA_PRODUCTO_BANCO CODIGO_FONDO, 
            FON_RAZON_SOCIAL NOMBRE_FONDO,
            PRDA_PRODUCTO_BANCO||'000000000000' NUMERO_PRODUCTO,
            'C' TIPO_PRODUCTO,
            NULL Nombre_objetivo,
            NULL Etiqueta_tipo_cuenta,
            NULL Codigo_alternativa,
            NULL Nombre_alternativa,
            NULL Codigo_subalternativa,
            NULL Nombre_subalternativa,
            'S' PRODUCTO_HABILITADO,
            DECODE(PRO_PERFIL,'CON','01',
                              'MOD','02',
                              'ARR','03',NULL) COD_PERFIL_PRODUCTO,
            DECODE(PRO_PERFIL,'CON','CONSERVADOR',
                              'MOD','MODERADO',
                              'ARR','ARRIESGADO',NULL) DESC_PERFIL_PRODUCTO,
            DECODE(PRO_PERFIL,'CON','CONSERVADOR',
                              'MOD','MODERADO',
                              'ARR','ARRIESGADO',NULL) ETIQUETA_PERFIL_PRODUCTO,
            DECODE(PRO_CLASIFICACION,'SIM','01',
                                     'UNI','02',
                                     'COM','03',NULL) COD_CLASIFICACION_PRODUCTO,
            DECODE(PRO_CLASIFICACION,'SIM','SIMPLE',
                                     'UNI','SIMPLE UNIVERSAL',
                                     'COM','COMPLEJO',NULL) DESC_CLASIFICACION_PRODUCTO,
            DECODE(PRO_CLASIFICACION,'SIM','SIMPLE',
                                     'UNI','SIMPLE UNIVERSAL',
                                     'COM','COMPLEJO',NULL) ETIQUETA_CLASIFICACION_PRODUCT,
            'N' Aplica_programacion_aportes,   -- lOGICA ESTÁ PENDIENTE
            'TIENE' Tipo_eximente, -- LOGICA PENDIENTE
            'VIGENTE' estado_eximente, -- LOGICA PENDIENTE
            0 contador_eximente, 
            'N' requiere_reperfilamiento, -- LOGICA PENDIENTE
            'S' requiere_eximente, -- LOGICA PENDIENTE
            'S' requiere_renuncia_recomen, -- LOGICA PENDIENTE
            'S' requiere_evaluacion,
            'NA' descripcion_condicion661,
            0 contador_condiciones,
            0 contador_evaluacion
      FROM  CLIENTES_PRODUCTOS_DAVIVIENDA CPD, FONDOS FON, PRODUCTOS PRO, PRODUCTOS_DAVIVIENDA PRD
     WHERE  CPD.CPDA_CFO_CCC_CLI_PER_NUM_IDEN = '1020729019'
       AND  CPD.CPDA_CFO_CCC_CLI_PER_TID_CODIG = 'CC'
       AND  CPD.CPDA_CFO_FON_CODIGO = FON.FON_CODIGO
       AND  FON.FON_NPR_PRO_MNEMONICO = PRO.PRO_MNEMONICO
       AND  PRD.PRDA_FON_CODIGO = FON.FON_CODIGO;

    P_SAL_CANTIDAD_DATOS_PRODUCTOS	:= 4;
    P_SAL_PERFIL_CLIENTE	          := 'CONSERVADOR';
    P_SAL_TIPO_INVERSIONISTA	      := 'INVERSIONISTA';
    P_SAL_REQUIERE_VALIDACION	      := 'N';
    P_SAL_REQUIERE_AUTORIZACION	    := 'S';
    P_SAL_DESCRIPCION_661	          := 'NA';
    P_SAL_CONTROL_RENUNCIA	        := 0;
    P_SAL_CONTROL_AUTORIZACION	    := 0;

  --P_CLOB := NULL; 

  END P_CONSULTA_PERFIL_CLASIFICA;
  -- Procedimiento para manejar Novedades de Eximente Renuncia
  PROCEDURE P_NOVEDAD_EXIMENTE_RENUNCIA (
                            P_CANAL                     IN  NUMBER  ,
                            P_TIPO_OPERACION            IN      NUMBER  ,
                            P_CLI_NUMERO_IDENTIFICACION IN      VARCHAR2  ,
                            P_CLI_TIPO_IDENTIFICACION   IN      VARCHAR2  ,
                            P_CLI_NOMBRE_CLIENTE        IN      VARCHAR2  ,
                            P_ORD_NUMERO_IDENTIFICACION IN      VARCHAR2  ,
                            P_ORD_TIPO_IDENTIFICACION   IN      VARCHAR2  ,
                            P_COM_NUMERO_IDENTIFICACION IN      VARCHAR2  ,
                            P_COM_TIPO_IDENTIFICACION   IN      VARCHAR2  ,
                            P_PRODUCTO                  IN      VARCHAR2  ,
                            P_GRUPO_PRODUCTO            IN      VARCHAR2  ,
                            P_ACEPTA                    IN      VARCHAR2  ,
                            P_ENVIO_EMAIL               IN      VARCHAR2  ,
                            P_TIPO_EXIMENTE             IN      VARCHAR2  ,
                            P_OPERACIÓN_EN_CANAL        IN      VARCHAR2  ,
                            P_FECHA                     IN      VARCHAR2  ,
                            P_HORA                      IN      VARCHAR2  ,
                            P_CANAL_MEDIO_VERIFICABLE   IN      VARCHAR2  ,
                            P_DETALLE_MEDIO_VERIFICABLE IN      VARCHAR2  ,
                            P_OBSERVACIONES             IN      VARCHAR2  ,
                            P_ID_OPERACION              IN      VARCHAR2  ,
                            P_CONSECUTIVO_EXIMENTE      OUT   VARCHAR2  ,
                            P_CONSECUTIVO_RENUNCIA      OUT   VARCHAR2  ,
                            P_ARCHIVO_BASE64            OUT   VARCHAR2  ,
                            P_ID_CORE                   OUT   VARCHAR2  ,
                            --
                            P_CLOB                      OUT   CLOB) AS
  BEGIN
    /* TAREA Se necesita implementación */
    NULL;
  END P_NOVEDAD_EXIMENTE_RENUNCIA;

 PROCEDURE P_CONSULTA_FONDOS(P_PRODUCTO        IN VARCHAR2,  -- FON = FONDOS 
                             P_ID_PRODUCTO     IN VARCHAR2,  -- NULL = reportar todos los FICs / NOT NULL fondo especifico
                             P_ERROR           OUT VARCHAR2, -- '000' resultado exitoso / Diferente a '000' resultado con error
                             P_ERROR_MENSAJE   OUT VARCHAR2, -- Mensaje del error
                             IO_CURSOR         OUT O_CURSOR) IS
                             
 CURSOR C_FONDO (P_FONDO VARCHAR2) IS
   SELECT 'X'
   FROM FONDOS
   WHERE FON_CODIGO = P_FONDO;
 C_FON C_FONDO%ROWTYPE;
 
BEGIN
  P_ERROR:= '000';
  P_ERROR_MENSAJE := NULL;
  IF P_PRODUCTO = 'FON' THEN
     IF P_ID_PRODUCTO IS NULL THEN  --> Solicitan todos los fondos
         OPEN IO_CURSOR FOR
                SELECT FON_CODIGO , FON_RAZON_SOCIAL , 
                   DECODE(PRO_PERFIL,'CON','CONSERVADOR',
                                     'MOD','MODERADO',
                                     'ARR','ARRIESGADO',NULL),
                   DECODE(PRO_CLASIFICACION,'SIM','SIMPLE',
                                            'UNI','UNIVERSAL',
                                            'COM','COMPLEJO',NULL)
                FROM FONDOS, PRODUCTOS
                WHERE FON_NPR_PRO_MNEMONICO = PRO_MNEMONICO
                AND FON_ESTADO = 'A'
                AND FON_TIPO = 'A'
                AND FON_TIPO_ADMINISTRACION = 'F'
                AND FON_CAPITAL_PRIVADO = 'N'
                AND FON_NOMBRE_CORTO IS NOT NULL
                ORDER BY 1;
     ELSE                            --> Solicitan un fondo específico 
       OPEN C_FONDO(P_ID_PRODUCTO);
       FETCH C_FONDO INTO C_FON;
       IF C_FONDO%NOTFOUND THEN
          P_ERROR:= '002';
          P_ERROR_MENSAJE := 'El Fondo solicitado no existe'||' '||P_ID_PRODUCTO;
       ELSE
          OPEN IO_CURSOR FOR
                SELECT FON_CODIGO , FON_RAZON_SOCIAL , 
                   DECODE(PRO_PERFIL,'CON','CONSERVADOR',
                                     'MOD','MODERADO',
                                     'ARR','ARRIESGADO',NULL),
                   DECODE(PRO_CLASIFICACION,'SIM','SIMPLE',
                                            'UNI','UNIVERSAL',
                                            'COM','COMPLEJO',NULL)
                FROM FONDOS, PRODUCTOS
                WHERE FON_NPR_PRO_MNEMONICO = PRO_MNEMONICO
                AND FON_ESTADO = 'A'
                AND FON_TIPO = 'A'
                AND FON_TIPO_ADMINISTRACION = 'F'
                AND FON_CAPITAL_PRIVADO = 'N'
                AND FON_NOMBRE_CORTO IS NOT NULL
                AND FON_CODIGO = P_ID_PRODUCTO
                ORDER BY 1;
       END IF;
       CLOSE C_FONDO;
     END IF;
  ELSE
    P_ERROR:= '001';
    P_ERROR_MENSAJE := 'El tipo de producto no es valido'||' '||P_PRODUCTO;
  END IF;
END;

 PROCEDURE P_CONSULTA_CLIENTE(P_NUM_IDENT      IN VARCHAR2,     -- Numero de identificacion
                              P_TID_CODIGO     IN VARCHAR2,     -- Tipo de identificacion
                              P_TIPO_CLIENTE   OUT VARCHAR2,    -- N = Inversionista / S = Inversionista Profesional
                              P_PERFIL_RIESGO  OUT VARCHAR2,    -- CONSERVADOR / MODERADO / ARRIESGADO / SIN PERFIL
                              P_ERROR          OUT VARCHAR2,    -- '000' resultado exitoso / Diferente a '000' resultado con error
                              P_ERROR_MENSAJE  OUT VARCHAR2) IS -- Mensaje del error 
                             
 CURSOR C_CLIENTE (P_NUM_IDENT VARCHAR2,P_TID_CODIGO VARCHAR2 ) IS
   SELECT 'X'
   FROM CLIENTES
   WHERE CLI_PER_NUM_IDEN   = P_NUM_IDENT
   AND   CLI_PER_TID_CODIGO = P_TID_CODIGO;
 C_CLI C_CLIENTE%ROWTYPE;
 
 CURSOR C_DATOS (P_NUM_IDENT VARCHAR2,P_TID_CODIGO VARCHAR2 ) IS
    SELECT DECODE(CLI_PROFESIONAL,'S','S','N') CLI_PROFESIONAL, 
           DECODE(CLI_PERFIL_RIESGO,'10','CONSERVADOR','20','MODERADO','30','ARRIESGADO',NULL) CLI_PERFIL_RIESGO
    FROM CLIENTES 
    WHERE CLI_PER_NUM_IDEN   = P_NUM_IDENT
    AND   CLI_PER_TID_CODIGO = P_TID_CODIGO;
 C_DAT C_DATOS%ROWTYPE;
 
BEGIN
  P_ERROR:= '000';
  P_ERROR_MENSAJE := NULL;
  
  OPEN C_CLIENTE(P_NUM_IDENT,P_TID_CODIGO);
  FETCH C_CLIENTE INTO C_CLI;
  IF C_CLIENTE%NOTFOUND THEN
     P_ERROR:= '001';
     P_ERROR_MENSAJE := 'El Cliente solicitado no existe'||' '||P_TID_CODIGO||' '||P_NUM_IDENT;
  ELSE
    OPEN C_DATOS(P_NUM_IDENT,P_TID_CODIGO);
    FETCH C_DATOS INTO C_DAT;
    CLOSE C_DATOS;
    P_TIPO_CLIENTE  := C_DAT.CLI_PROFESIONAL;
    P_PERFIL_RIESGO := C_DAT.CLI_PERFIL_RIESGO;
  END IF;
  CLOSE C_CLIENTE;
END;

END P_CAB_ALTERNO;
