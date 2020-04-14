#ifndef _BEHAVIOURCONTAINER
#define _BEHAVIOURCONTAINER

#include "../../../common/cbasetypes.h"
#include "../../entities/charentity.h"
#include "../../entities/trustentity.h"
#include "../ai_container.h"
#include "../controllers/trust_controller.h"
#include "../../mob_spell_container.h"
#include "../../status_effect.h"
#include "../../status_effect_container.h"


enum class B_SELECTOR : uint16
{
    SELF = 0,
    PARTY = 1,
    TARGET = 2,
};

enum B_TRIGGER : uint16
{
    HPP_LTE = 0,
    HPP_GTE = 1,
    MPP_LTE = 2,
    TP_GTE = 3,
    STATUS = 4,
    NOT_STATUS = 5,
    STATUS_FLAG = 6,
    NUKE = 7,
    SC_AVAILABLE = 8,
    MB_AVAILABLE = 9,
};

enum B_REACTION : uint16
{
    ATTACK = 0,
    ASSIST = 1,
    MA = 2,
    JA = 3,
    WS = 4,
};

enum B_REACTION_MODIFIER : uint16
{
    SELECT_HIGHEST = 0,
    SELECT_LOWEST = 1,
    SELECT_SPECIFIC = 2,
    SELECT_RANDOM = 3,
};

struct Action_t
{
    B_SELECTOR selector;
    B_TRIGGER trigger;
    uint16 trigger_condition;
    B_REACTION reaction;
    B_REACTION_MODIFIER reaction_mod;
    uint16 reaction_arg;
    uint16 retry_delay;
    time_point last_used;
};

class CBehaviourContainer
{
public:
    CBehaviourContainer(CTrustEntity* trust)
        : POwner(trust)
    {}

    ~CBehaviourContainer() = default;

    void AddBehaviour(B_SELECTOR selector, B_TRIGGER trigger, uint16 trigger_condition, B_REACTION reaction, B_REACTION_MODIFIER reaction_mod, uint16 reaction_arg, uint16 retry_delay);
    void Tick(time_point tick);

private:
    CTrustEntity* POwner;
    time_point m_lastAction;
    std::vector<Action_t> actions;
};

#endif // _BEHAVIOURCONTAINER
