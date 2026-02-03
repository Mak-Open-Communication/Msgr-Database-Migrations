DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.tables
        WHERE table_schema = 'msgr_schema' AND table_name = 'schema_info'
    ) THEN
        CREATE TABLE msgr_schema.schema_info (
            version TEXT NOT NULL,
            updated_at TIMESTAMP NOT NULL DEFAULT now()
        );
        INSERT INTO msgr_schema.schema_info (version) VALUES ('2.0');
        RAISE NOTICE 'Version 2.0 inserted into schema_info';
    ELSE
        UPDATE msgr_schema.schema_info SET version = '2.0', updated_at = now();
        RAISE NOTICE 'Schema version updated to 2.0';
    END IF;
END
$$;
