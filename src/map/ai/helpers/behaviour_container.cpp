#include "behaviour_container.h"

void CBehaviourContainer::AddBehaviour(B_SELECTOR selector, B_TRIGGER trigger, uint16 trigger_condition, B_REACTION reaction, B_REACTION_MODIFIER reaction_mod, uint16 reaction_arg, uint16 retry_delay)
{
    actions.push_back(Action_t{ selector, trigger, trigger_condition, reaction, reaction_mod, reaction_arg, retry_delay });
}

void CBehaviourContainer::Tick(time_point tick)
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
            case HPP_LTE:
            {
                return target->GetHPP() <= param;
                break;
            }
            case HPP_GTE:
            {
                return target->GetHPP() >= param;
                break;
            }
            case MPP_LTE:
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
            case NUKE:
            {
                return true;
                break;
            }
            case SC_AVAILABLE:
            {
                auto PSCEffect = target->StatusEffectContainer->GetStatusEffect(EFFECT_SKILLCHAIN);
                return PSCEffect && PSCEffect->GetStartTime() + 3s < server_clock::now() && PSCEffect->GetTier() == 0;
                break;
            }
            case MB_AVAILABLE:
            {
                auto PSCEffect = target->StatusEffectContainer->GetStatusEffect(EFFECT_SKILLCHAIN);
                return PSCEffect && PSCEffect->GetStartTime() + 3s < server_clock::now() && PSCEffect->GetTier() > 0;
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
                if (action.reaction_mod == SELECT_SPECIFIC)
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
                else if (action.reaction_mod == SELECT_RANDOM)
                {
                    auto spell = POwner->SpellContainer->GetSpell();
                    if (spell.has_value())
                    {
                        controller->Cast(target->targid, static_cast<SpellID>(spell.value()));
                    }
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
