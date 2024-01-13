local Bluetag = {}

local PlayerService = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local TextChatService = game:GetService("TextChatService")
local MessageProperties = Instance.new("TextChatMessageProperties")
local BubbleProperties = Instance.new("BubbleChatMessageProperties")

function Bluetag:CreateTag(Type, PropertiesWindow)
	TextChatService.OnIncomingMessage = function(Message: TextChatMessage)
		if Message.TextSource then
			local Player = PlayerService:GetPlayerByUserId(Message.TextSource.UserId)
			
			if Type == "User" then
				if Player.UserId == PropertiesWindow.Id then
					MessageProperties.PrefixText = string.format(`<font color="{PropertiesWindow.TagColor}">{PropertiesWindow.TagText}</font> ` .. Message.PrefixText)
				end
				
			elseif Type == "Group" then
				if Player:GetRankInGroup(PropertiesWindow.Id) == PropertiesWindow.Rank then
					MessageProperties.PrefixText = string.format(`<font color="{PropertiesWindow.TagColor}">{PropertiesWindow.TagText}</font> ` .. Message.PrefixText)
				end
				
			elseif Type == "Asset" then
				if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, PropertiesWindow.Id) then
					MessageProperties.PrefixText = string.format(`<font color="{PropertiesWindow.TagColor}">{PropertiesWindow.TagText}</font> ` .. Message.PrefixText)
				end
				
			else
				return warn(`[Bluetag]: Requested component in "CreateTag" invalid (Code 800)`)
			end
			
		end
		return MessageProperties
	end
end

function Bluetag:CreateBubble(Type, PropertiesWindow)
	TextChatService.OnBubbleAdded = function(Message: TextChatMessage, Adornee: Instance)
		if Message.TextSource then
			local Player = PlayerService:GetPlayerByUserId(Message.TextSource.UserId)
			
			if Type == "User" then
				if Player.UserId == PropertiesWindow.Id then
					BubbleProperties.BackgroundColor3 = PropertiesWindow.BackgroundColor3
					BubbleProperties.TextColor3 = PropertiesWindow.TextColor3
					BubbleProperties.FontFace = Font.fromEnum(Enum.Font[PropertiesWindow.FontFace])
				end
				
			elseif Type == "Group" then
				if Player:GetRankInGroup(PropertiesWindow.Id) == PropertiesWindow.Rank then
					BubbleProperties.BackgroundColor3 = PropertiesWindow.BackgroundColor3
					BubbleProperties.TextColor3 = PropertiesWindow.TextColor3
					BubbleProperties.FontFace = Font.fromEnum(Enum.Font[PropertiesWindow.FontFace])
				end
				
			elseif Type == "Asset" then
				if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, PropertiesWindow.Id) then
					BubbleProperties.BackgroundColor3 = PropertiesWindow.BackgroundColor3
					BubbleProperties.TextColor3 = PropertiesWindow.TextColor3
					BubbleProperties.FontFace = Font.fromEnum(Enum.Font[PropertiesWindow.FontFace])
				end
				
			else
				return warn(`[Bluetag]: Requested component in "CreateBubble" invalid (Code 801)`)
			end
		end
		return BubbleProperties
	end
end

function Bluetag:CreateTagBubble(Type, PropertiesWindow)
	TextChatService.OnIncomingMessage = function(Message: TextChatMessage)
		if Message.TextSource then
			local Player = PlayerService:GetPlayerByUserId(Message.TextSource.UserId)

			if Type == "User" then
				if Player.UserId == PropertiesWindow.Id then
					MessageProperties.PrefixText = string.format(`<font color="{PropertiesWindow.TagColor}">{PropertiesWindow.TagText}</font> ` .. Message.PrefixText)
				end

			elseif Type == "Group" then
				if Player:GetRankInGroup(PropertiesWindow.Id) == PropertiesWindow.Rank then
					MessageProperties.PrefixText = string.format(`<font color="{PropertiesWindow.TagColor}">{PropertiesWindow.TagText}</font> ` .. Message.PrefixText)
				end

			elseif Type == "Asset" then
				if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, PropertiesWindow.Id) then
					MessageProperties.PrefixText = string.format(`<font color="{PropertiesWindow.TagColor}">{PropertiesWindow.TagText}</font> ` .. Message.PrefixText)
				end

			else
				return warn(`[Bluetag]: Requested component "Tag" in "CreateTagBubble" invalid (Code 802)`)
			end

		end
		return MessageProperties
	end
	
	TextChatService.OnBubbleAdded = function(Message: TextChatMessage, Adornee: Instance)
		if Message.TextSource then
			local Player = PlayerService:GetPlayerByUserId(Message.TextSource.UserId)

			if Type == "User" then
				if Player.UserId == PropertiesWindow.Id then
					BubbleProperties.BackgroundColor3 = PropertiesWindow.BackgroundColor3
					BubbleProperties.TextColor3 = PropertiesWindow.TextColor3
					BubbleProperties.FontFace = Font.fromEnum(Enum.Font[PropertiesWindow.FontFace])
				end

			elseif Type == "Group" then
				if Player:GetRankInGroup(PropertiesWindow.Id) == PropertiesWindow.Rank then
					BubbleProperties.BackgroundColor3 = PropertiesWindow.BackgroundColor3
					BubbleProperties.TextColor3 = PropertiesWindow.TextColor3
					BubbleProperties.FontFace = Font.fromEnum(Enum.Font[PropertiesWindow.FontFace])
				end

			elseif Type == "Asset" then
				if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, PropertiesWindow.Id) then
					BubbleProperties.BackgroundColor3 = PropertiesWindow.BackgroundColor3
					BubbleProperties.TextColor3 = PropertiesWindow.TextColor3
					BubbleProperties.FontFace = Font.fromEnum(Enum.Font[PropertiesWindow.FontFace])
				end

			else
				return warn(`[Bluetag]: Requested component "Bubble" in "CreateTagBubble" invalid (Code 801)`)
			end
		end
		return BubbleProperties
	end
end

return Bluetag
