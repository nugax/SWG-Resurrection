black_market_template = ConvoTemplate:new {
	initialScreen = "first_screen",
	templateType = "Lua",
	luaClassHandler = "black_market_convo_handler",
	screens = {}
}



bm_first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "",
	customDialogText = "Welcome to The Black Market! You didn't see me, remember! Don't try to haggle, my prices are firm and will change based on availability!",
	stopConversation = "false",
	options = {
		{"Sith Speeder (500,000)", "SithSpeeder"},
		{"Barc Speeder (250,000)", "BarcSpeeder"},
		{"Ord Pedrovia PodRacer (800,000)", "PodRacer1"},
		{"GPE-3130 PodRacer (800,000)", "PodRacer2"},
		{"Imperial Barc Speeder (650,000)", "ImpBarc"},
		{"Rebel Barc Speeder (650,000)", "RebBarc"},
		{"Customization Kit (250)", "kit"},
	}
}
black_market_template:addScreen(bm_first_screen);


bm_merch_sithspeeder = ConvoScreen:new {
	id = "SithSpeeder",
	leftDialog = "",
	customDialogText = "You didn't get that Sith Speeder here! *looks away*",
	stopConversation = "true",
	options = {	
	}
}
bm_merch_barcspeeder = ConvoScreen:new {
	id = "BarcSpeeder",
	leftDialog = "",
	customDialogText = "Don't tell anyone, but that Barc might not be exactly, mine. I'd scratch the ID numbers off of it if I were you.",
	stopConversation = "true",
	options = {	
	}
}
bm_merch_podracer1 = ConvoScreen:new {
	id = "PodRacer1",
	leftDialog = "",
	customDialogText = "One of our finest Pod Racers in the land. Imported directly from Tatooine. Can't exactly say how, though. *looks away*",
	stopConversation = "true",
	options = {	
	}
}
bm_merch_podracer2 = ConvoScreen:new {
	id = "PodRacer2",
	leftDialog = "",
	customDialogText = "One of our finest Pod Racers in the land. Imported directly from Tatooine. Can't exactly say how, though. *looks away*",
	stopConversation = "true",
	options = {	
	}
}
bm_merch_impbarc = ConvoScreen:new {
	id = "ImpBarc",
	leftDialog = "",
	customDialogText = "Imperial Labeled BARC Speeder. I'd stay away from the Stormtroopers though. They might not like the fact you have it.",
	stopConversation = "true",
	options = {	
	}
}
bm_merch_rebbarc = ConvoScreen:new {
	id = "RebBarc",
	leftDialog = "",
	customDialogText = "Rebel Labeled BARC Speeder. We stole this, er bought this, from the Rebel Base on Dantooine. You might outta' avoid the Rebel inventory keepers, though.",
	stopConversation = "true",
	options = {	
	}
}
bm_merch_kit = ConvoScreen:new {
	id = "kit",
	leftDialog = "",
	customDialogText = "Now you can chop your ride..",
	stopConversation = "true",
	options = {	
	}
}
--register convos
black_market_template:addScreen(bm_merch_kit);
black_market_template:addScreen(bm_merch_sithspeeder);
black_market_template:addScreen(bm_merch_barcspeeder);
black_market_template:addScreen(bm_merch_podracer1);
black_market_template:addScreen(bm_merch_podracer2);
black_market_template:addScreen(bm_merch_impbarc);
black_market_template:addScreen(bm_merch_rebbarc);




bm_merch_deny_quest = ConvoScreen:new {
	id = "deny_quest",
	leftDialog = "",
	customDialogText = "Scram, Womp Rat Scum!",
	stopConversation = "true",
	options = {	
	}
}
black_market_template:addScreen(bm_merch_deny_quest);


bm_merch_insufficient_funds = ConvoScreen:new {
	id = "insufficient_funds",
	leftDialog = "",
	customDialogText = "Your mind tricks won't work here... bring me some money!",
	stopConversation = "true",
	options = {	
	}
}
black_market_template:addScreen(bm_merch_insufficient_funds);


bm_merch_insufficient_space = ConvoScreen:new {
	id = "insufficient_space",
	leftDialog = "",
	customDialogText = "You're not that strong, make some space and try again.",
	stopConversation = "true",
	options = {	
	}
}
black_market_template:addScreen(bm_merch_insufficient_space);


addConversationTemplate("black_market_template", black_market_template);
