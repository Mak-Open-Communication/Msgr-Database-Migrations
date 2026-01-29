DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'chat_members'
          AND column_name = 'role'
    ) THEN
        ALTER TABLE msgr_schema.chat_members ADD COLUMN role VARCHAR(32) NOT NULL DEFAULT 'member';
        RAISE NOTICE 'Column role added to msgr_schema.chat_members.';
    ELSE
        RAISE NOTICE 'Column role already exists in msgr_schema.chat_members.';
    END IF;
END
$$;
