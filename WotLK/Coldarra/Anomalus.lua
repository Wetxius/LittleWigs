-------------------------------------------------------------------------------
--  Module Declaration

local mod = BigWigs:NewBoss("Anomalus", 520)
if not mod then return end
mod.partyContent = true
mod.otherMenu = "Coldarra"
mod:RegisterEnableMob(26763)
mod.toggleOptions = {
	47743, -- Summon Rift
	"bosskill",
}

-------------------------------------------------------------------------------
--  Localization

local L = mod:NewLocale("enUS", true)
if L then
--@do-not-package@
L["rift_message"] = "Rift Summoned"--@end-do-not-package@
--@localization(locale="enUS", namespace="Coldarra/Anomalus", format="lua_additive_table", handle-unlocalized="ignore")@
end
L = mod:GetLocale()

-------------------------------------------------------------------------------
--  Initialization

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Rift", 47743)
	self:Death("Win", 26763)
end

-------------------------------------------------------------------------------
--  Event Handlers

function mod:Rift(_, spellId)
	self:Message(47743, L["rift_message"], "Attention", spellId)
end