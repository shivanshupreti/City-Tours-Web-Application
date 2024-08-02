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
	image_url VARCHAR(750),
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
('Eiffel Tower', 'Paris', 'Iconic symbol of France and a must-visit.', 'Monument', TRUE, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm-IDtfwTRzQ4ZkKsxN8I68hSY9kgw8aUCxg&s'),
('Louvre Museum', 'Paris', 'Home to the Mona Lisa and countless other masterpieces.', 'Museum', TRUE, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXSxi0V3JllREqOi5iilezupfXinx2gEqO6Q&s'),
('Notre-Dame Cathedral', 'Paris', 'Famous Gothic cathedral.', 'Church', TRUE, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSov2yUrlqw2XBlX2_8T-KX-SYmbEYhNsyxaQ&s'),
('Champs-Élysées and Arc de Triomphe', 'Paris', 'Prestigious avenue ending with the triumphal arch.', 'Avenue', TRUE, 'https://image.jimcdn.com/app/cms/image/transf/dimension=origxorig:format=jpg/path/se80bcf7e1bbfb507/image/i54f4e905929ff6b0/version/1305989812/image.jpg'),
('Sacré-Cœur Basilica', 'Paris', 'Stunning basilica on Montmartre hill.', 'Church', TRUE, 'https://static.wixstatic.com/media/68b72b_2a44b33c64d141e79bf5990d7ab10f64~mv2.jpg/v1/fill/w_980,h_653,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/68b72b_2a44b33c64d141e79bf5990d7ab10f64~mv2.jpg'),
('Palace of Versailles', 'Paris', 'Luxurious former royal residence.', 'Palace', TRUE, 'https://www.travelandleisure.com/thmb/sR2kS_tl_yz4bxFkxDWyaVv6lmw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/versailles-palace-courtyard-SECRET1216-911d9538288141a686474b1ce08a2e1a.jpg');

-- Rome landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Colosseum', 'Rome', 'Ancient amphitheater and symbol of Rome.', 'Amphitheater', TRUE, 'https://qph.cf2.quoracdn.net/main-qimg-922835f781d6eb3999c1a7cda092c850'),
('Vatican City (St. Peter''s Basilica & Sistine Chapel)', 'Rome', 'Seat of the Catholic Church and home to Michelangelo''s artwork.', 'Religious Site', TRUE, 'https://travelforawhile.com/wp-content/uploads/2023/05/The-Vatican-St.-Peters-Basilica.jpg'),
('Pantheon', 'Rome', 'Well-preserved ancient Roman temple.', 'Temple', TRUE, 'https://www.archeoroma.org/wp-content/uploads/2016/10/pantheon-rome-dome.jpg'),
('Trevi Fountain', 'Rome', 'Famous Baroque fountain.', 'Fountain', TRUE, 'https://www.travelandleisure.com/thmb/CKxA_iBAtx1zYw_7EevV4cuxgH0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/trevi-fountain-rome-italy-TREVI0217-4b6f7385c7f0436ba3d5fa2c061a1791.jpg'),
('Roman Forum', 'Rome', 'Ancient center of Roman public life.', 'Historical Site', TRUE, 'https://static.wixstatic.com/media/e41b5c_8e39787f991543fd97451f50d467ae01~mv2.jpg/v1/fill/w_2500,h_1666,al_c/e41b5c_8e39787f991543fd97451f50d467ae01~mv2.jpg'),
('Piazza Navona', 'Rome', 'Elegant square with beautiful fountains and architecture.', 'Square', TRUE, 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/27/88/12.jpg');

-- Kyoto landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Fushimi Inari Shrine', 'Kyoto', 'Known for its thousands of red torii gates.', 'Shrine', TRUE, 'https://static.toiimg.com/photo/55979195.cms'),
('Kinkaku-ji (Golden Pavilion)', 'Kyoto', 'Stunning golden temple.', 'Temple', TRUE, 'https://www.jal.co.jp/vn/en/guide-to-japan/destinations/articles/kyoto/5-must-see-temples-in-ancient-capital/_jcr_content/root/responsivegrid/sectioncontainer_cop/image_2147354233.coreimg.jpeg/1697607575940.jpeg'),
('Kiyomizu-dera', 'Kyoto', 'Historic temple with a large wooden stage.', 'Temple', TRUE, 'https://media.patheos.com/~/media/patheos-images/images/sacred-spaces/90-kiyomizu-dera-05_credit-shutterstock.jpg?as=1&w=800'),
('Arashiyama Bamboo Grove', 'Kyoto', 'Serene bamboo forest.', 'Forest', TRUE, 'https://lp-cms-production.imgix.net/2019-06/0bbf98a5a2d3a65c4e17feb1baa630ff-arashiyama-bamboo-grove.jpg'),
('Nijō Castle', 'Kyoto', 'Historic castle with beautiful gardens.', 'Castle', TRUE, 'https://tabijikan.com/kys/lang/en/wp-content/uploads/2016/02/20150309-304-20-100.jpg'),
('Gion District', 'Kyoto', 'Traditional geisha district with preserved architecture.', 'District', TRUE, 'https://media.timeout.com/images/106106593/image.jpg');

-- New York City landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Statue of Liberty', 'New York City', 'Iconic symbol of freedom and democracy.', 'Monument', TRUE, 'https://cdn1.epicgames.com/ue/product/Featured/StatueOfLiberty_featured-894x488-d1f9ab8763773da5a0cc370b753211f1.png'),
('Central Park', 'New York City', 'Large urban park offering numerous activities.', 'Park', TRUE, 'https://lik.com/cdn/shop/products/Peter-Lik-Central-Park-Spirit-Framed-Recess-Moun_1024x1024.jpg?v=1670363959'),
('Times Square', 'New York City', 'Bustling commercial and entertainment hub.', 'Square', TRUE, 'https://images.ctfassets.net/1aemqu6a6t65/46MJ6ER585Rwl3NraEIoGL/784c5eb5d87f576b5548b1a2255f08e7/tripadvisortimessquare_taggeryanceyiv_5912?w=1200&h=800&q=75'),
('Empire State Building', 'New York City', 'Famous skyscraper with observation decks.', 'Skyscraper', TRUE, 'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/crm/newyorkstate/GettyImages-486334510_CC36FC20-0DCE-7408-77C72CD93ED4A476-cc36f9e70fc9b45_cc36fc73-07dd-b6b3-09b619cd4694393e.jpg'),
('Brooklyn Bridge', 'New York City', 'Historic suspension bridge.', 'Bridge', TRUE, 'https://muralsyourway.vtexassets.com/arquivos/ids/234586/Brooklyn-Bridge-and-NYC-Skyline-at-Night-Wall-Mural.jpg?v=638165374098470000'),
('Metropolitan Museum of Art', 'New York City', 'One of the world''s largest and finest art museums.', 'Museum', TRUE, 'https://media.cntraveler.com/photos/55d362f337284fb1079ccc4b/16:9/w_2560%2Cc_limit/metropolitan-museum-of-art-new-york-city.jpg');

-- Sydney landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url)
VALUES
('Sydney Opera House', 'Sydney', 'Iconic performing arts center.', 'Theater', TRUE, 'https://ychef.files.bbci.co.uk/1280x720/p0gp95cq.jpg'),
('Sydney Harbour Bridge', 'Sydney', 'Famous bridge with climbing tours.', 'Bridge', TRUE, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Sydney_harbour_bridge_dusk.jpg/1200px-Sydney_harbour_bridge_dusk.jpg'),
('Bondi Beach', 'Sydney', 'Popular beach known for surfing.', 'Beach', TRUE, 'https://blog.forbestravelguide.com/wp-content/uploads/2013/12/FTG-AussieBeach-CreditiStock_KimPinTan.jpg'),
('Taronga Zoo', 'Sydney', 'Large zoo with diverse wildlife.', 'Zoo', TRUE, 'https://dbijapkm3o6fj.cloudfront.net/resources/1282,1004,1,6,4,0,600,450/-4601-/20150311175809/taronga-zoo.jpeg'),
('Royal Botanic Garden', 'Sydney', 'Beautiful botanical gardens by the harbor.', 'Garden', TRUE, 'https://media.istockphoto.com/id/510641020/photo/botanic-gardens-alley.jpg?s=612x612&w=0&k=20&c=Ph43mpMMUVxV7w90YlAahbGX9Z5uOVAoXCuldewvlHk='),
('The Rocks', 'Sydney', 'Historic area with markets, museums, and restaurants.', 'Historic District', TRUE, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/02/50/02/sydney-s-first-street.jpg?w=1200&h=-1&s=1');

COMMIT TRANSACTION;

-- Rollback transaction;