#include "behaviour_container.h"

void CBehaviourContainer::AddBehaviour(B_SELECTOR selector, B_TRIGGER trigger, uint16 trigger_condition, B_REACTION reaction, B_REACTION_MODIFIER reaction_mod, uint16 reaction_arg, uint16 retry_delay)
{
    actions.push_back(Action_t{ selector, trigger, trigger_condition, reaction, reaction_mod, reaction_arg, retry_delay });
}