/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#ifndef _TRUSTCONTROLLER_H
#define _TRUSTCONTROLLER_H

#include "mob_controller.h"

class CCharEntity;
class CTrustEntity;
class CBehaviourContainer;

class CTrustController : public CMobController
{
public:
    CTrustController(CCharEntity*, CTrustEntity*);
    ~CTrustController() override;
   
    void Tick(time_point) override;
    void Despawn() override;

    bool Ability(uint16 targid, uint16 abilityid) override;
    bool Cast(uint16 targid, SpellID spellid) override;

    static constexpr float RoamDistance{ 2.0f };
    static constexpr float SpawnDistance{ 3.0f };
    static constexpr float WarpDistance{ 30.0f };

    std::unique_ptr<CBehaviourContainer> m_BehaviourContainer;

private:
    void DoCombatTick(time_point tick) override;
    void DoRoamTick(time_point tick) override;

    CBattleEntity* GetTopEnmity();
    uint8 GetPartyPosition();

    CBattleEntity* m_LastTopEnmity;
    time_point m_CombatEndTime;
    time_point m_LastHealTickTime;
};

#endif // _TRUSTCONTROLLER
