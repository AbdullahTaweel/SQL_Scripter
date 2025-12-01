-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-02-09 17:56:26.526

-- tables
-- Table: characters
CREATE TABLE characters (
    character_id integer NOT NULL CONSTRAINT characters_pk PRIMARY KEY,
    name text NOT NULL,
    age integer NOT NULL,
    desccription text NOT NULL,
    talk_id integer NOT NULL,
    CONSTRAINT characters_talks FOREIGN KEY (talk_id)
    REFERENCES talks (talk_id)
);

-- Table: descriptions
CREATE TABLE descriptions (
    description_id text NOT NULL CONSTRAINT descriptions_pk PRIMARY KEY,
    text text NOT NULL,
    scene_id integer NOT NULL,
    projprop_id integer NOT NULL,
    CONSTRAINT descriptions_scenes FOREIGN KEY (scene_id)
    REFERENCES scenes (scene_id),
    CONSTRAINT descriptions_projproperties FOREIGN KEY (projprop_id)
    REFERENCES projproperties (projprop_id)
);

-- Table: dialogues
CREATE TABLE dialogues (
    dialogue_id integer NOT NULL CONSTRAINT dialogues_pk PRIMARY KEY,
    text text NOT NULL,
    talk_id integer NOT NULL,
    CONSTRAINT dialogues_talks FOREIGN KEY (talk_id)
    REFERENCES talks (talk_id)
);

-- Table: headers
CREATE TABLE headers (
    header_id integer NOT NULL CONSTRAINT headers_pk PRIMARY KEY,
    "set" text NOT NULL,
    place text NOT NULL,
    time text NOT NULL,
    scenes_scene_id integer NOT NULL,
    CONSTRAINT headers_scenes FOREIGN KEY (scenes_scene_id)
    REFERENCES scenes (scene_id)
);

-- Table: mainfiles
CREATE TABLE mainfiles (
    mainfile_id integer NOT NULL CONSTRAINT mainfiles_pk PRIMARY KEY,
    logline text NOT NULL,
    countries text NOT NULL,
    dateofstory text NOT NULL,
    timeofstory text NOT NULL,
    synopsis text NOT NULL,
    treatment text NOT NULL,
    motivation text NOT NULL,
    project_id integer NOT NULL,
    CONSTRAINT mainfiles_projects FOREIGN KEY (project_id)
    REFERENCES projects (project_id)
);

-- Table: notes
CREATE TABLE notes (
    note_id integer NOT NULL CONSTRAINT notes_pk PRIMARY KEY,
    text text NOT NULL,
    image text NOT NULL,
    link text NOT NULL,
    project_id integer NOT NULL,
    CONSTRAINT notes_projects FOREIGN KEY (project_id)
    REFERENCES projects (project_id)
);

-- Table: places
CREATE TABLE places (
    place_id integer NOT NULL CONSTRAINT places_pk PRIMARY KEY,
    name text NOT NULL,
    address text NOT NULL,
    description text NOT NULL,
    image text NOT NULL,
    header_id integer NOT NULL,
    CONSTRAINT places_headers FOREIGN KEY (header_id)
    REFERENCES headers (header_id)
);

-- Table: projects
CREATE TABLE projects (
    project_id integer NOT NULL CONSTRAINT projects_pk PRIMARY KEY,
    title text NOT NULL,
    type text NOT NULL,
    team_id integer NOT NULL,
    CONSTRAINT projects_teamwork FOREIGN KEY (team_id)
    REFERENCES teamworks (team_id)
);

-- Table: projproperties
CREATE TABLE projproperties (
    projprop_id integer NOT NULL CONSTRAINT projproperties_pk PRIMARY KEY
);

-- Table: properties
CREATE TABLE properties (
    property_id integer NOT NULL CONSTRAINT properties_pk PRIMARY KEY,
    type text NOT NULL,
    quantitiy integer NOT NULL,
    description text NOT NULL,
    projprops_id integer NOT NULL,
    CONSTRAINT properties_projproperties FOREIGN KEY (projprops_id)
    REFERENCES projproperties (projprop_id)
);

-- Table: scenes
CREATE TABLE scenes (
    scene_id integer NOT NULL CONSTRAINT scenes_pk PRIMARY KEY,
    transition text NOT NULL,
    screenplay_id integer NOT NULL,
    CONSTRAINT scenes_screenplays FOREIGN KEY (screenplay_id)
    REFERENCES screenplays (screenplay_id)
);

-- Table: screenplays
CREATE TABLE screenplays (
    screenplay_id integer NOT NULL CONSTRAINT screenplays_pk PRIMARY KEY,
    title text NOT NULL,
    type text NOT NULL,
    genre text NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT screenplays_Projects FOREIGN KEY (project_id)
    REFERENCES projects (project_id),
    CONSTRAINT screenplays_users FOREIGN KEY (user_id)
    REFERENCES users (user_id)
);

-- Table: stories
CREATE TABLE stories (
    story_id integer NOT NULL CONSTRAINT stories_pk PRIMARY KEY,
    text text NOT NULL,
    project_id integer NOT NULL,
    CONSTRAINT stories_projects FOREIGN KEY (project_id)
    REFERENCES projects (project_id)
);

-- Table: talks
CREATE TABLE talks (
    talk_id integer NOT NULL CONSTRAINT talks_pk PRIMARY KEY,
    scene_id integer NOT NULL,
    CONSTRAINT talks_scenes FOREIGN KEY (scene_id)
    REFERENCES scenes (scene_id)
);

-- Table: teamworks
CREATE TABLE teamworks (
    team_id integer NOT NULL CONSTRAINT teamworks_pk PRIMARY KEY,
    name text NOT NULL
);

-- Table: tone
CREATE TABLE tone (
    tone_id integer NOT NULL CONSTRAINT tone_pk PRIMARY KEY,
    text text NOT NULL,
    talk_id integer NOT NULL,
    CONSTRAINT tone_talks FOREIGN KEY (talk_id)
    REFERENCES talks (talk_id)
);

-- Table: users
CREATE TABLE users (
    user_id integer NOT NULL CONSTRAINT users_pk PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL,
    position text NOT NULL,
    country text NOT NULL,
    phone integer NOT NULL,
    email text NOT NULL,
    linkedin text NOT NULL,
    language text NOT NULL,
    avatar text NOT NULL,
    team_id integer NOT NULL,
    CONSTRAINT users_teamwork FOREIGN KEY (team_id)
    REFERENCES teamworks (team_id)
);

-- End of file.

