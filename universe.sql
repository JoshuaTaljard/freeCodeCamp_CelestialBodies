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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30),
    period integer NOT NULL,
    has_life boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
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
    name character varying(30),
    type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    distance_to_planet numeric(4,4),
    description text,
    planet_id integer
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
    name character varying(30),
    type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    moon_count integer,
    description text,
    star_id integer
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
    name character varying(30),
    type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Haley`s Comet', 75, false, 'Most well-known comet');
INSERT INTO public.comet VALUES (2, 'Haley-Bopp', 90, false, 'Brightest comet');
INSERT INTO public.comet VALUES (3, 'Tempel', 20, false, 'Subject of the deep impact space mission');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', true, 'contains earth');
INSERT INTO public.galaxy VALUES (4, 'andeomeda', 'spiral', false, 'brightest in its cluster');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', false, 'Named after mexican hat');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', false, 'Located in triangular constellation');
INSERT INTO public.galaxy VALUES (7, 'Black Eye', 'Ring', false, 'Located in the Coma Berenices constellation');
INSERT INTO public.galaxy VALUES (8, 'Cartwheel', 'Ring', false, 'Formed by the collision of two galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Terrestrial', false, 0.9999, 'Only moon of the earth', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Terrestrial', false, 0.9999, 'Most heavily cratered object in the Solar System', 5);
INSERT INTO public.moon VALUES (4, 'Io', 'Terrestrial', false, 0.9999, 'Volcanically active', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Terrestrial', false, 0.9999, 'Contains oceans beneath surface', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Terrestrial', false, 0.9999, 'Largest moon in Solar System', 5);
INSERT INTO public.moon VALUES (8, 'Adastrea', 'Terrestrial', false, 0.9999, 'Discovered in 1979', 5);
INSERT INTO public.moon VALUES (9, 'Aitne', 'Terrestrial', false, 0.9999, 'Discovered in 1984', 5);
INSERT INTO public.moon VALUES (10, 'Amalthea', 'Terrestrial', false, 0.9999, 'Discovered in 1892', 5);
INSERT INTO public.moon VALUES (11, 'Ananke', 'Terrestrial', false, 0.9999, 'Discovered in 1951', 5);
INSERT INTO public.moon VALUES (12, 'Aoede', 'Terrestrial', false, 0.9999, 'Discovered in 2003', 5);
INSERT INTO public.moon VALUES (13, 'Arche', 'Terrestrial', false, 0.9999, 'Member of the Carme family group', 5);
INSERT INTO public.moon VALUES (14, 'Autonoe', 'Terrestrial', false, 0.9999, 'Discovered in 2001', 5);
INSERT INTO public.moon VALUES (15, 'Carme', 'Terrestrial', false, 0.9999, 'Discovered in 1938', 5);
INSERT INTO public.moon VALUES (16, 'Carpo', 'Terrestrial', false, 0.9999, 'Discovered in 2003', 5);
INSERT INTO public.moon VALUES (17, 'Dia', 'Terrestrial', false, 0.9999, 'Discovered in 2000', 5);
INSERT INTO public.moon VALUES (18, 'Elara', 'Terrestrial', false, 0.9999, 'Discovered in 1905', 5);
INSERT INTO public.moon VALUES (19, 'Ersa', 'Terrestrial', false, 0.9999, 'Discovered in 2017', 5);
INSERT INTO public.moon VALUES (20, 'Herse', 'Terrestrial', false, 0.9999, 'Discovered in 2003', 5);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Terrestrial', false, 0.9999, 'Smaller moon of Mars', 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Terrestrial', false, 0.9999, 'Larger  moon of Mars', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Terrestrial', false, 9, 'PLANET', 7);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri a', 'Terrestrial', false, 9, 'PLANET', 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'Terrestrial', false, 9, 'PLANET', 2);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri c', 'Terrestrial', false, 9, 'PLANET', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Low-mass', false, 'Closest star to the Sun', 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'B-type', false, 'Two star system', 4);
INSERT INTO public.star VALUES (4, 'Almach', 'K-type', false, 'Quadruple star system', 4);
INSERT INTO public.star VALUES (5, 'Nembus-51', 'K-type', false, '5th brightest star in Andromeda galaxy', 4);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Red-giant', false, 'First star to have its diameter measured', 1);
INSERT INTO public.star VALUES (7, 'Sun', 'GV2', true, 'Closest star to the Earth', 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
