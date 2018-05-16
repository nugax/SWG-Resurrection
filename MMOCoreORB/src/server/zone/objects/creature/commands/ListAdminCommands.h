/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef LISTADMINCOMMANDS_H_
#define LISTADMINCOMMANDS_H_

#include "server/zone/objects/scene/SceneObject.h"

class listAdminCommands : public QueueCommand {
public:
listAdminCommands(const String& name, ZoneProcessServer* server)
: QueueCommand(name, server) {
}

int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

if (!creature->isPlayerCreature()) // If not player, bail
return GENERALERROR;

creature->sendSystemMessage("Hello World!");

return SUCCESS;
}
};

#endif //LISTADMINCOMMANDS_H_
