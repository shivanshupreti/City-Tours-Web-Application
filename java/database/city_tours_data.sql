BEGIN TRANSACTION;

-- Users data
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


-- Paris landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url, place_id, order_num)
VALUES
('Eiffel Tower', 'Paris', 'Iconic symbol of France and a must-visit.', 'Monument', TRUE, 'https://wallpapercat.com/w/middle-retina/1/a/2/30557-2880x1800-desktop-hd-eiffel-tower-background-photo.jpg', 'ChIJLU7jZClu5kcR4PcOOO6p3I0', 1),
('Louvre Museum', 'Paris', 'Home to the Mona Lisa and countless other masterpieces.', 'Museum', TRUE, 'https://media.architecturaldigest.com/photos/5900cc370638dd3b70018b33/16:9/w_1920,c_limit/Secrets%20of%20Louvre%201.jpg', 'ChIJD3uTd9hx5kcR1IQvGfr8dbk', 2),
('Notre-Dame Cathedral', 'Paris', 'Famous Gothic cathedral.', 'Church', TRUE, 'https://c0.wallpaperflare.com/preview/713/515/606/cathedral-notre-dame-paris-morning-light.jpg', 'ChIJATr1n-Fx5kcRjQb6q6cdQDY', 3),
('Arc de Triomphe', 'Paris', 'Prestigious avenue ending with the triumLandphal arch.', 'Avenue', TRUE, 'https://image.jimcdn.com/app/cms/image/transf/dimension=origxorig:format=jpg/path/se80bcf7e1bbfb507/image/i54f4e905929ff6b0/version/1305989812/image.jpg', 'ChIJjx37cOxv5kcRPWQuEW5ntdk', 4),
('Sacre Coeur Basilica', 'Paris', 'Stunning basilica on Montmartre hill.', 'Church', TRUE, 'https://static.wixstatic.com/media/68b72b_2a44b33c64d141e79bf5990d7ab10f64~mv2.jpg/v1/fill/w_980,h_653,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/68b72b_2a44b33c64d141e79bf5990d7ab10f64~mv2.jpg', 'ChIJg8vfy1xu5kcRA1tGDNGsgHA', 5),
('Palace of Versailles', 'Paris', 'Luxurious former royal residence.', 'Palace', TRUE, 'https://www.travelandleisure.com/thmb/sR2kS_tl_yz4bxFkxDWyaVv6lmw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/versailles-palace-courtyard-SECRET1216-911d9538288141a686474b1ce08a2e1a.jpg', 'ChIJdUyx15R95kcRj85ZX8H8OAU', 6);

-- Eiffel Tower availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(1, 'Monday', '09:00:00', '00:00:00'),
(1, 'Tuesday', '09:00:00', '00:00:00'),
(1, 'Wednesday', '09:00:00', '00:00:00'),
(1, 'Thursday', '09:00:00', '00:00:00'),
(1, 'Friday', '09:00:00', '00:00:00'),
(1, 'Saturday', '09:00:00', '00:00:00'),
(1, 'Sunday', '09:00:00', '00:00:00');

-- Louvre Museum availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(2, 'Monday', '09:00:00', '18:00:00'),
(2, 'Tuesday', NULL, NULL),
(2, 'Wednesday', '09:00:00', '21:00:00'),
(2, 'Thursday', '09:00:00', '18:00:00'),
(2, 'Friday', '09:00:00', '21:00:00'),
(2, 'Saturday', '09:00:00', '18:00:00'),
(2, 'Sunday', '09:00:00', '18:00:00');

-- Notre-Dame Cathedral availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(3, 'Monday', NULL, NULL),
(3, 'Tuesday', NULL, NULL),
(3, 'Wednesday', NULL, NULL),
(3, 'Thursday', NULL, NULL),
(3, 'Friday', NULL, NULL),
(3, 'Saturday', NULL, NULL),
(3, 'Sunday', NULL, NULL);

-- Arc de Triomphe availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(4, 'Monday', '10:00:00', '23:00:00'),
(4, 'Tuesday', '10:00:00', '23:00:00'),
(4, 'Wednesday', '10:00:00', '23:00:00'),
(4, 'Thursday', '10:00:00', '23:00:00'),
(4, 'Friday', '10:00:00', '23:00:00'),
(4, 'Saturday', '10:00:00', '23:00:00'),
(4, 'Sunday', '10:00:00', '23:00:00');

-- Sacre Coeur Basilica availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(5, 'Monday', '06:30:00', '22:30:00'),
(5, 'Tuesday', '06:30:00', '22:30:00'),
(5, 'Wednesday', '06:30:00', '22:30:00'),
(5, 'Thursday', '06:30:00', '22:30:00'),
(5, 'Friday', '06:30:00', '22:30:00'),
(5, 'Saturday', '06:30:00', '22:30:00'),
(5, 'Sunday', '06:30:00', '22:30:00');

-- Palace of Versailles availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(6, 'Monday', NULL, NULL),
(6, 'Tuesday', '09:00:00', '18:30:00'),
(6, 'Wednesday', '09:00:00', '18:30:00'),
(6, 'Thursday', '09:00:00', '18:30:00'),
(6, 'Friday', '09:00:00', '18:30:00'),
(6, 'Saturday', '09:00:00', '18:30:00'),
(6, 'Sunday', '09:00:00', '18:30:00');

-- Paris Starting Points
INSERT INTO StartingPoint (place_name, city, place_type, place_id)
VALUES
    ('Hotel Regina Louvre', 'Paris', 'Hotel', 'ChIJP_-HCS9u5kcRsj9b1x7Pl8w'),
    ('Hotel Le Grand Mazarin', 'Paris', 'Hotel', 'ChIJHy_5-Axv5kcReGwZ_7kYB4s'),
    ('Le Burgundy Paris', 'Paris', 'Hotel', 'ChIJb45b9TJu5kcR05gouvl8Fio'),
    ('Paris Charles de Gaulle Airport', 'Paris', 'Airport', 'ChIJW89MjgM-5kcRLKZbL5jgKwQ'),
    ('Paris-Orly Airport', 'Paris', 'Airport', 'ChIJHTtq-rF15kcRIoTbQ9feeJ0'),
    ('Gare du Nord', 'Paris', 'Station', 'ChIJ28OuH25u5kcRXGGV095HB-s'),
    ('Saint-Lazare Metro Station', 'Paris', 'Station', 'ChIJRQ5XWqNv5kcRKT549Q7N9Zc');

-- Rome landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url, place_id, order_num)
VALUES
('Colosseum', 'Rome', 'Ancient amphitheater and symbol of Rome.', 'Amphitheater', TRUE, 'https://qph.cf2.quoracdn.net/main-qimg-922835f781d6eb3999c1a7cda092c850', 'ChIJrRMgU7ZhLxMRxAOFkC7I8Sg', 1),
('St. Peter''s Basilica', 'Rome', 'Seat of the Catholic Church and home to Michelangelo''s artwork.', 'Religious Site', TRUE, 'https://travelforawhile.com/wp-content/uploads/2023/05/The-Vatican-St.-Peters-Basilica.jpg', 'ChIJWZsUt2FgLxMRg1KHzXfwS3I', 2),
('Pantheon', 'Rome', 'Well-preserved ancient Roman temple.', 'Temple', TRUE, 'https://www.archeoroma.org/wp-content/uploads/2016/10/pantheon-rome-dome.jpg', 'ChIJqUCGZ09gLxMRLM42IPpl0co', 3),
('Trevi Fountain', 'Rome', 'Famous Baroque fountain.', 'Fountain', TRUE, 'https://www.travelandleisure.com/thmb/CKxA_iBAtx1zYw_7EevV4cuxgH0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/trevi-fountain-rome-italy-TREVI0217-4b6f7385c7f0436ba3d5fa2c061a1791.jpg', 'ChIJ1UCDJ1NgLxMRtrsCzOHxdvY', 4),
('Roman Forum', 'Rome', 'Ancient center of Roman public life.', 'Historical Site', TRUE, 'https://static.wixstatic.com/media/e41b5c_8e39787f991543fd97451f50d467ae01~mv2.jpg/v1/fill/w_2500,h_1666,al_c/e41b5c_8e39787f991543fd97451f50d467ae01~mv2.jpg', 'ChIJ782pg7NhLxMR5n3swAdAkfo', 5),
('Piazza Navona', 'Rome', 'Elegant square with beautiful fountains and architecture.', 'Square', TRUE, 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/27/88/12.jpg', 'ChIJPRydwYNgLxMRSjOCLlYkV6M', 6);

-- Colosseum availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(7, 'Monday', '08:30:00', '19:15:00'),
(7, 'Tuesday', '08:30:00', '19:15:00'),
(7, 'Wednesday', '08:30:00', '19:15:00'),
(7, 'Thursday', '08:30:00', '19:15:00'),
(7, 'Friday', '08:30:00', '19:15:00'),
(7, 'Saturday', '08:30:00', '19:15:00'),
(7, 'Sunday', '08:30:00', '19:15:00');

-- St. Peter's Basilica availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(8, 'Monday', '07:00:00', '22:00:00'),
(8, 'Tuesday', '07:00:00', '22:00:00'),
(8, 'Wednesday', '07:00:00', '22:00:00'),
(8, 'Thursday', '07:00:00', '22:00:00'),
(8, 'Friday', '07:00:00', '22:00:00'),
(8, 'Saturday', '07:00:00', '23:00:00'),
(8, 'Sunday', '07:00:00', '22:00:00');

-- Pantheon availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(9, 'Monday', '09:00:00', '18:30:00'),
(9, 'Tuesday', '09:00:00', '18:30:00'),
(9, 'Wednesday', '09:00:00', '18:30:00'),
(9, 'Thursday', '09:00:00', '18:30:00'),
(9, 'Friday', '09:00:00', '18:30:00'),
(9, 'Saturday', '09:00:00', '18:30:00'),
(9, 'Sunday', '09:00:00', '18:30:00');

-- Trevi Fountain availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(10, 'Monday', '00:00:00', '23:59:59'),
(10, 'Tuesday', '00:00:00', '23:59:59'),
(10, 'Wednesday', '00:00:00', '23:59:59'),
(10, 'Thursday', '00:00:00', '23:59:59'),
(10, 'Friday', '00:00:00', '23:59:59'),
(10, 'Saturday', '00:00:00', '23:59:59'),
(10, 'Sunday', '00:00:00', '23:59:59');

-- Roman Forum availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(11, 'Monday', '09:00:00', '19:15:00'),
(11, 'Tuesday', '09:00:00', '19:15:00'),
(11, 'Wednesday', '09:00:00', '19:15:00'),
(11, 'Thursday', '09:00:00', '19:15:00'),
(11, 'Friday', '09:00:00', '19:15:00'),
(11, 'Saturday', '09:00:00', '17:30:00'),
(11, 'Sunday', '09:00:00', '19:15:00');

-- Piazza Navona availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(12, 'Monday', '00:00:00', '23:59:59'),
(12, 'Tuesday', '00:00:00', '23:59:59'),
(12, 'Wednesday', '00:00:00', '23:59:59'),
(12, 'Thursday', '00:00:00', '23:59:59'),
(12, 'Friday', '00:00:00', '23:59:59'),
(12, 'Saturday', '00:00:00', '23:59:59'),
(12, 'Sunday', '00:00:00', '23:59:59');

-- Rome Starting Points
INSERT INTO StartingPoint (place_name, city, place_type, place_id)
VALUES
    ('Palazzo Manfredi', 'Rome', 'Hotel', 'ChIJTVNJb7dhLxMRdE-kPPU1f_o'),
    ('Hotel Artemide', 'Rome', 'Hotel', 'ChIJ-XEpPK9hLxMRCnJJKst12y4'),
    ('Hotel Splendide Royal', 'Rome', 'Hotel', 'ChIJ3yLYfQBhLxMRHZtDqn639zc'),
    ('Rome Fiumicino Airport', 'Rome', 'Airport', 'ChIJ-WL4kXT6JRMR1wSyXhDe1WQ'),
    ('Rome Ciampino Airport', 'Rome', 'Airport', 'ChIJA-mdOLaIJRMRDVHFjx0Gtu0'),
    ('Roma Termini', 'Rome', 'Station', 'ChIJP4qLeOBhLxMRtzaveEY7RaY'),
    ('Roma San Pietro', 'Rome', 'Station', 'ChIJPYhLAmxgLxMRNtrYRZfvipE');


-- Kyoto landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url, place_id, order_num)
VALUES
('Fushimi Inari Shrine', 'Kyoto', 'Known for its thousands of red torii gates.', 'Shrine', TRUE, 'https://static.toiimg.com/photo/55979195.cms', 'ChIJIW0uPRUPAWAR6eI6dRzKGns', 1),
('Kinkaku-ji', 'Kyoto', 'Stunning golden temple.', 'Temple', TRUE, 'https://www.jal.co.jp/vn/en/guide-to-japan/destinations/articles/kyoto/5-must-see-temples-in-ancient-capital/_jcr_content/root/responsivegrid/sectioncontainer_cop/image_2147354233.coreimg.jpeg/1697607575940.jpeg', 'ChIJvUbrwCCoAWARX2QiHCsn5A4', 2),
('Kiyomizu-dera', 'Kyoto', 'Historic temple with a large wooden stage.', 'Temple', TRUE, 'https://media.patheos.com/~/media/patheos-images/images/sacred-spaces/90-kiyomizu-dera-05_credit-shutterstock.jpg?as=1&w=800', 'ChIJB_vchdMIAWARujTEUIZlr2I', 3),
('Arashiyama Bamboo Grove', 'Kyoto', 'Serene bamboo forest.', 'Forest', TRUE, 'https://lp-cms-production.imgix.net/2019-06/0bbf98a5a2d3a65c4e17feb1baa630ff-arashiyama-bamboo-grove.jpg', 'ChIJrYtcv-urAWAR3XzWvXv8n_s', 4),
('Nijo Castle', 'Kyoto', 'Historic castle with beautiful gardens.', 'Castle', TRUE, 'https://tabijikan.com/kys/lang/en/wp-content/uploads/2016/02/20150309-304-20-100.jpg', 'ChIJC5srCtQHAWARLy9qkFmHaxA', 5),
('Gion District', 'Kyoto', 'Traditional geisha district with preserved architecture.', 'District', TRUE, 'https://media.timeout.com/images/106106593/image.jpg', 'ChIJ39JafQAJAWART9ih3YcxvVQ', 6);

-- Fushimi Inari Shrine availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(13, 'Monday', '00:00:00', '23:59:59'),
(13, 'Tuesday', '00:00:00', '23:59:59'),
(13, 'Wednesday', '00:00:00', '23:59:59'),
(13, 'Thursday', '00:00:00', '23:59:59'),
(13, 'Friday', '00:00:00', '23:59:59'),
(13, 'Saturday', '00:00:00', '23:59:59'),
(13, 'Sunday', '00:00:00', '23:59:59');

-- Kinkaku-ji availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(14, 'Monday', '09:00:00', '17:00:00'),
(14, 'Tuesday', '09:00:00', '17:00:00'),
(14, 'Wednesday', '09:00:00', '17:00:00'),
(14, 'Thursday', '09:00:00', '17:00:00'),
(14, 'Friday', '09:00:00', '17:00:00'),
(14, 'Saturday', '09:00:00', '17:00:00'),
(14, 'Sunday', '09:00:00', '17:00:00');

-- Kiyomizu-dera availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(15, 'Monday', '06:00:00', '18:00:00'),
(15, 'Tuesday', '06:00:00', '18:00:00'),
(15, 'Wednesday', '06:00:00', '18:00:00'),
(15, 'Thursday', '06:00:00', '18:00:00'),
(15, 'Friday', '06:00:00', '18:00:00'),
(15, 'Saturday', '06:00:00', '18:00:00'),
(15, 'Sunday', '06:00:00', '18:00:00');

-- Arashiyama Bamboo Grove availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(16, 'Monday', '00:00:00', '23:59:59'),
(16, 'Tuesday', '00:00:00', '23:59:59'),
(16, 'Wednesday', '00:00:00', '23:59:59'),
(16, 'Thursday', '00:00:00', '23:59:59'),
(16, 'Friday', '00:00:00', '23:59:59'),
(16, 'Saturday', '00:00:00', '23:59:59'),
(16, 'Sunday', '00:00:00', '23:59:59');

-- Nijo Castle availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(17, 'Monday', '08:45:00', '17:00:00'),
(17, 'Tuesday', '08:45:00', '17:00:00'),
(17, 'Wednesday', '08:45:00', '17:00:00'),
(17, 'Thursday', '08:45:00', '17:00:00'),
(17, 'Friday', '08:45:00', '17:00:00'),
(17, 'Saturday', '08:45:00', '17:00:00'),
(17, 'Sunday', '08:45:00', '17:00:00');

-- Gion District availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(18, 'Monday', '10:00:00', '19:00:00'),
(18, 'Tuesday', '10:00:00', '19:00:00'),
(18, 'Wednesday', '10:00:00', '19:00:00'),
(18, 'Thursday', '10:00:00', '19:00:00'),
(18, 'Friday', '10:00:00', '21:00:00'),
(18, 'Saturday', '10:00:00', '21:00:00'),
(18, 'Sunday', '10:00:00', '19:00:00');

-- Kyoto Starting Points
INSERT INTO StartingPoint (place_name, city, place_type, place_id)
VALUES
    ('Park Hyatt Kyoto', 'Kyoto', 'Hotel', 'ChIJY1o_4kcJAWARy0VPcxQbz94'),
    ('The Blossom Kyoto', 'Kyoto', 'Hotel', 'ChIJ493mM6MIAWARcgLmwPVqEMg'),
    ('Hotel Okura Kyoto', 'Kyoto', 'Hotel', 'ChIJLS3WZJIIAWARqQv8aoODVqs'),
    ('Kansai International Airport', 'Kyoto', 'Airport', 'ChIJ9_rNIxO5AGARiI-QjZ-ncfE'),
    ('Itami Airport', 'Kyoto', 'Airport', 'ChIJuXeH9W3wAGARzfSdTYcaQQc'),
    ('Kyoto Station', 'Kyoto', 'Station', 'ChIJ7wKLka4IAWARCByidG5EGrY'),
    ('Nijo Station', 'Kyoto', 'Station', 'ChIJ2b4ClM0HAWARjkrNWXaOKu8');


-- New York City landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url, place_id, order_num)
VALUES
('Statue of Liberty', 'New York City', 'Iconic symbol of freedom and democracy.', 'Monument', TRUE, 'https://cdn1.epicgames.com/ue/product/Featured/StatueOfLiberty_featured-894x488-d1f9ab8763773da5a0cc370b753211f1.png', 'ChIJPTacEpBQwokRKwIlDXelxkA', 1),
('Central Park', 'New York City', 'Large urban park offering numerous activities.', 'Park', TRUE, 'https://lik.com/cdn/shop/products/Peter-Lik-Central-Park-Spirit-Framed-Recess-Moun_1024x1024.jpg?v=1670363959', 'ChIJ4zGFAZpYwokRGUGph3Mf37k', 2),
('Times Square', 'New York City', 'Bustling commercial and entertainment hub.', 'Square', TRUE, 'https://images.ctfassets.net/1aemqu6a6t65/46MJ6ER585Rwl3NraEIoGL/784c5eb5d87f576b5548b1a2255f08e7/tripadvisortimessquare_taggeryanceyiv_5912?w=1200&h=800&q=75', 'ChIJmQJIxlVYwokRLgeuocVOGVU', 3),
('Empire State Building', 'New York City', 'Famous skyscraper with observation decks.', 'Skyscraper', TRUE, 'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/crm/newyorkstate/GettyImages-486334510_CC36FC20-0DCE-7408-77C72CD93ED4A476-cc36f9e70fc9b45_cc36fc73-07dd-b6b3-09b619cd4694393e.jpg', 'ChIJaXQRs6lZwokRY6EFpJnhNNE', 4),
('Brooklyn Bridge', 'New York City', 'Historic suspension bridge.', 'Bridge', TRUE, 'https://muralsyourway.vtexassets.com/arquivos/ids/234586/Brooklyn-Bridge-and-NYC-Skyline-at-Night-Wall-Mural.jpg?v=638165374098470000', 'ChIJK3vOQyNawokRXEa9errdJiU', 5),
('Metropolitan Museum of Art', 'New York City', 'One of the world''s largest and finest art museums.', 'Museum', TRUE, 'https://media.cntraveler.com/photos/55d362f337284fb1079ccc4b/16:9/w_2560%2Cc_limit/metropolitan-museum-of-art-new-york-city.jpg', 'ChIJb8Jg9pZYwokR-qHGtvSkLzs', 6);

-- Statue of Liberty availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(19, 'Monday', '09:00:00', '18:30:00'),
(19, 'Tuesday', '09:00:00', '18:30:00'),
(19, 'Wednesday', '09:00:00', '18:30:00'),
(19, 'Thursday', '09:00:00', '18:30:00'),
(19, 'Friday', '09:00:00', '18:30:00'),
(19, 'Saturday', '09:00:00', '18:30:00'),
(19, 'Sunday', '09:00:00', '18:30:00');

-- Central Park availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(20, 'Monday', '06:00:00', '01:00:00'),
(20, 'Tuesday', '06:00:00', '01:00:00'),
(20, 'Wednesday', '06:00:00', '01:00:00'),
(20, 'Thursday', '06:00:00', '01:00:00'),
(20, 'Friday', '06:00:00', '01:00:00'),
(20, 'Saturday', '06:00:00', '01:00:00'),
(20, 'Sunday', '06:00:00', '01:00:00');

-- Times Square availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(21, 'Monday', '00:00:00', '23:59:59'),
(21, 'Tuesday', '00:00:00', '23:59:59'),
(21, 'Wednesday', '00:00:00', '23:59:59'),
(21, 'Thursday', '00:00:00', '23:59:59'),
(21, 'Friday', '00:00:00', '23:59:59'),
(21, 'Saturday', '00:00:00', '23:59:59'),
(21, 'Sunday', '00:00:00', '23:59:59');

-- Empire State Building availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(22, 'Monday', '09:00:00', '01:00:00'),
(22, 'Tuesday', '09:00:00', '01:00:00'),
(22, 'Wednesday', '09:00:00', '01:00:00'),
(22, 'Thursday', '09:00:00', '01:00:00'),
(22, 'Friday', '09:00:00', '01:00:00'),
(22, 'Saturday', '09:00:00', '01:00:00'),
(22, 'Sunday', '09:00:00', '01:00:00');

-- Brooklyn Bridge availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(23, 'Monday', '00:00:00', '23:59:59'),
(23, 'Tuesday', '00:00:00', '23:59:59'),
(23, 'Wednesday', '00:00:00', '23:59:59'),
(23, 'Thursday', '00:00:00', '23:59:59'),
(23, 'Friday', '00:00:00', '23:59:59'),
(23, 'Saturday', '00:00:00', '23:59:59'),
(23, 'Sunday', '00:00:00', '23:59:59');

-- Metropolitan Museum of Art availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(24, 'Monday', '10:00:00', '17:00:00'),
(24, 'Tuesday', '10:00:00', '17:00:00'),
(24, 'Wednesday', NULL, NULL),  -- Closed
(24, 'Thursday', '10:00:00', '17:00:00'),
(24, 'Friday', '10:00:00', '21:00:00'),
(24, 'Saturday', '10:00:00', '21:00:00'),
(24, 'Sunday', '10:00:00', '17:00:00');

-- New York City Starting Points
INSERT INTO StartingPoint (place_name, city, place_type, place_id)
VALUES
    ('The Plaza Hotel', 'New York City', 'Hotel', 'ChIJYaVdffBYwokRnTOoCzCq9mE'),
    ('The Ritz-Carlton New York', 'New York City', 'Hotel', 'ChIJ4yNdwPBYwokRqc1lCC4n89w'),
    ('Park Hyatt New York', 'New York City', 'Hotel', 'ChIJpQr2a_dYwokRoYDzhaXxroc'),
    ('John F. Kennedy International Airport', 'New York City', 'Airport', 'ChIJR0lA1VBmwokR8BGfSBOyT-w'),
    ('LaGuardia Airport', 'New York City', 'Airport', 'ChIJtU1Cg4lfwokRs2aWDmbEL3c'),
    ('Penn Station', 'New York City', 'Station', 'ChIJ3bk6Qh1ZwokRqmwQsqJPmJQ'),
    ('Grand Central Terminal', 'New York City', 'Station', 'ChIJ-b2RmVlZwokRpb1pwEQjss0');


--Sydney Landmarks
INSERT INTO landmarks (name, city, description, venue_type, approval_status, place_id, image_url, order_num)
VALUES
('Sydney Opera House', 'Sydney', 'Iconic performing arts center.', 'Theater', TRUE, 'ChIJ3S-JXmauEmsRUcIaWtf4MzE', 'https://ychef.files.bbci.co.uk/1280x720/p0gp95cq.jpg', 1),
('Sydney Harbour Bridge', 'Sydney', 'Famous bridge with climbing tours.', 'Bridge', TRUE, 'Ei1TeWRuZXkgSGJyIEJyZywgVGhlIFJvY2tzIE5TVyAyMDAwLCBBdXN0cmFsaWEiLiosChQKEgkFrsgVi64SaxGftdSd9hwMLxIUChIJs49dtkKuEmsRYM0yFmh9AQU', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Sydney_harbour_bridge_dusk.jpg/1200px-Sydney_harbour_bridge_dusk.jpg', 2),
('Bondi Beach', 'Sydney', 'Popular beach known for surfing.', 'Beach', TRUE, 'ChIJWTi8xgGyEmsRgK0yFmh9AQU' ,'https://blog.forbestravelguide.com/wp-content/uploads/2013/12/FTG-AussieBeach-CreditiStock_KimPinTan.jpg', 3),
('Taronga Zoo', 'Sydney', 'Large zoo with diverse wildlife.', 'Zoo', TRUE, 'ChIJq6qqWiSsEmsRJuIpepyEua4' , 'https://dbijapkm3o6fj.cloudfront.net/resources/1282,1004,1,6,4,0,600,450/-4601-/20150311175809/taronga-zoo.jpeg', 4),
('Royal Botanic Garden', 'Sydney', 'Beautiful botanical gardens by the harbor.', 'Garden', TRUE, 'ChIJWaTdYGuuEmsRoOfx-Wh9AQ8', 'https://media.istockphoto.com/id/510641020/photo/botanic-gardens-alley.jpg?s=612x612&w=0&k=20&c=Ph43mpMMUVxV7w90YlAahbGX9Z5uOVAoXCuldewvlHk=', 5),
('The Rocks', 'Sydney', 'Historic area with markets, museums, and restaurants.', 'Historic District', TRUE, 'ChIJs49dtkKuEmsRYM0yFmh9AQU' , 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/02/50/02/sydney-s-first-street.jpg?w=1200&h=-1&s=1', 6);

-- Sydney Opera House availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(25, 'Monday', '09:00:00', '17:00:00'),
(25, 'Tuesday', '09:00:00', '17:00:00'),
(25, 'Wednesday', '09:00:00', '17:00:00'),
(25, 'Thursday', '09:00:00', '17:00:00'),
(25, 'Friday', '09:00:00', '17:00:00'),
(25, 'Saturday', '09:00:00', '17:00:00'),
(25, 'Sunday', '10:00:00', '18:00:00');

-- Sydney Harbour Bridge availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(26, 'Monday', '00:00:00', '23:59:59'),
(26, 'Tuesday', '00:00:00', '23:59:59'),
(26, 'Wednesday', '00:00:00', '23:59:59'),
(26, 'Thursday', '00:00:00', '23:59:59'),
(26, 'Friday', '00:00:00', '23:59:59'),
(26, 'Saturday', '00:00:00', '23:59:59'),
(26, 'Sunday', '00:00:00', '23:59:59');

-- Bondi Beach availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(27, 'Monday', '06:00:00', '21:30:00'),
(27, 'Tuesday', '06:00:00', '21:30:00'),
(27, 'Wednesday', '06:00:00', '21:30:00'),
(27, 'Thursday', '06:00:00', '21:30:00'),
(27, 'Friday', '06:00:00', '21:30:00'),
(27, 'Saturday', '06:00:00', '21:30:00'),
(27, 'Sunday', '06:00:00', '21:30:00');

-- Taronga Zoo availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(28, 'Monday', '09:30:00', '16:30:00'),
(28, 'Tuesday', '09:30:00', '16:30:00'),
(28, 'Wednesday', '09:30:00', '16:30:00'),
(28, 'Thursday', '09:30:00', '16:30:00'),
(28, 'Friday', '09:30:00', '16:30:00'),
(28, 'Saturday', '09:30:00', '16:30:00'),
(28, 'Sunday', '09:30:00', '16:30:00');

-- Royal Botanic Garden availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(29, 'Monday', '07:00:00', '17:30:00'),
(29, 'Tuesday', '07:00:00', '17:30:00'),
(29, 'Wednesday', '07:00:00', '17:30:00'),
(29, 'Thursday', '07:00:00', '17:30:00'),
(29, 'Friday', '07:00:00', '17:30:00'),
(29, 'Saturday', '07:00:00', '17:30:00'),
(29, 'Sunday', '07:00:00', '17:30:00');

-- The Rocks availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(30, 'Monday', NULL, NULL),
(30, 'Tuesday', NULL, NULL),
(30, 'Wednesday', NULL, NULL),
(30, 'Thursday', NULL, NULL),
(30, 'Friday', NULL, NULL),
(30, 'Saturday', '10:00:00', '17:00:00'),
(30, 'Sunday', '10:00:00', '17:00:00');

-- Sydney Starting Points
INSERT INTO StartingPoint (place_name, city, place_type, place_id)
VALUES
    ('W Sydney', 'Sydney', 'Hotel', 'ChIJX1JXz_KvEmsRbZDJ2tHZY-0'),
    ('The Langham, Sydney', 'Sydney', 'Hotel', 'ChIJk20mbUSuEmsR-cpy8veWnAg'),
    ('Hyatt Regency Sydney', 'Sydney', 'Hotel', 'ChIJB_E7ITmuEmsRvpaogmLagvc'),
    ('Kingsford Smith International Airport', 'Sydney', 'Airport', 'ChIJ24MzG_GwEmsRd2VLWl01368'),
    ('Bankstown Airport', 'Sydney', 'Airport', 'ChIJeUF5Hnu-EmsRoHDv-Wh9AQ8'),
    ('Central Railway Station', 'Sydney', 'Station', 'ChIJ1URX0SOuEmsRp4tE5Y4ewCE'),
    ('Redfern Railway Station', 'Sydney', 'Station', 'ChIJRQDVBdqxEmsR5i8pv0ykUDI');


-- Itineraries
INSERT INTO Itineraries (user_id, name, starting_point, date, shared_status) VALUES
(1, 'Paris Highlights', 'Hotel Le Meurice', '2024-08-15', TRUE),
(1, 'Rome Adventure', 'Rome Central Station', '2024-09-01', FALSE),
(2, 'Kyoto Cultural Tour', 'Kyoto Station', '2024-10-10', TRUE);

-- ItineraryLandmarks
INSERT INTO ItineraryLandmarks (itinerary_id, landmark_id, order_num) VALUES
-- Paris Highlights
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),

-- Rome Adventure
(2, 7, 1),
(2, 8, 2),
(2, 9, 3),
(2, 10, 4),
(2, 11, 5),
(2, 12, 6),

-- Kyoto Cultural Tour
(3, 13, 1),
(3, 14, 2),
(3, 15, 3),
(3, 16, 4),
(3, 17, 5),
(3, 18, 6);

INSERT INTO Popularity (landmark_id, user_id, rating) VALUES
(1, 1, 'thumbs_up'),
(2, 2, 'thumbs_down'),
(3, 1, 'thumbs_up'),
(4, 2, 'thumbs_up'),
(5, 1, 'thumbs_down'),
(6, 2, 'thumbs_up');

INSERT INTO Reviews (landmark_id, user_id, first_name, last_name, title, rating, description, created_at, approval_status) VALUES
(1, 1, 'John', 'Doe', 'Great place to visit!', 5, 'The landmark was amazing and full of history.', '2024-08-01 12:34:56', TRUE),
(2, 2, 'Jane', 'Smith', 'Beautiful scenery!', 4, 'I loved the view and the ambiance.', '2024-08-02 14:45:23', TRUE),
(3, 1, 'Alice', 'Johnson', 'A must-see!', 5, 'This landmark is a must-see for anyone visiting.', '2024-08-03 09:12:34', TRUE),
(4, 2, 'Bob', 'Brown', 'Good experience', 4, 'Had a good time visiting this place.', '2024-08-04 16:45:00', TRUE),
(5, 1, 'Charlie', 'Davis', 'Interesting history', 4, 'Loved learning about the history behind this place.', '2024-08-05 11:24:45', TRUE),
(6, 2, 'Dana', 'Miller', 'Amazing architecture', 5, 'The architecture of the landmark is stunning.', '2024-08-06 15:37:21', TRUE),
(7, 1, 'Eve', 'Wilson', 'Not bad', 3, 'It was an okay visit, not very exciting.', '2024-08-07 10:11:11', TRUE),
(8, 2, 'Frank', 'Moore', 'Overrated', 2, 'The place was a bit overrated in my opinion.', '2024-08-08 13:56:33', TRUE),
(9, 1, 'Grace', 'Taylor', 'Enjoyed it', 4, 'I enjoyed my time here, would recommend.', '2024-08-09 17:23:45', TRUE),
(10, 2, 'Henry', 'Anderson', 'Too crowded', 3, 'The place was too crowded, hard to enjoy.', '2024-08-10 12:00:00', TRUE),
(11, 1, 'Ivy', 'Thomas', 'Loved it!', 5, 'I had an amazing time, everything was perfect.', '2024-08-11 11:45:12', TRUE),
(12, 2, 'Jack', 'Harris', 'Nice place', 4, 'It was a nice place to visit, had fun.', '2024-08-12 09:30:00', TRUE),
(13, 1, 'Kathy', 'Clark', 'Could be better', 3, 'It was okay but could be better.', '2024-08-13 14:50:23', TRUE),
(14, 2, 'Leo', 'Lewis', 'Amazing', 5, 'Absolutely amazing, would go again.', '2024-08-14 13:12:34', TRUE),
(15, 1, 'Mia', 'Walker', 'Pretty good', 4, 'Had a pretty good experience.', '2024-08-15 16:45:00', TRUE),
(16, 2, 'Nick', 'Hall', 'Not worth it', 2, 'Not worth the time or money.', '2024-08-16 11:24:45', TRUE),
(17, 1, 'Olivia', 'Allen', 'Great history', 5, 'The history of this place is fascinating.', '2024-08-17 15:37:21', TRUE),
(18, 2, 'Paul', 'Young', 'Boring', 1, 'It was boring, nothing much to see.', '2024-08-18 10:11:11', TRUE),
(19, 1, 'Quinn', 'King', 'Worth visiting', 4, 'Definitely worth a visit.', '2024-08-19 13:56:33', TRUE),
(20, 2, 'Rose', 'Scott', 'Loved the place', 5, 'Loved the place, will come back.', '2024-08-20 17:23:45', TRUE),
(21, 1, 'Sam', 'Green', 'Too expensive', 2, 'Too expensive for what it offers.', '2024-08-21 12:00:00', TRUE),
(22, 2, 'Tina', 'Adams', 'Good value', 4, 'Good value for money.', '2024-08-22 11:45:12', TRUE),
(23, 1, 'Uma', 'Nelson', 'Not as expected', 3, 'Not as good as I expected.', '2024-08-23 09:30:00', TRUE),
(24, 2, 'Victor', 'Carter', 'Highly recommend', 5, 'Highly recommend visiting this place.', '2024-08-24 14:50:23', TRUE),
(25, 1, 'Wendy', 'Mitchell', 'Nice but crowded', 4, 'Nice place but too crowded.', '2024-08-25 13:12:34', TRUE),
(26, 2, 'Xander', 'Perez', 'Overpriced', 2, 'Overpriced for what it offers.', '2024-08-26 16:45:00', TRUE),
(27, 1, 'Yara', 'Roberts', 'Loved the tour', 5, 'Loved the guided tour, very informative.', '2024-08-27 11:24:45', TRUE),
(28, 2, 'Zane', 'Stewart', 'Breathtaking views', 5, 'The views from the top are breathtaking.', '2024-08-28 15:37:21', TRUE),
(29, 1, 'Amy', 'Cruz', 'Good for families', 4, 'A good place to visit with family.', '2024-08-29 10:11:11', TRUE),
(30, 2, 'Brian', 'Ramirez', 'Nice ambiance', 4, 'Loved the ambiance, very relaxing.', '2024-08-30 13:56:33', TRUE),
(1, 1, 'Cindy', 'Torres', 'Well maintained', 5, 'The landmark is well maintained.', '2024-08-31 17:23:45', TRUE),
(2, 2, 'David', 'Flores', 'Just okay', 3, 'The visit was just okay, nothing special.', '2024-09-01 12:00:00', TRUE),
(3, 1, 'Elena', 'Sanders', 'Great spot for photos', 5, 'A great spot for photography.', '2024-09-02 11:45:12', TRUE),
(4, 2, 'Frank', 'Patel', 'Not worth the hype', 2, 'Not worth the hype, very average.', '2024-09-03 09:30:00', TRUE),
(5, 1, 'Gloria', 'Ross', 'Historical significance', 5, 'A landmark with great historical significance.', '2024-09-04 14:50:23', TRUE),
(6, 2, 'Harry', 'Ward', 'Disappointing', 1, 'The visit was disappointing.', '2024-09-05 13:12:34', TRUE),
(7, 1, 'Isabella', 'Hughes', 'Very interesting', 5, 'A very interesting place to visit.', '2024-09-06 16:45:00', TRUE),
(8, 2, 'Jake', 'Morgan', 'Needs better management', 3, 'The place could be managed better.', '2024-09-07 11:24:45', TRUE),
(9, 1, 'Kelly', 'Rogers', 'Not clean', 2, 'The place was not clean and well-maintained.', '2024-09-08 15:37:21', TRUE),
(10, 2, 'Leo', 'Peterson', 'Good but not great', 3, 'It was good, but I’ve seen better.', '2024-09-09 10:11:11', TRUE),
(11, 1, 'Maya', 'Collins', 'Must-visit landmark', 5, 'A must-visit landmark for history buffs.', '2024-09-10 13:56:33', TRUE),
(12, 2, 'Nina', 'Foster', 'Lovely views', 4, 'The views from here are lovely.', '2024-09-11 17:23:45', TRUE),
(13, 1, 'Oscar', 'Gomez', 'Not what I expected', 2, 'Did not meet my expectations.', '2024-09-12 12:00:00', TRUE),
(14, 2, 'Pia', 'Griffin', 'A unique experience', 5, 'Visiting this place was a unique experience.', '2024-09-13 11:45:12', TRUE),
(15, 1, 'Quincy', 'Harper', 'Very enjoyable', 4, 'I found the visit very enjoyable.', '2024-09-14 09:30:00', TRUE),
(16, 2, 'Rita', 'James', 'Mediocre', 3, 'The visit was mediocre and could be improved.', '2024-09-15 14:50:23', FALSE),
(17, 1, 'Steve', 'Kelly', 'Below expectations', 2, 'The place was below my expectations.', '2024-09-16 13:12:34', FALSE),
(18, 2, 'Tara', 'Lee', 'Very poor', 1, 'A very poor experience overall.', '2024-09-17 16:45:00', FALSE),
(19, 1, 'Ursula', 'Mitchell', 'Not recommended', 2, 'I would not recommend this place.', '2024-09-18 11:24:45', FALSE),
(20, 2, 'Victor', 'Nelson', 'Not enjoyable', 1, 'I did not enjoy the visit at all.', '2024-09-19 15:37:21', FALSE);

COMMIT TRANSACTION;


--ROLLBACK;



