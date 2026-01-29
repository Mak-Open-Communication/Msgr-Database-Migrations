DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'tokens'
          AND constraint_name = 'fk_tokens_user'
    ) THEN
        ALTER TABLE msgr_schema.tokens
            ADD CONSTRAINT fk_tokens_user
            FOREIGN KEY (user_id) REFERENCES msgr_schema.accounts(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_tokens_user added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_tokens_user already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'chats'
          AND constraint_name = 'fk_chats_owner'
    ) THEN
        ALTER TABLE msgr_schema.chats
            ADD CONSTRAINT fk_chats_owner
            FOREIGN KEY (owner) REFERENCES msgr_schema.accounts(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_chats_owner added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_chats_owner already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'chat_members'
          AND constraint_name = 'fk_chat_members_user'
    ) THEN
        ALTER TABLE msgr_schema.chat_members
            ADD CONSTRAINT fk_chat_members_user
            FOREIGN KEY (user_id) REFERENCES msgr_schema.accounts(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_chat_members_user added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_chat_members_user already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'chat_members'
          AND constraint_name = 'fk_chat_members_chat'
    ) THEN
        ALTER TABLE msgr_schema.chat_members
            ADD CONSTRAINT fk_chat_members_chat
            FOREIGN KEY (chat_id) REFERENCES msgr_schema.chats(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_chat_members_chat added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_chat_members_chat already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'messages'
          AND constraint_name = 'fk_messages_chat'
    ) THEN
        ALTER TABLE msgr_schema.messages
            ADD CONSTRAINT fk_messages_chat
            FOREIGN KEY (chat_id) REFERENCES msgr_schema.chats(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_messages_chat added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_messages_chat already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'messages'
          AND constraint_name = 'fk_messages_sender'
    ) THEN
        ALTER TABLE msgr_schema.messages
            ADD CONSTRAINT fk_messages_sender
            FOREIGN KEY (sender) REFERENCES msgr_schema.accounts(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_messages_sender added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_messages_sender already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'msg_contents'
          AND constraint_name = 'fk_msg_contents_message'
    ) THEN
        ALTER TABLE msgr_schema.msg_contents
            ADD CONSTRAINT fk_msg_contents_message
            FOREIGN KEY (message_id) REFERENCES msgr_schema.messages(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_msg_contents_message added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_msg_contents_message already exists.';
    END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'msgr_schema'
          AND table_name = 'msg_tags'
          AND constraint_name = 'fk_msg_tags_message'
    ) THEN
        ALTER TABLE msgr_schema.msg_tags
            ADD CONSTRAINT fk_msg_tags_message
            FOREIGN KEY (message_id) REFERENCES msgr_schema.messages(id) ON DELETE CASCADE;
        RAISE NOTICE 'Foreign key fk_msg_tags_message added.';
    ELSE
        RAISE NOTICE 'Foreign key fk_msg_tags_message already exists.';
    END IF;
END
$$;
