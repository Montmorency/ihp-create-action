-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE clients (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);
CREATE TABLE visits (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    visit_start TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    client_id UUID NOT NULL,
    body TEXT NOT NULL
);
CREATE INDEX visits_client_id_index ON visits (client_id);
ALTER TABLE visits ADD CONSTRAINT visits_ref_client_id FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE NO ACTION;
