DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_class c
        JOIN pg_namespace n ON n.oid = c.relnamespace
        WHERE c.relkind = 'S'
          AND c.relname = 'chat_members_seq'
          AND n.nspname = 'msgr_schema'
    ) THEN
        EXECUTE '
            CREATE SEQUENCE msgr_schema.chat_members_seq
                INCREMENT 1
                MINVALUE 0
                MAXVALUE 999999999999999
                START 1
                CACHE 1
        ';
        RAISE NOTICE 'Sequence msgr_schema.chat_members_seq created.';
    ELSE
        RAISE NOTICE 'Sequence msgr_schema.chat_members_seq already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'chat_members'
    ) THEN
        EXECUTE '
            CREATE TABLE msgr_schema.chat_members (
                id BIGINT DEFAULT nextval(''msgr_schema.chat_members_seq''),

                user_id BIGINT NOT NULL,
                chat_id BIGINT NOT NULL,

                role VARCHAR(16) DEFAULT 'member'

                CONSTRAINT chat_members_pk PRIMARY KEY (id)
            )
        ';
        RAISE NOTICE 'Table msgr_schema.chat_members created.';
    ELSE
        RAISE NOTICE 'Table msgr_schema.chat_members already exists.';
    END IF;
END
$$;

ALTER TABLE IF EXISTS msgr_schema.chat_members OWNER TO current_user;
