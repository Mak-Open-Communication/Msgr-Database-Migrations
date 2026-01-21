DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_class c
        JOIN pg_namespace n ON n.oid = c.relnamespace
        WHERE c.relkind = 'S'
          AND c.relname = 'msg_tags_seq'
          AND n.nspname = 'msgr_schema'
    ) THEN
        EXECUTE '
            CREATE SEQUENCE msgr_schema.msg_tags_seq
                INCREMENT 1
                MINVALUE 0
                MAXVALUE 999999999999999
                START 1
                CACHE 1
        ';
        RAISE NOTICE 'Sequence msgr_schema.msg_tags_seq created.';
    ELSE
        RAISE NOTICE 'Sequence msgr_schema.msg_tags_seq already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'msgr_schema'
          AND table_name = 'msg_tags'
    ) THEN
        EXECUTE '
            CREATE TABLE msgr_schema.msg_tags (
                id BIGINT DEFAULT nextval(''msgr_schema.msg_tags_seq''),
                message_id BIGINT NOT NULL,
                type VARCHAR(64) NOT NULL,
                tag VARCHAR(64),

                CONSTRAINT msg_tags_pk PRIMARY KEY (id)
            )
        ';
        RAISE NOTICE 'Table msgr_schema.msg_tags created.';
    ELSE
        RAISE NOTICE 'Table msgr_schema.msg_tags already exists.';
    END IF;
END
$$;

ALTER TABLE IF EXISTS msgr_schema.msg_tags OWNER TO current_user;
