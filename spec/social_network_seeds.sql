TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE posts RESTART IDENTITY CASCADE;

INSERT INTO users (email_address, username) VALUES('obsidian_fire_mage69@gmail.com', 'GreatBallsOfFire');
INSERT INTO users (email_address, username) VALUES('pitbul420@gmail.com', 'Mr.Wolrdwide');
INSERT INTO users (email_address, username) VALUES('gengenpressed_to_perfection@tisacli.net', 'BigKlopp');
INSERT INTO users (email_address, username) VALUES('test_email@gmail.com', 'TestUsername');

INSERT INTO posts (title, content, views, user_id) VALUES('Had a really bad day', 'I ran out of mana so no more fire balls', 100, 1);
INSERT INTO posts (title, content, views, user_id) VALUES('Had another bad day', 'Took a bath - water extinguishes fire. What was I thinking?', 4, 1);
INSERT INTO posts (title, content, views, user_id) VALUES('We back', 'I am the god of hellfire and i bring you!', 15, 1);
INSERT INTO posts (title, content, views, user_id) VALUES('At the barbers', 'Fresh trim', 3000, 2);
INSERT INTO posts (title, content, views, user_id) VALUES('Checking in', 'Hey, its me, the normal one', 14, 3);
INSERT INTO posts (title, content, views, user_id) VALUES('We got again', 'Its been a bad season lets be honest', 25, 3);
INSERT INTO posts (title, content, views, user_id) VALUES('Recording a new banger', 'Mr.Worldwide is back', 10, 2);
INSERT INTO posts (title, content, views, user_id) VALUES('Test', 'Test number 4', 4, 4);