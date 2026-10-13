-- SP ROBLOX - Custom Clean UI Script
-- US English Interface

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SP ROBLOX | Custom Hub",
   LoadingTitle = "Initializing SP ROBLOX...",
   LoadingSubtitle = "Created for Delta Executor",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SP_Hub",
      FileName = "Config"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = false,
})

-- ==========================================
-- TAB: PLAYER SETTINGS
-- ==========================================
local PlayerTab = Window:CreateTab("Player", 4483362458)

local WalkSpeedValue = 16

PlayerTab:CreateToggle({
   Name = "Speed Boost",
   CurrentValue = false,
   Flag = "SpeedToggle",
   Callback = function(Value)
      if Value then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedValue
         Rayfield:Notify({Title = "Speed Boost", Content = "Activated!", Duration = 2})
      else
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
         Rayfield:Notify({Title = "Speed Boost", Content = "Deactivated!", Duration = 2})
      end
   end,
})

PlayerTab:CreateSlider({
   Name = "Speed Value",
   Range = {16, 300},
   Increment = 5,
   Suffix = "studs",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      WalkSpeedValue = Value
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

PlayerTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJumpToggle",
   Callback = function(Value)
      _G.InfiniteJump = Value
   end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
   if _G.InfiniteJump then
      local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
      if humanoid then
         humanoid:ChangeState("Jumping")
      end
   end
end)

-- ==========================================
-- TAB: UTILITY & MISC
-- ==========================================
local MiscTab = Window:CreateTab("Misc", 4483362458)

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
         Rayfield:Notify({Title = "Anti AFK", Content = "Enabled successfully!", Duration = 2})
      end
   end,
})

MiscTab:CreateButton({
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
