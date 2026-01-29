DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'accounts'
          AND indexname = 'idx_accounts_username'
    ) THEN
        CREATE UNIQUE INDEX idx_accounts_username ON msgr_schema.accounts(username);
        RAISE NOTICE 'UNIQUE index idx_accounts_username created.';
    ELSE
        RAISE NOTICE 'Index idx_accounts_username already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'tokens'
          AND indexname = 'idx_tokens_user_id'
    ) THEN
        CREATE INDEX idx_tokens_user_id ON msgr_schema.tokens(user_id);
        RAISE NOTICE 'Index idx_tokens_user_id created.';
    ELSE
        RAISE NOTICE 'Index idx_tokens_user_id already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'tokens'
          AND indexname = 'idx_tokens_token'
    ) THEN
        CREATE INDEX idx_tokens_token ON msgr_schema.tokens(token);
        RAISE NOTICE 'Index idx_tokens_token created.';
    ELSE
        RAISE NOTICE 'Index idx_tokens_token already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'chats'
          AND indexname = 'idx_chats_owner'
    ) THEN
        CREATE INDEX idx_chats_owner ON msgr_schema.chats(owner);
        RAISE NOTICE 'Index idx_chats_owner created.';
    ELSE
        RAISE NOTICE 'Index idx_chats_owner already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'chat_members'
          AND indexname = 'idx_chat_members_user_id'
    ) THEN
        CREATE INDEX idx_chat_members_user_id ON msgr_schema.chat_members(user_id);
        RAISE NOTICE 'Index idx_chat_members_user_id created.';
    ELSE
        RAISE NOTICE 'Index idx_chat_members_user_id already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'chat_members'
          AND indexname = 'idx_chat_members_chat_id'
    ) THEN
        CREATE INDEX idx_chat_members_chat_id ON msgr_schema.chat_members(chat_id);
        RAISE NOTICE 'Index idx_chat_members_chat_id created.';
    ELSE
        RAISE NOTICE 'Index idx_chat_members_chat_id already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'messages'
          AND indexname = 'idx_messages_chat_id'
    ) THEN
        CREATE INDEX idx_messages_chat_id ON msgr_schema.messages(chat_id);
        RAISE NOTICE 'Index idx_messages_chat_id created.';
    ELSE
        RAISE NOTICE 'Index idx_messages_chat_id already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'messages'
          AND indexname = 'idx_messages_sender'
    ) THEN
        CREATE INDEX idx_messages_sender ON msgr_schema.messages(sender);
        RAISE NOTICE 'Index idx_messages_sender created.';
    ELSE
        RAISE NOTICE 'Index idx_messages_sender already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'msg_contents'
          AND indexname = 'idx_msg_contents_message_id'
    ) THEN
        CREATE INDEX idx_msg_contents_message_id ON msgr_schema.msg_contents(message_id);
        RAISE NOTICE 'Index idx_msg_contents_message_id created.';
    ELSE
        RAISE NOTICE 'Index idx_msg_contents_message_id already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'msgr_schema'
          AND tablename = 'msg_tags'
          AND indexname = 'idx_msg_tags_message_id'
    ) THEN
        CREATE INDEX idx_msg_tags_message_id ON msgr_schema.msg_tags(message_id);
        RAISE NOTICE 'Index idx_msg_tags_message_id created.';
    ELSE
        RAISE NOTICE 'Index idx_msg_tags_message_id already exists.';
    END IF;
END
$$;
