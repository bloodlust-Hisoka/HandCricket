-- Initializing variable
local player = {}
local computer = {}
player.score = 0
computer.score = 0
local ascii = require("handcricket.ascii")
local curses = require("nocurses")
local computer_player = require("handcricket.computer")
local game_running = true
local current_batsmen = nil
--function to select toss option randomly
local function select_random_opt()
	local random = math.random(2)
	if random == 1 then
		print("Computer selected batting")
		current_batsmen = "computer"
	else
		print("Computer selected bowling")
		current_batsmen = "player"
	end
end
--function to select toss  option
local function select_opt()
	print("1 - batting or 2 - bowling")
	local option = tonumber(io.read())
	if option == 1 then
		print("Player selected batting")
		current_batsmen = "player"
	else
		print("Player selected bowling")
		current_batsmen = "computer"
	end
end
local function clear()
	if curses then
		curses.hidecursor()
		os.execute("clear")
		curses.showcursor()
	else
		os.execute("clear")
	end
end
-- toss function
local function toss()
	print("1 - Odd or 2 - Eve")
	local selection = tonumber(io.read())
	print("Choose a number")
	local num = tonumber(io.read())
	if selection == 1 then
		if num % 2 == 0 then
			print("Computer won the toss")
			select_random_opt()
		else
			print("Player won the toss")
			select_opt()
		end
	else
		if num % 2 == 2 then
			print("Player won the toss")
			select_opt()
		else
			print("Computer won the toss")
			select_random_opt()
		end
	end
end

local player_out = false
local computer_out = false
Chasing = false
--game function
local function start_game()
	-- difficulty
	print("Choose difficulty")
	print("1 - noob")
	print("2 - intermidiate")
	print("3 - pro")
	print("4 - hacker")
	print("5 - hell")
	local option = tonumber(io.read())
	diff = { "noob", "intermidiate", "pro", "hacker", "hell" }
	local difficulty = diff[option]
	toss()
	--game loop
	while game_running == true do
		while player_out == false or computer_out == false do
			print("current batsmen - " .. current_batsmen)
			if current_batsmen == "player" then
				print("current score - " .. player.score)
			else
				print("current score - " .. computer.score)
			end
			print("Choose a number")
			Player_choosen_number = tonumber(io.read())
			if current_batsmen == "player" then
				Computer_choosen_number = computer_player.generate_random_for_bowling(Player_choosen_number, difficulty)
			else
				Computer_choosen_number = computer_player.generate_random_for_batting(Player_choosen_number, difficulty)
			end
			function ascii_number(i)
				if i ~= 0 then
					return ascii.numbers[i]
				else
					return ascii.numbers[11]
				end
			end

			clear()
			print(ascii_number(Player_choosen_number) .. ascii.colon .. ascii_number(Computer_choosen_number))

			os.execute("sleep 0.5")
			clear()
			if Player_choosen_number == Computer_choosen_number then
				if current_batsmen == "player" then
					if computer_out == false then
						clear()
						print(ascii.player_out)

						os.execute("sleep 0.5")

						clear()
						print("Computer need " .. player.score + 1 .. " to win ")
						player_out = true
						current_batsmen = "computer"
						Chasing = true
					else
						clear()
						print(ascii.player_out)

						os.execute("sleep 0.5")
						current_batsmen = "computer"
						player_out = true
					end
				else
					if player_out == false then
						clear()
						print(ascii.computer_out)

						os.execute("sleep 0.5")
						clear()
						print("Player need " .. computer.score + 1 .. " to win ")

						os.execute("sleep 0.5")

						computer_out = true

						current_batsmen = "player"
						Chasing = true
					else
						clear()
						print(ascii.computer_out)

						os.execute("sleep 0.5")
						current_batsmen = "player"
						computer_out = true
					end
				end
			elseif Player_choosen_number ~= Computer_choosen_number then
				if current_batsmen == "player" then
					if Player_choosen_number ~= 0 then
						player.score = player.score + Player_choosen_number
					else
						player.score = player.score + Computer_choosen_number
					end
				else
					if Computer_choosen_number ~= 0 then
						computer.score = computer.score + Computer_choosen_number
					else
						computer.score = computer.score + Player_choosen_number
					end
				end
			end
			if Chasing == true then
				if current_batsmen == "player" and computer_out == true then
					if player.score > computer.score then
						clear()
						print(ascii.player_won)

						os.execute("sleep 0.5")
						game_running = false
						break
					end
				elseif current_batsmen == "computer" and player_out == true then
					if computer.score > player.score then
						clear()
						print(ascii.computer_won)

						os.execute("sleep 0.5")
						game_running = false
						break
					end
				end
			end
		end
	end
end
start_game()
