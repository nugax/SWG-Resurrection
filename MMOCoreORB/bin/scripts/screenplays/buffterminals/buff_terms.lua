
BuffTerminals = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("BuffTerminals", true)


function BuffTerminals:start()
	self:spawnSceneObjects()
end


function BuffTerminals:spawnSceneObjects()

	--Bestine
	spawnSceneObject("tatooine", "object/tangible/beta/beta_terminal_wound.iff", -1294.5, 12, -3603.3, 0, .648643, 0, .761094, 0) 
	
	--Mos Eisley
	spawnSceneObject("tatooine", "object/tangible/beta/beta_terminal_wound.iff", 3517, 5, -4799, 0, -0.0507746, 0, 0.99871, 0) 
	
	--Mos Espa
	spawnSceneObject("tatooine", "object/tangible/beta/beta_terminal_wound.iff", -2897, 5, 2131, 0, 0.879969, 0, -0.475032, 0) 
	
	--Mos Entha
	spawnSceneObject("tatooine", "object/tangible/beta/beta_terminal_wound.iff", 1301, 7, 3121, 0, 0.956802, 0, 0.29074, 0) 
	
	--Coronet
	spawnSceneObject("corellia", "object/tangible/beta/beta_terminal_wound.iff", -133, 28, -4711, 0, 0.755095, 0, -0.655615, 0) 
	
	--Theed
	spawnSceneObject("naboo", "object/tangible/beta/beta_terminal_wound.iff", -4865, 6.5, 4182, 0, -0.33602, 0, 0.941851, 0) 

	
	--spawnSceneObject("endor", "object/tangible/beta/beta_terminal_wound.iff", -1696.47, 205.499, 4936.61, 0, 0.954006, 0, 0.299787, 0)
	--939900

end
