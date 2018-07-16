-- Switch to the system (aka master) database
USE master;
GO

-- Delete the bluray Database (IF EXISTS)
IF EXISTS(select * from sys.databases where name='bluraydb')
DROP DATABASE bluraydb;
GO

-- Create a new bluraydb Database
CREATE DATABASE bluraydb;
GO

-- Switch to the bluraydb Database
USE bluraydb
GO

drop table blurays;

create table blurays
(
	bluray_id int identity(1,1),
	title varchar(200) not null,
	description text not null, 
	rating varchar(5) not null,
	genre varchar(100) not null,
	director varchar(100) not null,
	writer varchar(100) not null,
	release_year int not null,
	runtime int not null

	constraint pk_blurays primary key (bluray_id)
);

insert into blurays values ('Hell or High Water', 'Texas brothers--Toby (Chris Pine), and Tanner (Ben Foster), come together after years divided to rob branches of the bank threatening to foreclose on their family land. For them, the hold-ups are just part of a last-ditch scheme to take back a future that seemed to have been stolen from under them. Justice seems to be theirs, until they find themselves on the radar of Texas Ranger, Marcus (Jeff Bridges) looking for one last grand pursuit on the eve of his retirement, and his half-Comanche partner, Alberto (Gil Birmingham). As the brothers plot a final bank heist to complete their scheme, and with the Rangers on their heels, a showdown looms at the crossroads where the values of the Old and New West murderously collide.', 'R', 'Drama', 'David Mackenzie', 'Taylor Sheridan', 2016, 102);
insert into blurays values ('The Leftovers: Season Two', 'Season 2 opens in Jarden, Texas, aka Miracle, a town known the world over for not losing a single person to the "Sudden Departure," and one where Kevin, Jill, Nora and baby Lily hope to start anew with a clean slate. Preceded by Matt, who''s found a new preaching gig, and his wife, Mary, they''re welcomed by their new neighbors and lifelong residents Erika and John Murphy. The latter, however, is leery of charlatans and carpetbaggers who seek to profit from Miracle''s reputation, but that stature is called into question after three young girls vanish without a trace. Back on the East Coast, Tom goes undercover to lure skeptics from the Guilty Remnant, while Laurie works on a tell-all book to expose the chain-smoking cult''s silent campaign of intimidation. Also starring Ann Dowd, Liv Tyler, Jovan Adepo, Steven Williams and Jasmin Savoy Brown.', 'NR', 'Drama', 'Mimi Leder', 'Damon Lindelof', 2015, 443);
insert into blurays values ('The Lord of the Rings: The Two Towers', 'Frodo and Samwise press on toward Mordor. Gollum insists on being the guide. Can anyone so corrupted by the ring be trusted? Can Frodo, increasingly under the sway of the ring, even trust himself? Meanwhile, Aragorn, drawing closer to his kingly destiny, rallies forces of good for the battles that must come. Director Peter Jackson delivers an amazing second movie that won 2 Academy Awards (R)* and earned 6 total nominations including Best Picture. The journey continues. So do the astonishing spectacle and splendor.', 'PG-13', 'Action & Adventure', 'Peter Jackson', 'Philippa Boyens', 2002, 180);
insert into blurays values ('Mad Max: Fury Road', 'Filmmaker George Miller gears up for another post-apocalyptic action adventure with Fury Road, the fourth outing in the Mad Max film series. Charlize Theron stars alongside Tom Hardy (Bronson), with Zoe Kravitz, Adelaide Clemens, and Rosie Huntington Whiteley heading up the supporting cast. ~ Jeremy Wheeler, Rovi', 'R', 'Action & Adventure', 'George Miller', 'Brendan McCarthy', 2015, 120);