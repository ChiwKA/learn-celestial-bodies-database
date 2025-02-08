--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    name character varying(30) NOT NULL,
    size numeric,
    continent_id integer NOT NULL,
    population integer,
    number_of_countries integer
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    constellation text NOT NULL,
    note text,
    is_naked_eye_galaxy boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    discovery_year integer,
    discovered_by text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    is_spherical boolean,
    name character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    constellation text,
    temp text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES ('Oceania', 8511000, 1, NULL, NULL);
INSERT INTO public.continent VALUES ('Europe', 10180000, 2, NULL, NULL);
INSERT INTO public.continent VALUES ('Antartica', 14200000, 3, NULL, NULL);
INSERT INTO public.continent VALUES ('South America', 17814000, 4, NULL, NULL);
INSERT INTO public.continent VALUES ('North America', 24239000, 5, NULL, NULL);
INSERT INTO public.continent VALUES ('Africa', 30244000, 6, NULL, NULL);
INSERT INTO public.continent VALUES ('Asia', 44579000, 7, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', NULL, true);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'Dorado', NULL, true);
INSERT INTO public.galaxy VALUES (3, 'Spider Galaxy', 'Bootes', NULL, false);
INSERT INTO public.galaxy VALUES (4, 'Porphyrion', 'Draco', NULL, false);
INSERT INTO public.galaxy VALUES (5, 'Cosmos Redshift 7', 'Sextans', NULL, false);
INSERT INTO public.galaxy VALUES (6, 'Eye of God', 'Eridanus', NULL, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 'Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 'Hall');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1610, 'Galileo');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1610, 'Galileo');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1610, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1610, 'Galileo');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 1892, 'Barnard');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 1904, 'Perrine');
INSERT INTO public.moon VALUES (10, 'Pasiphae', 5, 1908, 'Melotte');
INSERT INTO public.moon VALUES (11, 'Ananke', 5, 1951, 'Nicholson');
INSERT INTO public.moon VALUES (12, 'Metis', 5, 1979, 'Synnott');
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 1789, 'Herschel');
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, 1789, 'Herschel');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 1684, 'Cassini');
INSERT INTO public.moon VALUES (16, 'Titan', 6, 1655, 'Huygens');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 1851, 'Lassell');
INSERT INTO public.moon VALUES (18, 'Triton', 8, 1846, 'Lassell');
INSERT INTO public.moon VALUES (19, 'Charon', 10, 1978, 'Christy');
INSERT INTO public.moon VALUES (20, 'Dysnomia', 11, 2005, 'Brown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 7, false, true, 'Mercury');
INSERT INTO public.planet VALUES (2, 7, false, true, 'Venus');
INSERT INTO public.planet VALUES (3, 7, true, true, 'Earth');
INSERT INTO public.planet VALUES (4, 7, false, true, 'Mars');
INSERT INTO public.planet VALUES (5, 7, false, true, 'Jupiter');
INSERT INTO public.planet VALUES (6, 7, false, true, 'Saturn');
INSERT INTO public.planet VALUES (7, 7, false, true, 'Uranus');
INSERT INTO public.planet VALUES (8, 7, false, true, 'Neptune');
INSERT INTO public.planet VALUES (9, 7, false, true, 'Ceres');
INSERT INTO public.planet VALUES (10, 7, false, true, 'Pluto');
INSERT INTO public.planet VALUES (11, 7, false, true, 'Eris');
INSERT INTO public.planet VALUES (12, 7, false, true, 'Makemake');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Canis Major', '2,815 K', 'VY Canis Majoris');
INSERT INTO public.star VALUES (2, 1, 'Cephus', '2,905 K', 'VV Cephei A');
INSERT INTO public.star VALUES (3, 1, 'Ara', '3,700 K', 'Westerlund 1-26');
INSERT INTO public.star VALUES (4, 1, 'Sagittarius', '2,900 K', 'VX Sagittarii');
INSERT INTO public.star VALUES (5, 1, 'Scutum', '3,376 K', 'UY Scuti');
INSERT INTO public.star VALUES (6, 6, NULL, NULL, 'GJ 9785');
INSERT INTO public.star VALUES (7, 1, NULL, '5,780 K', 'Sun');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: continent continent_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_name_key UNIQUE (name);


--
-- Name: continent continent_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pkey PRIMARY KEY (continent_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


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

