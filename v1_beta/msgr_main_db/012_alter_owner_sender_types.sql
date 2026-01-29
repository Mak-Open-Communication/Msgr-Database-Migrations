DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'chats'
          AND column_name = 'owner'
          AND data_type = 'character varying'
    ) THEN
        ALTER TABLE msgr_schema.chats ALTER COLUMN owner TYPE BIGINT USING owner::BIGINT;
        RAISE NOTICE 'Column chats.owner changed to BIGINT.';
    ELSE
        RAISE NOTICE 'Column chats.owner is already BIGINT or does not exist.';
    END IF;
END
$$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'messages'
          AND column_name = 'sender'
          AND data_type = 'character varying'
    ) THEN
        ALTER TABLE msgr_schema.messages ALTER COLUMN sender TYPE BIGINT USING sender::BIGINT;
        RAISE NOTICE 'Column messages.sender changed to BIGINT.';
    ELSE
        RAISE NOTICE 'Column messages.sender is already BIGINT or does not exist.';
    END IF;
END
$$;
