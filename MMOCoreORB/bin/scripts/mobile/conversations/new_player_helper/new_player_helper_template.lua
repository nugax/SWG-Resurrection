new_player_helper_template = ConvoTemplate:new {
	initialScreen = "first_screen",
	templateType = "Lua",
	luaClassHandler = "new_player_helper_convo_handler",
	screens = {}
}



new_player_helper_first_screen = ConvoScreen:new {
	id = "first_screen",
	leftDialog = "",
	customDialogText = "Welcome to SWG Resurrection. I am C13-P2. I am here to help you along your journey into SWG. How can I help?",
	stopConversation = "false",
	options = {
		{"Where am I?", "whereami"},
		{"What should I do first?", "whatshouldido"},
		{"Where can I find help?", "help"},
		{"How do I move around the Galaxy?", "move"},
		{"I chose the wrong profession. How can I change it?", "profession"},
		{"Where or how do I get money?", "money"},
		{"Where is everyone else in the Galaxy?", "everyoneelse"},
	}
}
new_player_helper_template:addScreen(new_player_helper_first_screen);


new_player_helper_whereami = ConvoScreen:new {
	id = "whereami",
	leftDialog = "",
	customDialogText = "You are in one of the Galaxy starting cities. These are static cities and will always be here. Use M or CTL-V to view your map. You can travel anywhere you like.",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_whatshouldido = ConvoScreen:new {
	id = "whatshouldido",
	leftDialog = "",
	customDialogText = "It's not my place to tell you how to play, but I would suggest finding a weapon and start taking missions from the mission terminals, located everywhere. You can also ask other players. If you need to buy items, check the Bazaar, located in every city. Also check the Auction chat tab, or look for player vendors. The forum on the website is a good last resort.",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_help = ConvoScreen:new {
	id = "help",
	leftDialog = "",
	customDialogText = "You can add our chat channel Resurrection by following the instructions in the Help Desk. Go to our website: www.swgresurrection.com to find out more! Or ask a person in game!",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_move = ConvoScreen:new {
	id = "move",
	leftDialog = "",
	customDialogText = "You can move many ways. You can run. You can use your vehicles. You can take a shuttleport around your current planet. Or you can go to a different planet at a starport!",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_profession = ConvoScreen:new {
	id = "profession",
	leftDialog = "",
	customDialogText = "SWG Resurrection allows you to change your profession or class at any time. Unlike other games, all you have to do in order to change your selected profession is drop your currently attained skills, and starting doing something else. Then train in that area. Post in the forums if you have questions or ask someone in game. They will help you, I'm sure!",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_money = ConvoScreen:new {
	id = "money",
	leftDialog = "",
	customDialogText = "In SWG Resurrection, money is handled in the form of credits. You have credits in the bank and credits on your player. You can earn credits by selling items on the Auction House (Bazaar) or to other players. You can create a vendor or store and sell items. You can earn money by tips if you are a service based character (dancer, doctor). The easiest way starting out is to run missions from the mission terminals located all over the Galaxy and every city. You can run a mission based on your class, or general missions, and earn plenty of credits getting started. Look on the SWG Resurrection forums for opportunities for making credits. ",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_everyoneelse = ConvoScreen:new {
	id = "everyoneelse",
	leftDialog = "",
	customDialogText = "Players are all over. Some are on other planets in the wilderness hunting or gathering. Some are trying to become a Jedi. Some are preforming in Cantinas. Some are in big cities such as Theed on Naboo, or Coronet on Corellia. Add the Resurrection chat tab to chat with players Galaxy wide or use the Auction channel for business opportunities!",
	stopConversation = "true",
	options = {	
	}
}
--register convos
new_player_helper_template:addScreen(new_player_helper_whereami);
new_player_helper_template:addScreen(new_player_helper_whatshouldido);
new_player_helper_template:addScreen(new_player_helper_help);
new_player_helper_template:addScreen(new_player_helper_move);
new_player_helper_template:addScreen(new_player_helper_profession);
new_player_helper_template:addScreen(new_player_helper_money);
new_player_helper_template:addScreen(new_player_helper_everyoneelse);




new_player_helper_deny_quest = ConvoScreen:new {
	id = "deny_quest",
	leftDialog = "",
	customDialogText = "May the force be with you, sir. Please don't recycle me!",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_template:addScreen(new_player_helper_deny_quest);


new_player_helper_insufficient_funds = ConvoScreen:new {
	id = "insufficient_funds",
	leftDialog = "",
	customDialogText = "You have no credits.",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_template:addScreen(bm_merch_insufficient_funds);


new_player_helper_insufficient_space = ConvoScreen:new {
	id = "insufficient_space",
	leftDialog = "",
	customDialogText = "You're not that strong, make some space and try again.",
	stopConversation = "true",
	options = {	
	}
}
new_player_helper_template:addScreen(new_player_helper_insufficient_space);


addConversationTemplate("new_player_helper_template", new_player_helper_template);
