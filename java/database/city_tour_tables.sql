BEGIN TRANSACTION;

DROP TABLE IF EXISTS ItineraryLandmarks, Itineraries, Reviews, LandmarkAvailability, Landmarks, Users;
DROP TYPE IF EXISTS thumbs;
CREATE TYPE thumbs AS ENUM ('thumbs_up', 'thumbs_down');
CREATE TABLE users (
    user_id SERIAL,
    username varchar(50) NOT NULL UNIQUE,
    password_hash varchar(200) NOT NULL,
    role varchar(50) NOT NULL,
    CONSTRAINT PK_user PRIMARY KEY (user_id)
    );
CREATE TABLE Landmarks (
    id SERIAL,
    name VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    venue_type VARCHAR(50) NOT NULL,
    approval_status BOOLEAN NOT NULL DEFAULT FALSE,
	image_url VARCHAR(255),
    CONSTRAINT PK_landmarks PRIMARY KEY (id)
);
CREATE TABLE LandmarkAvailability (
    id SERIAL,
    landmark_id INTEGER NOT NULL,
    day_of_week VARCHAR(10) NOT NULL,
    open_time TIME NOT NULL,
    close_time TIME NOT NULL,
    CONSTRAINT PK_landmark_availability PRIMARY KEY (id),
    CONSTRAINT FK_landmark_availability_landmark FOREIGN KEY (landmark_id) REFERENCES Landmarks(id) ON DELETE CASCADE
);
CREATE TABLE Reviews (
    id SERIAL,
    landmark_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    rating thumbs NOT NULL,
    CONSTRAINT PK_reviews PRIMARY KEY (id),
    CONSTRAINT FK_reviews_landmark FOREIGN KEY (landmark_id) REFERENCES Landmarks(id) ON DELETE CASCADE,
    CONSTRAINT FK_reviews_user FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
CREATE TABLE Itineraries (
    id SERIAL,
    user_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    starting_point VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    shared_url VARCHAR(255),
    CONSTRAINT PK_itineraries PRIMARY KEY (id),
    CONSTRAINT FK_itineraries_user FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
CREATE TABLE ItineraryLandmarks (
    itinerary_id int NOT NULL,
    landmark_id int NOT NULL,
    order_num int NOT NULL,
    CONSTRAINT PK_itinerary_landmarks PRIMARY KEY (itinerary_id, landmark_id),
    CONSTRAINT FK_itinerary_landmarks_itinerary FOREIGN KEY (itinerary_id) REFERENCES Itineraries(id) ON DELETE CASCADE,
    CONSTRAINT FK_itinerary_landmarks_landmark FOREIGN KEY (landmark_id) REFERENCES Landmarks(id) ON DELETE CASCADE
);



-- Paris landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Eiffel Tower', 'Paris', 'Iconic symbol of France and a must-visit.', 'Monument', TRUE, NULL),
('Louvre Museum', 'Paris', 'Home to the Mona Lisa and countless other masterpieces.', 'Museum', TRUE, NULL),
('Notre-Dame Cathedral', 'Paris', 'Famous Gothic cathedral.', 'Church', TRUE, NULL),
('Champs-Élysées and Arc de Triomphe', 'Paris', 'Prestigious avenue ending with the triumphal arch.', 'Avenue', TRUE, NULL),
('Sacré-Cœur Basilica', 'Paris', 'Stunning basilica on Montmartre hill.', 'Church', TRUE, NULL),
('Palace of Versailles', 'Paris', 'Luxurious former royal residence.', 'Palace', TRUE, NULL);

-- Rome landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Colosseum', 'Rome', 'Ancient amphitheater and symbol of Rome.', 'Amphitheater', TRUE, NULL),
('Vatican City (St. Peter''s Basilica & Sistine Chapel)', 'Rome', 'Seat of the Catholic Church and home to Michelangelo''s artwork.', 'Religious Site', TRUE, NULL),
('Pantheon', 'Rome', 'Well-preserved ancient Roman temple.', 'Temple', TRUE, NULL),
('Trevi Fountain', 'Rome', 'Famous Baroque fountain.', 'Fountain', TRUE, NULL),
('Roman Forum', 'Rome', 'Ancient center of Roman public life.', 'Historical Site', TRUE, NULL),
('Piazza Navona', 'Rome', 'Elegant square with beautiful fountains and architecture.', 'Square', TRUE, NULL);

-- Kyoto landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Fushimi Inari Shrine', 'Kyoto', 'Known for its thousands of red torii gates.', 'Shrine', TRUE, NULL),
('Kinkaku-ji (Golden Pavilion)', 'Kyoto', 'Stunning golden temple.', 'Temple', TRUE, NULL),
('Kiyomizu-dera', 'Kyoto', 'Historic temple with a large wooden stage.', 'Temple', TRUE, NULL),
('Arashiyama Bamboo Grove', 'Kyoto', 'Serene bamboo forest.', 'Forest', TRUE, NULL),
('Nijō Castle', 'Kyoto', 'Historic castle with beautiful gardens.', 'Castle', TRUE, NULL),
('Gion District', 'Kyoto', 'Traditional geisha district with preserved architecture.', 'District', TRUE, NULL);

-- New York City landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Statue of Liberty', 'New York City', 'Iconic symbol of freedom and democracy.', 'Monument', TRUE, NULL),
('Central Park', 'New York City', 'Large urban park offering numerous activities.', 'Park', TRUE, NULL),
('Times Square', 'New York City', 'Bustling commercial and entertainment hub.', 'Square', TRUE, NULL),
('Empire State Building', 'New York City', 'Famous skyscraper with observation decks.', 'Skyscraper', TRUE, NULL),
('Brooklyn Bridge', 'New York City', 'Historic suspension bridge.', 'Bridge', TRUE, NULL),
('Metropolitan Museum of Art', 'New York City', 'One of the world''s largest and finest art museums.', 'Museum', TRUE, NULL);

-- Sydney landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Sydney Opera House', 'Sydney', 'Iconic performing arts center.', 'Theater', TRUE, NULL),
('Sydney Harbour Bridge', 'Sydney', 'Famous bridge with climbing tours.', 'Bridge', TRUE, NULL),
('Bondi Beach', 'Sydney', 'Popular beach known for surfing.', 'Beach', TRUE, NULL),
('Taronga Zoo', 'Sydney', 'Large zoo with diverse wildlife.', 'Zoo', TRUE, NULL),
('Royal Botanic Garden', 'Sydney', 'Beautiful botanical gardens by the harbor.', 'Garden', TRUE, NULL),
('The Rocks', 'Sydney', 'Historic area with markets, museums, and restaurants.', 'Historic District', TRUE, NULL);

COMMIT TRANSACTION;

-- Rollback transaction;