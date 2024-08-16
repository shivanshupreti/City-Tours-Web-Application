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
('Arc de Triomphe', 'Paris', 'Prestigious avenue ending with the triumLandphal arch.', 'Avenue', TRUE, 'https://www.lacomediedevanneau.com/wp-content/uploads/2020/06/arc-de-triomphe-paris.jpg', 'ChIJjx37cOxv5kcRPWQuEW5ntdk', 4),
('Sacre Coeur Basilica', 'Paris', 'Stunning basilica on Montmartre hill.', 'Church', TRUE, 'https://static.wixstatic.com/media/68b72b_2a44b33c64d141e79bf5990d7ab10f64~mv2.jpg/v1/fill/w_980,h_653,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/68b72b_2a44b33c64d141e79bf5990d7ab10f64~mv2.jpg', 'ChIJg8vfy1xu5kcRA1tGDNGsgHA', 5),
('Palace of Versailles', 'Paris', 'Luxurious former royal residence.', 'Palace', TRUE, 'https://www.travelandleisure.com/thmb/sR2kS_tl_yz4bxFkxDWyaVv6lmw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/versailles-palace-courtyard-SECRET1216-911d9538288141a686474b1ce08a2e1a.jpg', 'ChIJdUyx15R95kcRj85ZX8H8OAU', 6),
('Pantheon', 'Paris', 'Historic mausoleum and burial place of notable figures.', 'Monument', TRUE, 'https://tombtravel.com/wp-content/uploads/2022/12/Depositphotos_10895861_XL.jpg', 'ChIJc8mX0udx5kcRWKcjTwDr5QA', 7),
('Luxembourg Gardens', 'Paris', 'Beautiful public park with a picturesque landscape and fountain.', 'Park', TRUE, 'https://images8.alphacoders.com/651/651095.jpg', 'ChIJe2jeNttx5kcRi_mJsGHdkQc', 8),
('Musee d’Orsay', 'Paris', 'Renowned museum housed in a former railway station, featuring Impressionist art.', 'Museum', TRUE, 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Mus%C3%A9e_d%27Orsay%2C_North-West_view%2C_Paris_7e_140402.jpg', 'ChIJG5Qwtitu5kcR2CNEsYy9cdA', 9),
('Palais Garnier', 'Paris', 'Opulent opera house known for its grandeur and architecture.', 'Theater', TRUE, 'https://res.cloudinary.com/opera-national-de-paris/image/upload/c_crop,h_3333,w_5000,x_0,y_0/w_870/f_auto/f_auto/v1/user_photos/najocddrarivc3uljafm?_a=E', 'ChIJOYNm1DBu5kcRZwdtKBzyq6k', 10),
('Pompidou Center', 'Paris', 'Modern art museum and cultural center with distinctive architecture.', 'Museum', TRUE, 'https://images.surfacemag.com/app/uploads/2021/01/27105718/centre-pompidou-renovation-paris-01-2000x854.jpg', 'ChIJoyC4CRxu5kcRRTPcWX5srLc', 11),
('Pont Neuf', 'Paris', 'Oldest standing bridge across the Seine River, offering historic charm and views.', 'Bridge', TRUE, 'https://upload.wikimedia.org/wikipedia/commons/5/58/Pont_Neuf_-_Paris_-_France.jpg', 'ChIJiwXbjSBu5kcRG_Vjyw1gadQ', 12);

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

-- Pantheon availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(7, 'Monday', '10:00:00', '18:30:00'),
(7, 'Tuesday', '10:00:00', '18:30:00'),
(7, 'Wednesday', '10:00:00', '18:30:00'),
(7, 'Thursday', '10:00:00', '18:30:00'),
(7, 'Friday', '10:00:00', '18:30:00'),
(7, 'Saturday', '10:00:00', '18:30:00'),
(7, 'Sunday', '10:00:00', '18:30:00');

-- Luxembourg Gardens availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(8, 'Monday', '08:15:00', '22:30:00'),
(8, 'Tuesday', '08:15:00', '22:30:00'),
(8, 'Wednesday', '08:15:00', '22:30:00'),
(8, 'Thursday', '08:15:00', '22:30:00'),
(8, 'Friday', '08:15:00', '22:30:00'),
(8, 'Saturday', '08:15:00', '22:30:00'),
(8, 'Sunday', '08:15:00', '22:30:00');

-- Musée d’Orsay availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(9, 'Monday', NULL, NULL),  -- Closed
(9, 'Tuesday', '09:30:00', '18:00:00'),
(9, 'Wednesday', '09:30:00', '18:00:00'),
(9, 'Thursday', '09:30:00', '18:00:00'),
(9, 'Friday', '09:30:00', '18:00:00'),
(9, 'Saturday', '09:30:00', '18:00:00'),
(9, 'Sunday', '09:30:00', '18:00:00');

-- Palais Garnier availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(10, 'Monday', '10:00:00', '17:00:00'),
(10, 'Tuesday', '10:00:00', '17:00:00'),
(10, 'Wednesday', '10:00:00', '17:00:00'),
(10, 'Thursday', '10:00:00', '17:00:00'),
(10, 'Friday', '10:00:00', '17:00:00'),
(10, 'Saturday', '10:00:00', '17:00:00'),
(10, 'Sunday', '10:00:00', '17:00:00');

-- Pompidou Center availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(11, 'Monday', '11:00:00', '21:00:00'),
(11, 'Tuesday', NULL, NULL),  -- Closed
(11, 'Wednesday', '11:00:00', '21:00:00'),
(11, 'Thursday', '11:00:00', '23:00:00'),
(11, 'Friday', '11:00:00', '21:00:00'),
(11, 'Saturday', '11:00:00', '21:00:00'),
(11, 'Sunday', '11:00:00', '21:00:00');

-- Pont Neuf availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(12, 'Monday', '00:00:00', '23:59:59'),
(12, 'Tuesday', '00:00:00', '23:59:59'),
(12, 'Wednesday', '00:00:00', '23:59:59'),
(12, 'Thursday', '00:00:00', '23:59:59'),
(12, 'Friday', '00:00:00', '23:59:59'),
(12, 'Saturday', '00:00:00', '23:59:59'),
(12, 'Sunday', '00:00:00', '23:59:59');

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
('Pantheon', 'Rome', 'Well-preserved ancient Roman temple.', 'Temple', TRUE, 'https://theromanguy.com/wp-content/uploads/pantheon-feature-real.jpeg', 'ChIJqUCGZ09gLxMRLM42IPpl0co', 3),
('Trevi Fountain', 'Rome', 'Famous Baroque fountain.', 'Fountain', TRUE, 'https://www.travelandleisure.com/thmb/CKxA_iBAtx1zYw_7EevV4cuxgH0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/trevi-fountain-rome-italy-TREVI0217-4b6f7385c7f0436ba3d5fa2c061a1791.jpg', 'ChIJ1UCDJ1NgLxMRtrsCzOHxdvY', 4),
('Roman Forum', 'Rome', 'Ancient center of Roman public life.', 'Historical Site', TRUE, 'https://rome.us/wp-content/uploads/Roman-Forum-in-Rome-Italy.jpg', 'ChIJ782pg7NhLxMR5n3swAdAkfo', 5),
('Piazza Navona', 'Rome', 'Elegant square with beautiful fountains and architecture.', 'Square', TRUE, 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/27/88/12.jpg', 'ChIJPRydwYNgLxMRSjOCLlYkV6M', 6),
('Spanish Steps', 'Rome', 'Famous monumental stairway of 135 steps leading from the Piazza di Spagna to the Trinità dei Monti church.', 'Staircase', TRUE, 'https://www.walksofitaly.com/blog/wp-content/uploads/2023/08/shai-pal-3rbqwaYnf4w-unsplashresize.jpg', 'ChIJda54FlRgLxMRD2muipfUwH8', 7),
('Vatican Museums', 'Rome', 'Extensive collection of art and historical artifacts, including the Sistine Chapel.', 'Museum', TRUE, 'https://media.cntraveler.com/photos/5a99866499c77f4533dfc047/16:9/w_1920,c_limit/Braccio-Nuovo-Sculpture-Gallery-J9FA8C.jpg', 'ChIJKcGbg2NgLxMRthZkUqDs4M8', 8),
('Castel Sant''Angelo', 'Rome', 'Historic fortress and former mausoleum, offering panoramic views of the city.', 'Fortress', TRUE, 'https://i.redd.it/hzmb694p7w981.jpg', 'ChIJ0aTnEYeKJRMRiUF95xwRbDY', 9),
('Basilica di Santa Maria Maggiore', 'Rome', 'One of the major basilicas of Rome, renowned for its beautiful mosaics and architecture.', 'Basilica', TRUE, 'https://lp-cms-production.s3.amazonaws.com/public/2023-07/shutterstockRF796992370.jpg', 'ChIJ1zB926RhLxMRejWMj_tUs_c', 10),
('Basilica di San Clemente', 'Rome', 'Historic church known for its layered history and impressive archaeological excavations.', 'Basilica', TRUE, 'https://www.basilicasanclemente.com/wp-content/uploads/2022/09/Basilica-Superiore-Schola-Cantorum-2.jpg', 'ChIJ6V1-TbhhLxMRUbEhbeY44Zc', 11),
('Bocca della Verita', 'Rome', 'Famous ancient sculpture known as the "Mouth of Truth", located in the portico of the Church of Santa Maria in Cosmedin.', 'Sculpture', TRUE, 'https://www.turismoroma.it/sites/default/files/Bocca%20della%20Verit%C3%A0%201920x1080%20Pixabay%20ut.%20pcdazero.jpg', 'ChIJm1_ZezVgLxMR57Hw653cZoI', 12);

-- Colosseum availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(13, 'Monday', '08:30:00', '19:15:00'),
(13, 'Tuesday', '08:30:00', '19:15:00'),
(13, 'Wednesday', '08:30:00', '19:15:00'),
(13, 'Thursday', '08:30:00', '19:15:00'),
(13, 'Friday', '08:30:00', '19:15:00'),
(13, 'Saturday', '08:30:00', '19:15:00'),
(13, 'Sunday', '08:30:00', '19:15:00');

-- St. Peter's Basilica availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(14, 'Monday', '07:00:00', '22:00:00'),
(14, 'Tuesday', '07:00:00', '22:00:00'),
(14, 'Wednesday', '07:00:00', '22:00:00'),
(14, 'Thursday', '07:00:00', '22:00:00'),
(14, 'Friday', '07:00:00', '22:00:00'),
(14, 'Saturday', '07:00:00', '23:00:00'),
(14, 'Sunday', '07:00:00', '22:00:00');

-- Pantheon availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(15, 'Monday', '09:00:00', '18:30:00'),
(15, 'Tuesday', '09:00:00', '18:30:00'),
(15, 'Wednesday', '09:00:00', '18:30:00'),
(15, 'Thursday', '09:00:00', '18:30:00'),
(15, 'Friday', '09:00:00', '18:30:00'),
(15, 'Saturday', '09:00:00', '18:30:00'),
(15, 'Sunday', '09:00:00', '18:30:00');

-- Trevi Fountain availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(16, 'Monday', '00:00:00', '23:59:59'),
(16, 'Tuesday', '00:00:00', '23:59:59'),
(16, 'Wednesday', '00:00:00', '23:59:59'),
(16, 'Thursday', '00:00:00', '23:59:59'),
(16, 'Friday', '00:00:00', '23:59:59'),
(16, 'Saturday', '00:00:00', '23:59:59'),
(16, 'Sunday', '00:00:00', '23:59:59');

-- Roman Forum availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(17, 'Monday', '09:00:00', '19:15:00'),
(17, 'Tuesday', '09:00:00', '19:15:00'),
(17, 'Wednesday', '09:00:00', '19:15:00'),
(17, 'Thursday', '09:00:00', '19:15:00'),
(17, 'Friday', '09:00:00', '19:15:00'),
(17, 'Saturday', '09:00:00', '17:30:00'),
(17, 'Sunday', '09:00:00', '19:15:00');

-- Piazza Navona availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(18, 'Monday', '00:00:00', '23:59:59'),
(18, 'Tuesday', '00:00:00', '23:59:59'),
(18, 'Wednesday', '00:00:00', '23:59:59'),
(18, 'Thursday', '00:00:00', '23:59:59'),
(18, 'Friday', '00:00:00', '23:59:59'),
(18, 'Saturday', '00:00:00', '23:59:59'),
(18, 'Sunday', '00:00:00', '23:59:59');

-- Spanish Steps availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(19, 'Monday', '08:00:00', '17:00:00'),
(19, 'Tuesday', '08:00:00', '17:00:00'),
(19, 'Wednesday', '08:00:00', '17:00:00'),
(19, 'Thursday', '08:00:00', '17:00:00'),
(19, 'Friday', '08:00:00', '17:00:00'),
(19, 'Saturday', '08:00:00', '17:00:00'),
(19, 'Sunday', '08:00:00', '17:00:00');

-- Vatican Museums availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(20, 'Monday', '08:00:00', '19:00:00'),
(20, 'Tuesday', '08:00:00', '19:00:00'),
(20, 'Wednesday', '08:00:00', '19:00:00'),
(20, 'Thursday', '08:00:00', '19:00:00'),
(20, 'Friday', '08:00:00', '20:00:00'),
(20, 'Saturday', '08:00:00', '20:00:00'),
(20, 'Sunday', NULL, NULL);  -- Closed

-- Castel Sant'Angelo availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(21, 'Monday', NULL, NULL),  -- Closed
(21, 'Tuesday', '09:00:00', '19:30:00'),
(21, 'Wednesday', '09:00:00', '19:30:00'),
(21, 'Thursday', '09:00:00', '19:30:00'),
(21, 'Friday', '09:00:00', '19:30:00'),
(21, 'Saturday', '09:00:00', '19:30:00'),
(21, 'Sunday', '09:00:00', '19:30:00');

-- Basilica di Santa Maria Maggiore availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(22, 'Monday', '07:00:00', '18:30:00'),
(22, 'Tuesday', '07:00:00', '18:30:00'),
(22, 'Wednesday', '07:00:00', '18:30:00'),
(22, 'Thursday', '07:00:00', '18:30:00'),
(22, 'Friday', '07:00:00', '18:30:00'),
(22, 'Saturday', '07:00:00', '18:30:00'),
(22, 'Sunday', '07:00:00', '18:30:00');

-- Basilica di San Clemente availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(23, 'Monday', '09:00:00', '17:30:00'),
(23, 'Tuesday', '09:00:00', '17:30:00'),
(23, 'Wednesday', '09:00:00', '17:30:00'),
(23, 'Thursday', '09:00:00', '17:30:00'),
(23, 'Friday', '09:00:00', '17:30:00'),
(23, 'Saturday', '09:00:00', '17:30:00'),
(23, 'Sunday', '12:00:00', '17:30:00');

-- Bocca della Verità availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(24, 'Monday', '09:30:00', '17:45:00'),
(24, 'Tuesday', '09:30:00', '17:45:00'),
(24, 'Wednesday', '09:30:00', '17:45:00'),
(24, 'Thursday', '09:30:00', '17:45:00'),
(24, 'Friday', '09:30:00', '17:45:00'),
(24, 'Saturday', '09:30:00', '17:45:00'),
(24, 'Sunday', '09:30:00', '17:45:00');

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
('Kinkaku-ji', 'Kyoto', 'Stunning golden temple.', 'Temple', TRUE, 'https://gaijinpot.scdn3.secure.raxcdn.com/app/uploads/sites/6/2016/05/kinkakuji-kyoto-golden-pavilion-1024x576.jpg', 'ChIJvUbrwCCoAWARX2QiHCsn5A4', 2),
('Kiyomizu-dera', 'Kyoto', 'Historic temple with a large wooden stage.', 'Temple', TRUE, 'https://media.patheos.com/~/media/patheos-images/images/sacred-spaces/90-kiyomizu-dera-05_credit-shutterstock.jpg?as=1&w=800', 'ChIJB_vchdMIAWARujTEUIZlr2I', 3),
('Arashiyama Bamboo Grove', 'Kyoto', 'Serene bamboo forest.', 'Forest', TRUE, 'https://lp-cms-production.imgix.net/2019-06/0bbf98a5a2d3a65c4e17feb1baa630ff-arashiyama-bamboo-grove.jpg', 'ChIJrYtcv-urAWAR3XzWvXv8n_s', 4),
('Nijo Castle', 'Kyoto', 'Historic castle with beautiful gardens.', 'Castle', TRUE, 'https://tabijikan.com/kys/lang/en/wp-content/uploads/2016/02/20150309-304-20-100.jpg', 'ChIJC5srCtQHAWARLy9qkFmHaxA', 5),
('Gion District', 'Kyoto', 'Traditional geisha district with preserved architecture.', 'District', TRUE, 'https://media.timeout.com/images/106106593/image.jpg', 'ChIJ39JafQAJAWART9ih3YcxvVQ', 6),
('Heian Shrine', 'Kyoto', 'Shinto shrine known for its beautiful gardens and traditional architecture.', 'Shrine', TRUE, 'https://gaijinpot.scdn3.secure.raxcdn.com/app/uploads/sites/6/2018/07/Heian-Shrine-Dragon-1024x684.jpg', 'ChIJjch8GOUIAWART0WX2JLZvnU', 7),
('Ryoan-ji', 'Kyoto', 'Zen temple famous for its rock garden.', 'Temple', TRUE, 'https://smarthistory.org/wp-content/uploads/2022/06/27765010624_0ea76299a7_k.jpg', 'ChIJp7ocMCqoAWARQoXXRj4Xq-E', 8),
('Toji Temple', 'Kyoto', 'Historic temple renowned for its five-story pagoda.', 'Temple', TRUE, 'https://welcomekansai.com/wp-content/uploads/2017/12/AQ9PBVW6L6.jpg', 'ChIJTar7hQQGAWAREHkXsNkt7tM', 9),
('Philosopher''s Path', 'Kyoto', 'Scenic walkway along a cherry-tree-lined canal.', 'Path', TRUE, 'https://insidekyoto.smugmug.com/Walking-the-Path-of-Philosophy/i-t4Tc6Xd/0/L/walking-the-path-of-philosophy-25-L.jpg', 'ChIJV_CUrggJAWAR9IBSpzHzepE', 10),
('Sanjusangendo Temple', 'Kyoto', 'Famous for its 1001 statues of Kannon, the Buddhist goddess of mercy.', 'Temple', TRUE, 'https://mai-ko.com/wp-content/uploads/2017/10/rengeoin-sanjusangendo-kyoto-experience.jpg', 'ChIJs4Cbj8oIAWARiBZl2-sBK6o', 11),
('Tofuku-ji Temple', 'Kyoto', 'Known for its exquisite Zen gardens and seasonal foliage.', 'Temple', TRUE, 'https://res.cloudinary.com/jnto/image/upload/w_750,h_503,fl_lossy,f_auto/v1646651272/kyoto/M_00172_002', 'ChIJrZ8NkJJIAWARwRVgbKoRx2I', 12);

-- Fushimi Inari Shrine availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(25, 'Monday', '00:00:00', '23:59:59'),
(25, 'Tuesday', '00:00:00', '23:59:59'),
(25, 'Wednesday', '00:00:00', '23:59:59'),
(25, 'Thursday', '00:00:00', '23:59:59'),
(25, 'Friday', '00:00:00', '23:59:59'),
(25, 'Saturday', '00:00:00', '23:59:59'),
(25, 'Sunday', '00:00:00', '23:59:59');

-- Kinkaku-ji availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(26, 'Monday', '09:00:00', '17:00:00'),
(26, 'Tuesday', '09:00:00', '17:00:00'),
(26, 'Wednesday', '09:00:00', '17:00:00'),
(26, 'Thursday', '09:00:00', '17:00:00'),
(26, 'Friday', '09:00:00', '17:00:00'),
(26, 'Saturday', '09:00:00', '17:00:00'),
(26, 'Sunday', '09:00:00', '17:00:00');

-- Kiyomizu-dera availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(27, 'Monday', '06:00:00', '18:00:00'),
(27, 'Tuesday', '06:00:00', '18:00:00'),
(27, 'Wednesday', '06:00:00', '18:00:00'),
(27, 'Thursday', '06:00:00', '18:00:00'),
(27, 'Friday', '06:00:00', '18:00:00'),
(27, 'Saturday', '06:00:00', '18:00:00'),
(27, 'Sunday', '06:00:00', '18:00:00');

-- Arashiyama Bamboo Grove availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(28, 'Monday', '00:00:00', '23:59:59'),
(28, 'Tuesday', '00:00:00', '23:59:59'),
(28, 'Wednesday', '00:00:00', '23:59:59'),
(28, 'Thursday', '00:00:00', '23:59:59'),
(28, 'Friday', '00:00:00', '23:59:59'),
(28, 'Saturday', '00:00:00', '23:59:59'),
(28, 'Sunday', '00:00:00', '23:59:59');

-- Nijo Castle availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(29, 'Monday', '08:45:00', '17:00:00'),
(29, 'Tuesday', '08:45:00', '17:00:00'),
(29, 'Wednesday', '08:45:00', '17:00:00'),
(29, 'Thursday', '08:45:00', '17:00:00'),
(29, 'Friday', '08:45:00', '17:00:00'),
(29, 'Saturday', '08:45:00', '17:00:00'),
(29, 'Sunday', '08:45:00', '17:00:00');

-- Gion District availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(30, 'Monday', '10:00:00', '19:00:00'),
(30, 'Tuesday', '10:00:00', '19:00:00'),
(30, 'Wednesday', '10:00:00', '19:00:00'),
(30, 'Thursday', '10:00:00', '19:00:00'),
(30, 'Friday', '10:00:00', '21:00:00'),
(30, 'Saturday', '10:00:00', '21:00:00'),
(30, 'Sunday', '10:00:00', '19:00:00');

-- Heian Shrine availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(31, 'Monday', '06:00:00', '18:00:00'),
(31, 'Tuesday', '06:00:00', '18:00:00'),
(31, 'Wednesday', '06:00:00', '18:00:00'),
(31, 'Thursday', '06:00:00', '18:00:00'),
(31, 'Friday', '06:00:00', '18:00:00'),
(31, 'Saturday', '06:00:00', '18:00:00'),
(31, 'Sunday', '06:00:00', '18:00:00');

-- Ryoan-ji availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(32, 'Monday', '08:00:00', '17:00:00'),
(32, 'Tuesday', '08:00:00', '17:00:00'),
(32, 'Wednesday', '08:00:00', '17:00:00'),
(32, 'Thursday', '08:00:00', '17:00:00'),
(32, 'Friday', '08:00:00', '17:00:00'),
(32, 'Saturday', '08:00:00', '17:00:00'),
(32, 'Sunday', '08:00:00', '17:00:00');

-- Toji Temple availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(33, 'Monday', '08:00:00', '17:00:00'),
(33, 'Tuesday', '08:00:00', '17:00:00'),
(33, 'Wednesday', '08:00:00', '17:00:00'),
(33, 'Thursday', '08:00:00', '17:00:00'),
(33, 'Friday', '08:00:00', '17:00:00'),
(33, 'Saturday', '08:00:00', '17:00:00'),
(33, 'Sunday', '08:00:00', '17:00:00');

-- Philosopher's Path availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(34, 'Monday', '08:30:00', '19:00:00'),
(34, 'Tuesday', '08:30:00', '19:00:00'),
(34, 'Wednesday', '08:30:00', '19:00:00'),
(34, 'Thursday', '08:30:00', '19:00:00'),
(34, 'Friday', '08:30:00', '19:00:00'),
(34, 'Saturday', '08:30:00', '19:00:00'),
(34, 'Sunday', '08:30:00', '19:00:00');

-- Sanjusangendo Temple availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(35, 'Monday', '08:30:00', '17:00:00'),
(35, 'Tuesday', '08:30:00', '17:00:00'),
(35, 'Wednesday', '08:30:00', '17:00:00'),
(35, 'Thursday', '08:30:00', '17:00:00'),
(35, 'Friday', '08:30:00', '17:00:00'),
(35, 'Saturday', '08:30:00', '17:00:00'),
(35, 'Sunday', '08:30:00', '17:00:00');

-- Tofuku-ji Temple availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(36, 'Monday', '09:00:00', '16:00:00'),
(36, 'Tuesday', '09:00:00', '16:00:00'),
(36, 'Wednesday', '09:00:00', '16:00:00'),
(36, 'Thursday', '09:00:00', '16:00:00'),
(36, 'Friday', '09:00:00', '16:00:00'),
(36, 'Saturday', '09:00:00', '16:00:00'),
(36, 'Sunday', '09:00:00', '16:00:00');

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
('Brooklyn Bridge', 'New York City', 'Historic suspension bridge.', 'Bridge', TRUE, 'https://www.teahub.io/photos/full/194-1940888_brooklyn-bridge.jpg', 'ChIJK3vOQyNawokRXEa9errdJiU', 5),
('Metropolitan Museum of Art', 'New York City', 'One of the world''s largest and finest art museums.', 'Museum', TRUE, 'https://media.cntraveler.com/photos/55d362f337284fb1079ccc4b/16:9/w_2560%2Cc_limit/metropolitan-museum-of-art-new-york-city.jpg', 'ChIJb8Jg9pZYwokR-qHGtvSkLzs', 6),
('One World Trade Center', 'New York City', 'Tallest building in the Western Hemisphere, offering observation decks and a memorial.', 'Skyscraper', TRUE, 'https://w0.peakpx.com/wallpaper/537/11/HD-wallpaper-one-world-trade-center-evening-sunset-new-york-city-one-wtc-cityscape-modern-buildings-new-york-usa.jpg', 'ChIJy7cGfBlawokR5l2e93hsoEA', 7),
('Broadway', 'New York City', 'Famous street known for its theaters and musicals.', 'Theater District', TRUE, 'https://www.fodors.com/wp-content/uploads/2022/04/Hero-NYCBroadwayTicks-denys-nevozhai-N6t14kV_X68-unsplash.jpg', 'EhtCcm9hZHdheSwgTmV3IFlvcmssIE5ZLCBVU0EiLiosChQKEgk5IyONWVbCiRGelpM_JoWL2hIUChIJOwg_06VPwokRYv534QaPC8g', 8),
('Fifth Avenue', 'New York City', 'Luxury shopping street and iconic landmark.', 'Street', TRUE, 'https://travel.usnews.com/images/Fifth_Ave_Artem_Vorobiev_Getty.jpg', 'Eho1dGggQXZlLCBOZXcgWW9yaywgTlksIFVTQSIuKiwKFAoSCfVHOJ2iWMKJEUp3QQG6-01WEhQKEgk7CD_TpU_CiRFi_nfhBo8LyA', 9),
('Museum of Modern Art', 'New York City', 'Renowned museum featuring modern and contemporary art.', 'Museum', TRUE, 'https://images.adsttc.com/media/images/523a/2a12/e8e4/4eef/7900/022c/slideshow/MoMA_Tim_Hursley_garden.jpg?1379543564', 'ChIJKxDbe_lYwokRVf__s8CPn-o', 10),
('Grand Central Terminal', 'New York City', 'Historic train station known for its stunning architecture and celestial dome.', 'Transportation Hub', TRUE, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Image-Grand_central_Station_Outside_Night_2.jpg/1200px-Image-Grand_central_Station_Outside_Night_2.jpg', 'ChIJ-b2RmVlZwokRpb1pwEQjss0', 11),
('High Line', 'New York City', 'Urban park built on a historic freight rail line elevated above the city streets.', 'Park', TRUE, 'https://www.newyorkbyrail.com/wp-content/uploads/2018/04/The-High-Line-NYC-NY-New-York-By-Rail-Francois-Roux.jpg', 'ChIJ5bQPhMdZwokRkTwKhVxhP1g', 12);

-- Statue of Liberty availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(37, 'Monday', '09:00:00', '18:30:00'),
(37, 'Tuesday', '09:00:00', '18:30:00'),
(37, 'Wednesday', '09:00:00', '18:30:00'),
(37, 'Thursday', '09:00:00', '18:30:00'),
(37, 'Friday', '09:00:00', '18:30:00'),
(37, 'Saturday', '09:00:00', '18:30:00'),
(37, 'Sunday', '09:00:00', '18:30:00');

-- Central Park availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(38, 'Monday', '06:00:00', '01:00:00'),
(38, 'Tuesday', '06:00:00', '01:00:00'),
(38, 'Wednesday', '06:00:00', '01:00:00'),
(38, 'Thursday', '06:00:00', '01:00:00'),
(38, 'Friday', '06:00:00', '01:00:00'),
(38, 'Saturday', '06:00:00', '01:00:00'),
(38, 'Sunday', '06:00:00', '01:00:00');

-- Times Square availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(39, 'Monday', '00:00:00', '23:59:59'),
(39, 'Tuesday', '00:00:00', '23:59:59'),
(39, 'Wednesday', '00:00:00', '23:59:59'),
(39, 'Thursday', '00:00:00', '23:59:59'),
(39, 'Friday', '00:00:00', '23:59:59'),
(39, 'Saturday', '00:00:00', '23:59:59'),
(39, 'Sunday', '00:00:00', '23:59:59');

-- Empire State Building availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(40, 'Monday', '09:00:00', '01:00:00'),
(40, 'Tuesday', '09:00:00', '01:00:00'),
(40, 'Wednesday', '09:00:00', '01:00:00'),
(40, 'Thursday', '09:00:00', '01:00:00'),
(40, 'Friday', '09:00:00', '01:00:00'),
(40, 'Saturday', '09:00:00', '01:00:00'),
(40, 'Sunday', '09:00:00', '01:00:00');

-- Brooklyn Bridge availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(41, 'Monday', '00:00:00', '23:59:59'),
(41, 'Tuesday', '00:00:00', '23:59:59'),
(41, 'Wednesday', '00:00:00', '23:59:59'),
(41, 'Thursday', '00:00:00', '23:59:59'),
(41, 'Friday', '00:00:00', '23:59:59'),
(41, 'Saturday', '00:00:00', '23:59:59'),
(41, 'Sunday', '00:00:00', '23:59:59');

-- Metropolitan Museum of Art availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(42, 'Monday', '10:00:00', '17:00:00'),
(42, 'Tuesday', '10:00:00', '17:00:00'),
(42, 'Wednesday', NULL, NULL),  -- Closed
(42, 'Thursday', '10:00:00', '17:00:00'),
(42, 'Friday', '10:00:00', '21:00:00'),
(42, 'Saturday', '10:00:00', '21:00:00'),
(42, 'Sunday', '10:00:00', '17:00:00');

-- One World Trade Center availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(43, 'Monday', '00:00:00', '23:59:59'),
(43, 'Tuesday', '00:00:00', '23:59:59'),
(43, 'Wednesday', '00:00:00', '23:59:59'),
(43, 'Thursday', '00:00:00', '23:59:59'),
(43, 'Friday', '00:00:00', '23:59:59'),
(43, 'Saturday', '00:00:00', '23:59:59'),
(43, 'Sunday', '00:00:00', '23:59:59');

-- Broadway availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(44, 'Monday', '00:00:00', '23:59:59'),
(44, 'Tuesday', '00:00:00', '23:59:59'),
(44, 'Wednesday', '00:00:00', '23:59:59'),
(44, 'Thursday', '00:00:00', '23:59:59'),
(44, 'Friday', '00:00:00', '23:59:59'),
(44, 'Saturday', '00:00:00', '23:59:59'),
(44, 'Sunday', '00:00:00', '23:59:59');

-- Fifth Avenue availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(45, 'Monday', '00:00:00', '23:59:59'),
(45, 'Tuesday', '00:00:00', '23:59:59'),
(45, 'Wednesday', '00:00:00', '23:59:59'),
(45, 'Thursday', '00:00:00', '23:59:59'),
(45, 'Friday', '00:00:00', '23:59:59'),
(45, 'Saturday', '00:00:00', '23:59:59'),
(45, 'Sunday', '00:00:00', '23:59:59');

-- The Museum of Modern Art availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(46, 'Monday', '10:30:00', '17:30:00'),
(46, 'Tuesday', '10:30:00', '17:30:00'),
(46, 'Wednesday', '10:30:00', '17:30:00'),
(46, 'Thursday', '10:30:00', '17:30:00'),
(46, 'Friday', '10:30:00', '17:30:00'),
(46, 'Saturday', '10:30:00', '19:00:00'),
(46, 'Sunday', '10:30:00', '17:30:00');

-- Grand Central Terminal availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(47, 'Monday', '05:15:00', '02:00:00'),
(47, 'Tuesday', '05:15:00', '02:00:00'),
(47, 'Wednesday', '05:15:00', '02:00:00'),
(47, 'Thursday', '05:15:00', '02:00:00'),
(47, 'Friday', '05:15:00', '02:00:00'),
(47, 'Saturday', '05:15:00', '02:00:00'),
(47, 'Sunday', '05:15:00', '02:00:00');
-- The High Line availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(48, 'Monday', '07:00:00', '22:00:00'),
(48, 'Tuesday', '07:00:00', '22:00:00'),
(48, 'Wednesday', '07:00:00', '22:00:00'),
(48, 'Thursday', '07:00:00', '22:00:00'),
(48, 'Friday', '07:00:00', '22:00:00'),
(48, 'Saturday', '07:00:00', '22:00:00'),
(48, 'Sunday', '07:00:00', '20:00:00');

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
INSERT INTO landmarks (name, city, description, venue_type, approval_status, image_url, place_id, order_num)
VALUES
('Sydney Opera House', 'Sydney', 'Iconic performing arts center.', 'Theater', TRUE, 'https://ychef.files.bbci.co.uk/1280x720/p0gp95cq.jpg', 'ChIJ3S-JXmauEmsRUcIaWtf4MzE', 1),
('Sydney Harbour Bridge', 'Sydney', 'Famous bridge with climbing tours.', 'Bridge', TRUE, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Sydney_harbour_bridge_dusk.jpg/1200px-Sydney_harbour_bridge_dusk.jpg', 'Ei1TeWRuZXkgSGJyIEJyZywgVGhlIFJvY2tzIE5TVyAyMDAwLCBBdXN0cmFsaWEiLiosChQKEgkFrsgVi64SaxGftdSd9hwMLxIUChIJs49dtkKuEmsRYM0yFmh9AQU', 2),
('Bondi Beach', 'Sydney', 'Popular beach known for surfing.', 'Beach', TRUE, 'https://images.luxuryescapes.com/q_auto:good/7gk5apfqkdope68bfrm', 'ChIJWTi8xgGyEmsRgK0yFmh9AQU', 3),
('Taronga Zoo', 'Sydney', 'Large zoo with diverse wildlife.', 'Zoo', TRUE, 'https://cdn-imgix.headout.com/media/images/e867479f7e5698a270dc5cda9f54b314-16984-TicketstoTarongaZoowithExpressFerry-003.jpg?auto=format&w=720&h=450&q=90&fit=crop&ar=16%3A10', 'ChIJq6qqWiSsEmsRJuIpepyEua4', 4),
('Royal Botanic Garden', 'Sydney', 'Beautiful botanical gardens by the harbor.', 'Garden', TRUE, 'https://media.istockphoto.com/id/510641020/photo/botanic-gardens-alley.jpg?s=612x612&w=0&k=20&c=Ph43mpMMUVxV7w90YlAahbGX9Z5uOVAoXCuldewvlHk=', 'ChIJWaTdYGuuEmsRoOfx-Wh9AQ8', 5),
('The Rocks', 'Sydney', 'Historic area with markets, museums, and restaurants.', 'Historic District', TRUE, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/02/50/02/sydney-s-first-street.jpg?w=1200&h=-1&s=1', 'ChIJs49dtkKuEmsRYM0yFmh9AQU' , 6),
('Sydney Tower Eye', 'Sydney', 'Observation tower offering panoramic views of the city.', 'Observation Deck', TRUE, 'https://www.sydneytowereye.com.au/media/ygednft2/ste-summer23-frontpagehero-1920x1080px.jpg', 'ChIJy6BwuD-uEmsRyiRskH1UG-I', 7),
('Art Gallery of New South Wales', 'Sydney', 'Major art museum featuring Australian, European, and Asian art.', 'Museum', TRUE, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/68/4c/c4/south-building-of-art.jpg?w=1200&h=-1&s=1', 'ChIJPVqlfGyuEmsRHPcnCX1X1OE', 8),
('Sydney Fish Market', 'Sydney', 'Large seafood market with a variety of fresh produce and eateries.', 'Market', TRUE, 'https://img.delicious.com.au/WmIYq0aH/del/2024/06/new-sydney-fish-markets-213510-1.png', 'ChIJqy_-dTGuEmsRtBGe8eEFI8E', 9),
('Powerhouse Museum', 'Sydney', 'Museum focusing on science, technology, and design.', 'Museum', TRUE, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/22/1d/53/powerhouse-museum-by.jpg?w=1200&h=-1&s=1', 'ChIJwbKbCiWuEmsRgBXuDPx5lJ0', 10),
('Maritime Museum', 'Sydney', 'Museum showcasing Australia’s maritime history with interactive exhibits.', 'Museum', TRUE, 'https://media.timeout.com/images/104672648/image.jpg', 'ChIJTze93zmuEmsRhvE6T4Y9DhU', 11),
('St Mary’s Cathedral', 'Sydney', 'Gothic Revival-style cathedral and a significant religious site.', 'Cathedral', TRUE, 'https://travel.usnews.com/images/St._Marys_Cathedral_main_Getty.jpg', 'ChIJIfH_5hSuEmsR3jZ2qQd0ev4', 12);

-- Sydney Opera House availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(49, 'Monday', '09:00:00', '17:00:00'),
(49, 'Tuesday', '09:00:00', '17:00:00'),
(49, 'Wednesday', '09:00:00', '17:00:00'),
(49, 'Thursday', '09:00:00', '17:00:00'),
(49, 'Friday', '09:00:00', '17:00:00'),
(49, 'Saturday', '09:00:00', '17:00:00'),
(49, 'Sunday', '10:00:00', '18:00:00');

-- Sydney Harbour Bridge availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(50, 'Monday', '00:00:00', '23:59:59'),
(50, 'Tuesday', '00:00:00', '23:59:59'),
(50, 'Wednesday', '00:00:00', '23:59:59'),
(50, 'Thursday', '00:00:00', '23:59:59'),
(50, 'Friday', '00:00:00', '23:59:59'),
(50, 'Saturday', '00:00:00', '23:59:59'),
(50, 'Sunday', '00:00:00', '23:59:59');

-- Bondi Beach availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(51, 'Monday', '06:00:00', '21:30:00'),
(51, 'Tuesday', '06:00:00', '21:30:00'),
(51, 'Wednesday', '06:00:00', '21:30:00'),
(51, 'Thursday', '06:00:00', '21:30:00'),
(51, 'Friday', '06:00:00', '21:30:00'),
(51, 'Saturday', '06:00:00', '21:30:00'),
(51, 'Sunday', '06:00:00', '21:30:00');

-- Taronga Zoo availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(52, 'Monday', '09:30:00', '16:30:00'),
(52, 'Tuesday', '09:30:00', '16:30:00'),
(52, 'Wednesday', '09:30:00', '16:30:00'),
(52, 'Thursday', '09:30:00', '16:30:00'),
(52, 'Friday', '09:30:00', '16:30:00'),
(52, 'Saturday', '09:30:00', '16:30:00'),
(52, 'Sunday', '09:30:00', '16:30:00');

-- Royal Botanic Garden availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(53, 'Monday', '07:00:00', '17:30:00'),
(53, 'Tuesday', '07:00:00', '17:30:00'),
(53, 'Wednesday', '07:00:00', '17:30:00'),
(53, 'Thursday', '07:00:00', '17:30:00'),
(53, 'Friday', '07:00:00', '17:30:00'),
(53, 'Saturday', '07:00:00', '17:30:00'),
(53, 'Sunday', '07:00:00', '17:30:00');

-- The Rocks availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(54, 'Monday', NULL, NULL),
(54, 'Tuesday', NULL, NULL),
(54, 'Wednesday', NULL, NULL),
(54, 'Thursday', NULL, NULL),
(54, 'Friday', NULL, NULL),
(54, 'Saturday', '10:00:00', '17:00:00'),
(54, 'Sunday', '10:00:00', '17:00:00');

-- Sydney Tower Eye availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(55, 'Monday', '10:00:00', '18:00:00'),
(55, 'Tuesday', '10:00:00', '18:00:00'),
(55, 'Wednesday', '10:00:00', '18:00:00'),
(55, 'Thursday', '10:00:00', '18:00:00'),
(55, 'Friday', '10:00:00', '18:00:00'),
(55, 'Saturday', '10:00:00', '18:00:00'),
(55, 'Sunday', '10:00:00', '18:00:00');

-- Art Gallery of New South Wales availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(56, 'Monday', '10:00:00', '17:00:00'),
(56, 'Tuesday', '10:00:00', '17:00:00'),
(56, 'Wednesday', '10:00:00', '22:00:00'),
(56, 'Thursday', '10:00:00', '17:00:00'),
(56, 'Friday', '10:00:00', '17:00:00'),
(56, 'Saturday', '10:00:00', '17:00:00'),
(56, 'Sunday', '10:00:00', '17:00:00');

-- Sydney Fish Market
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(57, 'Monday', '07:00:00', '16:00:00'),
(57, 'Tuesday', '07:00:00', '16:00:00'),
(57, 'Wednesday', '07:00:00', '16:00:00'),
(57, 'Thursday', '07:00:00', '16:00:00'),
(57, 'Friday', '07:00:00', '16:00:00'),
(57, 'Saturday', '07:00:00', '16:00:00'),
(57, 'Sunday', '07:00:00', '16:00:00');

-- Powerhouse Museum availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(58, 'Monday', NULL, NULL),
(58, 'Tuesday', NULL, NULL),
(58, 'Wednesday', NULL, NULL),
(58, 'Thursday', NULL, NULL),
(58, 'Friday', NULL, NULL),
(58, 'Saturday', NULL, NULL),
(58, 'Sunday', NULL, NULL);

-- Australian National Maritime Museum availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(59, 'Monday', '10:00:00', '16:00:00'),
(59, 'Tuesday', '10:00:00', '16:00:00'),
(59, 'Wednesday', '10:00:00', '16:00:00'),
(59, 'Thursday', '10:00:00', '16:00:00'),
(59, 'Friday', '10:00:00', '16:00:00'),
(59, 'Saturday', '10:00:00', '16:00:00'),
(59, 'Sunday', '10:00:00', '16:00:00');

-- St Mary’s Cathedral availability
INSERT INTO LandmarkAvailability (landmark_id, day_of_week, open_time, close_time) VALUES
(60, 'Monday', '06:30:00', '18:30:00'),
(60, 'Tuesday', '06:30:00', '18:30:00'),
(60, 'Wednesday', '06:30:00', '18:30:00'),
(60, 'Thursday', '06:30:00', '18:30:00'),
(60, 'Friday', '06:30:00', '18:30:00'),
(60, 'Saturday', '06:30:00', '19:00:00'),
(60, 'Sunday', '06:30:00', '19:00:00');

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
(1, 1, 'Cindy', 'Torres', 'Well maintained', 5, 'The landmark is well maintained.', '2024-08-14 17:23:45', TRUE),
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



