
sp_black_market_dealers = ScreenPlay:new {
	numberOfActs = 1, 
	questString = "bm_quest_task",
	states = {}, 
}

registerScreenPlay("sp_black_market_dealers", true)

function sp_black_market_dealers:start() 
    self:spawnMobiles()
end 

function sp_black_market_dealers:spawnMobiles()


    -- Spawn our characters for dealers and their locations with pointers.
    spawnMobile("corellia", "black_market_dealer", 1, -121, 28, -4696, -1, 0 )
	spawnMobile("naboo", "black_market_dealer", 1, -4805, 6, 4141, -1, 0 )
    --Terra Nova
    spawnMobile("corellia", "black_market_dealer", 1, -91, 29, -5714 , -1, 0)
	
end


black_market_convo_handler = Object:new {
	tstring = "myconversation"
 }

function black_market_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
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
	--*****************************************************************************************************************************************		
			-- Make Sale // Add items
			elseif ( optionLink == "kit" and credits >= 2500) then
				creature:subtractCashCredits(2500)
				local pItem = giveItem(pInventory, "object/tangible/item/vehicle_customization.iff", -1)
				nextConversationScreen = conversation:getScreen("deny_quest")
			elseif ( optionLink == "SithSpeeder" and credits >= 500000) then
				creature:subtractCashCredits(500000)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/sith_speeder_deed.iff", -1)
				nextConversationScreen = conversation:getScreen("SithSpeeder")
			elseif ( optionLink == "BarcSpeeder" and credits >= 250000) then
				creature:subtractCashCredits(250000)
				local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/barc_speeder_deed.iff", -1)
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
--*****************************************************************************************************************************************

function black_market_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
	-- Plays the screens of the conversation.
	return conversationScreen
end
