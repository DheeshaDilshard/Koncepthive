-- Create extensions if required

CREATE TABLE "User" (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name text NOT NULL,
    email text NOT NULL UNIQUE,
    password text NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now()
);

CREATE TYPE "Priority" AS ENUM ('low', 'medium', 'high');
CREATE TYPE "Status" AS ENUM ('pending', 'in_progress', 'completed');

CREATE TABLE "Task" (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    title text NOT NULL,
    description text,
    priority "Priority" NOT NULL,
    status "Status" NOT NULL DEFAULT 'pending',
    due_date timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES "User"(id) ON DELETE CASCADE
);
