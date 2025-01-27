SELECT 
    customer_id,
    customer_unique_id,
    LPAD(customer_zip_code_prefix::text, 6, '0') as customer_zip_code_prefix,
    customer_city,
    customer_state,
    CASE 
        WHEN customer_state IN ('SP', 'RJ', 'ES', 'MG') THEN 'SE' 
        WHEN customer_state IN ('RS', 'SC', 'PR') THEN 'S' 
        WHEN customer_state IN ('DF', 'GO', 'MT', 'MS') THEN 'CO' 
        WHEN customer_state IN ('BA', 'SE', 'AL', 'PE', 'PB', 'RN', 'CE', 'PI', 'MA') THEN 'NE' 
        WHEN customer_state IN ('AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC') THEN 'N' 
        ELSE NULL 
    END as customer_region
FROM {{ ref('bronze.customers') }}