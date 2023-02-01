use hotelreservation;

### RSVP ###

/*
CREATE TABLE IF NOT EXISTS RSVP (
	id int not null auto_increment,
    full_name varchar(150) not null,
    email varchar(50) not null,
    phone varchar(10) not null,
    confirmation_date DATE,
    comments varchar(255),
    CONSTRAINT pk_rsvp_id PRIMARY KEY(id)
    );
*/

SELECT * FROM rsvp;
SELECT * FROM rsvp WHERE full_name like '%fred%';

INSERT INTO rsvp (full_name, email, phone, confirmation_date, comments)
VALUES ('Fred Flintstone', 'fred@gmail.com', '81234567', '2023-02-01', 'fred rsvp to B event');

UPDATE rsvp
SET full_name = 'fred', email = 'fred@hotmail.com', phone = '88776655',
confirmation_date = '2023-02-01', comments = 'fred rsvp to A event'
WHERE id = 1;

SELECT count(*) as cnt FROM rsvp;
