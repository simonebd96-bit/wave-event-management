-- ================================================================
-- Wave Event Management - Script di aggiornamento DB
-- Versione: Merge con nuove funzionalita
-- ================================================================

-- MODIFICA #7: aggiunge colonna posti_disponibili alla tabella evento
-- Eseguire se la colonna non esiste gia
ALTER TABLE evento ADD COLUMN IF NOT EXISTS posti_disponibili INTEGER;

-- Inizializza posti_disponibili = numero_posti per gli eventi esistenti
UPDATE evento SET posti_disponibili = numero_posti WHERE posti_disponibili IS NULL;

-- MODIFICA #6: imposta DEFAULT NOW() sulla colonna data_creazione
-- In questo modo quando si crea un evento senza specificare data_creazione, viene usato il timestamp corrente
ALTER TABLE evento ALTER COLUMN data_creazione SET DEFAULT NOW();

-- ================================================================
-- Verifica struttura tabelle dopo l'aggiornamento
-- ================================================================
-- SELECT column_name, data_type, column_default 
-- FROM information_schema.columns 
-- WHERE table_name = 'evento' 
-- ORDER BY ordinal_position;
