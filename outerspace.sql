--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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

ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_star_name_fkey;
ALTER TABLE ONLY public.stars DROP CONSTRAINT stars_pkey;
ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_pkey;
ALTER TABLE ONLY public.moons DROP CONSTRAINT moons_pkey;
DROP TABLE public.stars;
DROP TABLE public.planets;
DROP TABLE public.moons;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: moons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moons (
    moon_name text NOT NULL,
    planet text NOT NULL
);


--
-- Name: planets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planets (
    planet_name text NOT NULL,
    orbit_prd_yrs numeric(4,3) NOT NULL,
    star_name text NOT NULL
);


--
-- Name: stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stars (
    star_name text NOT NULL,
    star_temp character varying(8) NOT NULL
);


--
-- Data for Name: moons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moons (moon_name, planet) FROM stdin;
Phobos	Mars
Deimos	Mars
The Moon	Earth
\.


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planets (planet_name, orbit_prd_yrs, star_name) FROM stdin;
Earth	1.000	The Sun
Gliese 876 b	0.236	Gliese 876
Mars	1.882	The Sun
Proxima Centauri b	0.030	Proxima Centauri
Venus	0.620	The Sun
\.


--
-- Data for Name: stars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stars (star_name, star_temp) FROM stdin;
The Sun	5800°K
Proxima Centauri	3042°K
Gliese 876	3192°K
\.


--
-- Name: moons moons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_name);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_name);


--
-- Name: stars stars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_name);


--
-- Name: planets planets_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.stars(star_name);


--
-- PostgreSQL database dump complete
--

