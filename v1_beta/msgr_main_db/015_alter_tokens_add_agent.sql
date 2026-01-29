DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'tokens'
          AND column_name = 'agent'
    ) THEN
        ALTER TABLE msgr_schema.tokens ADD COLUMN agent TEXT;
        RAISE NOTICE 'Column agent added to msgr_schema.tokens.';
    ELSE
        RAISE NOTICE 'Column agent already exists in msgr_schema.tokens.';
    END IF;
END
$$;
