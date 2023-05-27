// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roomnames(rm) {
	var a = "NaN"
	switch rm {
		case rm_blank: a = "a" break;	
		default: a = "NaN" break;
		
		#region Tower
			case tower_entrancehall: a = "OUR GLORIOUS LEADER" break;
			case tower_1: a = "MEDIEVAL COMPLEX" break;
			case tower_secret1: a = "PEPPER'S LAIR" break;
			case tower_2: a = "WEIRDER WEST" break;
			case tower_secret2: a = "DESERT BUS" break;
			case tower_snick: a = "BREAK IN THROWBACK" break;
			case tower_snick2: a = "It's-a-me!" break;
			case tower_3: a = "NO VACATION CRUISE" break;
			case tower_secret3: a = "WASHING ROOM" break;
			case tower_4: a = "21st CENTURY EMPIRE" break;
			case tower_secret4: a = "???" break;
			case tower_5: a = "TERROR NATION" break;
			case tower_secret5: a = "GALLERY OF SOY" break;
			case tower_quickwarp: a = "TOWER SECRET" break;
			case tower_finale: a = "All the way up" break;
			case tower_finale2: a = "Top of the Tower (almost)" break;
			case tower_greenroom: a = "The Green Room" break;
			case tower_prop: a = "Prop Storage" break;
			case tower_top: a = "Wouldn't it be cool if there was like, a level on top of the tower or something?" break;
			// case tower_baby: a = "^$%&^(@)#*%!%^#@!^$%&^(@)#*%!%^#@!^$%&^(@)#*%!%^#@!^$%&^(@)#*%!%^#@!" break;
			case tower_broomcloset: a = "Wrong Mod" break;
			case tower_finalhallway: a = "THE TOWERS BACKBONE" break;
			case tower_escape1: a = "Escape from a Vanishing Tower" break;
			case tower_escape2: a = "He watches" break;
			case tower_escape3: a = "Step by Step" break;
			case tower_escape4: a = "I've got to earn my prize" break;
			case tower_escape5: a = "Scrap Metal" break;
			case tower_escape6: a = "Quickly, to space!" break;
			case tower_escape7: a = "Be Nimble Be Quick" break;
			case tower_escape8: a = "Not the time for games" break;
			case tower_escape9: a = "Air Raid" break;
			case tower_escape10: a = "Makeshift Flight" break;
			case tower_escape11: a = "Prepare for takeoff" break;
			case tower_escape12: a = "Mach 10" break;
			
		
		#endregion
		
		#region W1
		// Entrance
		case entrance_1: a = "WELCOME TO PIZZA TOWER" break;	
		case entrance_lap: a = "Mysterious Pizza" break;	
		case entrance_2: a = "Checkered Hallway" break;	
		case entrance_3: a = "From the Bottom" break;	
		case entrance_4: a = "Guest Room" break;	
		case entrance_5: a = "Jungle Shapes" break;	
		case entrance_6: a = "Where's The Reception?" break;	
		case entrance_7: a = "Super Slump" break;	
		case entrance_8: a = "A City Now?" break;	
		case entrance_9: a = "Swedish Heaven" break;	
		case entrance_10: a = "In the Gutter" break;	
		case entrance_6c: a = "Daring Escape" break;	
		case entrance_secret3: a = "Don't Forget your Moves!" break;	
		case entrance_secret4: a = "Headin' Up" break;	
		case entrance_secret5: a = "Hampster Tube" break;	
		case entrance_treasure: a = "PLACEHOLDER TREASURE NAME" break;	
		
		// Pizzascare
		case medieval_1: a = "PIZZA TOWER IN YE OLDE TIME" break;
		case medieval_2: a = "Valiant and Lazy Knight" break;
		case medieval_3: a = "Thunderstruck" break;
		case medieval_3b: a = "Here's the Kicker" break;
		case medieval_4: a = "Medieval Fantasy" break;
		case medieval_5: a = "Odd Castle Architecture" break;
		case medieval_6: a = "Tomes of Knowledge" break;
		case medieval_7: a = "That's How We Roll" break;
		case medieval_8: a = "Goblin Pit" break;
		case medieval_9: a = "Treasure Room" break;
		case medieval_9b: a = "Clean Money" break;
		case medieval_10: a = "John Throne" break;
		case medieval_secret4: a = "Back n Forth" break;
		case medieval_secret5: a = "Too Heavy and Fat" break;
		case medieval_secret6: a = "Gone Bowling" break;
		case medieval_treasure: a = "PLACEHOLDER TREASURE NAME 2: Electric Boogaloo" break;
		
		// Ruin
		case ruin_1: a = "RUINS OF THE PIZZA TOWER" break;
		case ruin_2: a = "Ruined Exploration" break;
		case ruin_3: a = "This was once a bedroom" break;
		case ruin_3b: a = "And this was my bathroom" break;
		case ruin_4: a = "Explosive Personalitiy" break;
		case ruin_5: a = "Roundabout Route" break;
		case ruin_6: a = "Ancient Architecture" break;
		case ruin_7: a = "CAUTION: RAT" break;
		case ruin_8: a = "And who might you be?" break;
		case ruin_9: a = "No Crackers" break;
		case ruin_10: a = "Very Very Old Cheese" break;
		case ruin_11: a = "Crumbling Pillar" break;
		case ruin_12: a = "Ascent to Madness" break;
		case ruin_13: a = "Cheese is what keeps me alive" break;
		case ruin_secret1: a = "Hot Potato" break;
		case ruin_secret4: a = "Riding on Cheese" break;
		case ruin_secret6: a = "Duck and Cover" break;
		case ruin_treasure: a = "MORE PLACHOLDER" break;
		
		// Dungeon
		case dungeon_1: a = "Pizza Tower in Hell!!!" break;
		case dungeon_2: a = "Smells Like Death" break;
		case dungeon_3: a = "Pizza Cutter of DOOM!" break;
		case dungeon_4: a = "Very Hot Sauce" break;
		case dungeon_5: a = "It's So Hot" break;
		case dungeon_6: a = "The Opposite of Absolute Zero" break;
		case dungeon_7: a = "Sharp Objects" break;
		case dungeon_8: a = "Winding Longway" break;
		case dungeon_9: a = "Last Layer of Hell" break;
		case dungeon_10: a = "The Devil Himself" break;
		case dungeon_secret1: a = "HELLISH OBSTACLES" break;
		case dungeon_secret2: a = "4th Degree Burns" break;
		case dungeon_secret3: a = "Flying Fire Ass" break;
		case dungeon_treasure: a = "HELLISH PLACEHOLDER" break;
		#endregion
		
		#region W2
		// Badlands
		case badland_1: a = "WESTERN PIZZA TOWER" break;
		case badland_2: a = "Ancient Rituals" break;
		case badland_3: a = "Very Convenient" break;
		case badland_4: a = "On the Cliffside" break;
		case badland_5: a = "Cave Mining" break;
		case badland_5a: a = "130 Thousand Scoville" break;
		case badland_5b: a = "Just out of reach" break;
		case badland_6: a = "Cattle on the Loose!" break;
		case badland_7: a = "You Cannot Walk" break;
		case badland_8: a = "Impassable Cow" break;
		case badland_9: a = "I WANT TO BELIEVE" break;
		case badland_10: a = "Not So Convenient" break;
		case badland_escape1: a = "Cave Dweller" break;
		case badland_mart1: a = "One to go, Please" break;
		case badland_mart2: a = "Theyre Minerals Not Rocks" break;
		case badland_mart3: a = "Look what the cat dragged in" break;
		case badland_mart4: a = "Localized ENTIRELY in your Pizzamart?" break;
		case badland_mart5: a = "Hot Wing Flash Sale" break;
		case badland_secret1: a = "This is a race Against the Clock" break;
		case badland_secret2: a = "Craziest Spice Kick" break;
		case badland_secret3: a = "Cow Crossing" break;
		case badland_treasure: a = "PLACING THAT HOLDER" break;
		
		// Wasteyard
		case graveyard_1: a = "PIZZA TOWER WITH THE DEAD" break;
		case graveyard_2: a = "duuuude do a kick flip bro" break;
		case graveyard_3: a = "The Pit" break;
		case graveyard_4: a = "Scared to Death" break;
		case graveyard_5: a = "Soul Searching" break;
		case graveyard_5b: a = "Ghouliday" break;
		case graveyard_5c: a = "Spicy Peppers" break;
		case graveyard_6: a = "GHOSTS... CANT... DIE!" break;
		case graveyard_7: a = "Close Call" break;
		case graveyard_9: a = "Vengance Beyond Death" break;
		case graveyard_10: a = "Grave Digging" break;
		case graveyard_secret1: a = "Bucket of Chicken" break;
		case graveyard_secret2: a = "Retirement Home" break;
		case graveyard_secret3: a = "By the skin of your teeth" break;
		case graveyard_treasure: a = "PLACEHOOOOOOOOOOOOOLDER..." break;
		
		// Farm
		case farm_1: a = "The Hero Return" break;
		case farm_2: a = "Pizza Tower on the Meadow" break;
		case farm_3: a = "Hate the Farmer Not the Harvest" break;
		case farm_4: a = "Rancher Fly by" break;
		case farm_4b: a = "An Upper Decker" break;
		case farm_5: a = "Back to the Barnyard" break;
		case farm_6: a = "Secret Attic" break;
		case farm_7: a = "I'm hooked on you" break;
		case farm_8: a = "Big Dumb Leap" break;
		case farm_9: a = "A TT I See" break;
		case farm_9b: a = "Morbid Mort" break;
		case farm_10: a = "Firing Range" break;
		case farm_11: a = "Burning down the barn" break;
		case farm_12: a = "Torched to the 3rd degree" break;
		case farm_12b: a = "One Big Fall" break;
		case farm_13: a = "It's not too late for my mercy" break;
		case farm_cube: a = "cube world" break;
		case farm_secret1: a = "+100 Assist" break;
		case farm_secret2: a = "Neck Strain" break;
		case farm_secret3: a = "Liar Liar Pants on Fire" break;
		case farm_treasure: a = "I CAN WRITE WHATEVER I WANT FOR THESE ROOM NAMES AND THEY CANT STOP ME. " break;
		
		case saloon_1: a = "PIZZA TOWER AT THE BAR" break;
		case saloon_2: a = "Off to the races!" break;
		case saloon_2b: a = "Cooked Chicken" break;
		case saloon_3: a = "RAT ALARM" break;
		case saloon_3b: a = "Big Meanie Weenie" break;
		case saloon_4: a = "Local Drunkard" break;
		case saloon_4b: a = "Big Long Weenie" break;
		case saloon_5: a = "Horse Betting" break;
		case saloon_5b: a = "CHUG CHUG CHUG CHUG" break;
		case saloon_6: a = "Fresh Oats" break;
		case saloon_6b: a = "Pick a card..." break;
		
		
		#endregion
		
		#region W3
			// Plage
			case plage_entrance: a = "PIZZA TOWER ON THE SEASIDE" break;
			case plage_beach1: a = "Relaxing Villa" break;
			case plage_shipmain: a = "THE SS SHIP" break;
			case plage_ship1: a = "Rolling Barrel" break;
			case plage_ship2: a = "Be careful with that thing!" break;
			case plage_ship3: a = "Barreling Through" break;
			case plage_beach2: a = "FIRE!!!" break;
			case plage_cavern1: a = "Castaway" break;
			case plage_cavern2: a = "Mayday" break;
			case plage_cavern3: a = "Unfortunate Situation" break;
			case plage_shiptop: a = "Going down with the ship" break;
			case plage_lap: a = "Pirate Legend" break;
			case beach_secret1: a = "But It's Right There!!!" break;
			case beach_secret2: a = "Swimming with the fishes" break;
			case beach_secret3: a = "True Captain" break;
			case plage_treasure: a = "CAPTAIN'S PLACEHOLDER" break;
			
			// Forest
			case forest_1: a = "BEWARE THE TOWER'S MUSHROOMS" break;
			case forest_2: a = "Someone's stealing my treasure!" break;
			case forest_3: a = "BEWARE: MUSHROOMS" break;
			case forest_G1: a = "Gustavo and Brick" break;
			case forest_G1b: a = "My Newest Creation: Crustavo" break;
			case forest_G2: a = "Pizzamancy" break;
			case forest_G3: a = "Back to umm.... uhhh..." break;
			case forest_5: a = "30 Minutes or Less" break;
			case forest_6: a = "Just doing my job, ma'am." break;
			case forest_7: a = "Funniest thing i've ever seen" break;
			case forest_G4: a = "Before it gets cold" break;
			case forest_G5: a = "Quick Delivery" break;
			case forest_8: a = "WARNING: GNOME ALARM." break;
			case forest_9: a = "Weeeee!" break;
			case forest_10: a = "Outta my way" break;
			case forest_12: a = "Very Very Very Secretive" break;
			case forest_14: a = "I better be getting a tip..." break;
			case forest_15: a = "Hey, take this!" break;
			case forest_16: a = "2 Delivery Drivers" break;
			case forest_17: a = "Hot Potato" break;
			case forest_john: a = "Rush Hour" break;
			case forest_escape1: a = "Dedicated Delivery" break;
			case forest_escape2: a = "By the Minute" break;
			case forest_lap: a = "Working Overtime" break;
			case forest_secret1: a = "Bouncy Bouncy" break;
			case forest_secret2: a = "Maybe dont beware" break;
			case forest_secret3: a = "Gustavo Training Regimine" break;
			case forest_treasure: a = "WAIT A SECOND... THIS ISN'T A PLACEHOLDER TREASURE... THIS IS A REAL ONE!!! WHAT?!?!?!?!?" break;
			
			// Space
			case space_1: a = "PIZZA TOWER IN SPAAAAAAAAAAACE!" break;
			case space_2: a = "First Contact" break;
			case space_3: a = "Cause I'm a rocket man" break;
			case space_4: a = "A long long time" break;
			case space_5: a = "Otherworldly" break;
			case space_6: a = "Flying outta control" break;
			case space_7: a = "Deadly Drop" break;
			case space_8: a = "The Reaches of Deep Space" break;
			case space_9: a = "Sometimes, I dream about cheese" break;
			case space_10: a = "Alien Extinction" break;
			case space_11: a = "Cut the cheese" break;
			case space_11b: a = "Teleportation Frustration" break;
			case space_12: a = "The one place that hasn't been corrupted by capitalism" break;
			case space_lap: a = "Station 13" break;
			case space_secret1: a = "Up Up and Away" break;
			case space_secret2: a = "Rocket Fist" break;
			case space_secret3: a = "Teleportation Frustration" break;
			case space_treasure: a = "ALIEN PLACEHOLDER" break;
			
			//Golf 
			case minigolf_1: a = "PIZZA TOWER ON THE GOLF COURSE" break;
			case minigolf_2: a = "WELCOME TO... GOLF" break;
			case minigolf_3: a = "On Par" break;
			case minigolf_4: a = "Country Club" break;
			case minigolf_5: a = "Good Golfin'" break;
			case minigolf_6: a = "Double Bogey" break;
			case minigolf_7: a = "Grease Elevator" break;
			case minigolf_8: a = "Hole in One" break;
			case minigolf_9: a = "Kicked Around" break;
			case minigolf_10: a = "Must have perfume on" break;
			case minigolf_11: a = "2 Golf Balls" break;
			case minigolf_lap: a = "Retirement" break;
			case minigolf_secret1: a = "Indentured Servitude" break;
			case minigolf_secret2: a = "Bowling Channel" break;
			case minigolf_secret3: a = "I BANISH THEE..." break;
			case minigolf_treasure: a = "I HATE GOLF I HATE GOLF I HATE GOLF" break;
			
		#endregion
		
		#region W4
		
			// Streets
			case street_intro: a = "PIZZA TOWER IN THE CITY" break;
			case street_1: a = "Taxi!" break;
			case street_2: a = "Reeks of smog" break;
			case street_3: a = "Cigarette Butts" break;
			case street_4: a = "Chinatown" break;
			case street_5: a = "The Open Road" break;
			case street_bacon: a = "Smells good..." break;
			case street_house1: a = "Hog Wild" break;
			case street_house2: a = "In custody" break;
			case street_house3: a = "You're going away for a long long time..." break;
			case street_house4: a = "Inhaling Helium" break;
			case street_house5: a = "One Bad Piggy" break;
			case street_jail: a = "Doing Real Time" break;
			case street_john: a = "Escape from the City" break;
			case street_secret1: a = "Piggin' out" break;
			case street_secret2: a = "Hang in there" break;
			case street_secret3: a = "High Pitched Voice" break;
			case street_treasure: a = "PLACEOINKER" break;
			
			// Sewers
			case sewer_1: a = "PIZZA TOWER IN THE SLUDGE" break;
			case sewer_2: a = "Sewer Ninja" break;
			case sewer_3: a = "Titty Twister" break;
			case sewer_4: a = "I'm Not a Plumber" break;
			case sewer_5: a = "Covered in Goo?" break;
			case sewer_6: a = "One Man's Trash" break;
			case sewer_7: a = "Sewer Slippin'" break;
			case sewer_8: a = "Comically Placed	 Banana" break;
			case sewer_9: a = "Throw me Away" break;
			case sewer_10: a = "Stop taking my money!" break;
			case sewer_11: a = "Trash King" break;
			case sewer_12: a = "Pipe Dream" break;
			case sewer_secret1: a = "Guessing Game" break;
			case sewer_secret2: a = "Grab my hand!" break;
			case sewer_secret3: a = "Here comes the trashman" break;
			case sewer_treasure: a = "STINKY PLACEHOLDER" break;
			
			// Industrial
			case industrial_1: a = "PIZZA TOWER 9 to 5" break;
			case industrial_2: a = "Domo Arigato" break;
			case industrial_3: a = "Lose some weight, fatty" break;
			case industrial_4: a = "Get your hands off me!" break;
			case industrial_5: a = "Am I living in a cardboard box?" break;
			case industrial_lap: a = "Hidden Pizza" break;
			case industrial_secret1: a = "Line em' up and knock em' down" break;
			case industrial_secret2: a = "Cooking a Bomb" break;
			case industrial_secret3: a = "Flywrench" break;
			case industrial_treasure: a = "MACHINE MADE PLACEHOLDER" break;
			
			// Freezer
			case freezer_1: a = "FROZEN PIZZA TOWER" break;
			case freezer_2: a = "Very Festive" break;
			case freezer_3: a = "Gustavo is here" break;
			case freezer_4: a = "Blast off" break;
			case freezer_5: a = "Brrrrrrr..." break;
			case freezer_6: a = "It's Getting Hot in Here" break;
			case freezer_7: a = "Icicle Pillars" break;
			case freezer_9: a = "Negative Forty" break;
			case freezer_11: a = "Jetpack Joyride" break;
			case freezer_12: a = "It's Claus!!" break;
			case freezer_13: a = "The Ultimatium" break;
			case freezer_15: a = "Back of the Fridge" break;
			case freezer_16 : a = "Snowmen Crossing" break;
			case freezer_escape1: a = "Frozen Solid" break;
			case freezer_upgrade: a = "Time to turn up the heat" break;
			case freezer_lap: a = "Frostburn" break;
			case freezer_secret1: a = "Cool Moves!" break;
			case freezer_secret2: a = "Watch me fly, Mama!" break;
			case freezer_secret3: a = "Ruining Christmas" break;
			case freezer_treasure: a = "PLACEHOLDER FROM THE ICE AGE" break;
		
		#endregion
		
		#region W5
		
			// Pizzascare
			case chateau_1: a = "Pizza Tower during Halloween!" break;
			case chateau_2: a = "Homemade Exorcism" break;
			case chateau_2b: a = "Inconvenient Cleaning" break;
			case chateau_3: a = "A G- G- GHOOOST!" break;
			case chateau_4: a = "Dont believe everything you see on tv" break;
			case chateau_5: a = "Goblins and Also Ghosts" break;
			case chateau_6: a = "Grave Desecration" break;
			case chateau_7: a = "Rollin Down" break;
			case chateau_8: a = "Spooky Hallway" break;
			case chateau_9: a = "Pitstop" break;
			case chateau_lap: a = "Pizzard Council" break;
			case chateau_secret1: a = "Spirits Begone!" break;
			case chateau_secret2: a = "Down on Slopes" break;
			case chateau_secret3: a = "The Goblin Room" break;
			case chateau_treasure: a = "THE TERRIFYING PLACEHOLDER" break;
		
			// Mansion
			case mansion_start: a = "PIZZA TOWER AT THE SPOOKY MANSION" break;
			case mansion_foyer: a = "Take off your shoes" break;
			case mansion_foyer_2: a = "Get comfortable" break;
			case mansion_1_1: a = "The Guest Room" break;
			case mansion_1_2: a = "My own clone!" break;
			case mansion_1_3: a = "Dubiously Legitimate Peppino" break;
			case mansion_b1_1: a = "MANSION... BASEMENT! FIND IT!!" break;
			case mansion_b1_2: a = "Gee, it's kinda dark..." break;
			case mansion_b2_1: a = "Arachnophobia " break;
			case mansion_b2_2: a = "Face your fears" break;
			case mansion_b2_3: a = "AAAHHHHHHHH!" break;
			case mansion_2_1: a = "Unliving Room" break;
			case mansion_2_2: a = "The Portrait Room" break;
			case mansion_2_john: a = "Esteemed Guest" break;
			case mansion_escape1: a = "You think they got enough rooms?" break;
			case mansion_escape2: a = "Attic Escape" break;
			case mansion_escape3: a = "Crashing Down" break;
			case mansion_treasure: a = "FAKE PLACEHOLDER" break;
		
			// Kids Party
			case kidsparty_1: a = "Pizza Tower during the Nightshift" break;
			case kidsparty_basementsecret: a = "Warning: Fall" break;
			case kidsparty_floor1_1: a = "Security!" break;
			case kidsparty_floor1_2: a = "Tread Lightly" break;
			case kidsparty_floor1_3: a = "In the Rafters" break;
			case kidsparty_floor2_1: a = "The Stretcher" break;
			case kidsparty_floor2_2: a = "Ooey Gooey" break;
			case kidsparty_floor2_3: a = "Wild Goose Chase" break;
			case kidsparty_floor3_1: a = "Ventriloquism" break;
			case kidsparty_floor3_2: a = "It pulls the strings" break;
			case kidsparty_floor3_3: a = "All there really is to say on the matter" break;
			case kidsparty_floor4_1: a = "Generic Slasher" break;
			case kidsparty_floor4_2: a = "Butchered" break;
			case kidsparty_floor4_3: a = "RUN!!!" break;	
			case kidsparty_john: a = "Payback Time" break;	
			case kidsparty_escape1: a = "Oh My God Its Jay Leno" break;	
			case kidsparty_escape2: a = "Clown Party" break;	
			case kidsparty_secret1: a = "Whos Hungry?" break;	
			case kidsparty_secret2: a = "Wow this secret kind of sucks huh" break;	
			case kidsparty_secret3: a = "if you see this DM @MrUnown#3718 saying \"Demo 3 was really good!!!\"" break;	
			case kidsparty_treasure: a = "SPOOKY PLACEHOLDER" break;	
		
			// War
			case war_1: a = "PIZZA TOWER ON THE BATTLEFIELD" break;
			case war_2: a = "Shooting Gallery" break;
			case war_3: a = "On the Frontlines" break;
			case war_6: a = "Deep in the trenches" break;
			case war_7: a = "Air Support" break;
			case war_8: a = "TAAAAAAAANK!" break;
			case war_9: a = "Getting out of Dodge" break;
			case war_10: a = "Self Made Missle Launcher" break;
			case war_11: a = "Cloning Facility" break;
			case war_12: a = "Missle Daycare" break;
			case war_12b: a = "Close Quarter Combat" break;
			case war_13: a = "Victory Day" break;
			case war_lap: a = "Vicious Cycle" break;
			case war_secret1: a = "300 Confirmed Kills" break;
			case war_secret2: a = "They were just civillians!!!" break;
			case war_secret3: a = "You don't belong in this world!" break;
			case war_treasure: a = "PLACEHOLDER PROPOGANDA" break;
			
		#endregion
		
		case champ_1: a = "PIZZA TOWER ROAD" break;
		case champ_2: a = "Turn Around" break;
		case champ_3: a = "All the way up" break;
		case champ_4: a = "The Knight's Throne" break;
		case champ_5: a = "The Pit" break;
		case champ_6: a = "Greedy Grinner" break;
		case champ_6_1: a = "The Squire Returneth" break;
		case champ_7: a = "Alas, The King comes out to Play" break;
		case champ_8: a = "Another man's treasure" break;
		case champ_9: a = "Get over it" break;
		case champ_10: a = "Stargazing" break;
		case champ_11: a = "Seeing stars" break;
		case champ_john: a = "Truly this is the Eggplant Build" break;
		case champ_escape1: a = "Yeeoowch thats hot!" break;
		case champ_escape2: a = "Cutting the cheese" break;
		case champ_escape3: a = "Taking Flight" break;
		case champ_escape4: a = "Scraping ice off the windows" break;
		case champ_escape5: a = "To go even further beyond" break;
		case champ_escape6: a = "Extinction Event" break;
		case champ_conglaturation: a = "YOU'RE WINNER!" break;
		case champ_golf: a = "Just kidding there's more!" break;
		case champ_lap: a = "The Garden of the King" break;
		case champ_treasure: a = "END ALL BE ALL OF PLACEHOLDERS" break;
		case champ_secret1: a = "Parry them Parry them Parry them" break;
		case champ_secret2: a = "September Build Level Design" break;
		case champ_secret3: a = "Brick look out!" break;
		
		#region Other Rooms
			case strongcold_arena: a = "Ho Ho Ho!" break;
			case pinball_arena: a = "Deep Dish 13" break;
			case kungfu_arena: a = "I've got a black belt, and a green, and red, and blue, and purple, and brown, and blourple, and..." break;
			case clown_arena: a = "Who's laughing now?" break;
			case lightsout_arena: a = "NO." break;
			case tower_arena: a = "Who will stop you?" break;
		#endregion	
	}
	return a
}