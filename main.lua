-- Auto-generated SP ROBLOX Delta Script Menu (US English Interface)
-- Compatible with Delta Executor & Rayfield UI Library

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SP ROBLOX - Main Hub",
   LoadingTitle = "Loading SP ROBLOX Interface...",
   LoadingSubtitle = "Delta Executor Edition",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SP_ROBLOX_Config",
      FileName = "SP_ROBLOX_Settings"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = false,
})

-- ==========================================
-- TAB 1: PLAYER & MOVEMENT
-- ==========================================
local PlayerTab = Window:CreateTab("Player", 4483362458)
local MovementSection = PlayerTab:CreateSection("Movement Settings")

local WalkSpeedVal = 1000

PlayerTab:CreateToggle({
   Name = "Speed Boost",
   CurrentValue = true,
   Flag = "SpeedBoostToggle",
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedVal
      else
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      end
   end,
})

PlayerTab:CreateSlider({
   Name = "Boost Speed (studs/s)",
   Range = {16, 2000},
   Increment = 10,
   Suffix = "studs/s",
   CurrentValue = 1000,
   Flag = "BoostSpeedSlider",
   Callback = function(Value)
      WalkSpeedVal = Value
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

PlayerTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = true,
   Flag = "InfiniteJumpToggle",
   Callback = function(Value)
      _G.InfiniteJump = Value
   end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
   if _G.InfiniteJump then
      game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
   end
end)

local CharacterSection = PlayerTab:CreateSection("Character Protection")

PlayerTab:CreateToggle({
   Name = "Instant Prompts",
   CurrentValue = true,
   Flag = "InstantPromptsToggle",
   Callback = function(Value)
      game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
         if Value then
            fireproximityprompt(prompt)
         end
      end)
   end,
})

PlayerTab:CreateToggle({
   Name = "Anti Ragdoll",
   CurrentValue = true,
   Flag = "AntiRagdollToggle",
   Callback = function(Value)
      _G.AntiRagdoll = Value
   end,
})

PlayerTab:CreateToggle({
   Name = "Anti Trap",
   CurrentValue = true,
   Flag = "AntiTrapToggle",
   Callback = function(Value)
      _G.AntiTrap = Value
   end,
})

-- ==========================================
-- TAB 2: FARM & STEAL
-- ==========================================
local FarmTab = Window:CreateTab("Farm", 4483362458)
local StealSection = FarmTab:CreateSection("Auto Steal")

FarmTab:CreateToggle({
   Name = "Auto Steal",
   CurrentValue = true,
   Flag = "AutoStealToggle",
   Callback = function(Value)
      _G.AutoSteal = Value
      Rayfield:Notify({Title = "Auto Steal", Content = Value and "Enabled" or "Disabled", Duration = 2})
   end,
})

FarmTab:CreateToggle({
   Name = "Instant Steal V2",
   CurrentValue = true,
   Flag = "InstantStealV2Toggle",
   Callback = function(Value)
      _G.InstantStealV2 = Value
   end,
})

FarmTab:CreateToggle({
   Name = "Teleport To Egg",
   CurrentValue = true,
   Flag = "TeleportToEggToggle",
   Callback = function(Value)
      _G.TeleportToEgg = Value
   end,
})

local RacingSection = FarmTab:CreateSection("Racing Event")

FarmTab:CreateToggle({
   Name = "Auto Race",
   CurrentValue = true,
   Flag = "AutoRaceToggle",
   Callback = function(Value)
      _G.AutoRace = Value
   end,
})

FarmTab:CreateToggle({
   Name = "Auto Equip Racer",
   CurrentValue = true,
   Flag = "AutoEquipRacerToggle",
   Callback = function(Value)
      _G.AutoEquipRacer = Value
   end,
})

FarmTab:CreateToggle({
   Name = "Auto Claim Race Rewards",
   CurrentValue = true,
   Flag = "AutoClaimRaceRewardsToggle",
   Callback = function(Value)
      _G.AutoClaimRaceRewards = Value
   end,
})

-- ==========================================
-- TAB 3: COMBAT & HIT AURA
-- ==========================================
local CombatTab = Window:CreateTab("Combat", 4483362458)
local CombatSection = CombatTab:CreateSection("Hit Aura Settings")

CombatTab:CreateToggle({
   Name = "Hit Aura",
   CurrentValue = true,
   Flag = "HitAuraToggle",
   Callback = function(Value)
      _G.HitAura = Value
   end,
})

CombatTab:CreateSlider({
   Name = "Hit Max Speed",
   Range = {100, 1500},
   Increment = 50,
   Suffix = "studs/s",
   CurrentValue = 750,
   Flag = "HitMaxSpeedSlider",
   Callback = function(Value)
      _G.HitMaxSpeed = Value
   end,
})

-- ==========================================
-- TAB 4: MISC & PERFORMANCE
-- ==========================================
local MiscTab = Window:CreateTab("Misc", 4483362458)
local PerfSection = MiscTab:CreateSection("Performance & Utility")

MiscTab:CreateToggle({
   Name = "Farm HUD",
   CurrentValue = true,
   Flag = "FarmHUDToggle",
   Callback = function(Value)
      _G.FarmHUD = Value
   end,
})

MiscTab:CreateToggle({
   Name = "FPS and Ping",
   CurrentValue = true,
   Flag = "FPSAndPingToggle",
   Callback = function(Value)
      _G.FPSAndPing = Value
   end,
})

MiscTab:CreateToggle({
   Name = "Disable 3D Render",
   CurrentValue = false,
   Flag = "Disable3DRenderToggle",
   Callback = function(Value)
      game:GetService("RunService"):Set3DRenderEnabled(not Value)
   end,
})

MiscTab:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = true,
   Flag = "AntiAFKToggle",
   Callback = function(Value)
      if Value then
         local vu = game:GetService("VirtualUser")
         game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
         end)
      end
   end,
})

-- ==========================================
-- TAB 5: SERVER & CONFIG
-- ==========================================
local ServerTab = Window:CreateTab("Server", 4483362458)
local ServerSection = ServerTab:CreateSection("Server Settings")

ServerTab:CreateToggle({
   Name = "Auto Rejoin When Disconnect",
   CurrentValue = true,
   Flag = "AutoRejoinToggle",
   Callback = function(Value)
      _G.AutoRejoin = Value
   end,
})

ServerTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
      local TeleportService = game:GetService("TeleportService")
      local HttpService = game:GetService("HttpService")
      local PlaceId = game.PlaceId
      local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
      for _, server in ipairs(Servers) do
         if server.playing < server.maxPlayers and server.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(PlaceId, server.id)
            break
         end
      end
   end,
})

Rayfield:LoadConfiguration()
