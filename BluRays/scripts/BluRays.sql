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


insert into blurays values ('12 Years a Slave', 'From acclaimed director Steve McQueen comes this "deeply evocative and brilliantly acted" film (Claudia Puig, USA Today) based on the true story of Solomon Northup. It is 1841, and Northup (Chiwetel Ejiofor in a gripping performance), an accomplished, free citizen of New York, is kidnapped and sold into slavery. Stripped of his identity and deprived of all dignity, Northup is ultimately purchased by ruthless plantation owner Edwin Epps (Michael Fassbender) and must find the strength within to survive. Filled with powerful performances by an astonishing cast that includes Benedict Cumberbatch, Brad Pitt and newcomer Lupita Nyong''o, 12 Years A Slave is both an unflinching account of slavery in American history and a celebration of the indomitable power of hope.', 'R', 'Drama', 'Steve McQueen (III)', 'John Ridley', 2013, 134, '12_years_a_slave.jpg');
insert into blurays values ('Arrival', 'When mysterious spacecraft touch down across the globe, an elite team--lead by expert linguist Louise Banks (Amy Adams)--are brought together to investigate. As mankind teeters on the verge of global war, Banks and the team race against time for answers--and to find them, she will take a chance that could threaten her life, and quite possibly humanity.', 'PG-13', 'Drama', 'Denis Villeneuve', 'Eric Heisserer', 2016, 116, 'arrival.jpg');
insert into blurays values ('Atomic Blonde', 'A high-stakes, global action-thriller that takes place in the city of Berlin, on the eve of the Wall''s collapse and the shifting of superpower alliances. Charlize Theron ("Mad Max: Fury Road") portrays Lorraine Broughton, a top-level spy for MI6, who is dispatched to Berlin to take down a ruthless espionage ring that has just killed an undercover agent for reasons unknown. She is ordered to cooperate with Berlin station chief David Percival (James McAvoy of "X-Men"), and the two form an uneasy alliance, unleashing their full arsenal of skills in pursuing a threat that jeopardizes the West''s entire intelligence operation.', 'R', 'Action & Adventure', 'David Leitch', 'Kurt Johnstad', 2017, 115, 'atomic_blonde.jpg');
insert into blurays values ('Avatar', 'A reluctant hero. An epic journey. A choice between the life he left behind and the incredible new world he''s learned to call home. Return to James Cameron''s Avatar� the greatest adventure of all time. Please note: This edition of the film is not in 3D.', 'PG-13', 'Action & Adventure', 'James Cameron', 'James Cameron', 2009, 162, 'avatar.jpg');
insert into blurays values ('Ex Machina', 'Alex Garland, writer of 28 Days Later and Sunshine, makes his directorial debut with the stylish and cerebral thriller, EX MACHINA. Caleb Smith (Domhnall Gleeson), a programmer at an internet-search giant, wins a competition to spend a week at the private mountain estate of the company''s brilliant and reclusive CEO, Nathan Bateman (Oscar Isaac). Upon his arrival, Caleb learns that Nathan has chosen him to be the human component in a Turing Test-charging him with evaluating the capabilities, and ultimately the consciousness, of Nathan''s latest experiment in artificial intelligence. That experiment is Ava (Alicia Vikander), a breathtaking A.I. whose emotional intelligence proves more sophisticated--and more deceptive--than the two men could have imagined. (C) A24', 'R', 'Drama', 'Alex Garland', 'Alex Garland', 2015, 108, 'ex_machina.jpg');
insert into blurays values ('Get Out', 'Now that Chris and his girlfriend, Rose, have reached the meet-the-parents milestone of dating, she invites him for a weekend getaway upstate with Missy and Dean. At first, Chris reads the family''s overly accommodating behavior as nervous attempts to deal with their daughter''s interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he could have never imagined.', 'R', 'Comedy', 'Jordan Peele', 'Jordan Peele', 2017, 104, 'get_out.jpg');
insert into blurays values ('Harry Potter and the Deathly Hallows: Part II', 'Harry Potter and the Deathly Hallows - Part 2, is the final adventure in the Harry Potter film series. The much-anticipated motion picture event is the second of two full-length parts. In the epic finale, the battle between the good and evil forces of the wizarding world escalates into an all-out war. The stakes have never been higher and no one is safe. But it is Harry Potter who may be called upon to make the ultimate sacrifice as he draws closer to the climactic showdown with Lord Voldemort. It all ends here. -- (C) Warner Bros', 'PG-13', 'Action & Adventure', 'David Yates (II)', 'Steve Kloves', 2011, 131, 'harry_potter_7_2.jpg');
insert into blurays values ('Hell or High Water', 'Texas brothers--Toby (Chris Pine), and Tanner (Ben Foster), come together after years divided to rob branches of the bank threatening to foreclose on their family land. For them, the hold-ups are just part of a last-ditch scheme to take back a future that seemed to have been stolen from under them. Justice seems to be theirs, until they find themselves on the radar of Texas Ranger, Marcus (Jeff Bridges) looking for one last grand pursuit on the eve of his retirement, and his half-Comanche partner, Alberto (Gil Birmingham). As the brothers plot a final bank heist to complete their scheme, and with the Rangers on their heels, a showdown looms at the crossroads where the values of the Old and New West murderously collide.', 'R', 'Drama', 'David Mackenzie', 'Taylor Sheridan', 2016, 102, 'hell_or_high_water.jpg');
insert into blurays values ('The Leftovers: Season One', 'Damon Lindelof ("Lost") and Tom Perrotta adapted the latter''s novel about life in a small town after many of its residents vanished in a Rapture-like event. The series begins with the third anniversary of the "The Sudden Departure," and the residents of Mapleton, N.Y., have their own ways of dealing with the aftermath of this cataclysmic event, including police chief Kevin Garvey (Justin Theroux), who tries to keep the peace but is also fighting to maintain his sanity, while his daughter, Jill (Margaret Qualley), pushes the boundaries of being a rebellious teen. Elsewhere in town, Rev. Matt Jamison (Christopher Eccleston) swears he has the inside scoop on the worldwide disappearance of 140 million people; Nora Durst (Carrie Coon) finds an unusual career to distract herself after losing her entire family; and a mysterious group called the Guilty Remnant have an uncanny ability to call attention to themselves without uttering a single word. With Ann Dowd, Amy Brenneman and Chris Zylka.', 'NR', 'Drama', 'Mimi Leder', 'Damon Lindelof', 2014, 600, 'the_leftovers_1.jpg');
insert into blurays values ('The Leftovers: Season Two', 'Season 2 opens in Jarden, Texas, aka Miracle, a town known the world over for not losing a single person to the "Sudden Departure," and one where Kevin, Jill, Nora and baby Lily hope to start anew with a clean slate. Preceded by Matt, who''s found a new preaching gig, and his wife, Mary, they''re welcomed by their new neighbors and lifelong residents Erika and John Murphy. The latter, however, is leery of charlatans and carpetbaggers who seek to profit from Miracle''s reputation, but that stature is called into question after three young girls vanish without a trace. Back on the East Coast, Tom goes undercover to lure skeptics from the Guilty Remnant, while Laurie works on a tell-all book to expose the chain-smoking cult''s silent campaign of intimidation. Also starring Ann Dowd, Liv Tyler, Jovan Adepo, Steven Williams and Jasmin Savoy Brown.', 'NR', 'Drama', 'Mimi Leder', 'Damon Lindelof', 2015, 443, 'the_leftovers_2.jpg');
insert into blurays values ('The Lord of the Rings: The Fellowship of the Ring', 'Assisted by a Fellowship of heroes, Frodo Baggins plunges into a perilous trek to take the mystical One Ring to Mount Doom so that it and its magical powers can be destroyed and never possessed by evil Lord Sauron. The astonishing journey begins in the first film of director/co-writer Peter Jackson''s epic trilogy that redefined fantasy filmmaking. This imaginative foray into J.R.R. Tolkien''s Middle-earth won 4 Academy Awards (R)* and earned 13 total nominations including Best Picture.', 'PG-13', 'Action & Adventure', 'Peter Jackson', 'Fran Walsh', 2001, 228, 'the_fellowship_of_the_ring.jpg');
insert into blurays values ('The Lord of the Rings: The Two Towers', 'Frodo and Samwise press on toward Mordor. Gollum insists on being the guide. Can anyone so corrupted by the ring be trusted? Can Frodo, increasingly under the sway of the ring, even trust himself? Meanwhile, Aragorn, drawing closer to his kingly destiny, rallies forces of good for the battles that must come. Director Peter Jackson delivers an amazing second movie that won 2 Academy Awards (R)* and earned 6 total nominations including Best Picture. The journey continues. So do the astonishing spectacle and splendor.', 'PG-13', 'Action & Adventure', 'Peter Jackson', 'Philippa Boyens', 2002, 235, 'the_two_towers.jpg');
insert into blurays values ('Mad Max: Fury Road', 'From director George Miller comes the fourth adventure in the Mad Max film series. In a post-apocalyptic world, Max teams up with a mysterious woman, Furiosa, to try and survive.', 'R', 'Action & Adventure', 'George Miller', 'Brendan McCarthy', 2015, 120, 'mad_max_fury_road.jpg');
insert into blurays values ('Midnight Special', 'A father (Michael Shannon) goes on the run to protect his young son, Alton (Jaeden Lieberher), and uncover the truth behind the boy�s special powers. What starts as a race from religious extremists and local law enforcement quickly escalates to a nationwide manhunt involving the highest levels of the Federal Government. Ultimately his father risks everything to protect Alton and help fulfill a destiny that could change the world forever, in this genre�defying film as supernatural as it is intimately human.', 'PG-13', 'Drama', 'Jeff Nichols', 'Jeff Nichols', 2016, 111, 'midnight_special.jpg');
insert into blurays values ('Mud', 'Mud is an adventure about two boys, Ellis and his friend Neckbone, who find a man named Mud hiding out on an island in the Mississippi. Mud describes fantastic scenarios-he killed a man in Texas and vengeful bounty hunters are coming to get him. He says he is planning to meet and escape with the love of his life, Juniper, who is waiting for him in town. Skeptical but intrigued, Ellis and Neckbone agree to help him. It isn''t long until Mud''s visions come true and their small town is besieged by a beautiful girl with a line of bounty hunters in tow.', 'PG-13', 'Drama', 'Jeff Nichols', 'Jeff Nichols', 2013, 131, 'mud.jpg');
insert into blurays values ('No Country for Old Men', 'When a Vietnam veteran discovers two million dollars while wandering through the aftermath of a Texas drug deal gone horribly awry, his decision to abscond with the cash sets off a violent chain reaction in a stripped-down crime drama from Joel and Ethan Coen. Llewelyn Moss (Josh Brolin) has just stumbled into the find of a lifetime. Upon discovering a bullet-strewn pickup truck surrounded by the corpses of dead bodyguards, Moss uncovers two million dollars in cash and a substantial load of heroin stashed in the back of the vehicle. Later, as an enigmatic killer who determines the fate of his victims with the flip of a coin sets out in pursuit of Moss, the disillusioned Sheriff Bell (Tommy Lee Jones) struggles to contain the rapidly escalating violence that seems to be consuming his once-peaceful Lone Star State town. Woody Harrelson, Javier Bardem, and Kelly MacDonald co-star in a distinctly American crime story that explores timeless biblical themes in a contemporary Southwestern setting. ~ Jason Buchanan, Rovi', 'R', 'Action & Adventure', 'Joel Coen', 'Ethan Coen', 2007, 122, 'no_country_for_old_men.jpg');
insert into blurays values ('The Revenant', 'Inspired by true events, The Revenant is an immersive and visceral cinematic experience capturing one man''s epic adventure of survival and the extraordinary power of the human spirit. In an expedition of the uncharted American wilderness, legendary explorer Hugh Glass (Leonardo DiCaprio) is brutally attacked by a bear and left for dead by members of his own hunting team. In a quest to survive, Glass endures unimaginable grief as well as the betrayal of his confidant John Fitzgerald (Tom Hardy). Guided by sheer will and the love of his family, Glass must navigate a vicious winter in a relentless pursuit to live and find redemption. The Revenant is directed and co-written by renowned filmmaker, Academy Award (R) winner Alejandro G. I��rritu (Birdman, Babel). (C) Fox', 'R', 'Action & Adventure', 'Alejandro Gonz�lez I��rritu', 'Mark L. Smith', 2015, 156, 'the_revenant.jpg');
insert into blurays values ('Sicario', 'In the lawless border area stretching between the U.S. and Mexico, an idealistic FBI agent [Emily Blunt] is enlisted by an elite government task force official [Josh Brolin] to aid in the escalating war against drugs. Led by an enigmatic consultant with a questionable past [Benicio Del Toro], the team sets out on a clandestine journey forcing Kate to question everything that she believes in order to survive. (C) Lionsgate', 'R', 'Action & Adventure', 'Denis Villeneuve', 'Taylor Sheridan', 2015, 121, 'sicario.jpg');
