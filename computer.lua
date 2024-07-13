M = {}
function M.generate_random_for_bowling(i, difficulty)
	if difficulty == "noob" then
		return math.random(0, 10)
	elseif difficulty == "intermidiate" then
		if i <= 5 then
			return math.random(0, 8)
		else
			return math.random(2, 10)
		end
	elseif difficulty == "pro" then
		if i <= 3 and i ~= 0 then
			return math.random(0, 6)
		elseif i > 3 and i < 7 then
			return math.random(2, 9)
		elseif i >= 7 then
			return math.random(3, 10)
		else
			random = math.random(2)
			if random == 1 then
				return math.random(0, 7)
			else
				return math.random(0, 10)
			end
		end
	elseif difficulty == "hacker" then
		if i <= 3 and i ~= 0 then
			return math.random(i, i + 4)
		elseif i > 3 and i <= 6 then
			return math.random(i, 10)
		elseif i >= 7 then
			return math.random(7, 10)
		else
			random = math.random(3)
			if random == 1 then
				return math.random(0, 5)
			elseif random == 2 then
				return math.random(0, 7)
			else
				return math.random(0, 10)
			end
		end
	elseif difficulty == "hell" then
		random = math.random(5)
		if random == 1 then
			if i <= 3 and i ~= 0 then
				return math.random(i, i + 3)
			elseif i > 3 and i <= 6 then
				return math.random(i, i + 3)
			elseif i >= 7 and i < 9 then
				return math.random(7, 10)
			elseif i >= 9 then
				return math.random(8, 10)
			else
				return math.random(0, 3)
			end
		else
			if i <= 3 and i ~= 0 then
				return math.random(i, i + 2)
			elseif i > 3 and i <= 6 then
				return math.random(i, i + 2)
			elseif i >= 7 and i < 9 then
				return math.random(7, 9)
			elseif i >= 9 then
				if random == 1 then
					return math.random(8, 10)
				else
					return math.random(8, 9)
				end
			else
				return math.random(0, 2)
			end
		end
	end
end

function M.generate_random_for_batting(i, difficulty)
	if difficulty == "noob" then
		return math.random(0, 10)
	elseif difficulty == "intermidiate" then
		random = math.random(0, 10)
		if random > 2 then
			return math.random(0, 10)
		else
			if i < 10 then
				return math.random(i + 1, 10)
			else
				return math.random(1, 9)
			end
		end
	elseif difficulty == "pro" then
		random = math.random(0, 10)
		if random > 3 then
			return math.random(0, 10)
		else
			if i <= 6 then
				return math.random(i + 2, 10)
			else
				return math.random(0, 6)
			end
		end
	elseif difficulty == "hacker" then
		random = math.random(0, 10)
		if random > 6 then
			return math.random(0, 10)
		else
			random_numb = math.random(0, 10)
			while random_numb == i do
				random_numb = math.random(0, 10)
			end
			return random_numb
		end
	elseif difficulty == "hell" then
		random = math.random(0, 10)
		if random < 4 then
			return math.random(0, 10)
		else
			random_numb = math.random(0, 10)
			while random_numb == i do
				random_numb = math.random(8, 10)
			end
			return random_numb
		end
	end
end

return M
