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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    origin_of_name text,
    size_in_ly integer NOT NULL,
    distance_mio_km numeric(4,2) NOT NULL,
    velocity_kmh integer,
    is_spiral_galaxy boolean,
    partof_local_group boolean
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
    name character varying(15),
    description text,
    mean_radius_km integer NOT NULL,
    sidereal_period_days numeric(5,3) NOT NULL,
    discovery_year integer,
    main_group_moon boolean,
    habitable boolean,
    planet_id integer NOT NULL
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    description text,
    avg_distance_in_au numeric(4,2),
    temp_celsius integer NOT NULL,
    earth_mass integer,
    life_possible boolean,
    similar_to_earth boolean,
    star_id integer NOT NULL
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: planetary_explorations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_explorations (
    planetary_explorations_id integer NOT NULL,
    name character varying(20),
    description text,
    start_year integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.planetary_explorations OWNER TO freecodecamp;

--
-- Name: planetary_explorations_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_explorations_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_explorations_mission_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_explorations_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_explorations_mission_id_seq OWNED BY public.planetary_explorations.planetary_explorations_id;


--
-- Name: planetary_explorations_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_explorations_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_explorations_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_explorations_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_explorations_planet_id_seq OWNED BY public.planetary_explorations.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    location text,
    distance_in_ly numeric(8,2) NOT NULL,
    solar_mass integer NOT NULL,
    solar_radius integer NOT NULL,
    part_of_constellation boolean,
    is_stellar_system boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: planetary_explorations planetary_explorations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_explorations ALTER COLUMN planetary_explorations_id SET DEFAULT nextval('public.planetary_explorations_mission_id_seq'::regclass);


--
-- Name: planetary_explorations planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_explorations ALTER COLUMN planet_id SET DEFAULT nextval('public.planetary_explorations_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'The appearance from Earth of the galaxy a band of light', 120000, 0.00, NULL, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'From the area of the sky in which it appears', 220000, 2.54, -301, true, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Named after Ferdinand Magellan', 14000, 0.16, 288, false, false);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Appears similar in shape to a cigar.', 37000, 11.50, 203, true, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Appearance this gravitationally disturbed galaxy exhibits.', 80000, 31.00, 460, true, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Similar in appearance to a sombrero', 50000, 28.00, 1024, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Only natural satellite, plays a crucial role in influencing tides and has captivated humanity with its phases and mystique throughout history.', 1738, 27.321, 0, NULL, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular shape, extreme closeness to the planet, and a surface covered in craters and grooves.', 11, 0.319, 1877, NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Small size, irregular shape, and a surface covered in craters and dust.', 6, 1.262, 1877, NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Strikingly active volcanism and colorful surface, making it the most geologically active body in the solar system.', 1822, 1.769, 1610, true, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Is renowned for its icy surface and subsurface ocean, making it a prime candidate in the search for extraterrestrial life.', 1561, 3.551, 1610, true, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymade', 'Striking geological diversity, including vast ice-covered surfaces and potential subsurface oceans that may harbor conditions suitable for life.', 2634, 7.155, 1610, true, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered surface, which suggests it has been geologically inactive for billions of years.', 2410, 16.690, 1610, true, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea ', 'small, irregularly-shaped moon of Jupiter, known for its reddish color and significant role in the planet''s ring system as a source of dust particles.', 84, 0.498, 1892, false, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 'referred to as the "Death Star" due to its prominent impact crater, which gives it a striking resemblance to the fictional spacecraft from Star Wars.', 198, 0.942, 1789, true, true, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Icy moon of Saturn known for its geysers that eject plumes of water vapor and ice particles, suggesting the presence of a subsurface ocean.', 252, 1.370, 1789, true, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Characterized by its icy surface and large impact crater, Odysseus, which gives it a unique and striking appearance.', 533, 1.880, 1684, true, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Icy surface and a unique combination of craters and bright wispy streaks thought to be caused by tectonic activity.', 561, 2.737, 1684, true, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'A, notable for its icy surface and the presence of ring-like features along its equator.', 763, 4.518, 1672, true, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Titan', 'Unique for its dense atmosphere and surface lakes filled with liquid methane and ethane, making it the only celestial body other than Earth known to have stable liquids on its surface.', 2575, 15.950, 1655, true, true, 6);
INSERT INTO public.moon VALUES (15, 'Prometheus', 'Distinctive shape and its role in shaping the planet''s F ring through gravitational interactions and the creation of narrow gaps.', 43, 0.613, 1980, false, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Thought to consist mostly of roughly equal amounts of water ice and silicate rock.', 579, 2.520, 1851, true, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark and heavily cratered surface, suggesting a history of significant impact events.', 585, 4.144, 1851, true, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'Icy surface and complex geological history, including canyons, impact craters, and a unique reddish hue due to the presence of organic compounds.', 789, 8.706, 1787, true, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 'Retrograde orbit and geologically active surface, featuring geysers that spew nitrogen gas into space.', 1353, 5.877, 1846, NULL, false, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Unusual size relative to its dwarf planet, having a diameter nearly half that of Pluto itself.', 606, 6.387, 1978, NULL, NULL, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'A vibrant, dynamic planet that hosts a diverse range of ecosystems and life forms, making it uniquely suitable for sustaining life in the cosmos.', 1.00, -18, 1, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Extreme temperature fluctuations and lack of a substantial atmosphere.', 0.39, 164, 0, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Earth''s "sister planet" due to its similar size and composition, but it has a thick, toxic atmosphere and surface temperatures hot enough to melt lead.', 0.72, 464, 0, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Referred to as the "Red Planet" due to its reddish appearance, which is caused by iron oxide (rust) on its surface.', 1.52, -65, 0, true, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'largest planet in our solar system, known for its swirling gas clouds, prominent Great Red Spot, and numerous moons.', 5.20, -110, 318, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Stunning rings, which are composed primarily of ice particles, with some rock debris and dust.', 9.54, -140, 95, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'seventh planet from the Sun in our solar system, known for its striking blue color due to methane in its atmosphere and its unique rotation on its side.', 19.22, -195, 15, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'An ice giant and is known for its deep blue color, which is largely due to the presence of methane in its atmosphere.', 30.06, -201, 17, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Pluto was long considered our solar systems ninth planet. But it was reclassified as a dwarf planet.', 39.48, -242, 0, false, false, 1);
INSERT INTO public.planet VALUES (10, 'Makemaker', 'Makemake is a dwarf planet located in the Kuiper Belt, known for its reddish color and for being named after the Rapa Nui god of creation and fertility.', 45.80, -230, 0, false, false, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 'A dwarf planet in the Kuiper Belt, known for being one of the largest and most massive objects in that region of the solar system', 96.07, -230, 0, false, false, 1);
INSERT INTO public.planet VALUES (12, 'Proxima B', 'A an exoplanet located in the habitable zone of the red dwarf star Proxima Centauri, making it a prime candidate in the search for extraterrestrial life.', NULL, -39, 1, true, true, 4);


--
-- Data for Name: planetary_explorations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_explorations VALUES (1, 'Curiosity Rover', 'Part of NASA''s Mars Science Laboratory, Curiosity explores Gale Crater, analyzing samples to assess Mars’ past habitability.', 2012, 4);
INSERT INTO public.planetary_explorations VALUES (2, 'Galileo Orbiter', 'Provided detailed images of Jupiter and its moons, discovering active volcanism on Io and the complex structures of its atmosphere.', 1995, 5);
INSERT INTO public.planetary_explorations VALUES (3, 'Cassini-Huygens', 'A groundbreaking mission that studied Saturn, its rings, and moons, including the Huygens probe that landed on Titan, revealing its atmospheric and surface conditions.', 1997, 6);
INSERT INTO public.planetary_explorations VALUES (4, 'New Horizons', 'The first spacecraft to fly by Pluto, providing diverse images and data about the dwarf planet and its moons, revealing its icy surface and atmosphere.', 2015, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is a giant, luminous ball of gas at the center of the solar system, providing light and heat essential for life on Earth.', 0.00, 1, 1, NULL, false, 1);
INSERT INTO public.star VALUES (2, 'Polaris', 'Polaris, also known as the North Star, is a bright star located nearly directly above the North Pole, making it a crucial navigational reference point for travelers in the Northern Hemisphere.', 447.60, 5, 38, true, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Known as the Dog Star, is the brightest star in the night sky and is located in the constellation Canis Major.', 8.71, 2, 2, true, true, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'The closest star system to Earth, featuring three stars: Alpha Centauri A, Alpha Centauri B, and Proxima Centauri, the latter of which hosts at least one Earth-sized exoplanet in its habitable zone.', 4.34, 1, 1, true, true, 1);
INSERT INTO public.star VALUES (5, 'Sanduleak -69 202', 'A blue super giant star located in the Southern Hemisphere constellation of Dorado, notable for being one of the most luminous stars known.', 168000.00, 20, 41, true, false, 3);
INSERT INTO public.star VALUES (6, 'Groombridge 34', 'A binary star system located in the constellation of Ursa Major, notable for its proximity and the discovery of a potential exoplanet orbiting one of its stars.', 11.70, 1, 1, true, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: planetary_explorations_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_explorations_mission_id_seq', 4, true);


--
-- Name: planetary_explorations_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_explorations_planet_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planetary_explorations planetary_explorations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_explorations
    ADD CONSTRAINT planetary_explorations_name_key UNIQUE (name);


--
-- Name: planetary_explorations planetary_explorations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_explorations
    ADD CONSTRAINT planetary_explorations_pkey PRIMARY KEY (planetary_explorations_id);


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
-- Name: planetary_explorations planetary_explorations_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_explorations
    ADD CONSTRAINT planetary_explorations_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

