

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.clients DISABLE TRIGGER ALL;

INSERT INTO public.clients (id, name) VALUES ('721c6294-ed1d-4ccb-9591-f6e292cd4839', 'Alonzo Church');


ALTER TABLE public.clients ENABLE TRIGGER ALL;


ALTER TABLE public.visits DISABLE TRIGGER ALL;



ALTER TABLE public.visits ENABLE TRIGGER ALL;


