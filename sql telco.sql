CREATE DATABASE IF NOT EXISTS TelcoDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;

USE TelcoDB;

CREATE TABLE Telco_Clientes (
    Edad INT,
    `GB Mensuales Promedio` INT,
    `Cargos Prom Larga Distancia` DECIMAL(10,2),
    `Puntaje Churn` INT,
    Ciudad VARCHAR(100),
    CLTV INT,
    Contrato VARCHAR(20),
    `ID Cliente` VARCHAR(20),
    Dependientes INT,
    `Plan Proteccion Dispositivo` TINYINT,
    Genero VARCHAR(10),
    `Servicio Internet` TINYINT,
    `Tipo Internet` VARCHAR(20),
    `Cobro Mensual` DECIMAL(10,2),
    `Lineas Multiples` TINYINT,
    `Backup Online` TINYINT,
    `Seguridad Online` TINYINT,
    Pareja TINYINT,
    `Servicio Telefonico` TINYINT,
    `Soporte Premium` TINYINT,
    `Puntaje Satisfaccion` INT,
    `Streaming Peliculas` TINYINT,
    `Streaming Musica` TINYINT,
    `Streaming TV` TINYINT,
    `Antiguedad Meses` INT,
    `Cargos Totales` DECIMAL(10,2),
    `Cargos Extra Datos` INT,
    `Cargos Tot Larga Distancia` DECIMAL(10,2),
    `Reembolsos Totales` DECIMAL(10,2),
    `Ingresos Totales` DECIMAL(10,2),
    `Datos Ilimitados` TINYINT,
    Churn TINYINT,
    Servicios INT,
    ARPU DECIMAL(10,2),
    Grupo_Antiguedad VARCHAR(10)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_spanish_ci;



-- RETENCION
-- 1)¿En qué etapa del ciclo de vida ocurre más churn?
SELECT Grupo_Antiguedad,
       COUNT(*) AS Total,
       ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Grupo_Antiguedad
ORDER BY Tasa_Churn DESC;

-- 2) ¿Qué tipo de contrato presenta mayor riesgo?
SELECT Contrato,
       COUNT(*) AS Total,
       ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Contrato
ORDER BY Tasa_Churn DESC;

-- 3) ¿Existe relación entre bajo número de servicios y churn?
SELECT Servicios,
       COUNT(*) AS Total,
       ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Servicios
ORDER BY Servicios;

-- 4) ¿Los clientes con baja satisfacción abandonan más?
SELECT `Puntaje Satisfaccion`,
       ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY `Puntaje Satisfaccion`
ORDER BY `Puntaje Satisfaccion`;

-- 5) ¿Hay concentración geográfica del churn?
SELECT Ciudad,
       COUNT(*) AS Total,
       ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Ciudad
HAVING COUNT(*) > 10
ORDER BY Tasa_Churn DESC;

-- 6) Clientes con mayor pérdida de ingresos por churn según antigüedad
SELECT 
    Grupo_Antiguedad,
    COUNT(*) AS Total_Clientes,
    SUM(ARPU) AS Perdida_Potencial_ARPU,
    AVG(Churn) AS Tasa_Churn
FROM Telco_Clientes
WHERE Churn = 1
GROUP BY Grupo_Antiguedad
ORDER BY Perdida_Potencial_ARPU DESC;

-- 7) Riesgo económico por tipo de contrato
SELECT 
    Contrato,
    COUNT(*) AS Total_Clientes,
    SUM(ARPU) AS Perdida_Potencial_ARPU,
    AVG(Churn) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Contrato
ORDER BY Perdida_Potencial_ARPU DESC;

-- 8) Churn según número de servicios y valor económico
SELECT 
    Servicios AS Num_Servicios,
    COUNT(*) AS Total_Clientes,
    SUM(ARPU) AS Perdida_Potencial_ARPU,
    AVG(Churn) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Servicios
ORDER BY Tasa_Churn DESC;

-- 9) Ciudades con mayor pérdida económica por churn
SELECT 
    Ciudad,
    COUNT(*) AS Total_Clientes,
    SUM(ARPU) AS Perdida_Potencial_ARPU,
    AVG(Churn) AS Tasa_Churn
FROM Telco_Clientes
WHERE Churn = 1
GROUP BY Ciudad
ORDER BY Perdida_Potencial_ARPU DESC
LIMIT 10;

-- 10) Segmento con mayor riesgo cruzando antigüedad y contrato
SELECT 
    Grupo_Antiguedad,
    Contrato,
    COUNT(*) AS Total_Clientes,
    AVG(Churn) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Grupo_Antiguedad, Contrato
ORDER BY Tasa_Churn DESC
LIMIT 20;

-- 11) Ranking de antigüedad por ingresos
SELECT Grupo_Antiguedad,
       SUM(`Ingresos Totales`) AS Total_Ingresos,
       RANK() OVER (ORDER BY SUM(`Ingresos Totales`) DESC) AS Ranking
FROM Telco_Clientes
GROUP BY Grupo_Antiguedad;

-- 12) ¿Los clientes nuevos tienen menor CLTV?
SELECT Grupo_Antiguedad,
       ROUND(AVG(CLTV),2) AS CLTV_Promedio
FROM Telco_Clientes
GROUP BY Grupo_Antiguedad
ORDER BY CLTV_Promedio;

-- 13) Clientes con alto CLTV pero alto riesgo de churn
SELECT *
FROM Telco_Clientes
WHERE CLTV > (
    SELECT AVG(CLTV) FROM Telco_Clientes
)
AND Churn = 1;

-- 14) ¿Backup Online reduce churn?
SELECT `Backup Online`,
       ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY `Backup Online`;

-- 15) ¿Seguridad Online reduce churn?
SELECT `Seguridad Online`,
       ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY `Seguridad Online`;

-- 16) Combinación de servicios digitales vs churn
SELECT 
    (`Streaming Peliculas` + `Streaming Musica` + `Streaming TV`) AS Servicios_Streaming,
    ROUND(AVG(Churn),3) AS Tasa_Churn
FROM Telco_Clientes
GROUP BY Servicios_Streaming
ORDER BY Servicios_Streaming;

-- 17)  Perfil del cliente promedio que hace churn
SELECT 
    ROUND(AVG(Edad),1) AS Edad_Promedio,
    ROUND(AVG(ARPU),2) AS ARPU_Promedio,
    ROUND(AVG(Servicios),2) AS Servicios_Promedio
FROM Telco_Clientes
WHERE Churn = 1;



