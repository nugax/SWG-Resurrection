
veh_merchS = ScreenPlay:new {
	numberOfActs = 1, 
	questString = "veh_merch_task",
	states = {}, 
}

registerScreenPlay("veh_merchS", true)

function veh_merchS:start() 
	-- Spawn our character into the world, setting pLarry a pointer variable we can use to check or change his state.
	local pLarry = spawnMobile("tatooine", "veh_merch", 1, -6560, 0, -4731, -1, 0 )
	-- Load some decorations
	spawnSceneObject("tatooine", "object/tangible/camp/camp_pavilion_s1.iff", -6563, 0, -4730, 0, 0, 0, 1, 0)
	spawnSceneObject("tatooine", "object/tangible/furniture/all/frn_all_data_terminal_free_s2.iff", -6561, 0, -4730, 0, 0, 0, 1, 0)
	spawnSceneObject("tatooine", "object/static/vehicle/static_speeder_bike.iff", -6555, 0, -4730, 0, 0.0255217, 0, 0.999674, 0)
	spawnSceneObject("tatooine", "object/static/vehicle/static_swoop_bike.iff", -6563, 0, -4725, 0, 0.0582651, 0, 0.998301, 0)
	spawnSceneObject("tatooine", "object/static/vehicle/e3/landspeeder.iff", -6555, 0, -4725, 0, 0.729313, 0, 0.68418, 0)
	spawnSceneObject("tatooine", "object/mobile/vehicle/landspeeder_av21.iff", -6551, 0, -4730, 0, 0.641522, 0, 0.767105, 0)
	spawnSceneObject("tatooine", "object/mobile/vehicle/speederbike_flash.iff", -6551, 0, -4725, 0, -0.103943, 0, 0.994583, 0)
	spawnSceneObject("tatooine", "object/mobile/vehicle/sith_speeder.iff", -6566, 0, -4731, 0, -0.103943, 0, 0.994583, 0)
end

 
veh_merch_convo_handler = Object:new {
	tstring = "myconversation"
 }

function veh_merch_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
-- Assign the player to variable creature for use inside this function.
	local creature = LuaCreatureObject(conversingPlayer)
	
	-- Get the last conversation to determine whetehr or not we're  on the first screen
	local convosession = creature:getConversationSession()
	lastConversation = nil
	local conversation = LuaConversationTemplate(conversationTemplate)
	local nextConversationScreen 
	
	-- If there is a conversation open, do stuff with it
	if ( conversation ~= nil ) then
		-- check to see if we have a next screen
		if ( convosession ~= nil ) then
			 local session = LuaConversationSession(convosession)
			 if ( session ~= nil ) then
			 	lastConversationScreen = session:getLastConversationScreen()
			 end
		end
		
		-- Last conversation was nil, so get the first screen
		if ( lastConversationScreen == nil ) then
			nextConversationScreen = conversation:getInitialScreen()
		else
		-- Start playing the rest of the conversation based on user input
			local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
			
			-- Set variable to track what option the player picked and get the option picked
			local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
			nextConversationScreen = conversation:getScreen(optionLink)
			
			-- Get some information about the player.
			local credits = creature:getCashCredits()
			local pInventory = creature:getSlottedObject("inventory")
			local inventory = LuaSceneObject(pInventory)
			
			-- Bail if inventory is full
			if (SceneObject(pInventory):isContainerFullRecursive()) then
				nextConversationScreen = conversation:getScreen("insufficient_space") 
				creature:sendSystemMessage("You do not have enough inventory space")	
			
			-- Make Sale // Add items
			elseif ( optionLink == "kit" and credits >= 2500) then
				creature:subtractCashCredits(2500)
				local pItem = giveItem(pInventory, "object/tangible/item/vehicle_customization.iff", -1)
				nextConversationScreen = conversation:getScreen("deny_quest")
			elseif ( optionLink == "SithSpeeder" and credits >= 500000) then
				creature:subtractCashCredits(500000)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/sith_speeder.iff", -1)
				nextConversationScreen = conversation:getScreen("SithSpeeder")
			elseif ( optionLink == "BarcSpeeder" and credits >= 250000) then
				creature:subtractCashCredits(250000)
				--local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/barc_speeder_deed.iff", -1)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/pod_racer_one_deed.iff", -1)
				nextConversationScreen = conversation:getScreen("BarcSpeeder")
			elseif ( optionLink == "PodRacer1" and credits >= 800000) then
				creature:subtractCashCredits(800000)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/pod_racer_one_deed.iff", -1)
				nextConversationScreen = conversation:getScreen("PodRacer1")
			elseif ( optionLink == "PodRacer2" and credits >= 800000) then
				creature:subtractCashCredits(800000)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/pod_racer_two_deed.iff", -1)
				nextConversationScreen = conversation:getScreen("PodRacer2")
			elseif ( optionLink == "ImpBarc" and credits >= 650000) then
				creature:subtractCashCredits(650000)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/barc_speeder_imperial_deed.iff", -1)
				nextConversationScreen = conversation:getScreen("ImpBarc")
			elseif ( optionLink == "RebBarc" and credits >= 650000) then
				creature:subtractCashCredits(650000)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/barc_speeder_rebel_deed.iff", -1)
				nextConversationScreen = conversation:getScreen("RebBarc")
			else			
				nextConversationScreen = conversation:getScreen("insufficient_funds")
				creature:sendSystemMessage("You have insufficient funds")
			end
		end
	end
	-- end of the conversation logic.
	return nextConversationScreen
end


function veh_merch_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	-- Plays the screens of the conversation.
	return conversationScreen
end
