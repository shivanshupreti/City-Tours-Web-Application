BEGIN TRANSACTION;
DROP TABLE IF EXISTS ItineraryLandmarks, Itineraries, Reviews, LandmarkAvailability, Landmarks, Users, Popularity, StartingPoint;
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
	image_url VARCHAR(750),
	place_id VARCHAR(250) UNIQUE,
	order_num int NOT NULL,
    CONSTRAINT PK_landmarks PRIMARY KEY (id)
);
CREATE TABLE LandmarkAvailability (
    id SERIAL,
    landmark_id INTEGER NOT NULL,
    day_of_week VARCHAR(10) NOT NULL,
    open_time TIME,
    close_time TIME,
    CONSTRAINT PK_landmark_availability PRIMARY KEY (id),
    CONSTRAINT FK_landmark_availability_landmark FOREIGN KEY (landmark_id) REFERENCES Landmarks(id) ON DELETE CASCADE
);
CREATE TABLE Reviews (
    id SERIAL,
    landmark_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    rating INTEGER NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approval_status BOOLEAN NOT NULL DEFAULT FALSE,
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
    shared_status BOOLEAN NOT NULL DEFAULT FALSE,
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
CREATE TABLE Popularity (
    id SERIAL,
    landmark_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    rating thumbs NOT NULL,
    CONSTRAINT PK_popularity PRIMARY KEY (id),
    CONSTRAINT FK_popularity_landmark FOREIGN KEY (landmark_id) REFERENCES Landmarks(id) ON DELETE CASCADE,
    CONSTRAINT FK_popularity_user FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE StartingPoint (
    id SERIAL,
    place_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    place_type VARCHAR(50) NOT NULL,
    place_id VARCHAR(250) UNIQUE,
    CONSTRAINT PK_startingpoint PRIMARY KEY (id)
);

COMMIT TRANSACTION;


--ROLLBACK;




