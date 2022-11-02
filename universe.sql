--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: exoplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet (
    exoplanet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.exoplanet OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exoplanet_exoplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exoplanet_exoplanet_id_seq OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exoplanet_exoplanet_id_seq OWNED BY public.exoplanet.exoplanet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30),
    ngc numeric,
    galaxy_description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    moon_description text,
    moon_has_life boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type text,
    planet_subtype text,
    planet_has_life boolean,
    number_of_moons integer,
    distance_from_star_in_au numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(30),
    age_in_millions_of_years numeric,
    distance_from_sol_in_ly numeric,
    star_has_planets boolean NOT NULL,
    star_description text,
    name character varying(50) NOT NULL,
    star_number_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: exoplanet exoplanet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet ALTER COLUMN exoplanet_id SET DEFAULT nextval('public.exoplanet_exoplanet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: exoplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet VALUES (1, 'Pluto', 1);
INSERT INTO public.exoplanet VALUES (2, 'Haumea', 1);
INSERT INTO public.exoplanet VALUES (3, 'Makemake', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 598, 'A spiral galaxy, our solar system lies within the Orion Spur of this galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 598, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 224, NULL);
INSERT INTO public.galaxy VALUES (4, 'Barnards', 'Spiral', 6822, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Lenticular', 5128, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 5457, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 4, 'Phobos', NULL, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', NULL, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', NULL, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', NULL, false);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', NULL, false);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', NULL, false);
INSERT INTO public.moon VALUES (1, 3, 'Selene', NULL, false);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', NULL, false);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', NULL, false);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', NULL, false);
INSERT INTO public.moon VALUES (11, 6, 'Dione', NULL, false);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', NULL, false);
INSERT INTO public.moon VALUES (13, 6, 'Titan', NULL, false);
INSERT INTO public.moon VALUES (14, 6, 'Hyperion', NULL, false);
INSERT INTO public.moon VALUES (15, 6, 'Iapetus', NULL, false);
INSERT INTO public.moon VALUES (16, 6, 'Phoebe', NULL, false);
INSERT INTO public.moon VALUES (17, 7, 'Miranda', NULL, false);
INSERT INTO public.moon VALUES (18, 7, 'Ariel', NULL, false);
INSERT INTO public.moon VALUES (19, 7, 'Umbriel', NULL, false);
INSERT INTO public.moon VALUES (20, 7, 'Titania', NULL, false);
INSERT INTO public.moon VALUES (21, 7, 'Oberon', NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', NULL, false, 79, NULL);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', NULL, false, 62, NULL);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', NULL, false, 27, NULL);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', NULL, false, 14, NULL);
INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 'Silicate', false, 0, 0.4);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 'Silicate', false, 0, 0.7);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 'Silicate', true, 1, 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 'Silicate', false, 2, 1.5);
INSERT INTO public.planet VALUES (9, 6, 'Proxima Centauri b', 'Terrestrial', NULL, false, NULL, 0.05);
INSERT INTO public.planet VALUES (10, 7, 'Kepler-90 b', 'Terrestrial', NULL, false, NULL, 0.074);
INSERT INTO public.planet VALUES (11, 7, 'Kepler-90 c', 'Terrestrial', NULL, false, NULL, 0.089);
INSERT INTO public.planet VALUES (12, 7, 'Kepler-90 i', 'Terrestrial', NULL, false, NULL, 0.107);
INSERT INTO public.planet VALUES (13, 7, 'Kepler-90 d', 'Terrestrial', NULL, false, NULL, 0.32);
INSERT INTO public.planet VALUES (14, 7, 'Kepler-90 e', 'Terrestrial', NULL, false, NULL, 0.42);
INSERT INTO public.planet VALUES (15, 7, 'Kepler-90 f', 'Terrestrial', NULL, false, NULL, 0.48);
INSERT INTO public.planet VALUES (16, 7, 'Kepler-90 g', 'Gas Giant', NULL, false, NULL, 0.71);
INSERT INTO public.planet VALUES (17, 7, 'Kepler-90 h', 'Gas Giant', NULL, false, NULL, 1.01);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Yellow Dwarf', 4500, 0, true, NULL, 'Sol', 8);
INSERT INTO public.star VALUES (4, 1, 'Main Sequence', 242, 8.6, false, 'binary star', 'Sirius A', NULL);
INSERT INTO public.star VALUES (5, 1, 'White Dwarf', 228, 8.709, false, 'binary star', 'Sirius B', NULL);
INSERT INTO public.star VALUES (2, 1, 'Class G', 5400, 4.37, false, NULL, 'Alpha Centauri A - Rigil Kentaurus', NULL);
INSERT INTO public.star VALUES (3, 1, 'Class K', 5400, 4.37, false, NULL, 'Alpha Centauri B - Toliman', NULL);
INSERT INTO public.star VALUES (6, 1, 'Class M', 5400, 4.244, true, NULL, 'Alpha Centauri C - Proxima Centauri', 3);
INSERT INTO public.star VALUES (7, 1, 'Class F', 2000, 2790, true, NULL, 'Kepler-90', 8);


--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exoplanet_exoplanet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: exoplanet exoplanet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_name_key UNIQUE (name);


--
-- Name: exoplanet exoplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_pkey PRIMARY KEY (exoplanet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: exoplanet exoplanet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

