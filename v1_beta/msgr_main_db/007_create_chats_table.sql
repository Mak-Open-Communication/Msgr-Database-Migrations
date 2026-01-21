DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_class c
        JOIN pg_namespace n ON n.oid = c.relnamespace
        WHERE c.relkind = 'S'
          AND c.relname = 'chats_seq'
          AND n.nspname = 'msgr_schema'
    ) THEN
        EXECUTE '
            CREATE SEQUENCE msgr_schema.chats_seq
                INCREMENT 1
                MINVALUE 0
                MAXVALUE 999999999999999
                START 1
                CACHE 1
        ';
        RAISE NOTICE 'Sequence msgr_schema.chats_seq created.';
    ELSE
        RAISE NOTICE 'Sequence msgr_schema.chats_seq already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'chats'
    ) THEN
        EXECUTE '
            CREATE TABLE msgr_schema.chats (
                id BIGINT DEFAULT nextval(''msgr_schema.chats_seq''),
                owner VARCHAR(256) NOT NULL,
                name VARCHAR(256) NOT NULL,

		        created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

                CONSTRAINT chats_pk PRIMARY KEY (id)
            )
        ';
        RAISE NOTICE 'Table msgr_schema.chats created.';
    ELSE
        RAISE NOTICE 'Table msgr_schema.chats already exists.';
    END IF;
END
$$;

ALTER TABLE IF EXISTS msgr_schema.chats OWNER TO current_user;
