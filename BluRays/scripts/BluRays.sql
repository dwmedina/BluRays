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
	runtime int not null,
	image_name varchar(100) not null

	constraint pk_blurays primary key (bluray_id)
);

insert into blurays values ('Arrival', 'When mysterious spacecraft touch down across the globe, an elite team--lead by expert linguist Louise Banks (Amy Adams)--are brought together to investigate. As mankind teeters on the verge of global war, Banks and the team race against time for answers--and to find them, she will take a chance that could threaten her life, and quite possibly humanity.', 'PG-13', 'Drama', 'Denis Villeneuve', 'Eric Heisserer', 2016, 116, 'arrival.jpg');
insert into blurays values ('Ex Machina', 'Alex Garland, writer of 28 Days Later and Sunshine, makes his directorial debut with the stylish and cerebral thriller, EX MACHINA. Caleb Smith (Domhnall Gleeson), a programmer at an internet-search giant, wins a competition to spend a week at the private mountain estate of the company''s brilliant and reclusive CEO, Nathan Bateman (Oscar Isaac). Upon his arrival, Caleb learns that Nathan has chosen him to be the human component in a Turing Test-charging him with evaluating the capabilities, and ultimately the consciousness, of Nathan''s latest experiment in artificial intelligence. That experiment is Ava (Alicia Vikander), a breathtaking A.I. whose emotional intelligence proves more sophisticated--and more deceptive--than the two men could have imagined. (C) A24', 'R', 'Drama', 'Alex Garland', 'Alex Garland', 2015, 108, 'ex_machina.jpg');
insert into blurays values ('Get Out', 'Now that Chris and his girlfriend, Rose, have reached the meet-the-parents milestone of dating, she invites him for a weekend getaway upstate with Missy and Dean. At first, Chris reads the family''s overly accommodating behavior as nervous attempts to deal with their daughter''s interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he could have never imagined.', 'R', 'Comedy', 'Jordan Peele', 'Jordan Peele', 2017, 104, 'get_out.jpg');
insert into blurays values ('Hell or High Water', 'Texas brothers--Toby (Chris Pine), and Tanner (Ben Foster), come together after years divided to rob branches of the bank threatening to foreclose on their family land. For them, the hold-ups are just part of a last-ditch scheme to take back a future that seemed to have been stolen from under them. Justice seems to be theirs, until they find themselves on the radar of Texas Ranger, Marcus (Jeff Bridges) looking for one last grand pursuit on the eve of his retirement, and his half-Comanche partner, Alberto (Gil Birmingham). As the brothers plot a final bank heist to complete their scheme, and with the Rangers on their heels, a showdown looms at the crossroads where the values of the Old and New West murderously collide.', 'R', 'Drama', 'David Mackenzie', 'Taylor Sheridan', 2016, 102, 'hell_or_high_water.jpg');
insert into blurays values ('The Leftovers: Season Two', 'Season 2 opens in Jarden, Texas, aka Miracle, a town known the world over for not losing a single person to the "Sudden Departure," and one where Kevin, Jill, Nora and baby Lily hope to start anew with a clean slate. Preceded by Matt, who''s found a new preaching gig, and his wife, Mary, they''re welcomed by their new neighbors and lifelong residents Erika and John Murphy. The latter, however, is leery of charlatans and carpetbaggers who seek to profit from Miracle''s reputation, but that stature is called into question after three young girls vanish without a trace. Back on the East Coast, Tom goes undercover to lure skeptics from the Guilty Remnant, while Laurie works on a tell-all book to expose the chain-smoking cult''s silent campaign of intimidation. Also starring Ann Dowd, Liv Tyler, Jovan Adepo, Steven Williams and Jasmin Savoy Brown.', 'NR', 'Drama', 'Mimi Leder', 'Damon Lindelof', 2015, 443, 'the_leftovers_2.jpg');
insert into blurays values ('The Lord of the Rings: The Two Towers', 'Frodo and Samwise press on toward Mordor. Gollum insists on being the guide. Can anyone so corrupted by the ring be trusted? Can Frodo, increasingly under the sway of the ring, even trust himself? Meanwhile, Aragorn, drawing closer to his kingly destiny, rallies forces of good for the battles that must come. Director Peter Jackson delivers an amazing second movie that won 2 Academy Awards (R)* and earned 6 total nominations including Best Picture. The journey continues. So do the astonishing spectacle and splendor.', 'PG-13', 'Action & Adventure', 'Peter Jackson', 'Philippa Boyens', 2002, 180, 'the_two_towers.jpg');
insert into blurays values ('Mad Max: Fury Road', 'Filmmaker George Miller gears up for another post-apocalyptic action adventure with Fury Road, the fourth outing in the Mad Max film series. Charlize Theron stars alongside Tom Hardy (Bronson), with Zoe Kravitz, Adelaide Clemens, and Rosie Huntington Whiteley heading up the supporting cast. ~ Jeremy Wheeler, Rovi', 'R', 'Action & Adventure', 'George Miller', 'Brendan McCarthy', 2015, 120, 'mad_max_fury_road.jpg');
insert into blurays values ('The Revenant', 'Inspired by true events, THE REVENANT is an immersive and visceral cinematic experience capturing one man''s epic adventure of survival and the extraordinary power of the human spirit. In an expedition of the uncharted American wilderness, legendary explorer Hugh Glass (Leonardo DiCaprio) is brutally attacked by a bear and left for dead by members of his own hunting team. In a quest to survive, Glass endures unimaginable grief as well as the betrayal of his confidant John Fitzgerald (Tom Hardy). Guided by sheer will and the love of his family, Glass must navigate a vicious winter in a relentless pursuit to live and find redemption. THE REVENANT is directed and co-written by renowned filmmaker, Academy Award (R) winner Alejandro G. Iñárritu (Birdman, Babel). (C) Fox', 'R', 'Action & Adventure', 'Alejandro González Iñárritu', 'Mark L. Smith', 2015, 156, 'the_revenant.jpg');
insert into blurays values ('Sicario', 'In the lawless border area stretching between the U.S. and Mexico, an idealistic FBI agent [Emily Blunt] is enlisted by an elite government task force official [Josh Brolin] to aid in the escalating war against drugs. Led by an enigmatic consultant with a questionable past [Benicio Del Toro], the team sets out on a clandestine journey forcing Kate to question everything that she believes in order to survive. (C) Lionsgate', 'R', 'Action & Adventure', 'Denis Villeneuve', 'Taylor Sheridan', 2015, 121, 'sicario.jpg');