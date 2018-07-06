CREATE TABLE github_events (
    event_id bigint,
    event_type text,
    event_public boolean,
    repo_id bigint,
    payload jsonb,
repo jsonb,
user_id bigint,
org jsonb, created_at timestamp
);
CREATE TABLE github_users (
    user_id bigint,
    url text,
    login text,
    avatar_url text,
    gravatar_id text,
    display_login text
);


CREATE INDEX event_type_index ON github_events (event_type);
CREATE INDEX payload_index ON github_events USING GIN (payload jsonb_path_ops);

SELECT create_distributed_table('github_users', 'user_id'); 
SELECT create_distributed_table('github_events', 'user_id');
\copy github_users from 'users.csv' with csv 
\copy github_events from 'events.csv' with csv