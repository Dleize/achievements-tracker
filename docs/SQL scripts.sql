CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    photo VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    platform VARCHAR(100),
    release_date DATE,
    image_url VARCHAR(255)
);

CREATE TABLE achievements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    difficulty ENUM('Easy', 'Medium', 'Hard') NOT NULL,
    game_id INT,
    hidden BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (game_id) REFERENCES games(id)
);

CREATE TABLE progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT,
    achievement_id INT,
    status ENUM('Not Started', 'In Progress', 'Completed') NOT NULL,
    start_date TIMESTAMP,
    completion_date TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(id),
    FOREIGN KEY (achievement_id) REFERENCES achievements(id)
);



