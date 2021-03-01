if not getgenv().if_globals_loaded then
	getgenv().isBypassed = false
	getgenv().global = false
	getgenv().mt = false
	getgenv().store = game.CoreGui
	
	getgenv().if_globals_loaded = true
end

local getreg = debug.getregistry or getreg or getregistry
local getuv = getupvals or secret953 or debug.getupvalues or getupvalues
local setuv = setupval or secret500 or debug.setupvalue or setupvalue
local srd = make_writeable or setreadonly or fullaccess

local newcclosure = newcclosure or coroutine.wrap
local hkf = replaceclosure or hookfunction
local cc = checkcaller or is_protosmasher_caller
local unicode ={"\226\132\162","\195\184","\226\128\176","\226\128\162","\194\176","\195\159","\194\189","\194\191","\226\128\161","\194\179"}

assert((getrawmetatable and (getreg and getuv and setuv)), "ISLANDFRICKER : Bypass Failure | Only SynapseX, Elysian, Visenya, and Protosmasher are Supported")

function checkUnicode(str)
	if str then
		for i,v in pairs(unicode) do
			if string.find(str, v) then
				return true
			end
		end
	end
	return false
end

if hkf then
	srd(getrawmetatable(game), false)
	function FireServer_Repl(self, ...)
		if typeof(self) ~= "Instance" then
			return error(select(2, pcall(getrawmetatable(game).__index, self))) -- stolen from 3dsboy08 / autumn
		end
		local args = {...}
		
		if checkUnicode(self.Name) then
			getgenv().isBypassed = true
			return wait(9e9)
		end
		
		if self.Name == 'Fire_Shot' then
			for i,v in pairs(args) do warn(i,v) end
		end
	
		if self.Name == 'Do_State' then
			return wait(9e9)
		end
		
		return saved(self, ...)
	end
	
	if not getgenv().saved then
   		getgenv().saved = hkf(Instance.new('RemoteEvent').FireServer, FireServer_Repl)
	end
	
	FireServer_Repl = newcclosure(FireServer_Repl)
end

for i,v in pairs(getreg()) do
	if type(v) == 'function' then
		local orig = v
		local suc, uvs = pcall(getuv, v)
		if uvs and type(uvs) == 'table' then
			for x,c in pairs(uvs) do
				if type(c) == 'string' and checkUnicode(c) then
					for i,v in pairs(uvs) do
						if type(v) == 'function' then
							getgenv().isBypassed = true
							setuv(orig, i, newcclosure(function() return wait(9e9) end))
						elseif type(v) == 'number' then
							setuv(orig, i, -math.huge)
						end
					end
					getfenv(orig).script.Parent = workspace
				end
			end
		end
	end
end

local mt = getrawmetatable(game)
local nc = mt.__namecall
local id = mt.__index
srd(mt, false)

if not getgenv().mt then
	getgenv().mt = true
	mt.__namecall = function(...)
		local args = {...}
		if args[#args] == 'Kick' and not checkcaller() then
			return function(msg) return wait(9e9) end
		elseif args[#args] == '______________' then
			return 'hi dad'
		end
		return nc(...)
	end
	
	mt.__index = function(inst, str)
		if inst == nil or str == nil then return end
		if string.find(inst:GetFullName(), 'CoreGui') and not cc() then
			return workspace
	 	end
   	   return id(inst, str)
  	end
end

if not getgenv().global then
	getgenv().global = true
	spawn(function()
		while wait() do
			_G.boop = nil
			getrenv()._G.boop = nil
		end
	end)
end

if getgenv().isBypassed ~= true then
	print ("you have a risk of getting banned using this script, be careful!")
end
