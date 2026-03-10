## RETENCIÓN DE CLIENTES – ANÁLISIS ESTRATÉGICO TELCO
# Contexto del Proyecto
Este proyecto se basa en un dataset sintético de una empresa de telecomunicaciones, obtenido de:
https://huggingface.co/datasets/muqsith123/telco-customer-churn/viewer/default/train?p=42

Los datos representan información simulada de clientes (edad, tipo de contrato, servicios contratados, facturación, churn, etc.) y permiten analizar patrones de abandono en una empresa tipo Telco.

El objetivo del proyecto es transformar estos datos en insights estratégicos accionables para negocio, identificando:
- Drivers estructurales del churn.
- Segmentos de alto riesgo económico.
- Oportunidades claras de mejora en retención.

# Metodología
El análisis se desarrolló en dos fases principales:
1) Limpieza y Preparación de Datos – Python
Se utilizó Python para:
- Tratamiento de valores nulos
- Conversión y normalización de variables
- Creación de variables derivadas (antigüedad agrupada, número de servicios, etc.)
- Validación de coherencia y consistencia de datos
Esta fase permitió asegurar una base de datos limpia y preparada para el análisis.

2) Análisis y Consultas – SQL
Posteriormente, se realizaron consultas en SQL para:
Calcular tasas de churn por: Antigüedad, tipo de contrato, número de servicios, servicios digitales, analizar pérdida económica por segmento, calcular CLTV promedio, identificar combinaciones de alto riesgo (ej. clientes nuevos con contrato Mes a Mes).
El uso de SQL permitió estructurar la información y extraer insights claros para la toma de decisiones estratégicas.

3) Visualización y Presentación de Resultados
Tras el análisis, se exploró la visualización y presentación de los resultados utilizando inteligencia artificial.
Para ello se utilizó la plataforma genspark.ai, que permitió transformar los insights obtenidos en visualizaciones y una narrativa estructurada del análisis, facilitando la interpretación de los resultados desde una perspectiva estratégica de negocio.
Este paso buscó complementar el análisis técnico con una presentación más clara y visual de los hallazgos.

# ESTRUCTURA EJECUTIVA EN PIRÁMIDE
MENSAJE PRINCIPAL
El churn en Telco no es un problema generalizado.
Es un problema estructural concentrado en:
Clientes nuevos (0–12 meses).
Contrato Mes a Mes.
Integración incompleta de servicios.

Datos clave:
- 48% churn en el primer año.
- 55.8% churn en clientes 0–12 meses con contrato Mes a Mes.
- CLTV aumenta más de 1.200$ tras 4 años.
La retención se pierde al inicio de la relación.

# PILAR 1 — El churn es un problema de inicio de relación
El onboarding no consolida al cliente antes de que tenga libertad contractual.
Implicación Estratégica:
- Programa de onboarding intensivo (0–6 meses).
- Activación temprana de servicios críticos.

Seguimiento personalizado
KPI: reducción ≥ 10 puntos porcentuales en churn temprano

# PILAR 2 — El modelo contractual es el mayor driver del churn
El contrato largo actúa como mecanismo estructural de retención.
El modelo Mes a Mes concentra el mayor riesgo económico.
Implicación Estratégica:
- Incentivar migración a contrato anual antes del mes 6.
- Bundles exclusivos para contratos largos.
- Beneficios progresivos por permanencia.
- Estrategia de anclaje de precios.

# PILAR 3 — No se pierden clientes low cost, se pierde valor medio-alto
Mayor fuga económica en clientes con 3–7 servicios.
Clientes alto CLTV también en riesgo si están en Mes a Mes.
El riesgo está en clientes parcialmente integrados (clientes en transición).

Implicación Estratégica:
- Segmentación de clientes >3 servicios y >80$ gasto mensual
- Programa de consolidación hacia 6–7 servicios
Estrategia basada en valor percibido

# PILAR 4 - Servicios digitales como ancla de retención
Clientes con solo 1–2 servicios digitales presentan mayor churn → integración incompleta aumenta riesgo.

Implicación Estratégica:
- Priorizar venta de Seguridad y Backup desde el inicio.
- Bundles completos (3–5 servicios digitales).
- Pruebas gratuitas estratégicas.
- Seguimiento a clientes en transición.

# CONCLUSIÓN EJECUTIVA
El churn en Telco:
No es masivo.
No es aleatorio.
No es de bajo valor.
Es estructural, temprano y concentrado en clientes Mes a Mes con integración parcial.

La estrategia óptima combina:
✔ Onboarding intensivo
✔ Migración temprana a contratos anuales
✔ Bundles estratégicos
✔ Seguimiento de clientes de valor medio-alto
