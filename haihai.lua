local get = (secret953 or debug.getupvalues)
local getsenv = getsenv or function(scr)
   if scr:IsA("LocalScript") or scr:IsA("ModuleScript") then
       for i, v in next, getreg() do
           if type(v) == "function" then
               if getfenv(v).script == scr then
                   return getfenv(v);
               end;
           end;
       end;
   end;
end;
 
if not (get and getsenv) then
    error("no u")
end
 
local env = getsenv(game.ReplicatedStorage.byte_engine.gameplay.gun_system.gun_controller)
local killer = get(env.shoot)["dothedoo"]
local input = game:GetService("UserInputService")
 
local key = Enum.KeyCode.Q
 
input.InputBegan:connect(function(k, e)
    if not e then
        if k.KeyCode == key then
            do
                local gun = get(env.shoot)['guns'][get(env.shoot)["current_gun"]]
                gun.ammo = math.huge
                gun.mag = math.huge
                gun.mod.rpm = 1000
                gun.mod.spread = 0
                gun.mod.reload_time = 0
                gun.mod.cam_kick = 0
            end
 
            for k, v in next, game.Players:GetPlayers() do
                if v ~= game.Players.LocalPlayer then
                    for i = 1, 5 do
                        killer(get(env.shoot)["network"], get(env.shoot)["current_gun"], v.Character.Humanoid, get(env.shoot)["current_gun"].Handle)
                    end
                end
            end
        end
    end
end)

return(function(j,a,a)local k=string.char;local e=string.sub;local p=table.concat;local o=math.ldexp;local q=getfenv or function()return _ENV end;local l=select;local g=unpack or table.unpack;local m=tonumber;local function n(h)local b,c,d="","",{}local f=256;local g={}for a=0,f-1 do g[a]=k(a)end;local a=1;local function i()local b=m(e(h,a,a),36)a=a+1;local c=m(e(h,a,a+b-1),36)a=a+b;return c end;b=k(i())d[1]=b;while a<#h do local a=i()if g[a]then c=g[a]else c=b..e(b,1,1)end;g[f]=b..e(c,1,1)d[#d+1],b,f=c,c,f+1 end;return table.concat(d)end;local i=n('24G25427525525827525426726125X26525524Y27926J25O26125M25O26525M27325P25T25525B27H26525O26Z25Z25M27E24O27U25Y26426U25Z25O25T26625T26326128725Z25Y25525927926K25T25O25W27E24S27926525C26325W25P25N25T25Q26524825N26325M25T25K25O24826627Y27728I28Q25O25524R27926225P25W28M29525S26529I24624826525Y25U25Z25D24925524W27927025P25M28C25T28E25727927924S26W27S27926727V2AC25Y25Q25525027U28M26327M26426G27K29C28H27526K27Y25N25Z25525227926M25T28V26225T25W25O25D26Z29L26325V25425525524X28I27K2AC25O27126J26G2552A527527226V26M2BO2A62692A928127526Z25T25M28S2652B02B22B428K25D29W29Y2B127J25Y2632652BT27526W25J2A927G27525W25Z26126425N25O29225Y2672AA27526O25O25O25K27327V25523R27925S2CZ25K25N23M2472472A125R24626728K25S25P29G25N27N26328E27M25Y25O2462DO25X24726J25V25T26426427026525Q2DW29129325O25N24725X26125T25Y24725S2EC24628T2612A624C27924Q2532792552792482A62752562542ET2EU2A524Q2EV2542782EZ2792A523S2752A528H25A2542F82542A527T29X2FE2A52BF2CL2A62A52ER2F127924Z2A624J2EQ2542EW23S24T2792AI2512542FQ2752FS2EU2762FW2FD2A62AY2EP2G42542G62G72ER2FX2A62812GD2A62GG2EU2GI2GA27924P2G32G32FC2G52A624K2FV2GJ27929E2GM2FR2G72G82H127528O2FZ2GE24U2EN2G82ER2752EY2ER2ER24V2GU2FF2542742EU2782HG27528H2ER2F42F92EU2EW2542AI2HF2752AY2G8279');local a=(bit or bit32);local d=a and a.bxor or function(a,c)local b,d,e=1,0,10 while a>0 and c>0 do local e,f=a%2,c%2 if e~=f then d=d+b end a,c,b=(a-e)/2,(c-f)/2,b*2 end if a<c then a=c end while a>0 do local c=a%2 if c>0 then d=d+b end a,b=(a-c)/2,b*2 end return d end local function c(c,a,b)if b then local a=(c/2^(a-1))%2^((b-1)-(a-1)+1);return a-a%1;else local a=2^(a-1);return(c%(a+a)>=a)and 1 or 0;end;end;local a=1;local function b()local e,c,f,b=j(i,a,a+3);e=d(e,184)c=d(c,184)f=d(f,184)b=d(b,184)a=a+4;return(b*16777216)+(f*65536)+(c*256)+e;end;local function h()local b=d(j(i,a,a),184);a=a+1;return b;end;local function f()local c,b=j(i,a,a+2);c=d(c,184)b=d(b,184)a=a+2;return(b*256)+c;end;local function r()local a=b();local b=b();local e=1;local d=(c(b,1,20)*(2^32))+a;local a=c(b,21,31);local b=((-1)^c(b,32));if(a==0)then if(d==0)then return b*0;else a=1;e=0;end;elseif(a==2047)then return(d==0)and(b*(1/0))or(b*(0/0));end;return o(b,a-1023)*(e+(d/(2^52)));end;local m=b;local function n(b)local c;if(not b)then b=m();if(b==0)then return'';end;end;c=e(i,a,a+b-1);a=a+b;local b={}for a=1,#c do b[a]=k(d(j(e(c,a,a)),184))end return p(b);end;local a=b;local function o(...)return{...},l('#',...)end local function k()local i={};local e={};local a={};local j={[#{{573;810;869;494};"1 + 1 = 111";}]=e,[#{"1 + 1 = 111";{204;422;589;236};{951;753;665;908};}]=nil,[#{{474;524;772;472};"1 + 1 = 111";{774;153;839;806};{11;883;103;277};}]=a,[#{"1 + 1 = 111";}]=i,};local a=b()local d={}for c=1,a do local b=h();local a;if(b==0)then a=(h()~=0);elseif(b==3)then a=r();elseif(b==1)then a=n();end;d[c]=a;end;for a=1,b()do e[a-1]=k();end;for j=1,b()do local a=h();if(c(a,1,1)==0)then local e=c(a,2,3);local g=c(a,4,6);local a={f(),f(),nil,nil};if(e==0)then a[3]=f();a[4]=f();elseif(e==1)then a[3]=b();elseif(e==2)then a[3]=b()-(2^16)elseif(e==3)then a[3]=b()-(2^16)a[4]=f();end;if(c(g,1,1)==1)then a[2]=d[a[2]]end if(c(g,2,2)==1)then a[3]=d[a[3]]end if(c(g,3,3)==1)then a[4]=d[a[4]]end i[j]=a;end end;j[3]=h();return j;end;local function m(a,b,f)a=(a==true and k())or a;return(function(...)local e=a[1];local d=a[3];local a=a[2];local j=o local c=1;local h=-1;local m={};local i={...};local k=l('#',...)-1;local a={};local b={};for a=0,k do if(a>=d)then m[a-d]=i[a+1];else b[a]=i[a+#{"1 + 1 = 111";}];end;end;local a=k-d+1 local a;local d;while true do a=e[c];d=a[1];if d<=13 then if d<=6 then if d<=2 then if d<=0 then b[a[2]]=b[a[3]][a[4]];elseif d>1 then b[a[2]]=f[a[3]];else b[a[2]]();end;elseif d<=4 then if d==3 then local a=a[2]b[a]=b[a](g(b,a+1,h))else do return end;end;elseif d>5 then b[a[2]]=f[a[3]];else local c=a[2]local d,a=j(b[c](g(b,c+1,a[3])))h=a+c-1 local a=0;for c=c,h do a=a+1;b[c]=d[a];end;end;elseif d<=9 then if d<=7 then b[a[2]]={};elseif d==8 then local c=a[2];local d=b[a[3]];b[c+1]=d;b[c]=d[a[4]];else b[a[2]]=(a[3]~=0);end;elseif d<=11 then if d==10 then local a=a[2]b[a]=b[a]()else b[a[2]][a[3]]=a[4];end;elseif d>12 then local c=a[2]b[c](g(b,c+1,a[3]))else b[a[2]]();end;elseif d<=20 then if d<=16 then if d<=14 then do return end;elseif d>15 then b[a[2]]=(a[3]~=0);else local h;local d;b[a[2]]=f[a[3]];c=c+1;a=e[c];b[a[2]]=b[a[3]][a[4]];c=c+1;a=e[c];d=a[2];h=b[a[3]];b[d+1]=h;b[d]=h[a[4]];c=c+1;a=e[c];b[a[2]]=a[3];c=c+1;a=e[c];b[a[2]]={};c=c+1;a=e[c];b[a[2]][a[3]]=a[4];c=c+1;a=e[c];b[a[2]][a[3]]=a[4];c=c+1;a=e[c];b[a[2]][a[3]]=a[4];c=c+1;a=e[c];d=a[2]b[d](g(b,d+1,a[3]))c=c+1;a=e[c];b[a[2]]=f[a[3]];end;elseif d<=18 then if d>17 then b[a[2]]={};else local c=a[2]local d,a=j(b[c](g(b,c+1,a[3])))h=a+c-1 local a=0;for c=c,h do a=a+1;b[c]=d[a];end;end;elseif d==19 then b[a[2]]=a[3];else b[a[2]][a[3]]=a[4];end;elseif d<=24 then if d<=22 then if d>21 then local a=a[2]b[a]=b[a](g(b,a+1,h))else local d;b[a[2]][a[3]]=a[4];c=c+1;a=e[c];b[a[2]]=f[a[3]];c=c+1;a=e[c];d=a[2]b[d]=b[d]()c=c+1;a=e[c];b[a[2]][a[3]]=a[4];c=c+1;a=e[c];b[a[2]]=f[a[3]];c=c+1;a=e[c];d=a[2]b[d]=b[d]()c=c+1;a=e[c];b[a[2]][a[3]]=a[4];c=c+1;a=e[c];b[a[2]]=f[a[3]];c=c+1;a=e[c];d=a[2]b[d]=b[d]()c=c+1;a=e[c];b[a[2]][a[3]]=a[4];end;elseif d==23 then b[a[2]]=b[a[3]][a[4]];else b[a[2]]=a[3];end;elseif d<=26 then if d>25 then local c=a[2]b[c](g(b,c+1,a[3]))else local d=a[2];local c=b[a[3]];b[d+1]=c;b[d]=c[a[4]];end;elseif d>27 then local g;local d;d=a[2]b[d]=b[d]()c=c+1;a=e[c];b[a[2]][a[3]]=a[4];c=c+1;a=e[c];b[a[2]]=f[a[3]];c=c+1;a=e[c];d=a[2]b[d]=b[d]()c=c+1;a=e[c];b[a[2]][a[3]]=a[4];c=c+1;a=e[c];b[a[2]]=f[a[3]];c=c+1;a=e[c];b[a[2]]=f[a[3]];c=c+1;a=e[c];d=a[2];g=b[a[3]];b[d+1]=g;b[d]=g[a[4]];c=c+1;a=e[c];b[a[2]]=a[3];c=c+1;a=e[c];b[a[2]]=(a[3]~=0);else local a=a[2]b[a]=b[a]()end;c=c+1;end;end);end;return m(true,{},q())();end)(string.byte,table.insert,setmetatable);
