#ifndef _CBEHAVIOURCONTAINER_H
#define _CBEHAVIOURCONTAINER_H

#include "../../../common/cbasetypes.h"
#include "../../entities/charentity.h"
#include "../../entities/trustentity.h"
#include "../../mob_spell_container.h"

//class CTrustController;

enum B_SELECTOR
{
    SELF = 0,
    PARTY = 1,
    TARGET = 2,
};

enum B_TRIGGER
{
    HP_LTE = 0,
    HP_GTE = 1,
    MP_LTE = 2,
    TP_GTE = 3,
    STATUS = 4,
    NOT_STATUS = 5,
    STATUS_FLAG = 6,
};

enum B_REACTION
{
    ATTACK = 0,
    ASSIST = 1,
    MA = 2,
    JA = 3,
    WS = 4,
};

enum B_REACTION_MODIFIER
{
    SELECT_HIGHEST = 0,
    SELECT_LOWEST = 1,
    SPECIFIC = 2,
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
    {
    }

    ~CBehaviourContainer() = default;

    void AddBehaviour(B_SELECTOR selector, B_TRIGGER trigger, uint16 trigger_condition, B_REACTION reaction, B_REACTION_MODIFIER reaction_mod, uint16 reaction_arg, uint16 retry_delay)
    {
        actions.push_back(Action_t{ selector, trigger, trigger_condition, reaction, reaction_mod, reaction_arg, retry_delay });
    }

    void Tick(time_point tick)
    {
        // Do something every 3 seconds
        if (tick < m_lastAction + 3s)
        {
            return;
        }
        m_lastAction = tick;

        // Define some things
        auto controller = static_cast<CTrustController*>(POwner->PAI->GetController());

        for (auto action : actions)
        {
            if (tick < action.last_used + std::chrono::seconds(action.retry_delay))
            {
                return;
            }

            auto checkTrigger = [&](CBattleEntity* target, B_TRIGGER trigger, uint16 param) -> bool
            {
                switch (trigger)
                {
                case HP_LTE:
                {
                    return target->GetHPP() <= param;
                    break;
                }
                case HP_GTE:
                {
                    return target->GetHPP() >= param;
                    break;
                }
                case MP_LTE:
                {
                    return target->GetMPP() <= param;
                    break;
                }
                case TP_GTE:
                {
                    return target->health.tp >= param;
                    break;
                }
                case STATUS:
                {
                    return target->StatusEffectContainer->HasStatusEffect(static_cast<EFFECT>(param));
                    break;
                }
                case NOT_STATUS:
                {
                    return !target->StatusEffectContainer->HasStatusEffect(static_cast<EFFECT>(param));
                    break;
                }
                case STATUS_FLAG:
                {
                    return target->StatusEffectContainer->HasStatusEffectByFlag(static_cast<EFFECTFLAG>(param));
                    break;
                }
                default: { return false;  break; }
                }
            };

            CBattleEntity* target = nullptr;
            if (action.selector == SELF)
            {
                target = checkTrigger(POwner, action.trigger, action.trigger_condition) ? POwner : nullptr;
            }
            else if (action.selector == TARGET)
            {
                auto mob = POwner->GetBattleTarget();
                target = checkTrigger(mob, action.trigger, action.trigger_condition) ? mob : nullptr;
            }
            else if (action.selector == PARTY)
            {
                // TODO: This is very messy
                CCharEntity* master = static_cast<CCharEntity*>(POwner->PMaster);
                for (uint8 i = 0; i < master->PParty->members.size(); ++i)
                {
                    auto member = master->PParty->members.at(i);
                    if (checkTrigger(member, action.trigger, action.trigger_condition))
                    {
                        target = member;
                        break;
                    }
                }
                if (!target)
                {
                    for (uint8 i = 0; i < master->PTrusts.size(); ++i)
                    {
                        auto member = master->PTrusts.at(i);
                        if (checkTrigger(member, action.trigger, action.trigger_condition))
                        {
                            target = member;
                            break;
                        }
                    }
                }
            }

            if (target)
            {
                if (action.reaction == MA)
                {
                    if (action.reaction_mod == SPECIFIC)
                    {
                        controller->Cast(target->targid, static_cast<SpellID>(action.reaction_arg));
                    }
                    else if (action.reaction_mod == SELECT_HIGHEST)
                    {
                        auto spell = POwner->SpellContainer->GetBestAvailable(static_cast<SPELLFAMILY>(action.reaction_arg));
                        if (spell.has_value())
                        {
                            controller->Cast(target->targid, static_cast<SpellID>(spell.value()));
                        }
                    }
                    else if (action.reaction_mod == SELECT_LOWEST)
                    {
                        /*
                        auto spell = POwner->SpellContainer->GetWorstAvailable(static_cast<SPELLFAMILY>(action.reaction_arg));
                        if (spell.has_value())
                        {
                            controller->Cast(target->targid, static_cast<SpellID>(spell.value()));
                        }
                        */
                    }
                }

                // Assume success
                if (action.retry_delay != 0)
                {
                    action.last_used = tick;
                }
            }

        }
    }

private:
    CTrustEntity* POwner;
    uint16 m_secondsDelayBetweenActions;
    time_point m_lastAction;
    std::vector<Action_t> actions;
};

#endif
