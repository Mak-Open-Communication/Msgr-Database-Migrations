DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'accounts'
          AND column_name = 'last_online_at'
    ) THEN
        ALTER TABLE msgr_schema.accounts ADD COLUMN last_online_at TIMESTAMPTZ;
        RAISE NOTICE 'Column last_online_at added to msgr_schema.accounts.';
    ELSE
        RAISE NOTICE 'Column last_online_at already exists in msgr_schema.accounts.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'accounts'
          AND column_name = 'display_name'
    ) THEN
        ALTER TABLE msgr_schema.accounts ADD COLUMN display_name VARCHAR(256) NOT NULL DEFAULT '';
        RAISE NOTICE 'Column display_name added to msgr_schema.accounts.';
    ELSE
        RAISE NOTICE 'Column display_name already exists in msgr_schema.accounts.';
    END IF;
END
$$;
