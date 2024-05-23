-- Create table for investigators
CREATE TABLE investigators (
    investigator_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    unique_trait TEXT,
    box_set_id INTEGER REFERENCES box_sets(box_set_id)
);

-- Create table for traits
CREATE TABLE traits (
    trait_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);

-- Create table to link investigators and traits (many-to-many relationship)
CREATE TABLE investigator_traits (
    investigator_id INTEGER REFERENCES investigators(investigator_id),
    trait_id INTEGER REFERENCES traits(trait_id),
    PRIMARY KEY (investigator_id, trait_id)
);

-- Create table for enemies
CREATE TABLE enemies (
    enemy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    health INTEGER NOT NULL,
    green_dices INTEGER,
    black_dices INTEGER,
    condition TEXT,
    is_monster: BOOLEAN NOT NULL,
    box_set_id INTEGER REFERENCES box_sets(box_set_id),
);

-- Create table for old ones (Great Old Ones)
CREATE TABLE old_ones (
    old_one_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,     
    enemy_id INTEGER REFERENCES enemies(enemy_id),
    box_set_id INTEGER REFERENCES box_sets(box_set_id)
);

-- Create table for episodes
CREATE TABLE episodes (
    episode_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    episode_number INTEGER NOT NULL,
    box_set_id INTEGER REFERENCES box_sets(box_set_id)
);

-- Create table for enemies that belong to episodes
CREATE TABLE enemies_episode (
    enemy_id INTEGER REFERENCES enemies(enemy_id)
    episode_id INTEGER REFERENCES episodes(episode_id),
    PRIMARY KEY (enemy_id, episode_id)
)

-- Create table for box sets (core game and expansions)
CREATE TABLE box_sets (
    box_set_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);
