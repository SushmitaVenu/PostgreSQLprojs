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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    galaxy_size_bigger_than_milky_way boolean,
    galaxy_shape text,
    galaxy_distance_from_earth integer NOT NULL
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(40),
    galaxy_size integer
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_star_id_seq OWNED BY public.galaxy_star.star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_size_in_miles numeric,
    moon_color text,
    moon_distance_from_its_planet_in_miles integer NOT NULL,
    name character varying(40),
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
    name character varying(50),
    has_oxygen boolean,
    size numeric,
    number_of_moons integer,
    max_temp integer,
    min_temp integer NOT NULL,
    special_notes text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_min_temp_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_min_temp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_min_temp_seq OWNER TO freecodecamp;

--
-- Name: planet_min_temp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_min_temp_seq OWNED BY public.planet.min_temp;


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
    name character varying(50),
    size numeric NOT NULL,
    bigger_than_sun boolean,
    has_planets boolean,
    types_of_gases character varying(90),
    star_color text,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN star_id SET DEFAULT nextval('public.galaxy_star_star_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet min_temp; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN min_temp SET DEFAULT nextval('public.planet_min_temp_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', true, 'Spherical', 230000);
INSERT INTO public.galaxy VALUES (2, ' Milky_Way', false, ' spherical', 1000);
INSERT INTO public.galaxy VALUES (3, 'Abcx', false, 'Triangular', 2000);
INSERT INTO public.galaxy VALUES (4, 'Xyzh', true, 'CYlindrical', 1500000);
INSERT INTO public.galaxy VALUES (5, 'Dhvb', true, 'Elliptical', 14320);
INSERT INTO public.galaxy VALUES (6, 'GHmv', false, 'Spherical', 450);


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (2, 1, '1st star', NULL);
INSERT INTO public.galaxy_star VALUES (2, 2, 'second star', NULL);
INSERT INTO public.galaxy_star VALUES (3, 3, '3rd star', NULL);
INSERT INTO public.galaxy_star VALUES (6, 4, '4th star', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 200, 'white', 300, 'm1', 3);
INSERT INTO public.moon VALUES (2, 201, 'pink', 301, 'm2', 1);
INSERT INTO public.moon VALUES (3, 202, 'white', 302, 'm3', 2);
INSERT INTO public.moon VALUES (4, 203, 'pink', 303, 'm4', 4);
INSERT INTO public.moon VALUES (5, 205, 'blue', 305, 'm5', 4);
INSERT INTO public.moon VALUES (6, 206, 'blue', 306, 'm6', 5);
INSERT INTO public.moon VALUES (7, 207, 'blue', 307, 'm7', 7);
INSERT INTO public.moon VALUES (8, 120, 'white', 110, 'm8', 8);
INSERT INTO public.moon VALUES (9, 121, 'pink', 117, 'm9', 7);
INSERT INTO public.moon VALUES (10, 122, 'pearl', 119, 'm10', 6);
INSERT INTO public.moon VALUES (11, 125, 'white', 118, 'm11', 6);
INSERT INTO public.moon VALUES (12, 133, 'yellow', 190, 'm12', 6);
INSERT INTO public.moon VALUES (13, 145, 'blue', 153, 'm13', 5);
INSERT INTO public.moon VALUES (14, 179, 'white', 185, 'm14', 6);
INSERT INTO public.moon VALUES (15, 280, 'blue', 290, 'm15', 7);
INSERT INTO public.moon VALUES (16, 293, 'pink', 380, 'm16', 6);
INSERT INTO public.moon VALUES (17, 381, 'red', 440, 'm17', 6);
INSERT INTO public.moon VALUES (18, 482, 'ice', 890, 'm18', 5);
INSERT INTO public.moon VALUES (19, 502, 'pink', 765, 'm19', 6);
INSERT INTO public.moon VALUES (20, 542, 'white', 650, 'm20', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 350, 1, 350, -350, 'closet to sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 450, 2, 250, -250, 'has_some_gases', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 500, 1, 100, -100, 'has_life', 1);
INSERT INTO public.planet VALUES (4, 'mars', true, 560, 4, 350, -350, 'is_livable', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 720, 14, 700, -750, 'has_rings', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 760, 12, 500, -700, 'medium_size', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 600, 1, 300, -200, 'has_ice', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 200, 0, 300, -800, 'considered_as_moon', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 780, 5, 300, -500, 'Largest_planet', 1);
INSERT INTO public.planet VALUES (10, 'CCC', false, 2300, 10, 650, -350, 'another system', 2);
INSERT INTO public.planet VALUES (11, 'DDD', true, 15000, 15, 359, -150, 'jcdk', 3);
INSERT INTO public.planet VALUES (12, 'EEE', false, 3000, 6, 450, -200, 'djhd', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 250000, false, true, 'Hydrogen', 'Yellow', 2);
INSERT INTO public.star VALUES (2, 'Dhruv', 2300, true, false, 'Helium', 'White', 2);
INSERT INTO public.star VALUES (3, 'Az', 5600000000, true, false, 'Nitrogen', 'Blue', 3);
INSERT INTO public.star VALUES (4, 'Gy', 320050000, true, false, 'Helium', 'Red', 6);
INSERT INTO public.star VALUES (5, 'By', 350, false, false, 'Nitrogen', 'Green', 4);
INSERT INTO public.star VALUES (6, 'Ten', 2800, true, false, 'Helium', 'Grey', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_star_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_min_temp_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_min_temp_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_distance_from_earth_key UNIQUE (galaxy_distance_from_earth);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_galaxy_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_size_key UNIQUE (galaxy_size);


--
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_id, star_id);


--
-- Name: moon moon_moon_distance_from_its_planet_in_miles_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_distance_from_its_planet_in_miles_key UNIQUE (moon_distance_from_its_planet_in_miles);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_special_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_special_notes_key UNIQUE (special_notes);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_color_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_color_key UNIQUE (star_color);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

