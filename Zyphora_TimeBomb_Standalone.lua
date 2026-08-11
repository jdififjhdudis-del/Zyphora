--[[ ZYPHORA TIMEBOMB STANDALONE ]]
local Bridge = {}
Bridge.__index = Bridge
function Bridge.new(Library, Window)
    return setmetatable({Library = Library, Window = Window}, Bridge)
end
function Bridge:CreateWindow(...) return self end
function Bridge:CreateTab(cfg)
    local title = type(cfg) == "table" and cfg.Title or tostring(cfg)
    local icon = "lucide-bomb"
    local cat = self.Window:CreateCategory(title, icon)
    local Tab = {}
    local function proxy(el)
        local p = {Visible=true, Enabled=true}
        function p:SetTitle(t) pcall(function() el:SetTitle(t) end) end
        function p:Set(v) pcall(function() el:Set(v) end) end
        function p:SetValue(v) pcall(function() el:Set(v) end) end
        return p, p, p
    end
    function Tab:Button(c, cb) return proxy(cat:CreateButton(type(c)=="table" and c.Title or c, type(c)=="table" and c.Callback or cb)) end
    function Tab:Toggle(c, d, cb) return proxy(cat:CreateToggle(type(c)=="table" and c.Title or c, type(c)=="table" and c.Value or d, type(c)=="table" and c.Callback or cb)) end
    function Tab:Slider(c, min, max, d, cb) return proxy(cat:CreateSlider(type(c)=="table" and c.Title or c, type(c)=="table" and c.Min or min, type(c)=="table" and c.Max or max, type(c)=="table" and c.Value or d, type(c)=="table" and c.Callback or cb)) end
    function Tab:Dropdown(c, o, cb) return proxy(cat:CreateDropdown(type(c)=="table" and c.Title or c, type(c)=="table" and c.Options or o, type(c)=="table" and c.Callback or cb)) end
    function Tab:Label(c) return proxy(cat:CreateLabel(type(c)=="table" and c.Title or c)) end
    function Tab:Divider(c) return proxy(cat:CreateLabel(type(c)=="table" and c.Title or "---")) end
    Tab.CreateButton, Tab.CreateToggle, Tab.CreateSlider, Tab.CreateDropdown = Tab.Button, Tab.Toggle, Tab.Slider, Tab.Dropdown
    return Tab
end
function Bridge:Tab(cfg) return self:CreateTab(cfg) end
function Bridge:Notify(c, cont, dur) self.Library:Notify(type(c)=="table" and c.Title or c, type(c)=="table" and c.Content or cont, type(c)=="table" and c.Duration or dur) end
_G.WindUI_Bridge_Class = Bridge

local Library = loadstring(game:HttpGet("https://github.com/PMLOLHUB/Ui-library/raw/refs/heads/main/UI%20PMS"))()
local Window = Library:CreateWindow("Zyphora TimeBomb", {
    ToggleConfig = { Text = "Open", Image = "" },
    ThemeColor = Color3.fromRGB(210, 180, 140),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementTransparency = 0.1,
    Logo = "rbxassetid://10747383470"
})
_G.WindUI_Bridge = _G.WindUI_Bridge_Class.new(Library, Window)
-- This file was protected using Luraph Obfuscator v14.7 [https://lura.ph/]

local Tv=(getfenv()); Tv["WindUI"] = _G.WindUI_Bridge; Tv["er"] = _G.WindUI_Bridge; Tv["hs"] = _G.WindUI_Bridge;
local YF,st,tv=(string.char),(string.byte),(bit32 .bxor)
local Xl=function(gC,lD)
    local nl=''
    for dq=25220-24980,(#gC-(-18203+18204))+(-8676+8916)do
        nl=nl..YF(tv(st(gC,(dq-(-5658+5898))+(-19894- -19895)),st(lD,(dq-0.010561985653302821*22723)%#lD+5.182152666217547e-05*19297)))
    end
    return nl
end
local Eo,Vn=(string.gsub),(string.char)
local O=(function(ly)
    ly=Eo(ly,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(ly:gsub('.',function(tm)
        if(tm=='=')then
            return''
        end
        local FB,CD='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(tm)-1)
        for uj=6,1,-1 do
            FB=FB..(CD%2^uj-CD%2^(uj-1)>0 and'1'or'0')
        end
        return FB
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(eb)
        if(#eb~=8)then
            return''
        end
        local RF=0
        for ve=1,8 do
            RF=RF+(eb:sub(ve,ve)=='1'and 2^(8-ve)or 0)
        end
        return Vn(RF)
    end))
end)
return(function(Fl,...)
    local function Xh(Qq)
        return Fl[Qq+(-34751+17011)]
    end
    Tv['pri:U%'](Xl('@\168\179&/\n&si\23\156\48\148\189\56{#$Y,.\151b','\16\192\210H[eK+IX\242'))
    local Ft,er = true, _G.WindUI_Bridge
    if Ft and er then
        local hs=er;
        Tv['_G']['SelectedLanguage']=Tv['_G']['SelectedLanguage']or 'Ara6p\xe3\x91'
        local Ku={['Arabic']={['welcome']=Xl("\198,\214r\169|\246\170\196\223\147\138\211\30\180\192\235\153u {*\149\175\214t\169r\14]u5\221\'\52\171_I\30/\209\bC\127\129",'\30\143\15\245p\248.\r\29T\179S[\198\a\25l@\241\248\220\243'),[Xh(-1202468080/-24665)]='\xe2\x9a\xa0\xef\xb8\x8f \xd8\xaa\xd9\x86\xd8\xa8\xd9\x8a\xd9\x87 \xd9\x87\xd8\xa7\xd9\x85:\n\xd8\xaa\xd8\xb4\xd8\xba\xd9\x8a\xd9\x84 \xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa \xd9\x8a\xd9\x83\xd9\x88\xd9\x86 \xd8\xb9\xd9\x84\xd9\x89 \xd9\x85\xd8\xb3\xd8\xa4\xd9\x88\xd9\x84\xd9\x8a\xd8\xaa\xd9\x83 \xd8\xa7\xd9\x84\xd8\xb4\xd8\xae\xd8\xb5\xd9\x8a\xd8\xa9 \xd9\x88\xd8\xa7\xd9\x84\xd9\x83\xd8\xa7\xd9\x85\xd9\x84\xd8\xa9\xd8\x8c \xd9\x88\xd9\x86\xd8\xad\xd9\x86 \xd8\xba\xd9\x8a\xd8\xb1 \xd9\x85\xd8\xb3\xd8\xa4\xd9\x88\xd9\x84\xd9\x8a\xd9\x86 \xd8\xb9\xd9\x86 \xd8\xa3\xd9\x8a \xd8\xb6\xd8\xb1\xd8\xb1. \xd9\x85\xd8\xb9 \xd8\xa3\xd9\x86\xd9\x86\xd8\xa7 \xd9\x86\xd8\xb9\xd9\x85\xd9\x84 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xaa\xd9\x82\xd8\xaf\xd9\x8a\xd9\x85 \xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa \xd8\xa8\xd8\xa3\xd8\xb9\xd9\x84\xd9\x89 \xd9\x85\xd8\xb9\xd8\xa7\xd9\x8a\xd9\x8a\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x85\xd8\xa7\xd9\x86 \xd8\xa7\xd9\x84\xd9\x85\xd9\x85\xd9\x83\xd9\x86\xd8\xa9\xd8\x8c \xd9\x87\xd8\xb0\xd8\xa7 \xd8\xaa\xd8\xad\xd8\xb0\xd9\x8a\xd8\xb1 \xd8\xa7\xd8\xad\xd8\xaa\xd8\xb1\xd8\xa7\xd8\xb7\xd9\x8a \xd9\x81\xd9\x8a \xd8\xad\xd8\xa7\xd9\x84 \xd8\xad\xd8\xaf\xd9\x88\xd8\xab \xd8\xa3\xd9\x8a \xd9\x85\xd8\xb4\xd9\x83\xd9\x84\xd8\xa9 \xd8\xba\xd9\x8a\xd8\xb1 \xd9\x85\xd8\xaa\xd9\x88\xd9\x82\xd8\xb9\xd8\xa9.\xd9\x86\xd8\xaa\xd9\x85\xd9\x86\xd9\x8a \xd9\x84\xd9\x83\xd9\x85 \xd8\xaa\xd8\xac\xd8\xb1\xd8\xa8\xd8\xa9 \xd9\x85\xd9\x85\xd8\xaa\xd8\xb9\xd8\xa9 \xe2\x9d\xa4',['di(\xeem\x9a\x89j']='\xf0\x9f\x8e\xae \xd8\xa7\xd9\x86\xd8\xb6\xd9\x85 \xd9\x84\xd8\xb3\xd9\x8a\xd8\xb1\xd9\x81\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xaf\xd9\x8a\xd8\xb3\xd9\x83\x82b\xd2\xe5f\x0c\xd9',[Xh(1482755544/30783)]=Xh(15553- -21357),[Xh(-0.49100926835518727*23413)]=Xh(-2.3154160395613848*-18604),[Xl('\135\20\222<\v\132\r\217\50,','\235}\176WH')]='\xe2\x9c\x85 \xd8\xaa\xd9\x85 \xd9\x86\xd8\xb3\xd8\xae \xd8\xa7\xd9\x84\xd8\xb1\xd8\xa7\xd8\xa8\xd8\xb7',[Xl('\214E\159)\131\15\18\214\223H\178-\174\20\a\209\206','\186,\241B\192\96b\191')]=Xh(37992-13678),[Xh(3.2136461318051577*5584)]=Xh(1684-4593),[Xh(592477860/23924)]='\xd8\xac\xd8\xa7\xd8\xb1\xd9\x8a \xd8\xa5\xd8\xb9\xd8\xa7\xd8\xaf\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xb4\xd8\xba\xd9\x8a\xd9\x84..zq',[Xh(-170646656/-8179)]='\xd8\xaa\xd9\x85 \xd8\xa5\xd8\xba\xd9\x84\xd8\xa7\xd9\x82 \xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa',['notification']=Xh(-213422712/-7311),['mainFeatures']=Xh(41008+-10349),['info']='\xd9\x85\xd8\xb9\xd9\xd4\xe6\x85\xabIz!\x1a\xaf',[Xl('(\247\18\188,\253\f\173','\\\146~\217')]='\xd8\xa7\xd9\x86\xd8\xaa\xd9\x82\xd8\xa7\xd9\x84',[Xh(174678591/3737)]=Xh(-0.52314647377938517*16590),['visuals']=Xh(-2633490/-6054),[Xh(5998+7405)]=Xh(159358290/16926),[Xh(-2.9070486152383217*-8413)]='\xd9\x85\xd9\x85\xd9\x8a\xd8\xb2\xd8\xa7\xd8\xaa \xd8\xa8\xd8\xb1\xd9\x88',['se \xbfDH\xcd\x86']='\xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\xd8\xaa',[Xh(2360+12167)]='\xd8\xa7\xd9\x84\xd9\x85\xd8\xb7\xd9\x88\xd8\xb1',[Xh(3.2034073309241093*-3874)]='\xd8\xa7\xd9\x84\xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\xd8\xaa',[Xh(4894+26744)]=Xh(35796-26797),[Xh(22119- -26653)]=Xl('~\240\96v,|\244\22\6\183\\\5\189|\253\245\174','\142o\238\221\f\165~\207'),[Xh(-31091- -22100)]=Xh(26573-19403),['accountAge']=Xh(364349562/-27057),[Xh(69510+-32707)]=Xh(30728+-25445),[Xh(51133+-6874)]=Xh(-6452+-6783),[Xh(-11482-760)]=Xh(43213-29770),['players']=Xh(-0.75989609104403766*8084),[Xh(0.14087454565480781*9079)]=Xh(65761+-29889),['ping']='\xf0\x9f\x93\xa1 \xd8\xa7\xd9\x84\xd8\xa8\xd9\x8a\xd9\x86\xd9\x82: ',['rejoin']='\xd8\xa7\xd8\xaf\xd8\xae\xd9\x84 \xd9\x86\xd9\x81\xd8\xb3 \xd8\xb3\xd9\x8a\xd8\xb1\x82\x94AuW?\xf4\x12D\x02p\xc7McmY\x90\xc3\xc6\xe1\xd4\xff\xd4r3\x8c\x84\x04%',['findServer']=Xh(15452- -22646),[Xh(1.517275237803007*16295)]='\xd8\xac\xd8\xa7\xd8\xb1\xd9\x8a \xd8\xa5\xd8\xb9\xd8\xa7\xd8\xaf\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xaf\xd8\xae\xd9\x88\xd9\x84',['searchingServer']=Xh(44211+-21348),['serverFound']='\xd9\x88\xd8\xac\xd8\xaf\xd9\xd2\xb9\x97,<\xd9\xc1|L\x91\xd8d\xd4\x97:=',['s5\xb1\xedb\x0frNotFo!\xe7;']=Xh(9250- -18508),['autoJoin']=Xh(-26844- -28030),['auto\x1d\xcaYx>\xf1Z\x8eU']=Xh(-27152- -23161),[Xh(22288-15860)]=Xh(75723+-32110),['disableAutoJoin']='\xd8\xb7\xd9\x81\xd9\x8a\xd9\x87 \xd8\xa7\xd8\xb0\xd8\xa7 \xd8\xa8\xd8\xaa\xd8\xaf\xd8\xae\xd9\x84 \xd8\xa7\xd9\x86\xd8\xaa \xd8\xa8\xd9\x8a\xd8\xaf\xd9\x83 \xd9\x85\xd8\xa8 \xd8\xa7\xd9\x88\xd8\xaa\xd9\x88',[Xh(16218+-1741)]='\xd8\xb7\xd8\xb1\xd9\x8a\xd9\x82\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xaf\xd8\xae\xd9\x88\xd9\x84',[Xl(' \180J\v\175X\4\185Y\21\175^','T\213\56l\202,')]=Xh(0.79763349514563109*19776),['selectArena']=Xh(-10607- -1405),[''Y\4}')]=Xh(49527-6622),[Xh(-3.4863044454422991*-13362)]=Xh(-19899+11840),[Xh(-528418133/-16607)]='Auto Ready \xe2\x9c\x85',[Xh(-412562496/-26672)]='\xd9\x8a\xd8\xb6\xd8\xba\xd8\xb7 \xd8\xa7\xd8\xb3\xd8\xaa\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf \xd8\xaa\xd9\x84\xd9\x82\xd8\xa7\xd8\xa6\xd9\x8a',['autoStreak']='\xf0\x9f\x94\xa5 \xd8\xa7\xd9\x88\xd8\xaa\xd9\x88 \xd8\xb3\xd8\xaa\xd8\xb1\xd9\x8a\xd9\x83',[Xh(68868-22721)]=Xh(51402-1261),['streakMode']='\xd9\x86\xd9\xd5\x8e&*\xe7\xfc\xa9*\xc4\xe8\x1f"\xed\xcc',['streakModeDesc']='\xd9\x83\xd9\x85 \xd9\x84\xd8\xa7\xd8\xb9\xd8\xfc\xd2\xac-\x13\xc9\xb9\xfb\x1f\x9b\x9b\x16\xb2\xcf\xed\x15\x05',['stre:\x0f\xbe\xa5f\x86\xaa}\xa6']=Xh(-635212480/-16660),[Xl(')$\159,\203\49\22\130<\196>','ZP\237I\170')]=Xh(3981- -20729),['strea?\xc3=\xc0\x82\xe4\x1e\xcd']='\xd8\xa8\xd8\xa7\xd9\x86\xd8\xaa\xd8\xb8\xd8\xa7\xd8\xb1 \x13l\x8b#\x81\xc3!\xed\xf4\xf2m\xc4\xb2t\x1b\x85\xdf%>K\xf4\x13\x1d0\xafM\xa8c\x19\x1d.'\191\208\143\52V'),['streakMatchActive']='\xd8\xa7\xd9\x84\xd9\x85\xd8\xa8\xd8\xa7\xd8\xb1\xd8\xa7\xd8\xa9 \xd8\xb4\xd8\xba\xd8\xa7\xd9\x84\xd8\xa9\xd8\x8c \xd8\xa7\xd9\x84\xd8\xad\xd9\x85\xd8\xa7\xd9\x8a\xd8\xa9 \xd9\x85\xd9\x81\xd8\xb9\xd9\x91\xd9\x84\xd8\xa9',[Xh(36158+9914)]='\xd9\x85\xd9\x86\xd8\xb9 \xd8\xa7\xd9\xdf}\xce\x13\xf8\xe1x\xc4E\xdff\xbc\xff\xc0~\x19ATk\x06',[Xh(-0.56561416316846136*5479)]='\xd9\x8a\xd9\x85\xd9\x86\xd8\xb9 \xd8\xb1\xd9\x88\xd8\xa8\xd9\x84\xd9\x88\xd9\x83\xd8\xb3 \xd9\x85\xd9\x86 \xd8\xb7\xd8\xb1\xd8\xaf\xd9\x83 \xd8\xa8\xd8\xb3\xd8\xa8\xd8\xa8 \xd8\xb9\xd8\xaf\xd9\x85 \xd8\xa7\xd9\x84\xd8\xad\xd8\xb1\xd9\x83\xd8\xa9',[Xh(16319+-302)]='Teleport Tools',[Xh(-25515- -30395)]='Teleport anywhere quickly',[Xh(1.4099276665773661*26129)]=Xh(687394515/19115),[Xh(9726-11985)]='\xd8\xb1\xd8\xad \xd9\x84\xd9\x84\xd9\x85\xd9\x83\xd8\xa7\xd9\x86 \xd8\xa7\xd9\x84\xd9\x85\xd8\xad\xd9\x81\xd9\x88\xd8\xb8',[Xh(13922-11765)]=Xh(421673160/8620),['autoFollowDesc']=Xh(23911+-10976),[Xh(27882+21239)]=Xl('\205\rq\205\149\55\253\216\48z\127&3\173\231-\245\22\173\182s!\164\231B\173A\201&\20{[\14\231-\245\20\172\146','\21\170\169|M\155%a\16\162\205\254\130\141?\138,\146u'),[Xh(-7.0305536089698668*-7135)]=Xh(-17134+23546),['pinAutoButtonDesc']=Xh(36934+-20018),['autoHold']=Xh(26380+-2471),[Xh(-13691+24891)]='\xd9\x84\xd8\xa7\xd8\xb2\xd9\x85 \xd9\x8a\xd9\x83\xd9\x88\xd9\x86 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd9\x81\xd9\x88\xd9\x84\xd9\x88 \xd8\xb4\xd8\xba\xd8\xa7\xd9\x84 \xd9\x85\xd8\xb9\xd8\xa7\xd9\x87. \xd9\x84\xd9\x85\xd8\xa7 \xd8\xaa\xd8\xa7\xd8\xae\xd8\xb0 \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9\xd8\x8c \xd9\x8a\xd9\x85\xd8\xb3\xd9\x83\xd9\x87\xd8\xa7 \xd9\x88\xd9\x8a\xd8\xb1\xd8\xa7\xd9\x88\xd8\xba \xd8\xa7\xd9\x84\xd8\xae\xd8\xb5\xd9\x85 \xd9\x84\xd9\x8a\xd9\x86 \xd9\x85\xd8\xa7 \xd9\x8a\xd9\x88\xd8\xb5\xd9\x84 \xd9\x88\xd9\x82\xd8\xaa \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xd9\x84\xd9\x84\xd8\xb1\xd9\x82\xd9\x85 \xd8\xa7\xd9\x84\xd9\x84\xd9\x8a \xd8\xaa\xd8\xad\xd8\xaf\xd8\xaf\xd9\x87\xd8\x8c \xd9\x88\xd8\xa8\xd8\xb9\xd8\xaf\xd9\x87\xd8\xa7 \xd9\x8a\xd8\xb3\xd9\x84\xd9\x85\xd9\x87\xd8\xa7 \xd8\xaa\xd9\x84\xd9\x82\xd8\xa7\xd8\xa6\xd9\x8a\xd9\x8b\xd8\xa7 \xd8\xb9\xd9\x86 \xd8\xb7\xd8\xb1\xd9\x8a\xd9\x82 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd9\x81\xd9\x88\xd9\x84\xd9\x88',['autoHoldSettings']='\xe2\x9a\x99\xef\xb8\x8f \xd8\xa5\xd8\xb9\x8fT\xe3\x1e\xf1\x83\x03\xedU\xb6C\x16T{\xd1Qk\xae\xce\xfd\x08G[\x18\xdcsIh',[Xh(33492+-1832)]=Xh(60061+-23081),[Xh(39512- -9875)]='\xd9\x84\xd9\x85\xd8\xa7 \xd9\x88\xd9\x82\xd8\xaa \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xd9\x8a\xd9\x88\xd8\xb5\xd9\x84 \xd9\x84\xd9\x87\xd8\xb0\xd8\xa7 \xd8\xa7\xd9\x84\xd8\xb1\xd9\x82\xd9\x85 \xd8\xa3\xd9\x88 \xd8\xa3\xd9\x82\xd9\x84\xd8\x8c \xd9\x8a\xd9\x88\xd9\x82\xd9\x81 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb1\xd8\xa7\xd9\x88\xd8\xba\xd8\xa9 \xd9\x88\xd9\x8a\xd8\xb3\xd9\x84\xd9\x85\xd9\x87\xd8\xa7 \xd8\xaa\xd9\x84\xd9\x82\xd8\xa7\xd8\xa6\xd9\x8a\xd9\x8b\xd8\xa7',['autoHoldDistance']=Xh(23392- -16861),[Xh(-1.8319946714727893*-25523)]=Xh(-1029433475/-31325),[Xh(-8319+9932)]=Xh(-526655376/-15912),['autoHold\x03\x02OV?\xb4\xc8\xa1\x88']='\xd8\xa7\xd9\x88\xd8\xaa\xd9\x88 \xd9\x87\xd9\x88\xd9\x84\xd8\xaf \xd8\xaa\xd8\xa7\xd8\xa8\xd8\xb9 \xd9\x84\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd9\x81\xd9\x88\xd9\x84\xd9\x88\xd8\x8c \xd9\x84\xd8\xa7\xd8\xb2\xd9\x85 \xd8\xaa\xd8\xb4\xd8\xba\xd9\x84 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd9\x81\xd9\x88\xd9\x84\xd9\x88 \xd9\x85\xd8\xb9\xd8\xa7\xd9\x87 \xd8\xb9\xd8\xb4\xd8\xa7\xd9\x86 \xd9\x8a\xd8\xb4\xd8\xaa\xd8\xba\xd9\x84 \xd8\xb5\xd8\xad',['importantNotes']='\xf0\x9f\x93\x9d \xd9\x85\xd9\x84\xd8\xa7\xd8\xad\xd8\xb8\xd8\xa7\xd8\xaa \xd9\x85\x89%\xf6$\x17\xd5z',[Xh(26565-798)]=Xh(27641693/683),['a!\xf79\xca\x811X\xfa\x1c?\xbb(\xd1\xb37Z\xf1\x00']='\xe2\x9a\x99\xef\xb8\x8f \xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\xd8\xaa \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd8\xa7\xd9\x84\xd9\x85\xd8\xaa\xd9\x82\xd8\xaf\xd9\x85\xd8\xa9',['strafeDistance']='\xd9\x85\xd8\xb3\xd8\xa7\xd9\x81\xd8\xa9 \xd8\xa7\xd9\xd4\xa2M\x9b\xa5\xa5a\xf4u\xc7 \xda\x8d\xc2',[''TT\xc4q1u\xee[g9A\xd8s2T\xcfA'P']=Xh(-15708- -23812),['strafeAmplitude']='\xd9\x82\xd9\x88\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xaa\xd9\x85\xd8\xa7\xd9\x8a\xd9\x84',['strafeAmplitudeDesc']='\xd8\xb9\xd8\xb1\xd8\xb6 \xd8\xad\xd8\xb1\xd9\x83\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb1\xd8\xa7\xd9\x88\xd8\xba\xd8\xa9 \xd9\x8a\xd9\x85\xd9\x8a\xd9\x86 \xd9\x88\xd9\x8a\xd8\xb3\xd8\xa7\xd8\xb1',[Xh(31029+16258)]=Xh(-23941- -22192),[Xh(52386+-17123)]=Xh(-336911505/-18735),[Xh(48391+-17247)]='\xd9\xd1\xe5\xf2^\xbe\xa9 \xd8\xa7\xd9\x84\xd9\xd1\xe4\xd9^\xbe\xa7\xd8\xad\xd9\x82\xd8\xa9',['followDurationDesc']='\xd9\x83\xd9\x85 \xd8\xab\xd8\xa7\xd9\x86\xd9\x8a\xd8\xa9 \xd9\x8a\xd9\x84\xd8\xa7\xd8\xad\xd9\x82 \xd8\xa7\xd9\x84\xd8\xae\xd8\xb5\xd9\x85 \xd9\x82\xd8\xa8\xd9\x84 \xd9\x85\xd8\xa7 \xd9\x8a\xd8\xaf\xd9\x88\xd8\xb1 \xd8\xb9\xd9\x84\xd9\x89 \xd9\x87\xd8\xaf\xd9\x81 \xd8\xac\xd8\xaf\xd9\x8a\xd8\xaf',['minDistance']='\xd8\xa3\xd9\x82\xd8\xb1\xd8\xa8{x\xbd\xcb\xf4`G\x9f\x04\xe85',[Xh(-8471-6072)]='\xd8\xa3\xd9\x82\xd8\xb1\xd8\xa8 \xd9\x85\xd8\xb3\xd8\xa7\xd9\x81\xd8\xa9 \xd9\x8a\xd9\x88\xd9\x82\xd9\x81 \xd8\xb9\xd9\x86\xd8\xaf\xd9\x87\xd8\xa7 \xd8\xb9\xd9\x86 \xd8\xa7\xd9\x84\xd8\xae\xd8\xb5\xd9\x85',['rotationSpeed']='\xd8\xb3\xd8\xb1\xc0\xaa\xb3\x9924\xad\xfb\x9d\xe0\x86\x19\\\xd2\xf9\xc8S\xf4\xb4\xc3\xb9'\169\19\232\238\48\224'),[Xh(49924+-16352)]=Xh(11291-3600),['adhesionForce']='\x8d\\\x7f\x95U\xea\xca\xc4\xc2\xb6\x98\x80|\xca\x16\x13\xd7m7\xd8K\x95\xf0\x11\xdc\xdc',[Xh(-0.66011663286004052*-15776)]='\xd8\xa3\xd9\x82\xd8\xb1\xd8\xa8 \xd9\x85\xd8\xb3\xd8\xa7\xd9\x81\xd8\xa9 \xd9\x8a\xd9\x84\xd8\xaa\xd8\xb5\xd9\x82 \xd9\x81\xd9\x8a\xd9\x87\xd8\xa7 \xd8\xa8\xd8\xa7\xd9\x84\xd8\xae\xd8\xb5\xd9\x85 \xd8\xb9\xd8\xb4\xd8\xa7\xd9\x86 \xd9\x8a\xd8\xb3\xd9\x84\xd9\x85\xd9\x87 \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9',[Xl('4s\"*\21\20)x\a,\r\28?','F\22CIa}')]=Xh(-4521- -22132),[Xh(-7218- -14399)]='\xd9\x8a\xd9\x86\xd8\xaa\xd8\xb8\xd8\xb1 \xd9\x87\xd8\xb0\xd9\x8a \xd8\xa7\xd9\x84\xd9\x85\xd8\xaf\xd8\xa9 \xd9\x82\xd8\xa8\xd9\x84 \xd9\x85\xd8\xa7 \xd9\x8a\xd8\xaa\xd8\xad\xd8\xb1\xd9\x83 \xd9\x84\xd9\x84\xd8\xb9\xd8\xaf\xd9\x88 \xd8\xb9\xd8\xb4\xd8\xa7\xd9\x86 \xd9\x8a\xd8\xa8\xd8\xa7\xd9\x86 \xd8\xb7\xd8\xa8\xd9\x8a\xd8\xb9\xd9\x8a\xd8\x8c 0.0 = \xd9\x8a\xd8\xaa\xd8\xad\xd8\xb1\xd9\x83 \xd9\x81\xd9\x88\xd8\xb1\xd9\x8b\xd8\xa7',['speedSetti> {\x1c']='\xd9\x86\xd8\xb8\xd8\xa7\xd9\x85 \xd8\xa7\xd9\x84\xd8\xb3\xd8\xb1\xd8\xb9\xd8\xa9 \xf0\x9f\x9a\x80',['speedDesc']='\xd8\xaa\xd8\xad\xd9\x83\xd9\x85 \xd9\x81\xd9\x8a \xd8\xb3\xd8\xb1\xd8\xb9\xd8\xaa\xd9\x83',['speedType']='\x88}\x9b\x88\xf9\xc3\xcd\xb2\xb1 \xd9\x86\xd9\x88\xd8\xe9\xfa\x9b\x81\xf8\xed\xcd\xb2\xb3\xd8\xb1\xd8\xb9\xd8\xa9',['speedTypeDesc']='\xd8\xa7\xd8\xae\xd8\xaa\xd8\xa7\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xb3\xd8\xb1\xd8\xb9\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x8a \xd8\xaa\xd9\x86\xd8\xa7\xd8\xb3\xd8\xa8 \xd9\x84\xd8\xb9\xd8\xa8\xd9\x83 ',['s$\xe9\xbeY\x83']='Speed 1',['speed2']='Speed 2',['speedLevel']=Xh(-47802954/10781),[Xh(-34778- -23346)]='\xd8\xaa\xd8\xb4\xd8\xba\xd9\x8a\xd9\x84 \xd8\xa7\xd9\x84\xd8\xb3\xd8\xb1\xd8\xb9\xd8\xa9',['speedDesc2']=Xl('\131\28M\157*%9\255\241w]\173rZ\247\173\207U,\132\130\17\160\14*:9\244\240D\\\133\138+{Z@\187\166l9','\178\49x\189\242\139\224~(\253\132,\170\243\215\130\239c\1\181'),['flightFeatures']=Xh(65545-21945),[Xh(325210700/-28972)]='\xd8\xb7\x8b@=\xdcy\x7f\xda\x04\x08\xde\xd1I\xd8\xba\x8ai<\xe8yp"lQ\xa0\x82\xef'\151\158%\218\128\128\167\243}!\19'),[Xh(-108199065/-14885)]=Xh(74518+-29441),[Xh(45294+-11900)]=Xh(40479+-15538),['flightSpeed']=Xh(90073104/-16368),['stopFlight']='\xd9\xd8\xe1\xa4\xc1dFB^\xb6t\xcb\xb5\xc7\xb4%2$\xc4O\x19',['dou2\x97Y?\xe9)\xb1']=Xh(-2253- -24104),[Xh(-15333- -13659)]='\xd9\x86\xd8\xb7 \xd9\x85\xd8\xb1\xd8\xaa\xd9\x8a\xd9\x86 \xd9\x81\xd9\x8a \xd8\xa7\xd9\x84\xd9\x87\xd9\x88\xd8\xa7\xd8\xa1',[Xh(-890725242/-23262)]=Xl('\245;+,%;\213\128\252K\n\151\145\127\25,$\17\212\169\253v\243\202','\23\167\174\f\253\148\r(%\207*N'),['doubleJumpDisabled']=Xh(494846768/10946),[Xh(1.6790376725102574*-5362)]=Xh(257912270/10982),[Xh(154741760/30223)]='\xd9\x8a\xd8\xaa\xd8\xad\xd9\x88\xd9\x84 \xd9\x84\xd8\xb4\xd8\xa8\xd8\xad \xd9\x85\xd8\xaa\xd8\xad\xd8\xb1\xd9\x83 - \xd8\xaf\xd8\xa7\xd8\xa6\xd8\xb1\xd8\xa9 \xd8\xad\xd9\x85\xd8\xb1\xd8\xa7\xd8\xa1 \xd8\xaa\xd8\xb8\xd9\x87\xd8\xb1 \xd8\xb9\xd9\x86\xd8\xaf \xd8\xa7\xd9\x84\xd8\xaa\xd9\x81\xd8\xb9\xd9\x8a\xd9\x84',['visualSettings']=Xh(-0.87668484734499408*-31902),['visualDesc']=Xh(20577+-14617),['enableLighting']=Xh(-12404+31923),[Xh(10288- -5013)]='\xd9\x8a\xd8\xb6\xd9\x8a\xd9\x81 \xd8\xaa\xd8\xa3\xd8\xab\xd9\x8a\xd8\xb1\xd8\xa7\xd8\xaa Bloom \xd9\x88 ColorCorrection \xd9\x88 SunRays',[Xl('\227\14l\235,y\229','\130\96\24')]='An#\x0c\x88\xbe.$\xfe\xc7\xbf\xd5-\xbe\xfb0-Fo\x15\xfdd\x88D\x19J\xc1\nf',[Xh(-1.8029262582910652*-25630)]='\xd8\xaa\xd8\xad\xd8\xb3\xd9\x8a\xd9\x86 \xd8\xa3\xd8\xaf\xd8\xa7\xd8\xa1 \xd9\x87\xd8\xa7\xd8\xa6\xd9\x84 \xd9\x88\xd8\xaa\xd8\xb9\xd8\xb7\xd9\x8a\xd9\x84 \xd9\x83\xd9\x84 \xd8\xa7\xd9\x84\xd9\x85\xd8\xa4\xd8\xab\xd8\xb1\xd8\xa7\xd8\xaa \xd8\xa7\xd9\x84\xd8\xab\xd9\x82\xd9\x8a\xd9\x84\xd8\xa9',[Xh(2.7658041085007379*17622)]=Xh(-25406- -18492),[Xh(-1564- -1366)]=Xh(4927-6639),['headless']=Xh(-0.11840553801681183*26291),['headlessDesc']=Xh(-1.6284987277353689*-3537),['korblox']='\xf0\x9f\xa6\xb4 Korblox',[Xh(62882+-23615)]=Xh(4908-2361),['newDanceSystem']='\xf0\x9f\x95\xba \xd9\x86\xd8\xe3#\xadjV\x8c\xbf\xb3\xac:j\x14\xe0\xc8\xf5\xea7x\xe5\x1fua\xcc\xa7d\xaa\xeb\x13\xa3',['enableDanceButton']=Xh(23140-3414),[Xh(1.2757731958762886*29488)]='\xd9\x8a\xd8\xb8\xd9\x87\xd8\xb1 \xd8\xaf\xd8\xa7\xd8\xa6\xd8\xb1\xd8\xa9 \xd8\xad\xd9\x85\xd8\xb1\xd8\xa7\xd8\xa1 \xd9\x82\xd8\xa7\xd8\xa8\xd9\x84\xd8\xa9 \xd9\x84\xd9\x84\xd8\xb3\xd8\xad\xd8\xa8',[Xh(37984- -9552)]=Xl('\\zc\211\167\16v\231\57\240#\4?\165\206c,\142\172\240-','\132\221\187}\127\186\174V\25('),['selectDanceDesc']=Xh(-16808510/-919),[Xh(5.3396799116997791*3624)]='\xd8\xb1\xd9\x82\xd8\xb5\xd8\xa9 1 \xf0\x9f\x95\xba',[Xh(42423- -3332)]='\xd8\xb1\xd9\x82\xd8\xe5\xf3\xaf\xf56\xb5\x00F\xb3\xbe\xdf\xc9',['danceg\xc0']=Xh(63665+-20739),[Xh(-171168306/-6046)]='\xd9\x88\xd8\xaf\xd8\xa7\xd8\xb9 \xf0\x9f\x91\x8b',[Xh(-8880+19573)]=Xh(13145568/21621),['laugh']=Xh(11928+-14040),['cheer']='\xd8\xaa\xd8\xb5\xd9\x81\xd9\x8a\xd9\x82 \xf0\x9f\x91\x8f',['p)\x00o\n\xf90\xeb'\n>\xa3']='\xd9\x85\x82P\xe7\xa5\xb2\xd8\xa7\xd8\xf1\xfa8\x130\x17',[Xh(11022-5107)]='\xd8\xa7\xd9\x88\xd8\xaa\xd9\x88 \xd8\xa8\xd8\xa7\xd8\xb3 \xd8\xa8\xd9\x88\xd9\x85\xd8\xa8\xf0\x9f\x92\xa3',['autoPa#Y\xd2\x02\x1e\xeb\x0brls']='\xd8\xa7\xd8\xb0\xd8\xa7 \xd9\x85\xd8\xb9\xd9\x83 \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xd8\xa8\xd9\x8a\xd8\xb9\xd8\xb7\xd9\x8a\xd9\x87\xd8\xa7 \xd9\x84 \xd8\xae\xd8\xb5\xd9\x85\xd9\x83',[Xl('/\221,\183\202\161@(\192\r\188\243\161Y','M\178A\213\158\200-')]=Xl('\206|~U\171\226\20\137\181\186\246e\n(\187\249\163\208\57Z;\145\167k\96\159+g\154\202\229\237\211\202\201Re\a)\140\249\165\208\53[\22h\251\30\17',",\243\207\186\19m4Q\18cr\189\160\240\b \'\t\179\131\190\177\127\198\184"),[Xl(',B\n\19g\132\n\182=\2D\n\24G\169\2\160,','N-gq3\237g\211O')]=Xh(31372516/-23102),[Xh(22840- -12864)]='\xd8\xa7\xd9\x84\xd9\x88\xd9\x82\xd8\xaa \xd8\xa7\xd9\x84\xd9\x85\xd8\xad\xd8\xaf\xd8\xaf \xd9\x84\xd9\x84\xd8\xaa\xd8\xb3\xd9\x84\xd9\x8a\xd9\x85 (\xd8\xa8\xd8\xa7\xd9\x84\xd8\xab\xd9\x88\xd8\xa7\xd9\x86\xd9\x8a)',['bombTimerValueDesc']=Xh(-40552- -26219),[Xh(17560664/10186)]=Xl('I\161\167|\192\217\253%QtgP\130\147\2I\174^,\176\170\172t\244tcx\172\217\6','\145\6~\244\24s$\173q\172\203\136\51K\165'),['autoGra2W=\xa7\xa6\x88p\xa0K<']=Xh(70353+-25599),['reach']='\xd8\xb1\xd9\x8a\xd8\xaa\xd8\xb4',[Xh(0.029310344827586206*-23780)]=Xh(-257302480/-8959),[Xh(5385+-17486)]=Xh(210535696/9247),['reachLevelDesc']='\xd9\x83\xd9\x84 \xd9\x85\xd8\xa7 \xd8\xb2\xd8\xa7\xd8\xaf \xd8\xa7\xd9\x84\xd8\xb1\xd9\x82\xd9\x85 \xd8\xb2\xd8\xa7\xd8\xaf \xd8\xad\xd8\xac\xd9\x85 \xd8\xa7\xd9\x84\xd8\xb1\xd9\x8a\xd8\xaa\xd8\xb4 (0 = \xd8\xa8\xd8\xaf\xd9\x88\xd9\x86 \xd8\xb1\xd9\x8a\xd8\xaa\xd8\xb4)',[Xh(-0.69724914035636132*6398)]=Xh(-15200+19112),['bombEvasion']=Xh(-515234349/-27849),['bombEvasionD>\t\xaf\x06']=Xh(-42354+28612),[Xh(-1.664855775449489*-15462)]='\xab|\x10B}\x91\xaa\xe6\xf7\xf75\xf4\\W~\x04\xd12\xb0Q\xf6\x17\xf4[',['an y\xcf\x82\xb1\xe9##\xc3\xb7\xbb']='\xd9\x85\x8fg\xf4\x81f\x85\xca{\n\xd2L\x8e5\x9a\xd7\xfc\xa2\xa3/'QH\x9b\xdc\x18\xdb\xbd\xe2\n\xd5L\x8f\x19\x9b\xf8\xfd\x91[N',['recordingMode']='\xf0\x9f\x8e\xa5 \xd9\x88\xd8\xb6\xd8\xb9 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xb5\xd9\x88\xd9\x8a\xd8\xb1',[Xh(-183749827/24251)]='\xd9\x8a\xd8\xae\xd9\x81\xd9\x8a \xd9\x83\xd9\x84 \xd8\xa3\xd8\xb2\xd8\xb1\xd8\xa7\xd8\xb1 \xd9\x88\xd9\x85\xd9\x8a\xd8\xb2\xd8\xa7\xd8\xaa \xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa \xd8\xa3\xd8\xab\xd9\x86\xd8\xa7\xd8\xa1 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xb5\xd9\x88\xd9\x8a\xd8\xb1',[Xh(-217557264/-15724)]=Xh(3.0442828816920025*13617),[Xh(27980+14870)]=Xh(-3.7041649818034776*-12365),[Xh(-5336- -1700)]='\xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\x8f\xd5n^\xe6\xadx<v\x9e\xdd\xa5\xf00k\xc9\x1cb\xea',['scriptDesc']=Xl(",Q\199\228\152~\221\247h\137\160\219\167\188\171\157\52j\\\'\181q\152r$\171\22\217\4\218\151\188\162\156\4kw",'\244\255\31Q@\203\253/\207P$\3\20e(E\133\178'),[Xh(20311+-20341)]='\xd9\x85\xd8\xf8\xaeC\x94\xb2\xb1 \xd8\xa7\xd9\x84\xd8\xa5\xd8\xee\xaff\x94\xb2\xa7\xd8\xaf\xd8\xa7\xd8\xaa',[Xh(-3.7556394814739207*-9797)]='\xd8\xa7\xd8\xad\xd9\x81\xd8\xb8 \xd9\x83\xd9\x84 \xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\xd8\xaa\xd9\x83 \xd8\xa7\xd9\x84\xd8\xad\xd8\xa7\xd9\x84\xd9\x8a\xd8\xa9 \xd8\xa8\xd8\xa7\xd8\xb3\xd9\x85 \xd9\x85\xd8\xae\xd8\xb5\xd8\xb5\xd8\x8c \xd8\xa3\xd9\x88 \xd8\xad\xd9\x85\xd9\x91\xd9\x84/\xd8\xa7\xd8\xad\xd8\xb0\xd9\x81 \xd9\x83\xd9\x88\xd9\x86\xd9\x81\xd9\x8a\xd8\xac \xd8\xb3\xd8\xa7\xd8\xa8\xd9\x82.',[Xh(35628-1168)]=Xh(21921+10664),['toggleUIDesc']=Xh(62568+-18187),['toggleUIButton']=Xh(56463-15357),['toggleUIKeyTitle']=Xh(22322- -26736),['toggleUIKeyDesc']='\xd8\xa7\xd9\x84\xd9\x85\xd9\x81\xd8\xaa\xd8\xa7\xd8\xad \xd8\xa7\xd9\x84\xd8\xa7\xd9\x81\xd8\xaa\xd8\xb1\xd8\xa7\xd8\xb6\xd9\x8a \xd9\x84\xd8\xa5\xd8\xb8\xd9\x87\xd8\xa7\xd8\xb1/\xd8\xa5\xd8\xae\xd9\x81\xd8\xa7\xd8\xa1 \xd8\xa7\xd9\x84\xd9\x88\xd8\xa7\xd8\xac\xd9\x87\xd8\xa9',[''\208\178\167\205\215a')]=Xh(2597- -7821),['keybindSe#\x01\xf95\x01\xc1']='\xd8\xb2\xd8\xb1 \xd8\xa5\xd8\xb8\xd9\x87\xd8\xa7\xd8\xb1/\xd8\xa5\xd8\xae\xd9\x81\xd8\xf0O%.\xcc\xacK`\x0f\xea?\xf8\xcc\x1e\xd2\xc16\xefd\xe9\xfe\xf3nw\xd2\x03\xeaRR',[Xh(-678532140/-20735)]=''\189/l1\163\'#}d\182"),['keybind\x1e\x0b\xc4O,\xae\xecR\xd0K']='\xd8\xa7\xd9\x84\xd9\x85\xd9\x81\xd8\xaa\xd8\xa7\xd8\xad \xd8\xba\xd9\x8a\xd8\xb1 \xd9\x85\xd8\xaf\xd8\xb9\xd9\x88\xd9\x85\xd8\x8c \xd8\xac\xd8\xb1\xd8\xa8 \xd9\x85\xd9\x81\xd8\xaa\xd8\xa7\xd8\xad \xd8\xab\xd8\xa7\xd9\x86\xd9\x8a',['SAVE_CONFIG']='\xd8\xad\xd9\x81\xd8\xb8 \xd8\xa7\xd9\x84\xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\xd8\xaa',[Xh(312406180/8084)]='\xd8\xaa\xd8\xad\xd9\x85\xd9\x8a\xd9\x84{=\xbe\xa7\xd9\x84\xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\x88:\xc9\x83\xb0\xf8\x9e\xb5',[Xh(-5.5971614072172731*-6623)]=Xh(-22465+24312),['selectTheme']='\xd8\xa7\xd8\xae\xd8\xaa\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xb3\xd9\x85\xd8\xa9',['closeScript']='\xd8\xa3\xd9\x82\xd9\x81\xd9\x84 \xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa',[Xh(-813+-9891)]=Xh(-4.3463789319678128*2734),['tpOnClose']=Xh(-364114080/-22352),['hideRealBody']='\xd8\xa5\xd8\xae\xd9\x81\xd8\xa7\xd8\xa1 \xd8\xa7\xd9\x84\x8f3\x92\x05D\xcf}{58\x04\xd5QG_\xba\xc9\x12E\x14\xe7W',['noclipInvisible']='\xd8\xa7\xd8\xae\xd8\xaa\xd8\xb1\xd8\xa7\x8d\xb0\x18\xda8z=\xd9\x1c\xb9c\xc9\xd8\xb1\x8c\x95\xe1\x84',['flyInvisible']=Xh(-129540288/14176),[Xh(74535+-28099)]='\xd9\x82\xd9\x81\xd9\x84 \xd8\xf0\xf7\xc8\\T\xa9\xb5U\xaeX\xe6t\xae\xb0\x04T}T\xdd\xe7?\xffP\xe2G4p\xbe',['ghostSpeed']=Xh(-37066- -26210),[Xh(10.532082922013821*1013)]='\xd9\xd6\xaa*"d\n\xf2\xbe\xa7\x8d\xf7{x\x14\xab\xf2\xbe\xb2',[Xh(0.65526162062922477*11983)]='\xd8\xa7\xd9\x88\xd8\xaa\xd9\x88 \xd8\xaf\xd8\xb9\xd8\xb3',[Xh(27458- -21355)]=Xh(0.14711369329993071*18761),['de&\xe7kf\xb5\xb9\x89\xdd\xedJ\xb1~@']=Xh(0.48936618235417984*-23745),['developerD5\xc2P\x9f']=Xh(-25440- -12383),[Xh(-3.1416142169566825*-5402)]=Xh(7156- -9354),[Xh(32926+-31550)]='\xd8\xa7\xd9\x84\xd8\xa5\xd8\xb5\xd8\xaf\xd8\xa7\xd8\xb1 2.6.0',['contactDev']='\xd8\xaa\xd9\x88\xd8\xa7\xd8\xb5\xd9\x84 \xd9\x85\xd8\xb9 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb7\xd9\x88\xd8\xb1',['mainFeaturesList']='\xf0\x9f\x93\x8b \xd8\xb3\xd8\xac\xd9\x84 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xad\xd8\xaf\xd9\x8a\xd8\xab\xd8\xa7\xd8\xaa',['mainFeaturesDesc']=Xh(15268-21540),['discordServerTitle']='\xf0\x9f\x8c\x9f \xd8\xb3\xd9\x8a\xd8\xb1\xd9\x81\xd8\xb1 \xd8\xaf\xd9\x8a\xd8\xb3\xd9\x83\xd9\x88\xd8\xb1\xd8\xaf Zyphora \xd8\xa7\xd9\x84\xd8\xb1\xd8\xb3\xd9\x85\xd9\x8a',[Xh(-0.7849299140882372*-30962)]=Xh(250040050/-20345),[Xh(-2.9582496752096374*-16934)]='\xf0\x9f\x93\x8b \xd9\x86\xd8\xb3\xd8\xaetP>\xf6\x91\x8at&\x85$\x98)\x17\xad',[Xh(-1.2180365296803652*5256)]='\xe2\x9c\x85 \xd8\xaa\xd9\x85 \xd9\x86\xd8\xb3\xd8\xae \xd8\xb1\xd8\xa7\xd8\xa8\xd8\xb7 \xd8\xa7\xd9\x84\xd8\xaf\xd9\x8a\xd8\xb3\xd9\xd7B\x0b\xc9\x80ro\xe2d',[Xh(16069- -14097)]=Xh(-98596224/16389),[Xh(-1.8883221476510068*-3725)]=Xh(-0.025895433115192455*14211)},[Xh(79701933/-9627)]={['welcome']=Xl('=\133H\207\185\55\252\217\159\179\228\212\200\v\142P\195\187\2\201\139\132\252\52\27,\245','j\224$\172\214Z\153\249\235\220\196\132\160'),[Xh(18345+-3947)]=Xh(-1032343659/-30423),['discord']=Xh(-1098310360/-21880),[Xh(-1.3621602746901007*-17183)]='Join the official script server!\n\xe2\x80\xa2 Latest updates\n\xe2\x80\xa2 Technical support\n\xe2\x80\xa2 Suggestions and improvements\n\xe2\x80\xa2 Security updates\n\nLink: https://discord.gg/CgUa36sPNs',['copyLink']='Copy Link & Activate Script',[Xh(-0.89296340374888428*13444)]='\xe2\x9c\x85 Link Copied',['linkCo\x0egv\xe8{\xb0E'\x08\xec_'")]='Script activated!
Discord link in clipboard',['changeLanguage']='Change La5\xd9S\x98\x17\xc9\xe5L\t\x7f\xe23\x93\xe4\xee\xbb\xf2\xbb',['languageChanged']=Xh(309250111/22151),['scriptCl8\xe7\x0eA\x94']='Script closed',[Xh(-0.088999261695415804*29798)]='Notification',[Xh(6.0998796630565586*4155)]=Xh(-43513420/-2663),[Xh(32721+-281)]=Xh(52114-21559),[Xh(0.68901388466605862*19734)]='Teleport',['movement']='Movem>\x95\xc7\xa9',['visuals']=Xh(40188+4750),[Xh(-1.0929165316920419*-18522)]='O#\xa3\xd3\x93',[Xh(2886-15741)]='Pr8\x1b\x182\xda\x9e|J\x11\xdc',[Xh(-29983- -17645)]=Xh(24873+-8936),[Xh(29944- -14671)]='Developer',[Xh(-124567113/-27553)]='Config',[Xh(541765818/27091)]='\xf0\x9f\x91\xa4 Your Name: ',[Xh(24827+-14312)]='\xf0\x9f\x8e\xab Username: ',[Xh(50636+-7741)]=Xh(-10871+32343),['accountAge']=Xl('\r\15\189\210\250\182;1,\136\254Zw\155\144=hc','\253\144.W\218\247XRC'),['h1\xc8\xa0\xa8']=Xh(-932+13511),[Xh(61310244/6276)]=Xh(21028-18092),['kills']=Xh(-1.8463434285985119*-21099),[Xh(70568-25125)]='\xf0\xcf\xdfZ\xbb3\x8c\xa6\xcf\xdb\x98\xb0\x7f\xbc,\x10',[Xh(383159964/13926)]=Xh(-42749- -28605),['pin<\x13']=Xh(-0.61832294574236224*-26153),[Xh(-0.73407863333752044*15922)]='Rejoin Current Server',['findServer']=Xh(-141230650/-12526),[Xh(-1.9645073817414884*-16595)]='Reconnecting...',[Xh(-93882942/29691)]=''\f=\3\163!\148\'\144\133^"),[Xh(31479- -19024)]='Server found!',[Xh(20249- -13522)]=Xh(182140224/-17808),[Xh(4554+14440)]=Xh(-1.2052163240257747*-16295),[Xh(48600-3607)]=Xh(352171446/13938),[Xh(-710442180/-23310)]='Ena5F\x9a\xd7aG\xa8\x8a\x16y\xbc\xdd(h',['d>\xc6L\xadl\xc8\xb5\x06\xeb\xf7\xa8\xa0\xc47']=Xl('\133K\4\212\209\ar\226\27\199D\248h$\179,(y\181\2\3\218\147\1x\171\28\129\t\224i$\242\55%n','\193\"w\181\179k\23\194r\161d\129\aQ\147[I\23'),['joinMethod']=Xh(28567- -5625),['targetPlayer']=Xh(-0.51484493192133129*-21152),['selectArena']=Xh(4.2166942359078767*7859),['showArena']=Xh(-417780552/-25637),['showArenaDesc']=Xh(-408-1489),[Xh(0.52632753235162877*-4482)]='Auto Ready \xe2\x9c\x85',['autoReadyDesc']=Xh(32935-18625),['autoStreak']='\xf0\x9f\x94\xa5 Auto Streak',[Xh(62467-15206)]=Xh(-4980- -5209),[Xh(-41.76525336091003*-967)]='Game Mode',[Xh(34534-31420)]='Players per te1\xad\xab',[Xh(2.127261041226701*21782)]='Searching for an arena...',['streakFoun4\x87']='Found 1?4\xc7\x16q\x88@*L \xb6\x8d`\x02+\xd5\xec^\xdc',[Xh(28696- -6737)]=Xh(17542+-28509),[Xh(36730+-9703)]='Match active, protection enabled',['antiAfkEnabled']=Xh(17910-22048),[Xh(330- -21384)]=Xh(46048-19645),[Xh(25757-23582)]=Xh(568862925/12975),[Xh(33205-9123)]=Xh(10183+-2518),[Xh(-50756438/21982)]=Xh(12505500/-29775),['goToSaved']=Xh(34964978/11419),['autoFollow']=Xh(-137020668/-13807),[Xh(0.20847645722137081*18923)]=Xl('\144\137,7\15\231\151\242^\184\49R\224\183\149,.\\\168\152\167Y\180cU\240\173','\195\225C@|\199\246\135*\215\17\48\149'),[Xh(1392905408/32339)]=Xh(-241762458/23559),[Xh(-26500- -15985)]='Pin Auto Button',[Xh(-37564- -25956)]='Pins a"2\xaf$\\\x02\xe9\xd0\xb30\x97\x19@\xdbg\x8e\xf9\x93(\x95\xf2\xcd\xa13\xe5\x92\xe9\x02\xf5\xe4U'\xcaJ\x1d\xe1\x86\xb4&\xf4\xd8\xbf\xc8Rj',[Xl("\155\209\147\'\178\203\139,",'\250\164\231H')]='Auto Hold',[Xh(1.2506666666666666*15000)]='Requires Auto Follow to be enabled. When you pick up the bomb, it holds and dodges the nearest enemy until the bomb timer reaches your set value, then automatically hands it off through Auto Follow',['autoH8ho\x88Qo#c\xb4\x14d\x9f']=Xh(-27707040/-16260),['autoHoldTimer']=Xh(-0.41434027641059967*-25397),[Xh(36906- -2722)]='When the bomb timer reaches this value or lower, dodging stops and it auto-delivers',[Xh(-1.0061808055423487*14723)]=Xh(29712-14931),['\xf6S^\xc5\x98\xe8\xa8Sm<a\xe4RK\xc4\xb3\xe2\x80\x06\x0bk'%\165\223\136\203lw\a')]='Closest distance from an enemy to start dodging so they can't take the bomb early',[Xh(-15181- -26699)]='\xe2\x9a\xa0\xef\xb8\x8f Notice',['autoHoldWarnDesc']=Xh(59190+-18230),['importantNotes']='\xf0\x9f\x93\x9d Important Notes',[Xh(-45566- -30644)]=Xh(0.55757418461804653*11559),['autoFollowSettings']='\xe2\x9a\x99\xbb\x9a\r2\n\xaa\xaf\x93?\ta\r\x92\xbd\x1bh\xcf\xb0\n\xe0c_\xcaU\t\x1e',[Xh(-633987537/-13939)]='Dodge Distance',['strafeDistanceDesc']='Distance t?u\x92Vi@\xfe\xd9\x1d\xa2\x047-$\x9d\xc6\xa2\x9b\xb3D\x99P\xd3Ky\x01\xfe\xc4Z\xae\x1f',['strafeAmplitude']='Dodge Strength',[Xh(7047-2078)]='Width of the l1\xa6\xfe\x1e/right dodge mov1\xad\xbb\xd6\x83',[Xh(28483-29561)]=Xh(30370-20502),[Xh(0.12719467489870731*-20732)]=Xh(-411292565/-15541),[Xh(1.4350509930220074*26082)]=Xh(29551+-9325),['followDurationDesc']='How many seconds to chase before picking a new target',[Xh(400826652/29202)]=Xh(36509- -13720),['minDistanceDesc']='\x17r2\xa3\xc8\xb9-ed\x06\xd8\x8e\xe7\xb7\xb68{|\x93\x8c\x9b\xc3/1\xbc\x9b\xbd*1"\x10\xde\x90\xb3\xa2\xb0>>(\x86\x91\xdc\xd5/',[Xl('<C\169\217_\231!B\142\200N\235*','N,\221\184+\142')]=Xh(-9385-2336),[Xh(-1219+14726)]='How fast you\xef\x8f\x860\xd5!\x92\xfc\x8ar\xb5\x00\xc2\x91\x85\xdc.\x1e~>\xb5\xc8\x15\x08M\xce4\x8a\xce\x97\x85)'<\156}8\201\53ag'),['adhesionForce']=Xh(0.76875831712560139*29307),[Xh(146198757/7303)]='Closest distance to stick to the target to hand off the bomb',['reactionDelay']=Xh(-1072518953/-28919),['reactionDelayDesc']=Xh(17084+-27792),[Xh(0.57146010374130896*18122)]=Xh(41373-22254),[Xh(4386+19900)]=Xh(-0.90314200890648189*8084),[Xh(699221724/27893)]='Choose Speed Type',[Xh(-0.2160392798690671*-6110)]=Xh(10627-18543),['speed1']=Xh(-8451716/749),['speedi)']=Xh(-1221+30087),['speedLevel']='S+\xa3\xc3\xf2v\xc7\x97\xac\xf8\x94\xdbH\x01\xed\xecI\x01',[Xh(-32333+28344)]='Enable Speed',[Xh(512712618/11199)]=Xh(16219- -22782),['flightFeatures']=Xh(2.7362131837307153*17825),['flightDesc']='Control advanced fligh/\x1f',[Xh(-6.5396727384995366*-6478)]=Xh(49539-16693),['\xb5V\x99oH\xa7~\x95{C\xe1'\227\27\51')]='Fly a5\xabr\xcay8,/\x9e\x89\xb4\xa1\xaa/|$\xe6\xed\xb0\x96\xbd\x99\xc03u;\xd0*\x08l(\xa5$',[Xh(2420- -16241)]='Fli7\x122P\xbeb\xa6\xd7\xedI/7o\x14\xb3\x03\xe6\x82\xa1',[Xh(6307+2430)]='Stop Flight',[Xh(33599-19081)]='Double Jump',['dou\xba%\xd5\x8f\x01\x930VX=\xe6'.\27')]='Jump twice i5\xf7iY\xf64',[Xh(-22876- -14077)]='\xe2\x9c\x85 Double Jump Enabled',['doubleJumpDisabled']='\xe2\x9d\x8c Dou9\xc9\xce\xc9\xcag\r\x9c?N1\xf22\xfab'\r',[Xh(14.98507968802984*2949)]=Xh(0.83345942567678699*30401),['invisibleModeDesc']=Xh(-14.176170607324988*-2157),['visualSettings']='V2d:\x96\x99\x85\x947Y:\xdeox3\xb7|',[Xh(1142908487/22813)]='Enhance your vision and game performance',[Xh(-1.3296589896336601*-21319)]=Xh(5620- -1178),[Xh(24122+-3830)]=Xl("\226\218\204\156\'\137QY\128l\221\167^\169\223\v~r<\219\233\51\142\215\215\199\129\'\170SR\207R\132\233O\167\202\23,T5\207\254\53\153\208",'\163\190\168\239\a\203=6\239\1\241\135\29\198\179d\f\49S\169\155V\237'),[Xh(-0.9754356167830408*-31794)]=Xh(-824968011/-31787),['antiLa7\xb8\xe5"\x81\xc2']=Xh(-24331+15379),[Xh(25553+-4186)]='Other Scripts',[Xh(197492976/-22422)]=Xh(-20683+23606),['headless']=Xh(486423059/28187),['headlessDesc']='Rem8|\x86L\xaf\xaf\xec\x81\x94^\x16k\xa2\xd9\xbf\xe5g\x0b\xd0F\xe1\xab\xf0\xc0\x84\x11\x1ed\xa4\xdf\xff',['korblox']='\xf0\x9f\xa6\xb4 Korblox',[Xh(280758080/14684)]=Xh(-0.66808668271902205*16197),[Xh(-267794523/-21981)]=Xl('\229\167s1\251\164I\134\218atV\133\238\251\185U\130\142@x','\21\56\230\139\219\234,\241\250%'),[Xh(-6.8008492569002126*-2355)]=Xh(5353+-20266),['enableDanceButtonDesc']=Xh(-8619+15401),['sel1\xc7\x9a\x87\x7f\x93\xf9/']='Select Dance',['selectDanceDesc']='Ch8\xb4];\xf2\xa26\x1e\x94D\x80un\xfc\x85\xed\x1fS5\xaa\xde\x82\x86P\xf8y\xb0L\xfd\xba\xad\xd3=\xaf\x17\x06\x95g',['dance1']='\x14\xfeU\xb0\nPF\xe1\x14.\xf6\xa0\xdc',['dance2']='Dance 2 \xf0\x9f\x92\x83',['dance3']=Xh(50165-1956),['w5\xb1\xcc\x8f\x0f']=Xh(18199+3437),['point']=Xh(34584-16464),[Xh(-781514037/-18351)]=Xh(-0.25251563774816427*22062),['cheer']='Ch>\xf8\xeb\xeaK\x8c1\x8b',['proxFeatures']='ProX Features',[Xh(-883+12115)]=Xh(-1.9216182048040455*-8701),[Xh(-34616+24925)]=Xh(-461176896/-11146),[Xh(389586892/28186)]=Xl(')\203\205P\29\132\244\250o\149\186\128,\170\55\25\219\133O\177\194o\142\186\223\23','\203D|\191\165\v\212\174\6\248\223\173n'),['bombTimerLimitDesc']=Xh(4.4889178617992176*-3068),[Xh(41030+7605)]=Xh(16059- -14376),[Xh(20269+24383)]=Xh(9250- -24881),['autoGrabBomb']='\x11\x1d\x88hJ\xcc[\x9c\x83l\x16\xbfsH\x8e\xecqp\xad',[Xh(0.45708455554138505*7841)]='Automatically moves to the nearest enemy holding the bomb to grab it',[Xh(-741764332/-19346)]='Reach',[Xh(111417687/3483)]='Enlarges other players' limb,m\xea\x80\xc2\xaev\xd4\xb1\xce\x07\xee\n\xe7\xe3;\x163;\xbee\xe0\xf4Z\x10\x8d\x95>\xfe\xd3\xe2\xec\x07\xfeG\xa6VlB\xaf\xc1',[Xh(374697316/15484)]='Reach Size',[Xh(16268+-16811)]=Xl('\28\n\154\155i\147|^\135\211\31{^\162\16\223\163>u\132Z&C\143\150m\130\52\16\218\142]#\f\236B\223\179\50s\128W}','Tc\253\243\f\225\\\48\242\190}\30,\130-\255\193W\18\227?'),['e&8\xa3,O\x93\ri\xa7+N\x93\x07']='\xf0\x9f\x8f\x83\xe2\x80\x8d\xe2\x99\x82\xef\xb8\x8f \x15\x11})\xb0\xb9\x87\xe6\xcd\x9a\x82\x88\xc3\xa8'',[Xh(6.2627169359664867*-1671)]=Xh(-8.4954523695548101*-4178),[Xh(-6.1943031536113935*-5898)]=Xh(-3.0383161078900933*-7934),['ant>\xa3\xaf@\x05\x89]']=Xh(-1.5970586402442823*-16047),['antiFireDesc']=Xh(-28030+21470),['recordingMode']='\xf0\x9f\x8e\xa5 Recording Mode',['re4\x94\xd6|\x0e\xb2\x1c\xd4\x00\xbe:\xd3\x01\xf5\xcc\xb2\x9d']='Hides all script buttons and features while recording',['warnin<\x81\x0b\x07\x0b\xba']='Warning use ev1\xd4\x8d2\xe3\x104_n\x08\xdaM\x16FE\xe9\xc5\xe1',['wa"\xb3\x19M\xb4\x1a\x14\xb8\x03@']='Everything can get you banned if someone records',[Xh(-290674969/20059)]=Xl('Gz^]\177\176\143G|X@\168\170\200g','\20\25,4\193\196\175'),[Xh(22046+-26927)]='Customize the script to your liking',[Xh(68346+-22777)]=Xh(-15014+13788),[Xh(-9168- -30613)]='Save all your current settings under a custom name, or load/delete a previous config.',['toggleUITitle']=Xh(50541926/-14578),['toggleUIDesc']='Click the button below or press the set key to show/hide the UI.',[Xh(0.79813052772771098*23857)]='ToggletF\xc6\xa5\xb0J\xfb\x8c\xaa\xbb\xafde\xf5nx\xa8',[Xh(-31136894/2746)]=Xh(27872+-2279),[Xh(-0.61986420950533461*-25775)]='Defau<\x1d\xb9\xd8I3\xae\x1d\xbd\x07\x8c\xe9\xa9dH\xf9:\x94O\xbf\x12\xac\x82\x9b\xa0\x91',[Xh(5.1919111816019035*5044)]=Xh(-21109+17697),[Xh(40420+-30084)]='Toggle UI key set to: ',['keybindErro&\xce\xeb\xa7\xa8T\xb2']=Xh(15358+26710),['keybindErrorDesc']='Unsupported <\xb7:\x04Z\x8d\x9e\xb1\xb9K\x1cZ\xd9\x08\x1e\x8d\xfe\x97\xff\x0e',[Xh(64901-15481)]='Save Config',[Xh(51052+-19124)]='Load Config',['DELETE_CONFIG']='Delete Config',[Xh(1.3103953147877012*-4098)]=Xh(-6613- -28867),['c8\xfa\xbc\xcb}\xdc\xc4*\x19\xc9\xe7\x07']='Close Script',[Xl('\166_,\127\51\56\222:\170b?b48\210\49\188','\207\49Z\22@Q\188V')]=Xh(-354025320/-7370),['tpOnClose']=Xh(0.012552301255230125*-1912),[Xh(36388+9891)]='Hide Real \x164r\xd5*',[Xh(29551- -10457)]=Xh(32571-28157),[Xh(255657040/16760)]='Fly Mode',[Xh(1.123220381317126*12011)]='Lock Camera Direction',[Xh(-152820655/-13663)]=Xh(302915555/25813),[Xh(-148813200/12150)]=Xh(12687241/-1351),[Xh(5414+7876)]='Auto Backshot',['autoBackshotDesc']='Automatically move\x08\xf6\x02\x9ew*\x03\x0e\xcfUH\xdc^\xe4#\x15\x87a\xf0\xee\xc2\xd1\xd7\xba\xd7\x0f\xa6\xa4\xc4^G\xb2\xec\x1d\xbe\x98I\xec\t\xcd#,\x03V\xd5\x10]\xc1\x1b\xe3?P\x8e',['developerName']=Xh(3685+1396),[Xh(1.8400052101424105*23032)]=Xh(1.1314937049260481*32724),['joinDiscord']='Join Discord Server',[Xh(561787490/22390)]=Xh(-330598016/30848),[Xh(252012964/13972)]=Xl('\189\19\52\192\139:\0\235\186\25,\209\134\54\4\174\140','\254|Z\180\234Yt\203'),['mainFeaturesList']=Xh(-1.7401144418823127*-23418),[Xh(0.15852195473086458*-12503)]=Xh(-233740164/24612),[Xh(-38384- -23737)]='\xf0\x9f\x8c\x9f$\xeb\xd4\x8f\x16\xc7\x8d&\x93\xb2u\xbck\xaf\xeey\xf7N\xbe\xf6A\x8c\x86\xdd\x0c5E\xd7\xda\xb0\xe6\xb2r'Cr\20)\21\220\148\31\212OaL'),['discordServerDesc']=Xh(-191497800/-24551),[Xl('\220\0a\174\0\209\25x\163,','\191o\17\215I')]=Xh(29579-11519),['inviteCopied']=Xh(0.4544285431642815*-30326),[Xh(89485104/-6702)]=Xh(43383-10856),[Xh(7664- -4285)]=Xh(-0.25120552045227801*-24056)}}
        local function Zs(Wy)
            return Ku[Tv['_G']['Select2E\xabK\x81\xf3v\xef\x02:\xaa']][Wy]or Wy
        end
        local function Zc()
            return(function(Uz)
                local function qq(Tx)
                    return Uz[Tx+-544029108/-23268]
                end
                for za,ps in Tv['p:\xf6\x8b\xd1'](Tv['game']['CoreGui'][''\230U\175R')](Tv['game']['CoreGui']))do
                    if not(ps['IsA'](ps,'ScreenGui')and(ps['\x1e\xf1\x97\xcf']['find'](ps['\x1e\xf1\x97\xcf'],qq(-19872+9324))or ps['Name']['find'](ps['Name'],'Ph:\x00\x91\x8ch\xc2\x00')or ps['Name']['find'](ps['Name'],qq(-0.94752218134602895*9242))or ps['Name']['find'](ps['Name'],qq(-22963+-26237))or ps['Name']['fin0\xf3'](ps['Name'],'InvisibleGhost')))then
                    else
                        ps['Des/\xdd\x9aH\xb6'](ps)
                    end
                end
            end){[0.78691439784155015*16308]='Wind',[-40749- -14930]='FakeLag',[-11905+26529]=Xl('\29,7.<','YM')}
        end
        hs['Popup'](hs,{['Title']=Xh(0.16433263105713222*8069),[Xh(1.2621815739161888*19353)]=Xh(-0.39837843055242755*-31081),[Xh(-1.0417557228262553*-32283)]=Xh(-1315+-12910),[Xh(-65190288/4903)]={{[Xh(-0.11530630469726737*27995)]=Xh(-0.84696406443618344*-11298),[Xh(-8524+25167)]='flag',[Xl(",(\'\19(;\14",'zIU')]=Xh(156655564/6812),['Callback']=function()
            return(function(ty)
                local function wp(oG)
                    return ty[oG-266185904/-20752]
                end
                Tv['_G']['SelectedLanguage']='English';
                hs['Notify'](hs,{[wp(-75845+32261)]=Xl('\166\127\96\195\57\r|K\231o#\134\197\176\16\0wO\230k ','D\227\229\227ul\18,\146\14'),[wp(-42306+27859)]='English language has been selected',[wp(38129+-27986)]=18712+-18709});
                Tv['task']['wait'](wp(-26400+18194));
                Tv['createMainScript']()
            end){[32309-9339]='Duration',[76.320099255583131*-403]='Title',[29991+-25370]=-16389+16390,[28218-29838]='Content'}
        end},{['Title']=Xh(1059113204/25334),[Xh(20609-272)]=Xh(-235562453/20993),[Xh(14.823465310570286*2753)]=Xh(60410+-11031),['Callback']=function()
            return(function(OA)
                local function Se(pH)
                    return OA[pH-(-51847+22611)]
                end
                Tv['_G']['SelectedLanguage']=Se(-31241- -30217);
                hs['Notify'](hs,{['Title']='\xe2\x9c\x85 \xd8\xaa\xd9\x85 \xd8\xa7\xd9\x84\xd8\xa7\xd8\xae\xd8\xaa\xd9\x8a\xd8\xa7\xd8\xb1',[Se(-39321+11625)]=Se(11830-9926),['Duration']=15538+-15535});
                Tv['task']['wait'](Se(-66348- -9805));
                Tv['createMainScript']()
            end){[1.0617029548989114*-25720]=-25299- -25300,[10.899544977248862*2857]='\xd8\xaa\xd9\x85 \xd8\xa7\xd8\xae\xd8\xaa\xd9\x8a\xd8\xa7\xd8\xb1 \xd8\xa7\x829I3\xc5i\x10\x93\xda\xfc\x02\x8c\x00\xcd\xbc\x1c|K$\xe7\x89\x89)',[-28038780/-18207]='Content',[245641884/8707]='Arabic'}
        end}}});
        Tv['createMainScript']=function()
            return(function(Rp)
                local function _i(kn)
                    return Rp[kn- -0.35964504978589484*19383]
                end
                Zc()
                local Zr,mi=Tv['pcall'](function()
                    return(function(Ui)
                        local function Bb(dt)
                            return Ui[dt-(-15680-7355)]
                        end
                        local XE=Tv['game']['HttpGet'](Tv['game'],Bb(-56317- -3164),true)
                        return Tv['loadstring'](XE)()
                    end){[-22924-7194]='https://github.com/Footagesus/WindUI/releases/latest/download/main.lua'}
                end)
                if not(not Zr)then
                else
                    hs['Notify'](hs,{[_i(-2.6056442629038248*5386)]=_i(-1210199757/31161),['Content']='Failed to load UI',['Duration']=_i(-7310+-24949)})
                    return
                end
                hs=mi;
                hs['TransparencyValue']=6.0233706782315385e-06*16602;
                hs['SetTheme'](hs,_i(12812- -1822))
                local Pm,if_,ie,Hg,mt,FC,ak,rn,Cw,CB=Tv['game']['GetService'](Tv['game'],_i(-0.32303014101450245*-29926)),Tv['game']['GetService'](Tv['game'],_i(-52500+31837)),Tv['game']['GetService'](Tv['game'],_i(24462-25146)),Tv['game']['GetService'](Tv['game'],'TweenService'),Tv['game']['GetService'](Tv['game'],_i(37991-28408)),Tv['game'][Xl('\131\219,A\152\182\200\49q\152','\196\190X\18\253')](Tv['game'],'Stats'),Tv['game']['GetService'](Tv['game'],'TeleportService'),Tv['game']['GetService'](Tv['game'],_i(-0.0023375984251968506*-8128)),Tv['game']['GetService'](Tv['game'],_i(-512278923/-31083)),Tv[Xl('&\4,\0','Ae')]['G>\x9eEZe\xd7\xebXje'](Tv[Xl('&\4,\0','Ae')],_i(-1086996280/27886))
                local CF=Pm['LocalPlayer'];
                hs['Popup'](hs,{[_i(-18787+-801)]=_i(-1.1276916451335055*18576),[_i(2.2038690476190474*4704)]=_i(24-3758),[_i(-30837- -32336)]=Zs('warn9\xcbN\x8f'),[_i(0.044327901604545174*-16017)]={{[_i(2752- -12311)]=Tv['_G']['SelectedLanguage']=='Arabic'and _i(-52582- -25720)or _i(-18409027/1157),[_i(-22467+-8866)]='arrow-right',['Variant']=_i(-15469+-16834),[_i(8771-4668)]=function()
                end}}});
                Tv['task']['wait'](0.00025013757566661664*19989);
                hs['Popup'](hs,{[_i(-483850250/13250)]=Zs('discord'),[_i(2.4204685573366214*3244)]='message-circle',[_i(35380+-15905)]=Zs(_i(-47055+15833)),['Buttons']={{['Title']=Zs(_i(3.7514577259475219*4116)),['Icon']='copy',['Variant']=_i(-2.0454317897371714*15980),['Callback']=function()
                    return(function(gf)
                        local function QB(eE)
                            return gf[eE-80342768/13576]
                        end
                        Tv['setclipboard'](QB(497213252/-31783));
                        hs['Notify'](hs,{['Title']=Zs(QB(16.915518824609734*-1089)),['Content']=Zs(QB(32012-1954)),['Duration']=QB(630+20539)})
                    end){[-0.82978641523956131*25985]=Xl('1\25J\136-\6tl\169pc \238\168=CY\159qI\t\55\175ah;\243\187,','Ym>\248^<[C\205\25\16C\129\218'),[32940+-17689]=-7709- -7713,[12563- -11577]='8\xfdxBhYL\x16\xfa\xce\xc1Plio-\x94',[65520588/-2692]='linkCopied'}
                end}}})
                local tC=hs['CreateWindow'](hs,{[_i(261928940/-9230)]=_i(-26501- -14201),[_i(-274288052/20549)]=_i(12.610510805500983*-2036),['Author']='By_Cypher',[_i(-6820+3285)]=_i(-57941- -18967),[Xl(",\'\5+",'\127N')]=Tv['\x02\xae\xc2\xef\xeb\xb4'][Xl('\190\161\54\152c\190\181*\144X','\216\211Y\245,')](_i(-2.6973620522749275*8264),_i(-0.56667742977074587*-12388)),[_i(756- -22503)]='Indigo',[_i(-684416438/32009)]='rbxassetid://5oE\xf59\x04]\x89\xcf\xcbV',['BackgroundImageTransparen8p\xa6']=2.8409090909090909e-05*21120,[_i(-27248+14472)]=_i(-9673- -16723),[_i(497147112/-18524)]={['Enabled']=true,[_i(0.18324087591240876*17125)]=_i(-218970990/21126),[_i(539844868/27388)]=function()
                    return(function(Ht)
                        local function Oy(pn)
                            return Ht[pn-(7384- -16112)]
                        end
                        hs[Xl('\149\166X\178\175U','\219\201,')](hs,{['Title']=Zs(Oy(37999- -13293)),[Oy(374894200/12424)]=(Tv['_G']['SelectedLanguage']=='Ar5Zr(2'and Oy(42674-16739)or 'Na:\xbcM\xbe\x8c')..CF['Name'],['Duration']=Oy(22516+16804)})
                    end){[62999370/25830]='\xd8\xa7\xd8\xb3\xd9\x85\xd9\x83: ',[74768400/4725]=-10546- -10549,[-18873484/-679]='info',[16543+-9864]='Content'}
                end},['SideBarWidth']=_i(0.75183588383000899*21107),[_i(-13388+18985)]=_i(7180- -9761)})
                local Sa,NE,us={['Main']=tC['Section'](tC,{['Title']=Zs('mainFeat%\xb6u\x08!'),[_i(4370-30472)]=true}),[_i(1.9178617013289285*-13319)]=tC['Section'](tC,{['Title']=Zs(_i(300946296/12964)),[_i(0.61060739436619715*22720)]=_i(19987+-6976)})},{},false
                local function Kk(ks)
                    return(function(rl)
                        local function xq(Vj)
                            return rl[Vj- -0.51942484255254573*-26358]
                        end
                        Tv['table']['2\x8a6\xa2\xab\xd5'](NE,ks)
                        if not us then
                            us=xq(35239- -7284);
                            Tv['tas<,']['spawn'](function()
                                return(function(Ma)
                                    local function VG(qB)
                                        return Ma[qB-(-34572- -1872)]
                                    end
                                    while#NE>VG(-39370+-7273)do
                                        local gv=Tv['table']['remove'](NE,4.1867280720117227e-05*23885);
                                        Tv['pcall'](gv);
                                        Tv['task']['wait'](1.6878206859303269e-06*29624)
                                    end
                                    us=VG(-2188512/144)
                                end){[0.70135814889336012*-19880]=0,[-3.0322245322245323*-5772]=false}
                            end)
                        end
                    end){[18.317662007623888*1574]=true}
                end
                local bl,Bc={[_i(4327- -20023)]=Sa['Main']['Tab'](Sa['Main'],{[_i(186574728/-6366)]=Zs(_i(-2484+-19283)),['Icon']='info'}),['Teleport']=Sa[Xl(',\207\b\192','a\174')]['Tab'](Sa[Xl(',\207\b\192','a\174')],{[_i(-49916- -30183)]=Zs(_i(13303+-5817)),[_i(24071+-32499)]='navigation'}),[_i(24744+-7055)]=Sa['Main']['Tab'](Sa['Main'],{[_i(-45212+31287)]=Zs('movement'),['Icon']=_i(11560+4444)}),['Visuals']=Sa['Main']['Tab'](Sa['Main'],{['Title']=Zs(_i(1.316547064501238*-23829)),['Icon']='eye'}),['Other']=Sa['Main']['Tab'](Sa['Main'],{['Title']=Zs(_i(1.0656137108292028*11903)),[_i(-22818-5334)]='box'}),[_i(43882+-21285)]=Sa['Main']['Tab'](Sa['Main'],{['\x00\xe3\xb4\xa9\xb1\xb8']=Zs('proXFeatures'),['Icon']='zap'}),[_i(2.9956155143338954*-5930)]=Sa['Settings']['Tab'](Sa['Settings'],{['Title']=Zs('7\xd9\xff+\xe1@'),['Icon']='settings'}),[_i(-595708104/-25412)]=Sa['Settings']['Tab'](Sa['Settings'],{['Title']=Zs('developer'),[_i(-331511824/21392)]='user'})},{}
                do
                    local function wD(OE)
                        return(function(vz)
                            local function Ob(Bl)
                                return vz[Bl+(-32514+18816)]
                            end
                            local Sm=CF['FindFirstChild'](CF,Ob(-2418-15972))
                            if Sm then
                                local LE=Sm['Fi5\xbc\xf7\xbc9^l|\x8d\x00\\\x11'')](Sm,OE)
                                if not(LE)then
                                else
                                    return Tv['tostring'](LE['Value'])
                                end
                            end
                            local rq=CF['FindFirstChild'](CF,'Stats')
                            if rq then
                                local He=rq['\x1d\xb9pib\xa8E\x04\x99\x8d{@\x89\x92'](rq,OE)
                                if He then
                                    return Tv['tostring'](He['Value'])
                                end
                            end
                            return '0'
                        end){[-45666- -13578]='leadersta/\xaa\xad'}
                    end
                    bl['Info']['Button'](bl['Info'],{[_i(816156360/-31931)]=Zs('yourName')..CF[Xl('\219\252\243,\243\254\236\206=\242\250','\159\149\128\\\159')],['Callback']=function()
                    end});
                    bl['Info']['Button'](bl['Info'],{['Title']=Zs(_i(2292- -11140))..CF['Name'],[_i(3.4537776553750117*-10893)]=function()
                    end});
                    bl['I9*_V']['Butto>\xa8'](bl['I9*_V'],{[_i(-17843+-3849)]=Zs(_i(15661-382))..CF['User\x12Z\xfc'],['Callback']=function()
                    end});
                    bl['Info']['Button'](bl['Info'],{[_i(174096293/13451)]=Zs('accountAge')..CF['AccountAge']..(Tv['_G']['Sel1\x03T\x85N%\xda\xd4\xedkB\x90L$']=='Arabic'and _i(0.93423304483888314*-20451)or ' day'),['Callback']=function()
                    end});
                    bl['Info']['Button'](bl['Info'],{['Tit7\xa6\xc9']=Zs(_i(-183625130/11722))..(Tv['identifyexecutor']and Tv['identifyexecutor']()or(Tv['_G']['SelectedLanguage']==_i(75521436/6492)and _i(0.64970357697051684*-25133)or _i(-3996-24337))),['Callback']=function()
                    end});
                    bl['Info']['Divider'](bl['Info'],{['Title']=''})
                    local cB,mB=bl['Info']['Button'](bl['Info'],{['\x043D\x0c\x0f']=Zs(_i(23217753/31333))..wD(_i(24768+-14239)),[_i(-603730700/-27550)]=function()
                    end}),bl['Info']['Button'](bl['Info'],{[_i(1.0464810760087582*-15985)]=Zs('kills')..wD(Xl('\25)>,!','R@')),[_i(-760149624/21866)]=function()
                    end});
                    bl['Info']['Divider'](bl['Info'],{['Title']=_i(-15797- -15597)})
                    local fx,zj,Px=bl['Info']['Button'](bl['Info'],{[_i(0.11838314728123875*-22216)]=Zs('players')..#Pm['\x10\x08{\x00\xbb\xdfS<u\xfa*\xf2'](Pm),[_i(-59006- -30080)]=function()
                    end}),bl['Info']['\x16\xf2S\x88\xaeI\x92'](bl['Info'],{['Title']=Zs('fps')..(Tv['_G'][Xl('\22unim\4=H\tqlk{\17?I','E\16\2\f\14pX,')]=='Arabic'and '\xd9\x8a\xd8\xad\xd8\xb3\xd8\xa8...'or _i(-0.27139874739039666*21076)),[_i(0.99424945468966885*5043)]=function()
                    end}),bl['Info']['Button'](bl['Info'],{[_i(-4271- -23299)]=Zs(_i(-2225+-13481))..(Tv['_G']['SelectedLanguage']=='Arabic'and _i(16377- -3620)or _i(-4539+-13364)),['Callback']=function()
                    end});
                    bl['I>\x91\xf2']['Divider'](bl['I>\x91\xf2'],{['Title']=''});
                    bl['Info']['Button'](bl['Info'],{['Title']=Zs(_i(929+-7252)),['Callback']=function()
                        return(function(Rf)
                            local function Xx(L)
                                return Rf[L-70518354/-5827]
                            end
                            hs[Xl('|$![-,','2KU')](hs,{[Xx(-1249130190/29766)]=Zs('reconnecting'),['Content']=Tv['_G']['SelectedLanguage']==Xx(-443048959/-25999)and '\x8f4\xa0\x17\xcf\x8eH\xd2\x7f\xe4\x0c\x1b\x0f\xcb\xfaEU\xcd\xc9\xfa\x8eG\x11\xe7\x9d\x15oc=\x0b\xef\x03\xd3\x1cHD\xc9o\x8e\xb9d\x9b{\xaa\xc5\xda\x0f%\x85\x0e'or Xx(-91136150/6307),[Xx(-10901+-19091)]=59745/19915});
                            Tv['wait'](-17924+17925);
                            Tv['pcall'](function()
                                ak['TeleportToPlace\x1e\xb5\xb3\x07;x+\x9cU'](ak,Tv['game'][''\153')],Tv['game']['JobId'],CF)
                            end)
                        end){[-70364864/29968]='Leaving and rejoining same serve"\xf4\x84\xe79',[42612-13469]='Arab9\x88\x12',[-22694+-7169]='Title',[-7421+-10469]='Duration'}
                    end});
                    bl['Info']['Button'](bl['Info'],{[_i(-17159- -19526)]=Zs('findServer'),['Callback']=function()
                        return(function(cj)
                            local function N(DA)
                                return cj[DA-(24621- -6685)]
                            end
                            local K=Tv['game']['GetService'](Tv['game'],'HttpService');
                            hs['Notify'](hs,{[N(67864800/1200)]=Zs(N(13.616702872314749*4143)),['Content']=Tv['_G']['Selb4\xb1\xc2\xe1x2\tTq\xc3\xf4\xb3'\220\138\251')]==N(1.9402087946852262*28449)and '\xd8\xa8\xd8\xaf\xd9\x88\xd8\xb1 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xb3\xd9\x8a\xd8\xb1\xd9\x81\xd8\xb1...'or 'Searchingt\x10Y\x96arkR\x00ef\xe2t\x11\xd7',[N(-0.83199131974187657*-17511)]=N(91290+-28371)})
                            local function bc()
                                return(function(ul)
                                    local function wE(ZD)
                                        return ul[ZD+(-21443-11040)]
                                    end
                                    local Tk=Tv['game']['P;P-gR\x1b']
                                    local ob=wE(-9.8609667768855296*-6351)..Tk..wE(-0.24425442868997366*-27717)
                                    local Cy,jp=Tv['pcall'](function()
                                        local Gx=Tv['game']['HttpGet'](Tv['game'],ob)
                                        return K['J\x08~\xfdN\x0c\xe4c\xe6\xdc'](K,Gx)
                                    end)
                                    if not(Cy and jp and jp['data']and#jp['data']>wE(-256420890/-26235))then
                                    else
                                        local Yo,OD=nil,Tv['math']['huge']
                                        for Ug,ko in Tv['pairs'](jp['data'])do
                                            if ko['id']and ko['play2\xdaC\x9f']and ko['maxPlayers']and ko['playing']<ko['maxPlayers']then
                                                if not(ko['playing']<OD)then
                                                else
                                                    OD=ko['p<\xd3\x18\xd0\xe6\xb4'];
                                                    Yo=ko
                                                end
                                            end
                                        end
                                        if Yo then
                                            hs['Notify'](hs,{[wE(607412520/10296)]=Zs('serverFound'),[wE(-2.3820702402957488*-5410)]=Tv['_G']['SelectedLanguage']==wE(-15660+20498)and '\xd8\xa8\xd9\x8a\x8c\xd93{]z8\xb1\x9a\xa59%\xe7@\x99\xa4\xfa1\x03\xfd'or 'Teleporting now...',[wE(43734-7015)]=-0.00038976224503053139*-7697});
                                            Tv['wait'](21839-21838);
                                            ak['Te7n\x14!\x85\xc1\x11\xd3\xff'*0S&D\xca6\x91\x97p\x81'](ak,Tk,Yo['id'],CF)
                                            return
                                        end
                                    end
                                    hs['Notify'](hs,{['Title']=Zs(wE(50596-12790)),['Content']=Tv['_G']['SelectedLanguage']=='Arabic'and '\xd8\xa8\xd9\x86\xd9\x86\x88\x16KZ\xb0\xf8\xca\x8e3\x0b\x92\x9d97\x04f\xeb_\xa4\x92\x16\xcc\x1d\x92\xf2w'or wE(50951-580),['Duration']=-10404+10407});
                                    Tv['wait'](9048+-9046);
                                    Tv['pc5\xe1\x86\x86'](function()
                                        ak['Teleport'](ak,Tk,CF)
                                    end)
                                end){[-5.2384904169136535*-5061]='Title',[-107708772/-25427]='Duration',[-1.6201431029798026*-11041]='Teleporting r5\xb9bU\x00\x02\xbfQ\xad\xe2\x99',[37079-31756]='serverNotFound',[-34897+12188]=0,[2.2113003095975232*-11628]='/servers/Public?sortOrder=Asc&limit=100',[-24.231511254019292*-1244]=Xl('\n\31cR\172\137\177\226\246,\140c\241\3F\246\145\14\4o\f\188\220\243\226\231|\206a\227@Q\234\220','bk\23\"\223\179\158\205\145M\225\6\130-4\153\243'),[-856746195/30991]='Arabic',[-10.910913140311804*1796]='\x17k\xcb\xbf_\xcf\x1a'}
                            end
                            bc()
                        end){[27827- -3786]=-7743- -7748,[-1.6466444922715711*-15333]='Title',[403495596/-24108]='Duration',[665060704/26488]='searchingS>\x02\xb4\xca\xa8\xbd',[4259+19632]='Ara5\x00\xd0\xc5'}
                    end});
                    Tv['spawn'](function()
                        return(function(Sx)
                            local function Yp(S)
                                return Sx[S-2936462/-4721]
                            end
                            while Yp(46396-29657)do
                                Tv['wait'](Yp(32800-6330));
                                cB['Set\x00\x8as\xc8~\xd1'](cB,Zs(Yp(8220- -13398))..wD(Yp(0.48861098704778921*-8956)));
                                mB['SetTitle'](mB,Zs(Yp(-20720+20252))..wD(Yp(-35961- -3115)));
                                fx['SetTitle'](fx,Zs('players')..#Pm[Xl('\255I\240\130\243\217U\225\160\236','\184,\132\210\159')](Pm));
                                Tv['pcall'](function()
                                    return(function(cn)
                                        local function Kn(kz)
                                            return cn[kz- -0.89949894006552322*-10378]
                                        end
                                        local hw=FC['Network']['ServerStatsItem'][Kn(289200852/10851)]['GetValue'](FC['Network']['ServerStatsItem'][Kn(289200852/10851)]);
                                        Px['\x03L\xf2\xa0b\x1c\xe3\xb8\x03L'](Px,Zs('ping')..Tv['m6\x97\xf6']['floor'](hw)..Kn(9673+-30353))
                                    end){[17706+-389]='Data Ping',[161150535/-5369]=' ms'}
                                end)
                            end
                        end){[-1.1796531056065347*-18853]='wins',[-31985+28231]='Wins',[13058+-12904]=Xl(';,<)#','PE'),[-43607+11383]='Kills',[762368880/28140]=0.00026021337496747333*11529,[0.55289808917197447*31400]=true}
                    end)
                    local gA,z=_i(0.18712865462674275*-16999),Tv['tick']();
                    if_['RenderStepped']['Connect'](if_['RenderStepped'],function()
                        return(function(Av)
                            local function ov(zh)
                                return Av[zh+24215280/-6190]
                            end
                            gA=gA+ov(-12975- -15483)
                            local to=Tv['tick']()
                            if to-z>=ov(-11686+-1709)then
                                local uu=Tv['mat<J']['floor'](gA/(to-z));
                                gA=ov(-1.3471532071463794*-26363);
                                z=to;
                                zj['SetTitle'](zj,Zs(ov(-60384800/-8200))..uu)
                            end
                        end){[7340+-8744]=3.2083159549552441e-05*31169,[21358-17906]='fps',[-15665-1642]=23308+-23307,[61306-29703]=0}
                    end)
                end
                do
                    bl['Teleport'][Xl('\222\171^\153\233\184M\136\230','\142\202,\248')](bl['Teleport'],{['Title']=Zs('aut8K\x17\x84\x867'),[_i(27900+-13613)]=Zs('autoJoinDesc'),['Image']='us2T>?',[_i(-0.83714131856296636*25998)]=12358+-12330,['Color']=Tv['Color3']['fromRGB'](_i(-5.4410399257195916*2154),777200/3886,0.015708741452596563*16233)})
                    local Fx,vD,zn,vp,vb,ku,ji,Bq,nC=false,Tv['_G']['Select\x93\x7fe\xc6\x9dEe\n\xb5W'')]==_i(17556+-19189)and _i(20353+-20060)or _i(-995886200/27416),Tv['_G']['SelectedLanguage']==_i(3301-18616)and _i(-362758112/-29416)or 'Everyone',Tv['_G'][Xl('\196\28\19,\142\239\166\161\219\24\17.\152\250\164\160','\151y\127I\237\155\195\197')]=='Arabic'and Xl('\18D,n\212\146y?R<Y\146c','\202\231\245\228\244J')or 'Any Arena',_i(-68257+30982),_i(-21139- -1481),_i(4981-7853),_i(89467850/5069),_i(14712-29177)
                    local function _j()
                        return(function(Cp)
                            local function RB(Ct)
                                return Cp[Ct+-0.72557443707085045*-26069]
                            end
                            local qd={Tv['_G']['SelectedLanguage']=='Arabic'and RB(2.3942931258106355*-6168)or 'Everyone'}
                            for vE,vq in Tv['pairs'](Tv['game']['Players']['GetPlayers'](Tv['game']['Players']))do
                                if vq~=CF then
                                    Tv['table']['insert'](qd,vq[Xl('\225M\194I','\175,')])
                                end
                            end
                            return qd
                        end){[0.18054769471896903*22969]='\xd8\xa7\xd9\x84\xd9\x83\xd9\x84'}
                    end
                    local function is()
                        return(function(Qh)
                            local function Pe(oi)
                                return Qh[oi+(-15802+5282)]
                            end
                            local Yv=CF[Xl('7\139,Z\21\128\57M\6','t\227M(')]
                            if Yv and Yv['FindFirstChild'](Yv,'HumanoidRootPart')and Tv['work(\xca\xfc\x00Q\xba']['Fi54\x071G\xeb\x98\x00\x7f\x0b\x1eB\xaak'](Tv['work(\xca\xfc\x00Q\xba'],Pe(1.8429628868099106*19454))then
                                Yv['Humanoid\t&\x99\x159\x08\x83\x0f`']['CFrame']=Tv['workspace']['WorldSpawn']['CFrame']
                                return Pe(0.47703387202370695*29021)
                            end
                            return Pe(36293-4605)
                        end){[26579+-23255]=true,[7244- -13924]=false,[637935606/25182]='WorldSpawn'}
                    end
                    local function ey()
                        return(function(hk)
                            local function xi(WG)
                                return hk[WG+2.8344671201814058*-10584]
                            end
                            if ji and ji[Xl('\152\240^\173\255X','\200\145,')]then
                                ji['Destroy'](ji);
                                ji=xi(-10.742763157894737*-3040)
                            end
                            if vp==(Tv['_G']['SelectedLanguage']=='Arabic'and xi(-429055916/-9466)or xi(30069+-7793))or not vb then
                                return
                            end
                            local f_=Tv['workspace']['Arenas']['FindFirstChild'](Tv['workspace']['Arenas'],vp)
                            if not f_ then
                                return
                            end
                            ji=Tv['Instance']['new']('Highlight');
                            ji['Name']='Select>\xc8\xc8\x0c\xa3M.W\xe0\x98\xfc';
                            ji[Xl('e\214,\174\96\208,\173Q','#\191@\194')]=Tv[Xl('\176W@\156J\31','\243\56,')]['fromRGB'](xi(79991+-23067),-30424- -30679,xi(37676+11889));
                            ji['FillTransparency']=xi(807941313/27311);
                            ji['Ou#\x8d.\xbb\xae\xa2P\xeb.\xbd\xb2']=Tv[''5H')]['fromRGB'](xi(-340889640/-23002),-4375545/-17159,xi(-560480280/-24630));
                            ji['OutlineTransparency']=0;
                            ji['DepthM4=B<']=Tv['Enum']['Highli3\xfb\xde\xecL\x0e2\xa0\x0b\x03\x99\xd2\xfd']['AlwaysOnTop'];
                            ji['Parent']=f_
                            local mg=Tv[''\235\177o')]['new'](xi(-33537- -32650));
                            mg['Name']=xi(36646+24880);
                            mg['\x03\xe5\xb5\xa6\xb9']=Tv['UDim2']['new'](xi(69632-30023),xi(23668- -7642),0,xi(32658+26703));
                            mg['StudsOffset']=Tv['Vector3']['new'](xi(-17.444116779710999*-3391),xi(494979054/20681),xi(6943+-5945));
                            mg['AlwaysOnTop']=xi(52825+-2111);
                            mg['Adornee']=f_
                            local Fc=Tv['Instance']['new'](xi(57477475/12925));
                            Fc[Xl('\5(,$','VA')]=Tv['UDim2']['5\x085\x0fw'](25828/25828,xi(20296+19836),xi(-1.7085247302638606*-18722),0.0020554139603716189*24326);
                            Fc['BackgroundTransparency']=xi(29318- -16772);
                            Fc['Text']=(Tv['_G']['SelectedL6\xae\xac\xe0\xd28\x84\xd1']==xi(-1.6034954456210371*-31069)and xi(348386090/8930)or Xl('\230Y\185\\,b3\243\149}\167\\!w\\\204','\181<\213\57O\22V\151'))..vp..xi(-270378900/-5580);
                            Fc['TextColor3']=Tv['Color3'][Xl('\148,\244\159\f\220\176','\242^\155')](1136-881,4988-4733,xi(-10932- -32128));
                            Fc['TextSize']=xi(-37634496/-12646);
                            Fc['Font']=Tv['Enum']['Font']['GothamBold'];
                            Fc['TextS \xf4\xe0\xb3t`7\xack\xd8\x06\xba\x8b\xe0\xb9qf\x1a']=xi(5573+5542);
                            Fc['TextSt"\x14<\r\xa9\xfb:\xfe\xe5.G\x06']=Tv['Color3']['fr;\x96\xbc8\x87'](xi(32485- -16291),xi(9474+17186),xi(1.9508325974517471*31708));
                            Fc['Parent']=mg;
                            mg['IJ\xaa|E\xac'\218')]=f_
                        end){[-12728+32547]='Arabic',[48738-28024]=true,[13210- -16151]=-432500/-8650,[0.82083897158322061*-7390]=19571+-19561,[4519+-12243]='\x11`\x94\x06\xeeF\x86\xa5\xe8',[-599900910/31766]=0,[-32477- -23673]=0,[36385+-17609]=0,[-0.43002908928171851*-22345]=0,[-28662- -21418]=0,[12697- -2629]='\xd8\xa3\xd9\x8a \xd8\xb3\x8fm,\x0e\xbb\x02\xf0',[701129650/24050]=0,[-646387056/23919]=-222446/-15889,[710501165/-27805]=Xl('\220\t\227X\196\r\249I\228','\136l\155,'),[3839- -27687]='ArenaLabel',[-1.0470488709572461*-15367]=15382-15381,[-13380279/32087]=-3.4401204042141478e-05*-23255,[-3.803362056787682*-7079]=0,[47408-15551]=0,[14144+-12157]=0,[-19351+-11536]='BillboardGui',[-35063+19883]=-24823+25078,[0.082196864273123671*32337]=nil,[-1.2432483955010485*-15737]=0,[2556-5896]=0,[28331-9876]=Xl(',','q'),[-137896520/-13610]=0,[-4365+5675]=8384+-8184,[-43324+14322]=0,[-20574+29587]='\xd8\xa7\xd9\x84\xd8\xb3\xd8\xa7\xd8\xad\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x85\xd8\xae\xd8\xaa\xd8\xa7\xd8\xb1\xd8\xa9\n['}
                    end
                    local function dn()
                        return(function(KF)
                            local function Ls(bB)
                                return KF[bB- -2.4364640883977899*-5611]
                            end
                            if not(ji and ji['Parent'])then
                            else
                                ji['Destroy'](ji);
                                ji=Ls(-124678292/-7594)
                            end
                            if Tv['wo&_n\xf6\xb7&f\xe0']['Arenas']then
                                for jt,bH in Tv['p6\x136\x03rs'](Tv['workspace']['Arenas']['GetC3\x93\xcbu\xa6\x96\xf8\xcc'](Tv['workspace']['Arenas']))do
                                    local H=bH['FindFirstChild'](bH,Ls(42675-24311))
                                    if H then
                                        H['Destroy'](H)
                                    end
                                end
                            end
                        end){[19673+-14980]='ArenaLabel',[-0.13616536135620105*-20174]=nil}
                    end
                    local function au(ud,aa,lz)
                        return(function(Ns)
                            local function xy(Nj)
                                return Ns[Nj-(-43718- -18456)]
                            end
                            local vC=CF['Character']
                            if not vC or not vC['F>r\xc2+\xfaNXZu\xd2\xa2\x92\xcb'](vC,xy(-16980-32514))then
                                return false
                            end
                            local _s=ud['Slots'][aa]['FindFirstChild'](ud['Slots'][aa],Tv['tostring'](lz))
                            if not(not _s or not _s['FindFirstChild'](_s,xy(11552+-8009)))then
                            else
                                return false
                            end
                            local dm,_c=_s['Hull'],vC['HumanoidRootPart']['Position']
                            local Ah,uB=dm[Xl(',F\212\255\b@\200\248','|)\167\150')],dm['Size']
                            local Mh,ke=(_c-Ah)['Magnitude'],Tv['math']['max'](uB['X'],uB['Y'],uB[Xl('v',',')])/xy(-1.9027267960146828*19070)+-44830/-22415
                            return Mh<=ke
                        end){[1.663394352370503*17317]='Hull',[-3331+-7692]=6758-6756,[478363912/-19741]='HumanoidRootPart'}
                    end
                    local function lf(r_,mG,gn)
                        return(function(Gd)
                            local function xD(HE)
                                return Gd[HE+-214526340/-24795]
                            end
                            local bG=r_['Slots'][mG][Xl('\237E\149\185Y\31\18\216X\184\181v\26\4','\171,\251\221\31v\96')](r_['Slots'][mG],Tv['tostr2L\x05\x1f'](gn))
                            if not bG then
                                return false
                            end
                            local QF=bG['\x1dZ\xf5\xbb~/\xad\xc3z\xeb,\x8e\x12\xfd'](bG,xD(-5.5634775257150908*7097))
                            if not(not QF)then
                            else
                                return false
                            end
                            return QF['Tran\xc6\xf2\xe90\xb3\xc9ms'')]<-3.8598116411919098e-05*-25908 and QF['Parent']~=nil
                        end){[-434052896/14078]='Pad'}
                    end
                    local function Wo()
                        return(function(Ci)
                            local function bq(LB)
                                return Ci[LB-(22635-19846)]
                            end
                            if not(Tv['w8\xe9\x85\x06\x12\x8b\x96Y\x12\xff']['Find5\x91wX\xa5\xb5N0\xbf\xb0'#')](Tv['w8\xe9\x85\x06\x12\x8b\x96Y\x12\xff'],'Arenas'))then
                            else
                                for lq,Ew in Tv['pairs'](Tv['workspace']['A&\xa4s\xd7\x8c']['GetChildren'](Tv['workspace']['A&\xa4s\xd7\x8c']))do
                                    if not(Ew['FindFirstChild'](Ew,'Slots'))then
                                    else
                                        for Ub,go in Tv['pairs']{bq(-44256903/-3599),bq(22281+-6011)}do
                                            if Ew['Slots']['FindFirstChild'](Ew['Slots'],go)then
                                                for ib=-6484- -6498,(bq(-0.38736171125616747*32631))+(-10102+10115)do
                                                    local Ut=Ew['Slots'][go]['FindFirstChild'](Ew['Slots'][go],Tv['to'\xe0E\xe65\x97V']((ib-(30557-30544))))
                                                    if not(Ut and Ut['FindFirstChild'](Ut,bq(1.530097522699249*17842))and Ut['Data']['FindFirstChild'](Ut['Data'],'Player'))then
                                                    else
                                                        if not(Ut['Data']['Player']['\x01\xf2\xb8\xb5\xac\xbc']==CF)then
                                                        else
                                                            local R=au(Ew,go,(ib-64558/4966))
                                                            return bq(19.267647058823531*-1020),Ew,go,(ib-(26067+-26054)),R
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            return false,nil,bq(-45.585951940850279*-541),bq(38565+-22388),bq(399594860/31010)
                        end){[-1.5565265640172008*14418]=true,[28852-18755]=false,[25755+-12274]='\xb6Y\x83X\x90''),[44305-22432]=nil,[11614+1774]=nil,[-44492- -29063]=-20974+20978,[-474532960/-19360]='Data',[-82101580/-8635]='Left'}
                    end
                    local function HB()
                        return(function(ne)
                            local function yr(v)
                                return ne[v+(-12042- -6660)]
                            end
                            local Jf,vA,pD,pl=Wo()
                            if Jf then
                                if not(not lf(vA,pD,pl))then
                                else
                                    is()
                                    return true
                                end
                            end
                            return yr(-1427+-4821)
                        end){[1.731685527099464*-6716]=false}
                    end
                    local function Xn()
                        return(function(qw)
                            local function Gr(DD)
                                return qw[DD+274146012/13878]
                            end
                            if nC then
                                nC['Disconnect'](nC);
                                nC=Gr(-4.2143325143325141*12210)
                            end
                            nC=if_[Xl('\160\154\127?\156\157{,\156','\232\255\30M')]['Connect'](if_[Xl('\160\154\127?\156\157{,\156','\232\255\30M')],function()
                                return(function(Fo)
                                    local function xn(sH)
                                        return Fo[sH-23799096/7732]
                                    end
                                    if not(not ku)then
                                    else
                                        return
                                    end
                                    local QD=rn['FindFirstChild'](rn,'Remotes')
                                    if not(QD)then
                                    else
                                        local Nr=QD['FindFirs/z\x04\xbc\xc5g\x0c'](QD,'Arena')
                                        if Nr then
                                            local _z=Nr['FindFirstChild'](Nr,xn(-4545+-22628))
                                            if not(_z)then
                                            else
                                                Tv[''*\x056*\x06;'](function()
                                                    return(function(KB)
                                                        local function Gi(ef)
                                                            return KB[ef-0.21794218769896856*15706]
                                                        end
                                                        _z['FireServer'](_z,Gi(-42705- -15277))
                                                    end){[-59053+28202]=true}
                                                end)
                                            end
                                        end
                                    end
                                end){[-21704-8547]='R56X]@'}
                            end)
                        end){[-25787-5916]=nil}
                    end
                    Bc['AutoReadyToggle']=bl['Teleport']['Toggle'](bl['Teleport'],{[_i(111019774/6859)]=_i(-56394597/-25599),['Title']=Zs('autoReady'),[_i(-637691813/27533)]=Zs('autoReadyDesc'),['Value']=_i(-29450- -5670),[_i(-2313+489)]=_i(1.6161413843888071*-16975),['Callback']=function(yt)
                        return(function(Xj)
                            local function ap(oB)
                                return Xj[oB+3.4313914299470389*2077]
                            end
                            ku=yt
                            if not(yt)then
                                if not(nC)then
                                else
                                    nC['Disconnect'](nC);
                                    nC=nil
                                end
                                hs[Xl('b\228HE\237E',',\139<')](hs,{['\x04\t~6\x0f']=Zs(ap(-2255+-2911)),[ap(9969-4786)]=Tv['_G']['Selecte0\x03\x8a\xd5\xe6\xee\xe1\xc6+']==ap(14552+-17613)and 'Auto Ready \xd9\x85\xd8\xaa\xd9\x88\xd9\x82\xd9\x81'or 'Auto Rea4\x7f\x0b\x17\x0eisabl5b',[ap(0.74599365841117493*23338)]=ap(10.135997614076945*-3353)})
                            else
                                Xn();
                                hs['Notify'](hs,{[ap(-133730297/3917)]=Zs(ap(-26046-6876)),['Content']=Tv['_G']['SelectedLanguage']==ap(-207230854/29702)and ap(-57258+27792)or '\x15\xbf\x1d\x81=\x00\xccc\n\xd4\xd4\xc6\xe9\x92-\x97\xce\x08',['Duration']=ap(50724-29741)})
                            end
                        end){[-39874+13015]=-28824+28826,[2001+-40]='notif29[\xd6\xc4ld',[422385812/-18908]='Auto Ready \xd9\x85\xd9\x81\xd8\xb9\xd9\x84',[1314150/8761]='Arabic',[1116+-26911]='notification',[7615-3549]='Arabic',[29041-16731]='Content',[-55035- -28021]='Title',[-530- -25067]='Duration',[-351599880/-12508]=-0.00042707666026051675*-4683}
                    end});
                    bl['Teleport']['Divider'](bl['Teleport'],{[_i(-2269+14767)]=''})
                    local TC,ao=_i(-381649635/-24385),nil;
                    Bc['AntiAfkToggle']=bl['Teleport']['Toggle'](bl['Teleport'],{[_i(1.3016885553470918*-13325)]='AntiAfkToggle',['Title']=Zs(_i(11302-29188)),['De$\xcf\xa2']=Zs(_i(345037950/18285)),[_i(-5790+-8468)]=_i(-260445066/-24854),[_i(-25672+-5362)]='xlarge',[_i(-196314601/-8323)]=function(mp)
                        return(function(Zj)
                            local function An(Th)
                                return Zj[Th-(-3314+-18969)]
                            end
                            TC=mp
                            if mp then
                                if ao then
                                    ao['Disconnect'](ao)
                                end
                                ao=CF['Idled']['Connect'](CF['Idled'],function()
                                    return(function(Wt)
                                        local function ha(Zw)
                                            return Wt[Zw+(26480- -2734)]
                                        end
                                        local xw=Tv['game']['GetService'](Tv['game'],ha(6830-19667));
                                        Tv['pcall'](function()
                                            xw['CaptureController'](xw)
                                        end);
                                        Tv[Xl('=C,L!','M ')](function()
                                            xw['ClickButton2'](xw,Tv['Vector2']['new']())
                                        end)
                                    end){[61348242/3746]='VirtualUser'}
                                end)
                            else
                                if ao then
                                    ao['Disconnect'](ao);
                                    ao=An(17625+-30167)
                                end
                            end
                        end){[16464-6723]=nil}
                    end});
                    bl['Teleport']['Divider'](bl['Teleport'],{[_i(12613-11758)]=''})
                    local jc,vy,Na,rh,Mp=false,-22179/-7393,nil,'idle',_i(-46248+22160);
                    bl['Teleport']['Divider'](bl['Teleport'],{['Title']=''})
                    local function Q(AB,gB,sB)
                        return(function(uG)
                            local function UB(Xe)
                                return uG[Xe+(-27938+24084)]
                            end
                            local ry=AB['Slots'][gB]['FindF>\xf4\xba8\xe4\x8e\x02i;\xe2'](AB['Slots'][gB],Tv[' \xc4\xa1\xfa\xe9\xa8\xa7\xe7\xfa'](sB))
                            if ry and ry['Find\x16\xe5\x7f\xd4\x97\xff\xc7\xd5\xda\xe5'](ry,UB(7658+-6178))then
                                local Sc=ry['Pad']
                                local FA=Sc['Color']
                                if not(Tv['math']['abs'](FA['R']- -8441.0470588235294/-24741)<UB(42734-26181)and Tv['math']['abs'](FA['G']- -4.876701625342683e-05*-14555)<UB(0.39132577624445541*-2029)and Tv['math']['5\x0b5\x1fs'](FA['B']-UB(127324556/-20294))<-4.8892582995159639e-07*-20453)then
                                else
                                    return true
                                end
                            end
                            return false
                        end){[-3.5511921458625526*2852]=3104.3764705882354/13888,[34081144/-14356]='Pad',[-33992+29344]=208.21000000000001/20821,[14791-2092]=-231.27000000000001/-23127}
                    end
                    local function aF(lr)
                        return(function(Zd)
                            local function oy(Xz)
                                return Zd[Xz+-118384896/4636]
                            end
                            if not(not lr or not lr['FindFirstChild'](lr,'Slots'))then
                            else
                                return oy(462363968/18968)
                            end
                            for vH,fp in Tv['pairs']{oy(-1097357442/-26337),oy(-13832700/-19761)}do
                                if lr['Slots']['FindFirstChild'](lr['Slots'],fp)then
                                    for Yh=7164-7151,(49088/12272)+(14428-14416)do
                                        if not(Q(lr,fp,(Yh-(13482+-13470))))then
                                        else
                                            return oy(11631- -7754)
                                        end
                                    end
                                end
                            end
                            return false
                        end){[-11514+5363]=true,[15491800/-13355]=false,[-0.98524278006981914*25208]='Right',[36565-20435]='Left'}
                    end
                    local function sn(hA,Bm)
                        return(function(qC)
                            local function pk(SE)
                                return qC[SE-(11423+-22152)]
                            end
                            if not(not hA or not hA['FindFirstChild'](hA,pk(0.45630265983809681*18159)))then
                            else
                                return pk(9998+-7896),pk(-21685- -9831)
                            end
                            if not(Bm and hA['Slots']['FindFirstChild'](hA['Slots'],Bm))then
                            else
                                for ls=-0.0088912694161756827*-28005,(15003+-14999)+(18627+-18379)do
                                    local rm=hA['Slots'][Bm]['FindFirstChild'](hA['Slots'][Bm],Tv['tostring']((ls-(23832-23584))))
                                    if rm and rm['FindFirstChild'](rm,'Data')and rm['Data']['FindFirstChild'](rm['Data'],pk(-10644- -30939))then
                                        if not(rm['Data']['Player']['Value']==nil and not Q(hA,Bm,(ls-(8797+-8549))))then
                                        else
                                            return Bm,(ls- -0.0077131216371722697*-32153)
                                        end
                                    end
                                end
                            end
                            for JC,rB in Tv['pairs']{pk(0.16928293356775084*-23889),pk(30390+-10966)}do
                                if not(hA['Slots']['FindFirstChild'](hA['Slots'],rB))then
                                else
                                    for Zg=17766-17687,(pk(-0.41505727224294087*30032))+(31085+-31007)do
                                        local sg=hA['Slots'][rB]['FindFirstChild'](hA['Slots'][rB],Tv['tos$\xe6D<\xe6']((Zg- -2432586/-31187)))
                                        if sg and sg['FindFirstChild'](sg,pk(-30902+25147))and sg['Data'][Xl('c\14\141\23j\138\222V\19\160\27E\143\200','%g\227s,\227\172')](sg['Data'],pk(-8.0113335851907816*-2647))then
                                            if sg['Data']['Player']['Value']==pk(25676-21817)and not Q(hA,rB,(Zg-(-844- -922)))then
                                                return rB,(Zg-(1876+-1798))
                                            end
                                        end
                                    end
                                end
                            end
                            return pk(-10161+-29589),nil
                        end){[-11120816/6406]=112236/28059,[486936120/25608]=Xl('\16\201,\209\48','C\165'),[-105264432/-3393]='Player',[1.9348690965092403*15584]='Right',[-7050+5925]=nil,[-12688- -17662]='Data',[211544697/16487]=nil,[286785522/-9882]=nil,[-22238- -28923]='Left',[36587+-4652]='Player',[-807+15395]=nil}
                    end
                    local function Gh(bd,Fm,wj)
                        return(function(Ju)
                            local function Kf(TG)
                                return Ju[TG-(-23358- -17186)]
                            end
                            if not bd['Slots'][Fm]['FindF\x8e\xd2\xe9#\x81\x0e\xac\x8f\x81\t'')](bd['Slots'][Fm],Tv[Xl('\180\206,\158\178\200\49\141','\192\161_\234')](wj))or not bd['Slots'][Fm][Tv['tostri94\x9a'](wj)]['FindFirstChild'](bd['Slots'][Fm][Tv['tostri94\x9a'](wj)],'H.k\x14\x14')then
                                return false
                            end
                            local Tq,nn=bd['Slots'][Fm][Tv['tos$\xd6V\xf7\x1c\xaf'](wj)]['Hull'],CF['Character']
                            if not(nn and nn['FindFirstChild'](nn,'HumanoidRootPart'))then
                            else
                                nn['H%\xcfw\x02\x02\x12\\\xda{\xf7\xc0*`d7']['CFrame']=Tq['\x14\xeb\x8fn\xb4\xa4y']+Tv['Ve7\xddv\xa8\xa4']['ne'\x1d'](0,-22227- -22232,Kf(5237+-4153));
                                Tv['task']['wait'](-1.5394878637040077e-05*-19487)
                                return au(bd,Fm,wj)
                            end
                            return false
                        end){[0.76042758331586668*9542]=0}
                    end
                    local function Bg(Kj)
                        return(function(Jm)
                            local function s_(Gn)
                                return Jm[Gn- -0.34202616315990009*23621]
                            end
                            if not Kj or not Kj['FindF=\xde\\qO\xf6b\x1c\xb1J'](Kj,'Slots')then
                                return s_(-4142+-1196),nil,nil
                            end
                            local EB,hb,De=0,nil,nil
                            for dB,qb in Tv['pairs']{s_(-1031220360/30620),s_(-13034- -17332)}do
                                if not(Kj['Slots']['FindFirstChild'](Kj['Slots'],qb))then
                                else
                                    for Or=2024170/9874,(s_(-12214- -7716))+-1767252/-8663 do
                                        local VD=Kj['Slots'][qb]['FindFirstChild'](Kj['Slots'][qb],Tv['tostring']((Or- -0.027903159622486663*-7311)))
                                        if not(VD and VD['FindFirstChild'](VD,s_(8179080/9555))and VD['Data']['Find\xb9\xc4V\x12\xef\xb1\x9cj\xa0\xdb'\207')](VD['Data'],'Player'))then
                                        else
                                            local Oe=VD['Data']['Player']['Value']
                                            if not(Oe and Oe['Parent']and not Q(Kj,qb,(Or- -0.012222155652746989*-16691)))then
                                                if not Oe and not Q(Kj,qb,(Or-(30487-30283)))and not hb then
                                                    hb,De=qb,(Or-(6476-6272))
                                                end
                                            else
                                                EB+=s_(-581491339/17743)
                                            end
                                        end
                                    end
                                end
                            end
                            return EB,hb,De
                        end){[-12240+14981]=0,[-20247+-5352]='Left',[-2.9380130874479478*8405]=-11573+11574,[14420+-5485]='Data',[242428299/19587]='Right',[8141-4560]=-0.00017290567995158641*-23134}
                    end
                    local function fd(bF)
                        return(function(kt)
                            local function ea(Mv)
                                return kt[Mv+(-49448+21857)]
                            end
                            if not(not Tv['workspace']['FindFirstChild'](Tv['workspace'],ea(31065-18228)))then
                            else
                                return nil,nil,nil
                            end
                            for pe,qt in Tv['pairs'](Tv['workspace'][Xl('G^ahMw','\6,\4')]['GetChildren'](Tv['workspace'][Xl('G^ahMw','\6,\4')]))do
                                if not(qt['FindFirstChild'](qt,'Slots')and not aF(qt))then
                                else
                                    local bb,ro,Qf=Bg(qt)
                                    if not(bb==(bF- -0.01282051282051282*-78)and ro)then
                                    else
                                        return qt,ro,Qf
                                    end
                                end
                            end
                            return ea(26889- -20131),nil,ea(-2.3523775569321272*-22439)
                        end){[50694-25500]=nil,[253045854/-17151]='Arenas',[35401+-15972]=nil}
                    end
                    local function dg()
                        if Bc['Aut8\xcbo\xc9\xae\x8d\x8aw\xc4M\xde\xf2\xd3\x0bw']then
                            Tv['pcall'](function()
                                Bc['Aut8\xe3\x95U\xd6\xf2\x8e\xffd\x13\xa5\xaaS\xc2\xed\xa9']['Set'](Bc['Aut8\xe3\x95U\xd6\xf2\x8e\xffd\x13\xa5\xaaS\xc2\xed\xa9'],true)
                            end)
                        end
                        if not(Bc['BombEvasionToggle'])then
                        else
                            Tv['pcall'](function()
                                Bc['Bo\xa2\x9d3\x8c~\x08\xaa\x8f\x82h\xf9\xbe\xbb\xf7\x85'@\239\201M')]['Set'](Bc['Bo\xa2\x9d3\x8c~\x08\xaa\x8f\x82h\xf9\xbe\xbb\xf7\x85'@\239\201M')],true)
                            end)
                        end
                    end
                    local function Ex()
                        return(function(gz)
                            local function If(wm)
                                return gz[wm- -111512972/25076]
                            end
                            local Co=CF['FindFirstChild'](CF,If(0.4042679312388856*-5061))
                            if Co and Co[Xl('\178E\22\149T\5\53\135X;\153{\0#','\244,x\241\18lG')](Co,'TBDUI')and Co['TBDUI']['FindFirstChild'](Co['TBDUI'],'Main')and Co['TBDUI']['Main']['FindFirstChild'](Co['TBDUI']['Main'],'Scorebar')then
                                return Co['TBDUI']['Main']['Scorebar']['Visible']
                            end
                            return If(-0.79499407767595531*32082)
                        end){[404755818/-19221]=false,[17947-15546]='PlayerGui'}
                    end
                    local function MC()
                        return(function(hp)
                            local function br_(vk)
                                return hp[vk+(-7266+-6962)]
                            end
                            if not(Na)then
                            else
                                Na['Disconnect'](Na)
                            end
                            rh=br_(-23765- -27241);
                            Na=if_['Heartbeat']['Connect'](if_['Heartbeat'],function()
                                return(function(me)
                                    local function ok(ED)
                                        return me[ED-746146176/24144]
                                    end
                                    if not jc then
                                        return
                                    end
                                    if Ex()then
                                        if not(rh~=ok(40137-24609))then
                                        else
                                            rh=ok(34727+22171);
                                            Tv[''k')]['spawn'](function()
                                                Tv['task']['wait'](-491+492);
                                                dg()
                                            end)
                                        end
                                        return
                                    end
                                    if rh=='in_mat4\x87\xcf'then
                                        rh=ok(36840+-26502);
                                        Mp=ok(4303+17883)
                                    end
                                    local cD,Ty,eD,mo,kr=Wo()
                                    if cD then
                                        if not kr then
                                            if Mp then
                                                Gh(Ty,eD,mo)
                                            end
                                        end
                                        return
                                    end
                                    if rh==ok(-8.0003813155386077*-5245)then
                                        rh=ok(-2.2880867416964041*-14572);
                                        Tv['task']['spawn'](function()
                                            return(function(eB)
                                                local function qH(vo)
                                                    return eB[vo+-0.92500858918699436*32017]
                                                end
                                                local lh,c,Dz=fd(vy)
                                                if not(lh and c and Dz)then
                                                else
                                                    Mp=lh;
                                                    Gh(lh,c,Dz)
                                                end
                                                rh=qH(-409429479/-21097)
                                            end){[-22553+12344]='>\xba\xca\xc2\xcb'}
                                        end)
                                    end
                                end){[-30957- -15581]='in_match',[5797- -20197]='in_match',[1.5666945989182601*-13127]='idle',[7268-15986]=nil,[1.087315634218289*10170]='id;\xfa\x8e',[11794-9356]='searching'}
                            end)
                        end){[228856320/-21285]='idle'}
                    end
                    Bc['AutoStreakToggle']=bl['T5\x97\x04M\xa2\xb3\xee']['Toggle'](bl['T5\x97\x04M\xa2\xb3\xee'],{['Flag']=_i(-1.249734763644937*-16966),['Tit;\xe9\x9d']=Zs('autoStreak'),[_i(-15643- -11918)]=Zs(_i(-4495+17974)),[_i(81494914/-2546)]=_i(458745872/-18512),['Size']=_i(-25887- -12020),['Callback']=function(Kl)
                        return(function(qi)
                            local function Wn(xo)
                                return qi[xo-(-60966- -29159)]
                            end
                            jc=Kl
                            if not(Kl)then
                                if Na then
                                    Na['Disconnect'](Na);
                                    Na=nil
                                end
                                rh='>!T
'
                            else
                                MC()
                                if not ku then
                                    ku=true;
                                    Xn();
                                    Tv['pcall'](function()
                                        return(function(Dx)
                                            local function Bw(Yf)
                                                return Dx[Yf+0.7042886648037906*24693]
                                            end
                                            Bc['AutoReadyToggle']['Set'](Bc['AutoReadyToggle'],Bw(0.39186518630304334*-27831))
                                        end){[0.99341299019607843*6528]=true}
                                    end)
                                end
                                hs['Notify'](hs,{['Title']=Zs(Wn(-1.9676443316578009*20491)),['Content']=Zs('autoStreak'),[Wn(0.04975288303130148*-15175)]=9.666505558240696e-05*31035})
                            end
                        end){[-22541+14029]='notification',[-930504232/-29966]='Duration'}
                    end})
                    local Bi={_i(20099+-375),_i(-55580- -23748)};
                    Bc['StreakModeDropdown']=bl['Telepo&X\xff']['Dropdown'](bl['Telepo&X\xff'],{[_i(-50806+30535)]=_i(-0.05511337034312086*14951),['Title']=Zs('streakMode'),[_i(1.522637320204653*10359)]=Zs('streakModeDesc'),['Values']=Bi,['Value']=Bi[_i(-0.3888851824671426*-29978)],['Size']=_i(-363532533/18933),[_i(-62971- -31252)]=function(iE)
                        return(function(Fr)
                            local function fz(Tl)
                                return Fr[Tl+(-32770- -23506)]
                            end
                            vy=(iE=='4v4')and 27134+-27130 or fz(-47549+31690)
                        end){[-16021-9102]=-11385- -11388}
                    end})
                    local function vm(Ab,Ws,io)
                        return(function(rx)
                            local function i_(Qk)
                                return rx[Qk-(-20506- -31525)]
                            end
                            if not Ab or not Ab['Slots']or not Ab[Xl(',\151\16\143\f','\127\251')]['FindFirstChild'](Ab[Xl(',\151\16\143\f','\127\251')],Ws)then
                                return nil
                            end
                            for uq=i_(39997+-18694),0.00017674870752507622*22631 do
                                if uq~=io then
                                    local VF=Ab['Slots'][Ws]['FindFir$-c\tV\x17nX'](Ab['Slots'][Ws],Tv['tostring'](uq))
                                    if VF and VF['FindFirstChild'](VF,i_(0.66968305817957097*-22654))and VF['Data']['FindFirst\x18\x0f\x10|\x129'](VF['Data'],Xl('B(,k!?','\18DM'))then
                                        if VF['Data']['Player']['Value']==nil and not Q(Ab,Ws,uq)then
                                            return uq
                                        end
                                    end
                                end
                            end
                            return nil
                        end){[1.6464449613377758*-15907]='\x1f\x07/\x07',[0.45375926579597597*22664]=5.2789948793749668e-05*18943}
                    end
                    Tv['findTargetPlayer']=function(_l)
                        return(function(kb)
                            local function eA(Wb)
                                return kb[Wb-(-30585+27546)]
                            end
                            if _l==(Tv['_G']['Selew9(ULanga,*T'\248\189')]=='Arabic'and '\xd8\xa7\xd9\x84\xd9\x83\xd9\x84'or 'Everyone')then
                                return eA(-48134- -12689)
                            end
                            for Sp,hf in Tv['pairs'](Tv['game'][Xl(']\231Mt\238^~','\r\139,')]['GetPlayers'](Tv['game'][Xl(']\231Mt\238^~','\r\139,')]))do
                                if hf['Name']==_l and hf~=CF then
                                    return hf
                                end
                            end
                            return nil
                        end){[-341008338/10523]=nil}
                    end;
                    Tv['isInGame']=function()
                        return(function(we)
                            local function rd(sb)
                                return we[sb-162472413/10121]
                            end
                            local HF=CF['FindFirstChild'](CF,'Pl:\xd9\xe9d\x1b\xe8E')
                            if not(HF and HF['FindFirstChild'](HF,rd(15033+-4499))and HF['TBDUI']['FindFirstChild'](HF['TBDUI'],'Main')and HF['TBDUI']['Main']['FindFirstChild'](HF['TBDUI']['Main'],rd(158176185/13935)))then
                            else
                                return HF['TBD\x02m\x0c']['Main']['Sco)^\x0b%\x02c0']['Visible']
                            end
                            return false
                        end){[12096-17615]='TBDUI',[-30816- -26114]='Scorebar'}
                    end;
                    Tv['fi:\xbe\x08\xffHr\x8b\xedHG\xa5\xf0\xae\xd4C\x96']=function(jA)
                        return(function(Dd)
                            local function lA(_o)
                                return Dd[_o-(-20746-11304)]
                            end
                            if Tv['workspace']['A&\xa4a\xd6\xddw']then
                                local Hz={}
                                for yo,NC in Tv['pairs'](Tv['workspace']['Ar2\xbf?\x81']['GetChildren'](Tv['workspace']['Ar2\xbf?\x81']))do
                                    if NC['Name']==lA(-8947+-4079)or NC['Name']==lA(923651280/-16812)then
                                        if jA==nil then
                                            continue
                                        end
                                    end
                                    if not(vp~=(Tv['_G']['SelectedLanguage']==lA(-36017+-26214)and '\xd8\xa3\xd9\x8a \xd8\xb3\xd8\xa7\xd8\xad\xd8\xa9'or lA(-270867836/23521))and NC['Name']~=vp)then
                                    else
                                        continue
                                    end
                                    if NC['FindFirstChild'](NC,lA(-24791-4808))then
                                        if not(aF(NC))then
                                        else
                                            continue
                                        end
                                        for qp,Ha in Tv['p:\x12o5']{lA(-5793-13734),lA(0.22338658146964857*-31300)}do
                                            if not(NC['Slots']['FindFirstChild'](NC['Slots'],Ha))then
                                            else
                                                for Fn=lA(-139740208/2734),lA(-65828- -27504)do
                                                    local iF=NC['Slots'][Ha]['FindFirstChild'](NC['Slots'][Ha],Tv['tostring'](Fn))
                                                    if iF and iF['FindFirstChild'](iF,'Data')and iF['Data']['FindFirstChild'](iF['Data'],lA(-1.8034068695895002*25067))then
                                                        local _f=iF['Data']['Player']['Val"<Q']
                                                        if not(_f and _f~=CF and _f['Parent']and not Q(NC,Ha,Fn))then
                                                        else
                                                            local aj=lA(-1.8111520998864927*14096)
                                                            if vD==(Tv['_G']['SelectedLanguage']=='Arabic'and '\xd8\xb9\xd8\xaf\xd9\x88\xd9\x89'or lA(-17779+9381))then
                                                                local Rd=(Ha==lA(328996290/-11613))and 'Right'or lA(-38956+13378)
                                                                if vm(NC,Rd,lA(-1254560849/28033))then
                                                                    aj=lA(-43529- -27863)
                                                                end
                                                            elseif vD==(Tv['_G']['SelectedLanguage']==lA(3.879562866155926*-8876)and Xl('\245\156\3\169\245\151\2\154',',\29\219\24')or 'Team')then
                                                                if vm(NC,Ha,Fn)then
                                                                    aj=lA(-6.2865217391304347*4600)
                                                                end
                                                            end
                                                            if not(aj)then
                                                            else
                                                                if not(jA==nil)then
                                                                    if not(_f==jA)then
                                                                    else
                                                                        return NC,Ha,Fn,_f
                                                                    end
                                                                else
                                                                    Tv['table']['inse)\xa7\x1b'](Hz,{[lA(-291159360/16920)]=NC,['side']=Ha,[lA(-45.804624277456647*865)]=Fn,[Xl('V%__,L','&I>')]=_f})
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if not(jA==lA(-1.947413164925917*16468)and#Hz>lA(-65824- -11440))then
                                else
                                    local Ki=Hz[-10167- -10168]
                                    return Ki['arena'],Ki['side'],Ki['slot'],Ki['player']
                                end
                            end
                            return nil
                        end){[-960480144/31824]='Arabic',[-0.90719354389870599*-7187]=false,[1.1604772920978936*-16426]=-28228+28229,[10092-32426]=0,[70203993/28643]='Slots',[445-23335]='Arena5ICED',[-0.45877932941093075*-14107]='Left',[18339+-20724]='Ar6\x04\xb4\xa7{',[47360+-22302]='Right',[23191+-19471]='Left',[26921-3269]='Infection',[25566-9182]=true,[20243-5401]='arena',[24743-12220]='Left',[-30440- -22869]='slot',[0.20091587408332534*-31227]=9644-9640,[-2.333394562821455*5444]=nil,[-541960/27098]=nil,[256859806/12509]='Any Aren5\xc4',[-2.7687381749381457*-6871]='Arena5',[-23509- -10353]='Player',[62386308/19919]=true}
                    end;
                    Tv['findBestSlot']=function(tz,Xg,Qt,Mt)
                        return(function(nc)
                            local function Oc(yz)
                                return nc[yz+(15106+-7746)]
                            end
                            if not(aF(tz))then
                            else
                                return Oc(38058+-29703),Oc(639-25919)
                            end
                            local _a=Xg
                            if not(vD==(Tv['_G']['SelectedLanguage']=='Arabic'and '\xd8\xb9\xd8\xaf\xd9\x88\xd9\x89'or 'Infect9C\x0c\xf3'))then
                                if vD==(Tv['_G']['SelectedLanguage']==Oc(-63717- -31011)and Oc(2818-16174)or 'Team')then
                                    local Qp,kC=sn(tz,Xg)
                                    if Qp and kC then
                                        return Qp,kC
                                    end
                                end
                            else
                                _a=(Xg=='Left')and 'Right'or 'Left'
                                local jw,bw=sn(tz,_a)
                                if not(jw and bw)then
                                else
                                    return jw,bw
                                end
                            end
                            return Oc(-55008- -20201),nil
                        end){[7.44426362896664*-3687]=nil,[-0.82657187581528824*30664]='Arabic',[-444687355/-28297]=nil,[1096+-7092]='\xd9\x81\xd8\xb1\xd9\x8a\xd9\x82',[-33397+15477]=nil}
                    end;
                    Tv['star/X\xfbk\xe7\xb0\xc5\xb3\x82h\xf8\xfe\xe7']=function()
                        if not(Bq)then
                        else
                            Bq['Di#\xb2\xdf\x8c\x89\xc1Rrg\xf4'](Bq)
                        end
                        Bq=if_['He5R\xb2\xd8S\x7f\x92']['Connect'](if_['He5R\xb2\xd8S\x7f\x92'],function()
                            return(function(vf)
                                local function tD(wl)
                                    return vf[wl+-10.237510237510238*-1221]
                                end
                                if not Fx then
                                    return
                                end
                                if HB()then
                                    return
                                end
                                if not(Tv['isInGame']())then
                                else
                                    return
                                end
                                local Ke,E,ld,Gg,Zn=Wo()
                                if Ke then
                                    if not Zn then
                                        Gh(E,ld,Gg)
                                        return
                                    end
                                    local mA={}
                                    if E and E['FindFirstChild'](E,tD(-70418888/-10216))then
                                        for MF,dp in Tv['pairs']{'Left','Right'}do
                                            if not(E['Slots']['FindFirstChild'](E['Slots'],dp))then
                                            else
                                                for wa=-0.0058815798120523096*-30434,(-3133+3137)+(28518-28340)do
                                                    local wA=E['Slots'][dp]['\x12\xdb\xb6\xf8\xdb\x0b\x1e\xd97\x17\xcaF\x92\x95'](E['Slots'][dp],Tv['tostring']((wa- -5830390/-32755)))
                                                    if wA and wA['FindFirstChild'](wA,'Data')and wA['Data']['FindFirstChild'](wA['Data'],'Player')and wA['Data']['Player']['Value']then
                                                        local Zk=wA['Data']['Player']['Value']
                                                        if Zk~=CF and Zk['Parent']and not Q(E,dp,(wa-3039706/17077))then
                                                            Tv['table']['insert'](mA,Zk)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if#mA==tD(-9938+-30840)then
                                        is()
                                        return
                                    end
                                    return
                                end
                                local Jz,rE,cf,W
                                if not(zn==(Tv['_\x10:']['\x04\xa9\xd9\rQ\x9f\xef\x94\x9c\xcb\xdd\x0fS\x89\xfa\x96\x9d']=='Arabic'and tD(4744-2455)or 'Everyone'))then
                                    local pm=Tv['findTargetPlayer'](zn)
                                    if pm and pm['Parent']then
                                        Jz,rE,cf,W=Tv['findPlayerInArenas'](pm)
                                    end
                                else
                                    Jz,rE,cf,W=Tv['f>\x1c\xfc\x8e\x832$\x8b\xdb\xa66\xab4T\xd2o\xc0'](tD(-13424+-17489))
                                end
                                if Jz and rE and cf then
                                    local qF,JB=Tv['findBestSlot'](Jz,rE,cf,W)
                                    if not(qF and JB)then
                                    else
                                        Gh(Jz,qF,JB)
                                    end
                                end
                            end){[-4207- -18996]='\xd8\xa7\xd9\x84\xd9\x83\xd9\x84',[16988+2405]='Slots',[-2820+-25458]=0,[-41566- -23153]=nil}
                        end)
                    end;
                    Bc['AutoJoinToggle']=bl[Xl('\243_(=\215U6,','\167:DX')]['Toggle'](bl[Xl('\243_(=\215U6,','\167:DX')],{['Flag']='AutoJoinToggle',[_i(191332722/13179)]=Zs(_i(-46738- -10423)),['Desc']=Zs('disableAutoJoin'),['\x02\x98\xc5\xc8\xd1\xc1']=_i(3194-28507),['Size']=_i(-0.60247792276262024*-22761),['Callback']=function(zc)
                        Fx=zc
                        if zc then
                            Tv['st5\x9ak\tX\xc1\xc0\x93T\xbf\x99\x1b\n\xf7j']()
                        else
                            if Bq then
                                Bq['Dis3\xc3`W:\xcd\xf9\xccB'](Bq);
                                Bq=nil
                            end
                        end
                    end})
                    local Hm=Tv['_G']['Sele7>\x12edLangu:\x1e#']=='Arabic'and{'\xd8\xb9\xd8\xaf\xd9\x88\xd9\x89',_i(-19062-16067)}or{_i(40956+-25609),'Team'};
                    Bc['JoinMethodDropdown']=bl['\x00\x9e\xfb%6\xaa\x1e\xa3']['Dropdown'](bl['\x00\x9e\xfb%6\xaa\x1e\xa3'],{['Flag']='Joi9ME\xa8c-O\xcb\x0c|1x\xa9x2N',[_i(0.3942977964253857*30269)]=Zs(_i(0.43725037558169361*-27291)),[_i(-0.36180826188620419*25660)]=Hm,['Value']=Hm[-7532- -7533],['Size']='xlarge',['Callback']=function(Ql)
                        vD=Ql
                    end});
                    Bc['TargetPlayerDrop3\x94\x8b\x1b\xd1']=bl['Telep;rE\xd3']['Dropdown'](bl['Telep;rE\xd3'],{['Flag']=_i(-885509391/26221),[_i(-0.77348270343469161*-8123)]=Zs('targetPlayer'),['Values']=_j(),[_i(0.59525756336876534*12230)]=_j()[-30333+30334],[_i(-0.30198478946392138*-16173)]='xlarge',['Callback']=function(Gk)
                        zn=Gk
                    end})
                    local Xy=Tv['_G']['SelectedLa5\xd83X\x99\xc3\xb3']=='Arabic'and{_i(-0.23443339123111742*18999),'Arena1','Arena2',_i(-13488- -13239),_i(-52348- -13178),_i(-253689035/15265),_i(-28016- -22192),_i(0.89864779476810308*-7913)}or{_i(-12114- -18041),_i(1.4943418168806191*-22357),'Arena2',_i(-27915+-7586),'Arena4','Arena5','Arena6','A)\x94h\x1a\xdbM\x8f\xb29'};
                    Bc[Xl('\b,\245\165\28\0\181\30\218\53(\221\178\16\4\144\3\200\53','[I\153\192\127t\244l\191')]=bl['Teleport']['Dropdown'](bl['Teleport'],{[_i(-45724- -25028)]=_i(0.67220704662252884*-21599),['Title']=Zs(_i(34924131/17541)),[_i(27453062/-8873)]=Xy,[_i(-23847373/-2519)]=Xy[-28564- -28565],['Size']=_i(18987810/1054),[_i(-0.94181079391539901*-19196)]=function(Kc)
                        return(function(Ib)
                            local function ck(Ms)
                                return Ib[Ms- -1.7107542251744723*11893]
                            end
                            vp=Kc;
                            dn()
                            if Kc~=Xy[ck(-39854+-5457)]then
                                ey()
                            end
                        end){[3.8591745246560518*-6469]=28569+-28568}
                    end});
                    Bc['ShowArenaToggle']=bl['Teleport']['Toggle'](bl['Teleport'],{['Flag']='ShowArenaToggle',['Title']=Zs('showArena'),['Desc']=Zs('showArenaDesc'),[_i(-15807- -25189)]=_i(-4544+27459),[_i(-0.40960539748768254*22529)]=_i(-44059+10921),['Ca79\xd87\xb3\x04\x8e\x8a']=function(OC)
                        vb=OC
                        if OC then
                            ey()
                        else
                            dn()
                        end
                    end});
                    bl['Teleport']['\x1e\x1cx3\x11k('R')](bl['Teleport']);
                    bl['Teleport']['Paragraph'](bl['Teleport'],{[_i(11949+-19928)]=Zs(_i(44289-24097)),[_i(-57303477/-27563)]=Zs(_i(-404931480/-15720)),[_i(10803+-10)]='navigation',['Ima<\x8d\x86\xa9\xfc\xf6\x86']=-0.0030231051608723817*-9262,[_i(-655604464/21124)]=Xl('\18\180,\168 ','E\220')})
                    local XA=_i(-87269850/-7785)
                    local function gy(_y)
                        return(function(rF)
                            local function Wz(zm)
                                return rF[zm- -346392816/12516]
                            end
                            local Tu=CF['Character']
                            if not(Tu and _y)then
                            else
                                local wn,Fp=Tu['FindFirstChild'](Tu,Wz(1.5741458016323142*-28916)),Tu['Find\x16\xd3?\xe0\x98\x16\x14\xa2\xec\x93'](Tu,'Humanoid')
                                if not(wn and Fp)then
                                else
                                    Fp['PlatformStand']=true
                                    local av,Nh=wn['Position'],_y['Position']
                                    for Fz=Wz(1.7335953878406709*-19080),Wz(-18930+-23119)do
                                        local Tb=Fz/(-163360/-16336);
                                        wn['CF%\xfe\xa0]\x94']=Tv['CFrame']['new'](av['Lerp'](av,Nh,Tb));
                                        Tv['task']['wait'](1.1254924029262803e-06*8885)
                                    end
                                    wn['CFrame']=_y;
                                    Tv['task']['wait'](Wz(-4237-15429));
                                    Fp['PlatformStand']=false
                                    return Wz(12581+-20572)
                                end
                            end
                            return false
                        end){[-0.21990146980986117*24561]=-28408+28409,[-235885355/-11983]=true,[19057-11047]=-299.60000000000002/-2996,[-0.44395366795366797*32375]=-12651+12661,[381390592/-21376]='HumanoidRootPart'}
                    end
                    local function jk()
                        return(function(jg)
                            local function _k(tp)
                                return jg[tp+-0.99227822703228552*16447]
                            end
                            local YB=CF['Character']
                            local ae=YB and YB['FindFirstCh=\x8dw.'](YB,_k(21182-30935))
                            if not(not ae)then
                            else
                                return _k(259+8810)
                            end
                            local Fs,wG=_k(-11601+-3749),Tv['math']['huge']
                            for dc,yD in Tv[Xl(',\0t,\2f','Ep\21')](Pm['GetPlayers'](Pm))do
                                if not(yD~=CF and yD['Character']and yD['Character']['FindFirstC<\xd4\xc2\xb32'](yD['Character'],'HumanoidRootPart')and yD['Chara4!\xa8*\xde']['FindFirstChild'](yD['Chara4!\xa8*\xde'],'Humanoid'))then
                                else
                                    local GC=yD['Character']
                                    if GC[Xl('\229\54\139\152\195,\143\157','\173C\230\249')]['Health']>_k(-1.9113832853025936*8328)then
                                        local nH=(ae['P4um\xdd\xa4\x00\x03j']-GC['HumanoidRootPart']['Position'])['Magnitude']
                                        if not(nH<wG)then
                                        else
                                            wG=nH;
                                            Fs=GC
                                        end
                                    end
                                end
                            end
                            if not(Fs)then
                            else
                                local YE=(Fs['HumanoidRootPart']['Position']-ae['\x07*\x12sit>\xa0\x13'])['Unit'];
                                ae['CFrame']=Tv[Xl('p,hR\a\127','3j\26')]['new'](Fs['HumanoidRootPart']['Position']-YE*(-27913- -27916),Fs['Human\x8a\x98\x0e\n,\x9c\xb3\xfb\x00\xdb]'\247')]['Positi8\xbb\xf0'])
                                return _k(2.5459416550902958*-5039)
                            end
                            return _k(-90361498/-2243)
                        end){[7396+16570]=false,[-618-31052]=nil,[-24583+-1490]='HumanoidRootP6\xfct\xaa',[-27884-1265]=true,[-20293-11945]=0,[-9436- -2185]=false}
                    end
                    bl['Teleport']['Button'](bl['Teleport'],{['\x0f@\x1b\x06\x1e\x17']=Zs('savePosition'),['\x19\x83\xc3\xcf\xce']='map-pin',['Size']=_i(8082472/4376),[_i(-38781324/-7468)]=function()
                        return(function(As)
                            local function mj(Dt)
                                return As[Dt-(31925-11051)]
                            end
                            local u_=CF['Character']and CF['Character']['FindFirstChild'](CF['Character'],'Hum5\x01\xa4\xfb\x17\xa3Jm\x98~\x9a\xf5\x0c\xb3')
                            if not(u_)then
                            else
                                XA=u_['CFrame'];
                                hs['Notify'](hs,{[mj(44474+-28139)]=Zs('notification'),['Content']=Tv['_G']['SelectedLanguage']==mj(-494702023/-10999)and mj(27803- -2375)or 'Posi#$\x1f\xc8\xb3\x7f\xed\x83\x02Y',[mj(55732+-8227)]=mj(27982-17085)})
                            end
                        end){[-0.84171433989696265*-31639]='Duration',[22148+-26687]='Title',[242908832/26108]='\xd8\xaa\xd9\x85 \xd8\xad\x89\xd0'\x15\xc0\xa09\xe8\x9d3\x9b\x0c\xbf\xe0~j\xa1\x06',[-1411+25514]='Arabic',[-2839-7138]=-7786+7788}
                    end});
                    bl['Teleport']['Button'](bl['Teleport'],{['Title']=Zs('goToSaved'),['Icon']=_i(24753+-6891),[_i(-0.39400972244001881*31885)]='xlarge',['Callback']=function()
                        return(function(oz)
                            local function Sv(vg)
                                return oz[vg-0.89880006233442422*32085]
                            end
                            if not(XA)then
                                hs['Notify'](hs,{[Sv(4.8438567300113844*11419)]=Zs('notification'),[Sv(-14449- -14015)]=Tv['_G']['SelectedLanguage']=='Arabic'and Xl('\200\15\190\vn\130t5x5\226)c%\181\146R\193u\200{,i*A\188\136c(\180\169','\17\138f\172N[\245\236\242\236e\t\186\160l')or Sv(89462-30662),['Duration']=-32675+32677})
                            else
                                gy(XA)
                            end
                        end){[0.86794308569929846*30502]='Title',[-954229776/-31848]='No saved position',[-20538-8734]='C\xa9\xad\x8b\\Rt'')}
                    end})
                end
                do
                    Tv['_G']['AutoSettings']=Tv['_G'][Xl('\191\168X\23Q \138\169E\22e6','\254\221,x\2E')]or{[_i(-80913988/6911)]=_i(-40084- -4754),['STRAFE_AMPLITUDE']=_i(51616386/-27081),[_i(1.8191543555781966*7852)]=-10756- -10772,[_i(21766-13116)]=-1515- -1523,['MIN_DIST']=-9568/-4784,['RO\x04\x18$\xcbs\xa33("m\xaa\xe0\x93\xd5']=_i(-67728+30785),[_i(-53344- -20423)]=0.00064864864864864862*4625}
                    local ma,wh_,Sy,qA,mn,hn,Nc,bi,pj,ur,NG,Jr,Zi,Jx,Ti,Cq,ii,fC,Nl,Rs,Ja,Bn,OB,zE,uD,bC,gb,nF,lc,zy,Ey=Tv['_G']['AutoSettings']['STRAFE_DISTANCE'],Tv['_G']['AutoSettings']['STRAFE_AMPLITUDE'],Tv['_G']['AutoSettings']['STRAFE_SPEED'],Tv['_G']['A%\xc0X\xd8Fq1\xabE\xd9rg']['FOLLOW_DURATION'],Tv['_G']['AutoSettings']['MIN_DIST'],Tv['_G']['AutoSettings']['ROTATION_SPEE\x13\xaf'],Tv['_G']['AutoSettings']['ADHESION_FORCE'],_i(-8417+20241),_i(44235+-26955),_i(-30263+23416),_i(193115793/14001),false,Xl(O'EEeW+QtrMvFUu5HJee3mfMBq/WTME8iKMCbYB8BnJU+iUgpCbTTKmlvBoBT+aN1+phRKfftq6WTP66ENMCbYDjk7fRD5A52z',false,{},false,false,_i(7074-24256),nil,_i(308872139/24811),nil,Tv['UDim2']['new'](0,_i(37068-15356),_i(-16480260/13564),-646230/-21541),false,{},0,CB['CreatePath'](CB,{['A3A\xf36w\xd5~\xd0\xaa\x14']=_i(-1.3766889383815888*-13470),['Ag>\xbe\xb8\xe1\xaf\x18\x05\xf7\xa3\xf8\x9c']=true,['AgentHeight']=_i(293479772/19108)}),nil,_i(49214+-27275),_i(0.11771525738135724*-12938),51416/12854,0.0024747370591874612*4849
                    local function kg(WE)
                        return(function(Vl)
                            local function Pg(Cf)
                                return Vl[Cf+12.75601821730644*1537]
                            end
                            return WE and WE['Character']and WE['Character']['FindF>L\x1d\x8a\x11\x15E\xb94\x0b'](WE['Character'],Pg(-22903- -7806))and WE['Character']['Humanoid']['He1\x1but']>0
                        end){[-0.13926552799827038*-32377]='Humanoid'}
                    end
                    local function fj()
                        return(function(fa_)
                            local function yd(G)
                                return fa_[G+-2689950/-158]
                            end
                            local ut=CF['\x13{\x0b\xf5\xf5J\r\x88a']
                            if not(not ut)then
                            else
                                return nil
                            end
                            local qv=ut['FindFirstChild'](ut,yd(13437-29091))
                            if qv then
                                return qv
                            end
                            local ev=CF['FindFirstChild'](CF,'Back \x05\xc9q\xce')
                            if ev then
                                local Ok=ev['FindFirstChild'](ev,'Bomb')
                                if not(Ok)then
                                else
                                    return Ok
                                end
                            end
                            return nil
                        end){[23104+-21733]='Bomb'}
                    end
                    local function cd()
                        return(function(j)
                            local function ij(yG)
                                return j[yG-2.8613881748071979*9725]
                            end
                            local fb=fj()
                            if not fb then
                                return ij(48540-23616)
                            end
                            for FF,JE in Tv['ipairs'](fb['GetDescendants'](fb))do
                                if(JE['IsA'](JE,ij(28153+6941))or JE['IsA'](JE,'IntValue'))and Tv['string']['lower'](JE['Name'])['find'](Tv['string']['lower'](JE['Name']),'time')then
                                    return JE['Value']
                                end
                            end
                            for gs,Im in Tv['ipairs'](fb['GetDe'u\x96#\x1aL\x8d\x01\x18\x86'](fb))do
                                if not(Im['IsA'](Im,'TextLabel')and Tv['string']['lower'](Im['Name'])['find'](Tv['string']['lower'](Im['Name']),ij(-18445+14040)))then
                                else
                                    local fy=Tv['tonumber'](Im['Text'])
                                    if not(fy)then
                                    else
                                        return fy
                                    end
                                end
                            end
                            return ij(-1487415000/-30700)
                        end){[-690828456/21433]='time',[-125951644/-17332]='Nu:1\xf9f1\xa0\x15\xba\xed',[-6690+27313]=nil,[-0.12550799827064418*23130]=nil}
                    end
                    local function it(qE)
                        return(function(vt)
                            local function M(Fh)
                                return vt[Fh+53673244/-27553]
                            end
                            if not(not qE)then
                            else
                                return M(64550-30075)
                            end
                            return qE['FindFirstChild'](qE,M(-31424936/3002))~=nil
                        end){[-27401+14985]='Bomb',[13573- -18954]=false}
                    end
                    local function vs(zf)
                        return(function(Dc)
                            local function Ao(CG)
                                return Dc[CG-(6669-1801)]
                            end
                            if not(not zf)then
                            else
                                return false
                            end
                            for iH,ui in Tv['pairs'](zf['GetDe$\xba\xbb7\x92\xbb\xd2\xc7\x80'](zf))do
                                if not(ui['IsA'](ui,'Highlight')and ui['FillColor']['G']>-20673.900000000001/-22971)then
                                else
                                    return Ao(68347-31479)
                                end
                            end
                            return false
                        end){[27224+4776]=true}
                    end
                    local function Bp()
                        return(function(de)
                            local function ht(PB)
                                return de[PB+(-9092-19974)]
                            end
                            if not Tv['workspace']['FindFirstChild'](Tv['workspace'],'Arenas')then
                                return nil,ht(-655808256/-12027)
                            end
                            for xx,IE in Tv['pairs'](Tv['workspace']['Arenas']['GetChildren'](Tv['workspace']['Arenas']))do
                                if not(IE['FindFirstChild'](IE,'Slots'))then
                                else
                                    for a_,cs in Tv['ipairs']{'Left',ht(30862- -3670)}do
                                        local wt=IE['Slots'][Xl('\25\202\162c\152\nn,\215\143o\183\15x','_\163\204\a\222c\28')](IE['Slots'],cs)
                                        if wt then
                                            for Rr=ht(-353376900/-8620),ht(39294+4418)do
                                                local rp=wt['FindFirstChild'](wt,Tv['tostring'](Rr))
                                                if not(rp and rp['FindFirstChild'](rp,ht(-1015- -1785))and rp['Data']['FindFirstChild'](rp['Data'],'Player'))then
                                                else
                                                    if rp['Data']['PlQ< \x07'')]['Value']==CF then
                                                        return IE,cs
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            return nil,ht(-1.953106503226792*-26187)
                        end){[-30066- -1770]='Data',[1.1070434782608696*23000]=nil,[-277826410/-23290]=5818-5817,[40545+-18465]=nil,[-18753- -24219]='Right',[20779-6133]=90276/22569}
                    end
                    local function cH()
                        return(function(hv)
                            local function db(vl)
                                return hv[vl+0.046202577732469233*27466]
                            end
                            local jF=Tv['tick']()
                            if not(jF-uD<db(785268328/25961))then
                            else
                                return
                            end
                            uD=jF
                            local ar,vj=Bp()
                            if not ar then
                                zE={}
                                return
                            end
                            local ik,WF=(vj==db(19014-6798))and db(63410568/-13026)or db(-22770+26963),{}
                            if ar['Slots']['FindFirstChild'](ar['Slots'],ik)then
                                for uv,iy in Tv['pairs'](ar['Slots'][ik]['GetChildren'](ar['Slots'][ik]))do
                                    if iy['FindFirstChild'](iy,db(-1.2578507180053653*-6337))and iy['Data']['FindFirstChild'](iy['Data'],'\x00\xa3\x97*\x90K')then
                                        local Xw=iy['Data']['Player']['Value']
                                        if not(Xw and Xw~=CF)then
                                        else
                                            local Xf=false
                                            if not(iy['FindFirstChild'](iy,db(-11731-15117)))then
                                            else
                                                local LA=iy['Pad']
                                                local Sh=LA['Color']
                                                if not(Tv['math']['abs'](Sh['R']-db(8734-17720))<db(9630-19578)and Tv['math']['abs'](Sh['G']-db(-0.076892060803999837*-24801))<db(33336-7241)and Tv['math']['abs'](Sh['B']- -5651.3254901960781/-16192)<4.1170900407591915e-07*24289)then
                                                    Xf=true
                                                end
                                            end
                                            local Qc,Zh=kg(Xw),Xw['Character']~=nil;
                                            WF[Xw[Xl('}\26,Z -','(iI')]]={[db(45990-18264)]=Xw,['alive']=Qc,[db(40722+-24107)]=Zh,['inArena']=Xf,['lastSeen']=jF}
                                        end
                                    end
                                end
                            end
                            for iC,Mu in Tv[Xl('\\\nE\25_',',k')](zE)do
                                if not(not WF[iC])then
                                else
                                    if Mu['alive']and Tv['tick']()-Mu['lastSeen']<-5863- -5866 then
                                        WF[iC]=Mu;
                                        WF[iC]['alive']=false
                                    end
                                end
                            end
                            zE=WF
                        end){[-17031- -26271]='Data',[-14012+31896]='hasCharacter',[1.7969137332672285*16136]='+\x10\x18\x1a$w',[6501-14218]=618-617,[-0.84023926724406506*-16049]='Left',[-64085736/7384]=-4.2195873243596776e-07*-23699,[2486808/783]=2.2609289877770113e-05*15437,[-22289- -27751]='Left',[421296144/15396]=-188.78999999999999/-18879,[-2.6992977046933881*-11676]=3.0444489547391921e-05*9854,[-1266-24313]='Pad',[-34316465/9535]='Right'}
                    end
                    local function gx()
                        cH()
                        local dl={}
                        for bp,Kp in Tv['pairs'](zE)do
                            if not(Kp['alive']and Kp['h:Rh\x06\xad\xa8u\x7f~ \xd0']and Kp['inArena'])then
                            else
                                Tv['table']['insert'](dl,Kp['player'])
                            end
                        end
                        return dl
                    end
                    local function nB(ww,zD)
                        ww['ChildAdded']['Connect'](ww['ChildAdded'],function(Gz)
                            return(function(xu)
                                local function nq(rb)
                                    return xu[rb-0.17396068534998008*30116]
                                end
                                if not(Gz['IsA'](Gz,nq(1.638082978512724*20198))and Gz['Name']==nq(11184+-12607))then
                                else
                                    Ti[zD]=Tv['tick']()
                                end
                            end){[53261-25414]='Tool',[-132387264/19872]='Bomb'}
                        end);
                        ww['ChildRemoved']['Connect'](ww['ChildRemoved'],function(Om)
                            return(function(vx)
                                local function Fk(WD)
                                    return vx[WD-(-155+17148)]
                                end
                                if not(Om['IsA'](Om,Fk(-5706- -4839))and Om['Name']==Fk(-2554- -5707))then
                                else
                                    Ti[zD]=Tv['tick']()
                                end
                            end){[-248331120/17943]='Bomb',[12620+-30480]='Tool'}
                        end)
                    end
                    for dG,Yk in Tv['ipairs'](Pm['GetPlayers'](Pm))do
                        if Yk['\x18\x9fvW:\x94c@)'')]then
                            nB(Yk[Xl('\178\175,[\144\164\57L\131','\241\199M)')],Yk)
                        end
                        Yk[Xl('\171\182}\172M|\224\141\172]\186Hz\240','\232\222\28\222,\31\148')]['Connect'](Yk[Xl('\171\182}\172M|\224\141\172]\186Hz\240','\232\222\28\222,\31\148')],function(sE)
                            nB(sE,Yk)
                        end)
                    end
                    Pm['PlayerAdded']['Connect'](Pm['PlayerAdded'],function(Fi)
                        Fi['CharacterAdded'][Xl('\207\219,\226\209!\248','\140\180B')](Fi['CharacterAdded'],function(ta)
                            nB(ta,Fi)
                        end)
                    end)
                    local function Xc()
                        return(function(fg)
                            local function KE(Eu)
                                return fg[Eu-(-68+9467)]
                            end
                            local ow,kw,oj=KE(-38211- -23167),Tv['math']['huge'],Tv['tick']()
                            for BG,zp in Tv['pairs'](Ti)do
                                if BG~=CF and zp and(oj-zp)<=-37128/-30940 then
                                    local Do=oj-zp
                                    if Do<kw then
                                        kw=Do;
                                        ow=BG
                                    end
                                end
                            end
                            return ow
                        end){[-9954-14489]=nil}
                    end
                    local function ye(Zy,yl,Qi,Sb)
                        return(function(sC)
                            local function mc(Ye)
                                return sC[Ye+0.47739466108348599*-30568]
                            end
                            if not(not Zy or not yl)then
                            else
                                return mc(-1929- -8638)
                            end
                            local Hb,gp=yl['\x000w08~q,?']+Tv['Vector3']['new'](mc(19944+-14348),-23866/-23866,0),Tv[Xl('\n\236\254CU\176,\221\230RU\174+','X\141\135 4\195')]['new']();
                            gp['\x11\xb3yx\xf7^\xa4\xb6i\xfb']=Tv['Enum']['Raycast\x12\xa3-,\xdb\x1f\x0eF\x12\xa0\xbba']['Exclude']
                            local Pl={Zy}
                            for Fv,oE in Tv['pairs'](Pm[Xl("\195],\5\175\229A=\'\176",'\132\56XU\195')](Pm))do
                                if oE['Character']then
                                    Tv['table']['insert'](Pl,oE['Character'])
                                end
                            end
                            gp['Fi7\xc0\x812\xf40\xcd%\x9d\x15z\x1a\xa52\xfa\x19\xca\x83\x91\x8a\x96\xdd\xe6\x16']=Pl
                            local Pt=Tv['workspace']['Rayca#\xeb\xf3'](Tv['workspace'],Hb,Qi*Sb,gp)
                            return Pt~=nil
                        end){[21064-28948]=false,[-0.27677115698157317*32507]=0}
                    end
                    local function VE(Yj,LF,Hd,_F)
                        local ka=Tv['tick']()
                        if ka-nF<-2674.3000000000002/-26743 then
                            return
                        end
                        nF=ka;
                        Tv['task']['spawn'](function()
                            return(function(je)
                                local function Xp(rA)
                                    return je[rA- -1.1766195613635213*-19743]
                                end
                                local sf,_C=(LF-Yj)['Unit'],(LF-Yj)['M1\r\xce\x84\x84\xf2\xc4\x88']
                                if not ye(Hd,_F,sf,Tv['mat<\xb7']['min'](_C,-27314- -27324))then
                                    gb=LF
                                    return
                                end
                                local lt=Tv['pcall'](function()
                                    bC['ComputeAsync'](bC,Yj,LF)
                                end)
                                if lt and bC['Status']==Tv['Enum']['PathStatus']['Success']then
                                    local x=bC['\x10\xbe\x99\xc5^\x8cT\xf4\x93\xd8g\x99^'](bC)
                                    if#x>=Xp(18125+-6094)then
                                        gb=x[Xp(0.24123583934088569*24275)]['P;\xf9.\xb9\x05\x952\xbe']
                                    else
                                        gb=LF
                                    end
                                else
                                    gb=LF
                                end
                            end){[0.41859161246916349*-26754]=-7811- -7813,[-423647616/24384]=18687+-18685}
                        end)
                    end
                    local function cu(Au,dd)
                        return(function(od)
                            local function qf(Ae)
                                return od[Ae-(8206+15190)]
                            end
                            local Bv,aA=Au['Position'],Au['AssemblyLinearVelocity'];
                            aA=Tv['Vector3']['new'](aA['X'],qf(-7.6689624853458378*-6824),aA['Z'])
                            local zB=aA['Magnitude']
                            if not(zB>-0.0016726323888535777*-29893)then
                                if not(zB<-5344.5+5346)then
                                else
                                    return Bv
                                end
                            else
                                aA=aA[Xl('\16\215,\205','E\185')]*(9990-9940)
                            end
                            local Yi=(Bv-dd[Xl('\18\53_\164\54\51C\163','BZ,\205')])['Magnitude']
                            local kc=Tv['math']['clamp'](Yi/qf(-8621+26951),-4.6937338652898377e-06*-25566,qf(-12806+28201))
                            local mE,tf=Bv+(aA*kc),Tv['RaycastParams']['new']();
                            tf['FilterDescendantsInstances']={Au['Parent'],CF['Characte"\xa6']};
                            tf['F2\xe8\x00b\xea]\xc0\x80\x16']=Tv['Enum']['RaycastFilterType']['Exclude']
                            local pq=Tv['workspace']['Raycast'](Tv['workspace'],Bv,mE-Bv,tf)
                            if not(pq)then
                            else
                                return pq['Positio:(']-(aA['\x0e\xc9\x94\x93\x8e']*(-33708/-28090))
                            end
                            return mE
                        end){[10609+18328]=0,[14064-22065]=1.3096760111010632e-05*32069,[122587068/-24198]=-23608- -23650}
                    end
                    local function mC()
                        return(function(Ph)
                            local function Xa(Qz)
                                return Ph[Qz+702500403/27357]
                            end
                            local jz=gx()
                            if not(#jz==Xa(-2190-20890))then
                            else
                                return nil
                            end
                            local eG=CF['Character']and CF[Xl(',\218_A\14\209JV\29','o\178>3')]['FindFirstChild'](CF[Xl(',\218_A\14\209JV\29','o\178>3')],'HumanoidRootPart')
                            if not(not eG)then
                            else
                                return nil
                            end
                            local fF,Gs=Xa(353277678/-31369),Tv['math']['huge']
                            for pF,Aw in Tv['ipairs'](jz)do
                                if not(Aw['Ch5\xb8\x83&s\x91Z']and not vs(Aw['Character']))then
                                else
                                    local aE=Aw['Character']['FindFirstChild'](Aw['Character'],'HumanoidRootPart')
                                    if not(aE)then
                                    else
                                        local Mz=(aE['Position']-eG['Po'o\xd9\xb0wV'])['M6\xd2\xecf1\xeaS\xe8']
                                        if Mz<Gs then
                                            Gs=Mz;
                                            fF=Aw
                                        end
                                    end
                                end
                            end
                            return fF
                        end){[28453852/10948]=0,[250091699/17347]=nil}
                    end
                    local function pE(Rj)
                        local Tz,Cz=Tv['pcall'](function()
                            return(function(sG)
                                local function Zf(Mk)
                                    return sG[Mk+(-7562-11759)]
                                end
                                if not(Rj['IsA'](Rj,'Tool')and Rj['Name']==Zf(43063+-9502))then
                                else
                                    local Kq=Xc()
                                    if not(Kq and kg(Kq))then
                                        ur=Zf(-4122586/-338);
                                        Cq=true
                                    else
                                        ur=Kq;
                                        Cq=Zf(176569260/15716)
                                    end
                                    pj=Tv['tick']()+qA;
                                    Jr=false
                                    if bi then
                                        local ju=(ur and kg(ur))and ur or mC()
                                        if not(ju)then
                                        else
                                            NG=ju
                                        end
                                    end
                                end
                            end){[-229065096/32154]=nil,[-17802+9716]=false,[162763200/11430]='Bomb'}
                        end)
                        if not(not Tz)then
                        else
                            Tv['warn']('[Zyphora] onLocalAdde0\xec^\n\t\xfdV\xf9\xba',Cz)
                        end
                    end
                    local function ph(zs)
                        local QG,Dq=Tv['pcall'](function()
                            return(function(p)
                                local function SF(mh)
                                    return p[mh+(21491- -4859)]
                                end
                                if zs['IsA'](zs,SF(5080+-1180))and zs['Name']=='Bomb'then
                                    NG=SF(84088688/-16579);
                                    ur=nil;
                                    Cq=SF(16906-19456)
                                    do
                                        Jr=true
                                    end
                                end
                            end){[10532- -13268]=false,[21804+-526]=nil,[-4.8076923076923075*-6292]='Tool'}
                        end)
                        if not(not QG)then
                        else
                            Tv['warn'](Xl('\250\225\151\0\254\197\49[>\153\183z,\175\2B\192\221\173\4\253\222(S\2\228\242g0\140\31\27','\161\177\255a\144\177^6f\196\151\21B\227m!'),Dq)
                        end
                    end
                    local function Km(no_)
                        no_['ChildAdded']['Connect'](no_['ChildAdded'],pE);
                        no_['\x18\xc0s\x1fVE\xc1\x80v\x19LD\xf7']['Connect'](no_['\x18\xc0s\x1fVE\xc1\x80v\x19LD\xf7'],ph)
                    end
                    if CF['Character']then
                        Km(CF['Character'])
                    end
                    CF['CharacterAdded']['Connect'](CF['CharacterAdded'],Km)
                    local function Us()
                        return(function(ot)
                            local function Be(ci)
                                return ot[ci+(1165-27508)]
                            end
                            ur=Be(-0.47730410069021517*12315);
                            NG=Be(22498- -19772);
                            pj=Be(78127704/1753);
                            Jr=false;
                            Cq=Be(31763+15046);
                            ii=Be(9.1116800780297496*4101);
                            zE={};
                            gb=nil
                        end){[7836- -3188]=false,[43060-27133]=nil,[87963330/-2730]=nil,[0.95877447765389301*21346]=false,[37584-19359]=0}
                    end
                    if not(Tv['workspace'][Xl('l\239E\31,\227\255Y\242h\19\3\230\233','*\134+{j\138\141')](Tv['workspace'],'Arenas'))then
                    else
                        Tv['workspace']['Arenas']['ChildAdded']['Connect'](Tv['workspace']['Arenas']['ChildAdded'],Us);
                        Tv['workspace']['Arenas']['ChildRemoved']['Connect'](Tv['workspace']['Arenas']['ChildRemoved'],Us)
                    end
                    local function XB(Gb,sA)
                        return(function(hy)
                            local function EC(of)
                                return hy[of-0.2354237501574109*15882]
                            end
                            local Gm,FG,kq=Tv['CFrame']['new'](Gb['Position'],Tv['Vector3']['new'](sA['X'],Gb['Position']['Y'],sA['\x0e'])),Gb['CFrame']['LookVector'],(Tv['Vector3']['new'](sA['X'],Gb['Position']['Y'],sA['Z'])-Gb['Position'])['Unit']
                            local cE,pw=FG['Dot'](FG,kq),hn
                            if cE<2.374028132233367e-05*16849 then
                                pw=pw*EC(520958168/30068)
                            end
                            Gb['CFrame']=Gb['CFrame']['Lerp'](Gb['CFrame'],Gm,Tv['9\xb1\xd7\xc2\xde']['clamp'](pw,3.4411562284927739e-06*29060,2564.4499999999998/3017))
                        end){[-0.43045875047522492*-31564]=-2200/-1375}
                    end
                    local function Wl(Ej,Uw)
                        return(function(Sd)
                            local function tx(Bh)
                                return Sd[Bh+(-39857- -10837)]
                            end
                            local EA=Uw['FindFirstChild'](Uw,'Hand<\xbaK')or Uw['FindFirstChildOfClass'](Uw,tx(33940- -19876))
                            if EA and Ej['FindFirstChild'](Ej,tx(79155-20827))then
                                local iz=(CF['Character']['HumanoidRootPart']['P8\x10\xafO\x8a&\xcb']-Ej['HumanoidRootP6\x90\xc9\x88']['Position'])['Magnitude']
                                if iz<tx(-0.33313059825279223*-18086)then
                                    Tv['task']['spawn'](function()
                                        for Mr=-780- -1006,(21960-21945)+(30305-30080)do
                                            Tv['firetouchinterest'](Ej['HumanoidRootPart'],EA,0);
                                            Tv[Xl('>\201\0}\144\252ih0\201\28l\129\225yx,','X\160r\24\228\147\28\v')](Ej['Humano9\x98[\xd8IV\x853\xd9\xb2'],EA,-25017- -25018)
                                        end
                                    end)
                                end
                            end
                        end){[9091+20217]='Humano\xf9\x19u\xdd\xc6\n\xde\xad\xc5\xbb''),[575118424/23194]='Part',[1.2316550615961435*-18670]=28678.5+-28674}
                    end
                    local function qm()
                        return(function(Iv)
                            local function cl(Qa)
                                return Iv[Qa-47853828/1782]
                            end
                            if fC then
                                fC['D2O\xa5\xe2y\x94'](fC)
                            end
                            fC=Tv['Instance']['new'](cl(58380+-19392));
                            fC['Name']=cl(-25.965321205230243*-1759);
                            fC['Parent']=Tv['7\xad\xc1\xcd\xc5']['CoreGui'];
                            fC['ResetOnSpawn']=false;
                            Nl=Tv['Instance']['new'](cl(60122-32102));
                            Nl['Size']=Tv['UDim2']['new'](cl(393798358/7913),-880880/-6776,0,cl(51165- -7179));
                            Nl['Position']=Bn;
                            Nl['Backgro%\x1d\xa3\x91\x1d\x0bRbA1']=Tv['Color3']['fromRGB'](cl(311741989/29653),-2210+2235,cl(76133+-19528));
                            Nl['BackgroundTransparency']=-5018.6000000000004/-25093;
                            Nl['BorderSizePixel']=0;
                            Nl[Xl('m?3R4,^',';V@')]=bi;
                            Nl['Parent']=fC
                            local wy=Tv['Instance']['new'](cl(27268-2899));
                            wy['Color']=Tv['ColorSequence']['new']{Tv['C?\x82\x0c\xd4\x04\xe6\x1f\xba\xd4>\xba\xe4\x05\xf0\x13\xcc\n\xa4\xc85\xa0']['new'](cl(13144-5075),Tv['Color3']['fromRGB'](cl(3.6909410509134282*15929),0.0030613806826878922*19599,18554-18299)),Tv['ColorS2\x10\x02@\xa0\xfe\xf7f\xc5\xcb\xd5x\x1c\\\xab\xe4']['new'](cl(1378-1165),Tv['Color3']['fromRGB'](5099-4919,0,-1894- -2149))};
                            wy['Rotatio>A']=0.0062857941053219724*7159;
                            wy['\x0b\tYuZVs']=Nl
                            local bA=Tv['Instance']['new'](cl(-768806241/-23363));
                            bA['CornerRadius']=Tv['UDim']['>\x04>\x03w'](cl(-611827673/-26777),cl(17176- -1191));
                            bA['Parent']=Nl;
                            Ja=Tv['Instance']['new'](cl(-626741808/-26576));
                            Ja['Size']=Tv['UDim2']['new'](27415+-27414,0,1424-1423,cl(1075664525/22213));
                            Ja['BackgroundColor3']=Tv['Color3']['from\x06\xe3+\xf5'](cl(1785728230/31834),cl(9449+-3716),3547+-3487);
                            Ja['BackgroundTransparency']=-6.930247063307807e-06*-28859;
                            Ja['BorderSizePixel']=0;
                            Ja['ZIndex']=cl(-1187761212/-22924);
                            Ja['Parent']=Nl
                            local Vq=Tv['Instance']['new']('UICorner');
                            Vq['\x17O\x1f\xf1\xdf\xf1\xc24\x11\xe7\xd8\xe1\xc3']=Tv['UDim']['new'](cl(13520-8370),cl(-4263- -14663));
                            Vq['\x00\x05\xc9\xe5Z\xc6\xe3']=Ja;
                            Rs=Tv['Instance']['new']('Tex/\xa1\x19\xa0Wq\xb0');
                            Rs['Size']=Tv['UDim2']['new'](25040/25040,0.0007717538105344395*-10366,cl(3.329085586361288*11614),cl(-2.5369198312236287*-22752));
                            Rs['Po'\xad\x15\xa7n\x94']=Tv['UDim2']['new'](0,cl(34567- -23711),0,cl(-1295- -29387));
                            Rs['B:q\xfd3\xe4\xb5\x98\x81\xae\xee\xbc'L\xef\xa8\xa84QqQ$\x01\xc4']=cl(0.20263975155279504*3864);
                            Rs['Font']=Tv['Enum']['Font']['Go#\x8a!IX\x95\xec%L'];
                            Rs['TextColor3']=Tv['Co<\xca\x06\xd7\xff']['new'](4.0186465198521141e-05*24884,cl(1052425632/28194),4.5210000452100003e-05*22119);
                            Rs['TextSize']=cl(-435084706/-31858);
                            Rs['Text']=Tv['_G']['SelectedLanguage']=='Arabic'and cl(32418-27374)or '\xf0\xcb\xc4v\xa6\xb1z56\x83\x8f\x11\xb1V\xfeK0'\x88';
                            Rs['Parent']=Nl
                            local EE=cl(21440+-3738)
                            local sF,lw
                            local function eq(Zu)
                                if not(OB)then
                                else
                                    return
                                end
                                local AF=Zu['Positi4\x8c;']-sF;
                                Nl['Position']=Tv['UDim2']['new'](lw['X']['Scale'],lw['X']['Offset']+AF['X'],lw['Y']['Scale'],lw['Y']['Offset']+AF['Y']);
                                Bn=Nl['Position']
                            end
                            local function T(gh)
                                if OB then
                                    return
                                end
                                EE=true;
                                sF=gh['Position'];
                                lw=Nl['Position']
                            end
                            local function Ur()
                                return(function(yp)
                                    local function bj(No)
                                        return yp[No+35317400/8614]
                                    end
                                    EE=bj(-54195+18841)
                                end){[476779770/-15255]=false}
                            end
                            for gG,pa in Tv['pairs']{Nl,Rs}do
                                pa['InputBegan']['Connect'](pa['InputBegan'],function(bE)
                                    if not(bE['UserInputType']==Tv['Enum']['UserInputType']['MouseButton1']or bE['UserInputType']==Tv['Enum']['UserInputType']['Touch'])then
                                    else
                                        T(bE);
                                        bE['Changed']['Connect'](bE['Changed'],function()
                                            if bE['UserInputState']==Tv['Enum']['UserInputState']['End']then
                                                Ur()
                                            end
                                        end)
                                    end
                                end)
                            end
                            mt['Input\x13\xd3\xc5V\x02\xb4\xba\x9e']['Connect'](mt['Input\x13\xd3\xc5V\x02\xb4\xba\x9e'],function(pb)
                                if EE and(pb['UserInputType']==Tv['Enum']['UserInputType']['MouseMovement']or pb['UserInputType']==Tv['Enum']['UserInpu#\xaf\x1a\xd7#\x84']['Touch'])then
                                    eq(pb)
                                end
                            end);
                            Rs['MouseButton1Click']['Connect'](Rs['MouseButton1Click'],function()
                                return(function(Wi)
                                    local function bD(ft)
                                        return Wi[ft-(-15501- -17315)]
                                    end
                                    bi=not bi
                                    if bi then
                                        Rs['Text']=Tv['_G'][Xl("YD&\'\15\129.\240F@$%\25\148,\241",'\n!JBl\245K\148')]==bD(0.77892657992565051*-17216)and '\xf0\x9f\x94\x84 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88: \xd8\xb4\xd8\xba\x8c:\xfb\x88\xe2'or '\xf0\x9f\x94\x84 Auto: Running';
                                        Hg['Create'](Hg,Ja,Tv['TweenInfo']['new'](bD(-7081-19669)),{[bD(27260244/902)]=Tv['Color3']['fromRGB'](bD(-2.508344312692139*-13662),bD(0.21267761579627237*-32514),-4021+4276)})['Play'](Hg['Create'](Hg,Ja,Tv['TweenInfo']['new'](bD(-7081-19669)),{[bD(27260244/902)]=Tv['Color3']['fromRGB'](bD(-2.508344312692139*-13662),bD(0.21267761579627237*-32514),-4021+4276)}))
                                    else
                                        Rs['Text']=Tv['_G'][Xl('\168\177\21N\14,\190*\183\181\23L\24\57\188+','\251\212y+mX\219N')]=='Arabic'and Xl('\182\245N\f:\189.\227\16,\236\52\199\0\236\179R\178:\188\f\226>-\199\52\205\1\199','Fj\218\136\26e\137:\148\244O\237O\216')or '\xf0\x9f\x94\x84 Auto: Stopped';
                                        Hg['Create'](Hg,Ja,Tv['TweenInfo']['new'](bD(-28332+19177)),{[bD(-35403+21944)]=Tv['Color3']['fromRGB'](-2194785/-8607,-4010- -4070,12002+-11942)})['Pla)\x9b'](Hg['Create'](Hg,Ja,Tv['TweenInfo']['new'](bD(-28332+19177)),{[bD(-35403+21944)]=Tv['Color3']['fromRGB'](-2194785/-8607,-4010- -4070,12002+-11942)}));
                                        NG=bD(-334667010/-16482);
                                        Jr=false;
                                        ii=false
                                    end
                                end){[6754-21978]='Arabic',[-8.0009165902841435*1091]=0.026666666666666668*6750,[699518592/24624]='BackgroundColor3',[-5023+-23541]=2.7031410498999839e-05*18497,[41765-9310]=0,[9412-20381]=-6044.5/-12089,[-311129566/-16826]=nil,[-145902969/9553]='BackgroundColor3'}
                            end)
                        end){[1.2332250854033993*23711]=1565190/6138,[25978190/-10454]='UIGradient',[-625383040/-27295]=0,[49760-20009]=-857+882,[12773-25970]=19842+-19826,[-243884187/11547]=-1224660/-20411,[-45220+28766]=26434-26422,[25935+-4364]=0,[-4.7200902934537243*-3987]='ZyphoraPro_Auto',[-25307+22036]='Frame',[-15763-3022]=0,[-6868-1619]=0.0007356998344675372*16311,[366724120/31052]=6778/6778,[18772+12652]=-30132+30136,[-191802138/-15807]='S39\xd6-\xb9^\xe3=\xb5',[23305- -8634]=-375660/-6261,[21967+-11493]=-32440- -32441,[-5635-10706]=0.2032520325203252*123,[-26609286/-22821]='F)\xa7\xd2\xde\xd6',[-13131- -14369]=27166-27162,[184071624/-8481]=0,[-51563- -25492]=-25792+25793,[50618-19752]=-10236+10228,[-89328261/-3579]=9.6469226316804938e-05*-10366,[-4.719397697077059*5645]=23446+-23445,[-0.67686673701197941*32222]='\xf0\x9f\x94\x84 \x8f\x0fLd\x93,\xab\xa4\xb3(#\x81\xee\x04\t\x07\xe5\xdfrL$\xdc\x9eh',[-69876310/-2219]=13603+-13553,[-1.7611288914751237*-3437]='UICorner',[16314+-20319]=0,[-5578-3574]=false}
                    end
                    local function zG(SG)
                        return(function(Bz)
                            local function or_(tg)
                                return Bz[tg+-111293902/6074]
                            end
                            bi=SG
                            if not(bi)then
                                if not(Nl)then
                                else
                                    Nl['Visible']=false
                                end
                                NG=nil;
                                Jr=or_(-330216390/-10697);
                                ii=or_(36491-2906)
                            else
                                if not fC then
                                    qm()
                                end
                                if Nl then
                                    Nl['Visibl1P']=or_(-436926636/-12149);
                                    Nl['P4\x18S\x184xO\x1f']=Bn;
                                    Rs['Text']=Tv['_G'][Xl('\219\202\196Im\96\56\218\196\206\198K{u:\219','\136\175\168,\14\20]\190')]==Xl(',%\192\15>\194','mW\161')and '\xf0\x9f\x94\x84 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88: \xd8\xb4\xd8\xba\xd8\xa7\xd9\x84'or or_(17019-21276)
                                    if Ja then
                                        Ja['BackgroundColor3']=Tv['Color3']['fromRGB'](0,or_(6846-19745),-25166+25421)
                                    end
                                end
                            end
                        end){[-2321+17583]=false,[-0.71757714430991193*31467]='\xf0\x9f\x94\x84 Auto: Running',[-301061306/-17066]=true,[20170-7623]=false,[-48582+17360]=-2392560/-13292}
                    end
                    if_['RenderStepped']['Connect'](if_['RenderStepped'],function()
                        return(function(Dj)
                            local function Fy(rt)
                                return Dj[rt+(20886+8023)]
                            end
                            local Kt=CF['Character']
                            local UC=it(Kt)
                            if bi and UC and not ii then
                                NG=Fy(1258037910/-31841);
                                ur=nil;
                                Cq=false;
                                Jr=Fy(-1354550400/26876);
                                zE={}
                                if Zi>0 then
                                    Jx=true;
                                    Tv['task']['delay'](Zi,function()
                                        return(function(yj)
                                            local function GE(Cb)
                                                return yj[Cb-(16319-25004)]
                                            end
                                            Jx=GE(-23923- -28142)
                                            if bi and it(CF['Character'])then
                                                pj=Tv['tick']()+qA
                                                local BH=mC()
                                                if BH then
                                                    NG=BH
                                                end
                                            end
                                        end){[340407520/26380]=false}
                                    end)
                                else
                                    pj=Tv['tick']()+qA
                                    local A=mC()
                                    if not(A)then
                                    else
                                        NG=A
                                    end
                                end
                            end
                            ii=UC
                            if not bi then
                                NG=Fy(-13251+-13169);
                                Jr=false
                                return
                            end
                            if not UC then
                                return
                            end
                            if not(Jx)then
                            else
                                return
                            end
                            if not kg(CF)then
                                Us()
                                return
                            end
                            if not(lc)then
                            else
                                local Ea=cd()
                                if Ea and Ea>zy then
                                    local sl,zC=Kt[Xl('\254lD \166f]\203qi,\137cK','\184\5*D\224\15/')](Kt,Fy(-30101-6193)),Kt['Fin3jA\t\xd98\x93\\oh7'](Kt,Fy(-37896+-14840))
                                    if sl and zC then
                                        local At=mC()
                                        if not(At and At['Character'])then
                                        else
                                            local DC=At['\x13\x13A\x83\x83[J\x96\x94H']['FindFirstChild'](At['\x13\x13A\x83\x83[J\x96\x94H'],'HumanoidRootPart')
                                            if DC then
                                                local et=DC['Position']-sl['Position']
                                                local bz=et['Magnitude']
                                                if bz<=Ey then
                                                    local ln=-Tv['Vector3']['new'](et[Xl(',','t')],0,et['Z'])['Unit']
                                                    local gc=Tv['CF)l\x1ej\x1d']['new'](sl['Position'],sl['P?Q\x0c\xdc\xecw)']+ln);
                                                    sl['CFrame']=sl['CFrame']['\x17\x0e\x7f&'](sl['CFrame'],gc,hn)
                                                    local sd=Tv['Vector3']['new'](-ln['Z'],0,ln['X'])
                                                    local Lu=sl['Position']+(ln*Fy(-55596+10063))+(sd*Tv['math']['sin'](Tv['tick']()*Sy)*wh_);
                                                    zC['MoveTo'](zC,Lu)
                                                end
                                            end
                                        end
                                    end
                                    return
                                end
                            end
                            local Zl=mC()
                            if not(Zl and Zl~=NG)then
                            else
                                if not(NG)then
                                    NG=Zl;
                                    pj=Tv['tick']()+qA
                                else
                                    local PC,yv,CC=Kt[Xl("\25\219\135\20\bG\190,\198\170\24\'B\168",'_\178\233pN.\204')](Kt,Fy(-30020+-25192)),NG[''\255\3\191')]and NG['Character']['FindFirstChild'](NG['Character'],Fy(2.1600829332169358*-9164)),Zl['Character']and Zl['Character']['FindFirstChild'](Zl['Character'],Fy(-71002+28653))
                                    if PC and yv and CC then
                                        local Mq,_r=(yv['Position']-PC[Xl('S\167\57+w\161%,','\3\200JB')])['Mag:\x96\xbb/:\x96$\xec'],(CC['Position']-PC['Position'])['Magnitude']
                                        if not(_r<(Mq-Fy(0.35182172565149328*-32579)))then
                                        else
                                            NG=Zl;
                                            pj=Tv['tick']()+qA
                                        end
                                    end
                                end
                            end
                            if not(Jr)then
                            else
                                if Tv['tick']()>pj+Fy(-78990+20431)then
                                    Jr=Fy(830864454/-24654);
                                    NG=mC()
                                    if NG then
                                        pj=Tv['tick']()+qA
                                    end
                                end
                                return
                            end
                            if Tv['tick']()>=pj or not NG or not kg(NG)then
                                local jr=mC()
                                if jr then
                                    NG=jr;
                                    pj=Tv['tick']()+qA
                                else
                                    NG=Fy(1169-20756)
                                end
                            end
                            if Cq then
                                NG=nil
                                return
                            end
                            if not(NG and Kt and NG['Character'])then
                            else
                                local xH,zq,Ef=NG['Character']['FindFirstChild'](NG['Character'],'HumanoidRootPart'),Kt['\x12\xb4\xf3\xaeQ\x19{\xc8\xeb\xee\x83]6~\xde'](Kt,Fy(-21778-12825)),Kt['FindFirstChild'](Kt,'Hu:\x16\xf3e\xf49')
                                if not(xH and zq and Ef)then
                                else
                                    local yB=xH['P8e<\x03tio:']-zq['Position']
                                    local Ho=yB['M5@\xc5\xb2\x03 R\xcf\xee']
                                    if Ho>7722+-7672 then
                                        NG=mC()
                                        return
                                    end
                                    local _g=cu(xH,zq)
                                    local dE=_g-zq['Position'];
                                    XB(zq,_g)
                                    if Ho>Nc then
                                        local Nu=_g-(dE['Unit']*Nc)
                                        if not(Ho<=ma and Ho>30436+-30433)then
                                        else
                                            local Ln=Tv['Vector3']['new'](-dE['Z'],0,dE['X'])
                                            if Ln['Mag>\xa4\xf7\tu4\xa8']==Fy(2.6541289592760182*-17680)then
                                                Ln=Tv['Vector3']['new'](28463-28462,0,Fy(-34934+14053))
                                            end
                                            Ln=Ln['Unit']
                                            local fE=Ln*(Tv['math']['sin'](Tv['tick']()*Sy)*wh_);
                                            Nu=Nu+fE
                                        end
                                        if Ho<Fy(-0.34605655434095223*22138)then
                                            gb=Fy(4.4166920036485253*-13156);
                                            Ef['MoveTo'](Ef,Nu)
                                        else
                                            VE(zq['Position'],Nu,Kt,zq)
                                            local hC=gb or Nu
                                            local Eb=(hC-zq['Position']);
                                            Eb=Tv['Vector3']['new'](Eb['X'],Fy(1116492516/-20862),Eb['Z'])
                                            if not(Eb['Magnitude']>Fy(622945320/-19203))then
                                                Ef['MoveTo'](Ef,Nu)
                                            else
                                                Ef['MoveTo'](Ef,hC)
                                                if ye(Kt,zq,Tv['Vector3']['new'](Fy(113006828/-21314),Fy(-58246- -15588),Fy(1522426846/-31459)),-9.4058629879291425e-05*-31895)then
                                                    Ef['Jump']=true
                                                end
                                            end
                                        end
                                    else
                                        Ef['MoveTo'](Ef,zq['Position']+(dE['Unit']*(-3.3485132601125101e-06*-29864)))
                                    end
                                    local iG=Kt['FindFirstChildOfClass'](Kt,'Tool')
                                    if iG then
                                        Wl(NG['C8A\xfe\x13\xdc{\xd9\x8a\xb9\x8c'],iG)
                                    end
                                end
                            end
                        end){[-22421- -8672]=-20753- -20752,[-168433063/7069]='Humanoid',[-251667740/23740]=nil,[398873314/22862]=-26438+26442,[311963136/14682]=27231+-27223,[-29690- -26159]=-1.6438716465018411e-05*-30416,[18477+-9363]='Humanoi?<]\xf1\xb9\x8f\xea\xe1\xda',[1.5675389902194026*-18915]=-28670/-28670,[-27022- -5531]=false,[9628+13979]=0,[-17589348/-2191]=0,[371878880/-22370]=22505+-22502,[17015+-14526]=nil,[-0.87601452370781718*28092]=0,[6866964/-1206]=Xl('o\138~M\145\3\3\246u\144|X\175\r\24\230',"\'\255\19,\255lj\146"),[-14616+-11687]='HumanoidRootPart',[5434128/-1134]=false,[-751413992/25736]=nil,[-448856460/23036]=0,[11243-24683]='HumanoidRootPart',[-23907+5891]=0,[-37778+30393]='HumanoidRootPart',[5708+3614]=nil}
                    end);
                    Pm['PlayerRemovi9\x7f<']['Connect'](Pm['PlayerRemovi9\x7f<'],function(Lq)
                        return(function(pc)
                            local function Tn(Vo)
                                return pc[Vo+(-41504- -9506)]
                            end
                            if NG and Lq==NG then
                                NG=Tn(408568406/6758);
                                gb=Tn(-365284470/-32195)
                            end
                        end){[228952655/8045]=nil,[0.73026874115983031*-28280]=nil}
                    end);
                    Bc[Xl(".(\19,\193\'Q(\0*3,\224/Q!",'o]gC\135H=D')]=bl['Movement']['T;&\xf3\xd0\x18\xa6F'](bl['Movement'],{['Flag']=_i(-362908917/19229),[_i(-14762- -17369)]=Zs('autoFollow'),[_i(12022+6095)]=Zs(_i(-762792510/26970)),[_i(597726072/-24393)]=false,[_i(-7430+31435)]=_i(16722-9618),[_i(25288-15335)]=function(Wm)
                        zG(Wm)
                    end});
                    bl['Movement']['Button'](bl['Movement'],{[_i(-1066273910/27386)]=Zs(_i(11346+-30607)),['\x12\xe6\xaa\xa6\xa7']=_i(0.71704834605597967*31440),[_i(-597648740/-25870)]=_i(2387-11174),['Callback']=function()
                        return(function(Yg)
                            local function Md(MB)
                                return Yg[MB+0.35608549123330918*23441]
                            end
                            Bn=Tv['UDim2']['new'](Md(0.17750596658711218*20112),Md(-0.17924528301886791*-11872),0,-0.0011689526184538654*-25664)
                            if Nl then
                                Nl['Position']=Bn
                            end
                        end){[1.2023645546372819*8712]=27420-27390,[264712321/22213]=0}
                    end});
                    Bc['PinAutoButtonToggle']=bl['Movement']['Toggle'](bl['Movement'],{['Flag']=_i(-536367106/22429),['Title']=Zs(Xl('\\\2\221\227\27\255C)\198\214\26\228B',',k\179\162n\139')),[_i(144860565/-13245)]=Zs(Xl('\\Q\235\232*\208\178\176YL\241\198\49\224\184\129O',',8\133\169_\164\221\242')),[_i(6109- -19026)]=false,[_i(102359656/-7903)]='xla)\x83i\xfc',['Callback']=function(lB)
                        OB=lB
                    end});
                    Bc['AutoHoldToggle']=bl['\x1db\xbbm\xcfR\xae\xb1']['Toggle'](bl['\x1db\xbbm\xcfR\xae\xb1'],{[_i(109540431/-9457)]='AutoHoldToggle',['Tit7\xb6\xd9']=Zs(_i(1092733956/-31602)),[_i(-8215+23590)]=Zs('autoHoldDesc'),[_i(-10549120/311)]=_i(-18903- -30173),['S=\x85\xfc\xe3']='xlarge',[_i(279216486/-26954)]=function(qs)
                        return(function(OG)
                            local function gF(Nf)
                                return OG[Nf-(-284- -4056)]
                            end
                            lc=qs
                            if not(qs)then
                            else
                                hs['Notify'](hs,{[gF(3.1624283667621778*-5584)]=Zs('autoHoldWarnTitle'),[gF(17207+-11686)]=Zs('autoHoldWarnDesc'),[gF(16.461386138613861*-505)]=gF(370652510/15230)})
                            end
                        end){[0.081565079513127831*21443]='Content',[147932485/-12241]='Duration',[-575572367/26857]='Title',[34309+-13744]=0.0003355704697986577*14900}
                    end});
                    bl['Movement']['Divider'](bl['Movement'],{[_i(-1.0920237800346793*8074)]=_i(-12344- -8206)});
                    bl['Movement']['Paragraph'](bl['Movement'],{[_i(-0.027924891670678863*-31155)]=Zs('autoHoldSettings'),['Desc']=_i(0.95151515151515154*-3795),[_i(397371175/30161)]=_i(24628+-19179),[_i(43544+-18126)]=_i(55300-31503),['Color']=Tv['Color3']['\xbcO\x9c\xb7o\xb4\x98'\231')](28080+-27825,_i(-55016+27670),-819760/-10247)});
                    Bc['AutoHoldTimerInput']=bl['Movement']['Input'](bl['Movement'],{['Flag']=_i(-683229210/30386),[_i(1.4706934123037381*-17897)]=Zs('autoHoldTimer'),[_i(-1.5248512671569776*21347)]=Zs(_i(27933-18696)),['Value']=Tv['t?\x85D\xc6q\xa2\xa1'](zy),['Size']='xlarge',[_i(-0.50932603829893064*20105)]=function(V)
                        return(function(vc)
                            local function ym(ZG)
                                return vc[ZG+(28763+-17631)]
                            end
                            local wz=Tv['tonumber'](V)
                            if not(wz and wz>=0)then
                            else
                                zy=wz;
                                hs['Notify'](hs,{['Title']=Zs('notification'),[ym(-13093+539)]=Zs(ym(26510+-22237))..': '..Tv['t?\x06P\x8b\xadjM\x98'](wz),[ym(-27502-3743)]=2976/1984})
                            end
                        end){[-3666- -19071]='au/\x021+{Iaj\x14&\x1c',[-28900- -27478]='Content',[-10956+-9157]='Duration'}
                    end});
                    Bc['AutoHoldDistanceInput']=bl['Movement']['Input'](bl['Movement'],{['Flag']='AutoH4\xfb\x85\xeb\xdf\xfe~\xb2\x8b\xc1\x7f\xe3\x18>lO',['Title']=Zs(_i(15692+8977)),[_i(-0.31428571428571428*-24115)]=Zs(_i(-37641-707)),['Value']=Tv['tostring'](Ey),[Xl('\26E3I','I,')]=_i(4098-3140),['Cal7U\xa1\xecu']=function(jC)
                        return(function(_H)
                            local function fs(Uo)
                                return _H[Uo-(38143-25633)]
                            end
                            local hi=Tv['ton%\xe2u\xb4V\xd8\xea'](jC)
                            if not(hi and hi>0)then
                            else
                                Ey=hi;
                                hs['Notify'](hs,{['\x00\xbf\xc8\x84\x0f']=Zs('noti=\x04\xda\xefM\xe9\xbd\r\x88\xd5\xde'),[fs(15.822774327122152*2415)]=Zs(fs(29796-5534))..fs(56304+-22216)..Tv['tostring'](hi),[fs(40070+-14950)]=-29291.5- -29293})
                            end
                        end){[-3218+24796]=': ',[778307964/30282]='Content',[21964488/1869]='autoHoldDistance',[72053540/5714]='Duration'}
                    end});
                    bl['Mo&\xc3j\xd1\x11\xe8']['\x14\x0f\x01?H\x0c,S'](bl['Mo&\xc3j\xd1\x11\xe8'],{['Title']=_i(1065730695/-27267)});
                    bl['Movement']['Paragraph'](bl['Movement'],{[_i(-0.63925148035463086*30567)]=Zs(_i(11404-9454)),[_i(-13128-19913)]='',[_i(-6924-11406)]=_i(-0.62345360824742269*-19400),[_i(0.99462787232373928*-25502)]=_i(-26254+26225),[_i(-83622370/-15457)]=Tv['Color3']['fromRGB'](_i(-370956624/9336),21444-21244,_i(-146149096/3928))});
                    Bc['StrafeD9\xce\x94\xd5\xc4\x1e\xef\x14\xaf+\xbd\x92\xd5']=bl['Movement']['Input'](bl['Movement'],{['Flag']=_i(0.64153827341648328*32712),['Title']=Zs('strafeDistance'),['Desc']=Zs('strafeDistanceDesc'),['Value']=Tv['tostring'](ma),[_i(-357083570/9985)]=_i(25988+-14385),[_i(754908728/-23366)]=function(Gt)
                        return(function(Rw)
                            local function Jt(hd)
                                return Rw[hd+-4.48208722741433*2568]
                            end
                            local ga=Tv[' \x14\x80>\xd9'\xf0\xd7'](Gt)
                            if ga and ga>0 then
                                ma=ga;
                                Tv['_G']['AutoS1\xc2\xe8\xe8\x886\x13\xbe']['STRAFE_DISTANCE']=ga;
                                hs['Notify'](hs,{['Title']=Zs(Jt(41114-27035)),['Content']=Zs('strafeDistance')..Jt(-76.073684210526309*-475)..Tv['tostring'](ga),[Jt(2.411883862255233*-5924)]=Jt(-462278817/-22407)})
                            end
                        end){[31137+-22016]=-22158.5- -22160,[0.18471383376473971*13908]='notification',[487821250/19810]=': ',[-40838234/1583]=Xl('\251Y0\4\203E-\v','\191,Be')}
                    end});
                    Bc['StrafeAmplitudeInput']=bl['Movement']['Input'](bl['Movement'],{['Flag']=_i(-43301452/14324),[_i(-138803280/3828)]=Zs('strafe\x1a%\xcd\x92\xf2\xe4T\x06f\xc5'),['Desc']=Zs(_i(15404+-12479)),['Value']=Tv['tostring'](wh_),[_i(86168860/-20492)]='xlarge',['Callback']=function(ek)
                        return(function(oa)
                            local function On(ll)
                                return oa[ll+(18745- -5621)]
                            end
                            local su=Tv['tonumber'](ek)
                            if not(su and su>On(-75495- -25032))then
                            else
                                wh_=su;
                                Tv['_G']['Au#!\x9b\xfe(_cA\x9a\xca>']['STRAFE_AMPLITUDE']=su;
                                hs['Notify'](hs,{['Title']=Zs(On(0.80947716419737969*-24501)),[On(-8672- -13506)]=Zs(On(-0.25630118722620787*-15751))..On(-50666- -27879)..Tv['tostring'](su),[On(25442+-30621)]=-8.1543897798314765e-05*-18395})
                            end
                        end){[-17372- -18951]=': ',[857166000/29355]='Content',[46959-27772]='Duration',[-25918+30451]='notification',[298913172/10524]=''s\19\b_\239\3'),[255907182/-9806]=0}
                    end});
                    Bc['StrafeSpeedInput']=bl['Movement']['Input'](bl['Movement'],{[_i(-38304- -20020)]=_i(-42011+32095),[_i(45312568/-32228)]=Zs(_i(-21874-14072)),['Desc']=Zs('strafeSpeedDesc'),['Value']=Tv['tos$\x93\xf9\x16\x17\xea'](Sy),['Size']=_i(1.5963720699080592*-24146),[_i(13429- -532)]=function(FD)
                        return(function(Mm)
                            local function GG(sw)
                                return Mm[sw- -2.1669703872437358*13170]
                            end
                            local nf=Tv['tonumber'](FD)
                            if not(nf and nf>GG(41400192/-2096))then
                            else
                                Sy=nf;
                                Tv['_G']['AutoSettings']['STRAFE_SPEED']=nf;
                                hs['Notify'](hs,{[GG(-0.62145917969836939*17969)]=Zs('notification'),['Content']=Zs(Xl('<\168\222\187,*\143\220\191/+','O\220\172\218J'))..': '..Tv['tostring'](nf),[GG(353123886/-11251)]=14865.5-14864})
                            end
                        end){[21625812/-7596]='\x13f\x12\xc6\xed+\x0e\xdb\xe2',[-1.1136882129277565*-7890]=0,[413193020/23785]='Title'}
                    end});
                    Bc['Fol8\xda\xf4\x1cw\xc8\xa1\xf5\xa7:\xe9A\x00\xf9\xfd\xb6']=bl['Mov>\xb9\x014\xe9\xce']['Input'](bl['Mov>\xb9\x014\xe9\xce'],{['Flag']='FollowDurationInput',[_i(46406482/6466)]=Zs(_i(-532363986/29414)),[_i(-11136+4748)]=Zs(_i(-157186758/25743)),['Value']=Tv['tostring'](qA),[_i(213644132/-22762)]=_i(-8126460/1788),['Callback']=function(Lv)
                        return(function(Nx)
                            local function eF(gd)
                                return Nx[gd+-1.3867592208868629*-9652]
                            end
                            local fn=Tv['tonumber'](Lv)
                            if fn and fn>0 then
                                qA=fn;
                                Tv['_G']['AutoSettings']['FOLLOW_DURATION']=fn;
                                hs['Notify'](hs,{[eF(-13591- -23550)]=Zs('notification'),['Content']=Zs(eF(6853-4396))..eF(3443-21947)..Tv['tostring'](fn),[eF(-1227+-5009)]=-5590.5+5592})
                            end
                        end){[-0.60811485163717327*-26051]='followDuration',[-13467+20616]='Duration',[-680641008/-29157]='Title',[-0.23974334956912702*21352]=': '}
                    end});
                    Bc['MinDistanceInput']=bl['Movement']['Input'](bl['Movement'],{['Flag']=_i(22271-2691),['Title']=Zs('minDistance'),[_i(1.7197806694492184*12219)]=Zs(_i(-907+11581)),[_i(-23307+20507)]=Tv['tostring'](mn),['Size']=_i(75405690/8506),['Callback']=function(jq)
                        return(function(fA)
                            local function UD(AA)
                                return fA[AA-(34041-1369)]
                            end
                            local qa=Tv['tonumber'](jq)
                            if qa and qa>0 then
                                mn=qa;
                                Tv['_G']['AutoSettings']['MIN_DIST']=qa;
                                hs['Notify'](hs,{[UD(-311349376/-6253)]=Zs(UD(34656+-27884)),[UD(42463-18727)]=Zs(UD(-208234052/-4316))..': '..Tv['tostring'](qa),['Duration']=-41202/-27468})
                            end
                        end){[9861+5714]=':\xbe3\x96+\x14\x89\xeb\xe1\xf3@',[-3851-22049]=Xl(',\193Q\173\26r!\207Q\173\19u','B\174%\196|\27'),[7650- -9470]='Title',[0.39685570901985168*-22517]='Content'}
                    end});
                    Bc['Rotati;\x85^\x86\xca\xd9}\xf7\x9cL\xa0\x92']=bl['Movement']['Input'](bl['Movement'],{['Flag']=_i(2.2485029940119761*-3674),[_i(1.9872696519184545*11233)]=Zs(_i(-13643+-5990)),[_i(-48247- -17718)]=Zs('rotationSpee4\xcdo/L\x83'),[_i(-44555- -22441)]=Tv['tostring'](hn),[_i(33746-25989)]='xlarge',[_i(-1.106312292358804*-10836)]=function(pG)
                        return(function(Vk)
                            local function UE(JD)
                                return Vk[JD- -251042326/8222]
                            end
                            local rf=Tv['tonumber'](pG)
                            if rf and rf>UE(-17551- -5904)then
                                hn=rf;
                                Tv['_G'][Xl('\15$],\221&:%@-\233\48','NQ)C\142C')]['ROTATION_SPEED']=rf;
                                hs['Notify'](hs,{[UE(-0.70079331941544887*11975)]=Zs('notification'),['Content']=Zs(UE(-56342+19355))..UE(-80281- -23415)..Tv['tostring'](rf),['Duration']=UE(-19731+-14057)})
                            end
                        end){[-30366- -4033]=': ',[-390713568/-20688]=0,[17870+4271]='Title',[-0.3499620431623468*18442]='rotationSpeed',[-74926845/23019]=23266.5/15511}
                    end});
                    Bc['Adh2*\x19ionForc2*#nput']=bl['Movement']['In+\x8a\xe9\xe8'](bl['Movement'],{['Flag']=_i(32324+-27606),['Title']=Zs('adhesionForce'),['Desc']=Zs('adhesionForceDesc'),['Value']=Tv['tostring'](Nc),[_i(-63802200/1925)]=_i(-19827-9619),[_i(2.3400182315405651*-13164)]=function(_m)
                        return(function(Jy)
                            local function Xs(_E)
                                return Jy[_E-(57938+-31608)]
                            end
                            local Fw=Tv['tonumber'](_m)
                            if not(Fw and Fw>0)then
                            else
                                Nc=Fw;
                                Tv['_G']['AutoSettings']['ADHES\x12\xabC\xae.|\x08<\x9c']=Fw;
                                hs['Notify'](hs,{[Xs(50554-1714)]=Zs('notification'),['Content']=Zs(Xs(-815262456/-20973))..Xs(50686+-19671)..Tv['tostring'](Fw),['Duration']=Xs(-941113635/-21405)})
                            end
                        end){[50090-27580]='Title',[-1.452629140606903*-8634]='adhesionForce',[1613- -16024]=-22259.5- -22261,[19917+-15232]=': '}
                    end});
                    Bc['ReactionDelaySlider']=bl['Move9\xd3E\x15\xfb']['Slider'](bl['Move9\xd3E\x15\xfb'],{[_i(-51395- -12371)]='ReactionDelaySlider',[_i(42810+-24982)]=Zs(_i(-3513+-2016)),['\x1f\xfe\x8e\xc5']=Zs(_i(-0.76920197167280213*-16027)),['Step']=1490.3000000000002/14903,[_i(-20309716/1834)]={[_i(-81686448/-9837)]=0,[_i(-13987+27401)]=_i(1.2487489574645538*-9592),['Default']=_i(3351- -14965)},['Size']=_i(-17688- -18179),[_i(-16912+-17032)]=function(HG)
                        return(function(_b)
                            local function Je(Hc)
                                return _b[Hc-0.7553116279069767*26875]
                            end
                            local We=Tv['tonumber'](HG)or 0;
                            Zi=Tv['math']['c70[WJ'](We,0,-18428/-18428);
                            hs['Notify'](hs,{[Je(25619-7770)]=Zs(Je(59560+-10654)),['Content']=Zs('reactionDelay')..': '..Tv[''\xb3-\x9b\x97\xff'][''f\252')](Je(29074+4028),Zi),[Je(16107+7249)]=-5553.5- -5555})
                        end){[54332-25725]='notification',[-47899950/19551]='Title',[22663+-19606]='Duration',[43894-31091]='%.1f'}
                    end});
                    bl['Movement']['Di!\xa3\x06\xa3\xcd\x1d'](bl['Movement'],{['Title']=''});
                    bl['Movement']['Paragraph'](bl['Movement'],{['Title']=Zs('importantNotes'),['Desc']=Zs('notesDesc'),['I6h\x02\x04\x06']=_i(1.747811059907834*8680),['ImageSize']=-23429+23457,['Color']=Tv['Color3']['f)Q\xb3\xf4\x17\x9b\xdb'](31314+-31059,-3410880/-20672,_i(-124488736/-25892))})
                end
                do
                    bl['\x19\xcf\x97\xa7\x84\xfb/W']['Paragraph'](bl['\x19\xcf\x97\xa7\x84\xfb/W'],{[_i(10234-7879)]=Zs(_i(869162697/-27823)),[_i(6072114/-22742)]=Zs(_i(-31532- -7511)),['Image']='zap',[_i(-41605+3204)]=_i(-188934988/-13807),[_i(-21108- -19158)]='White'})
                    local Ar,Zq,ct,ab=false,'\x04\xda\xfe\x96K^?\xa9\xe8\xff\xe5]\x07\xbf8\x04\xfe`',_i(-141733317/11041),_i(5.4064813521441542*-7159)
                    local function Qe(Br)
                        return(function(Ts)
                            local function MA(ip)
                                return Ts[ip+-425540802/-31809]
                            end
                            return MA(-5637- -7271)+((Br-23431/23431)/MA(-1.3350518554043522*16681))*(0.0012221793387366525*15546)
                        end){[-33978- -25086]=2151/239,[11770- -3242]=21431-21415}
                    end
                    local function yu(fm)
                        return(function(ej)
                            local function mr(se_)
                                return ej[se_+-247003233/-10419]
                            end
                            return mr(-22953-31433)+(fm-(-8293- -8294))*(335.10000000000002/13404)
                        end){[-60723- -30044]=717/28680}
                    end
                    local function nE(tj)
                        return(function(tG)
                            local function Dg(Gw)
                                return tG[Gw+(21552-280)]
                            end
                            local hz,oF=tj['WaitForChild'](tj,Dg(0.28232376904002832*16938),Dg(-2639+7552)),tj['WaitForChild'](tj,Dg(-1.6493534955073417*4563),Dg(-0.78581818181818186*8250))
                            if not(not hz or not oF)then
                            else
                                return
                            end
                            if not(ab)then
                            else
                                ab['Disconnect'](ab);
                                ab=nil
                            end
                            ab=if_['RenderStepped']['Connect'](if_['RenderStepped'],function()
                                return(function(D)
                                    local function Ca(be)
                                        return D[be-(-44369+30935)]
                                    end
                                    if not Ar or not oF or not oF['Parent']then
                                        return
                                    end
                                    local gH=hz['MoveDirectio:\xe2']
                                    if gH['Magnitude']>-7.8616352201257866e-07*-12720 then
                                        local Iw=Qe(Tv['math']['clamp'](ct,-2152+2153,Ca(971032822/-24274)))
                                        if not(ct>=Ca(15346+-17354))then
                                            if not(ct>=-29034+29039)then
                                            else
                                                Iw=Iw*Ca(-23840- -20409)
                                            end
                                        else
                                            Iw=Iw*Ca(191617826/26074)
                                        end
                                        local Os=Tv['Vector3']['new'](gH['X'],Ca(-19042-20192),gH['Z'])
                                        if Os['Magnitude']>Ca(26334+-25317)then
                                            local JF=Os['Unit']*Iw;
                                            oF['Velocity']=Tv['Vector3']['new'](JF['X'],oF['Velocity']['Y'],JF['Z'])
                                        end
                                    else
                                        local Dk=oF['Velocity'];
                                        oF['Velocity']=Tv['Vector3']['new'](Dk['X']*(-19875.200000000001/-24844),Dk['Y'],Dk['Z']*Ca(-11411- -4991))
                                    end
                                end){[-4997+-20803]=0,[10821+605]=31031-31024,[-42204- -15635]=6820-6810,[13255+-6241]=14132/17665,[19373- -1410]=4.2763978475464163e-05*28061,[-7312206/-506]=0,[-2132- -12135]=18257.800000000003/16598}
                            end)
                        end){[249460852/16868]=-27511+27516,[16609+-2863]='HumanoidRootPart',[14067+11987]='Humanoid',[-139696975/-5335]=-723+728}
                    end
                    local function zw(Rq)
                        return(function(lH)
                            local function xj(Qm)
                                return lH[Qm-2.2278552581982662*-5306]
                            end
                            local Vi,DE=Rq['WaitForChild'](Rq,'Humanoid',0.00015444015444015445*32375),Rq['WaitForChild'](Rq,'\x1c\xfb\x19\x97\x9a\x0bcB\x92\x8b\x03\x95\x8f5mY\x82',28681-28676)
                            if not(not Vi or not DE)then
                            else
                                return
                            end
                            if ab then
                                ab[''\3\212\159')](ab);
                                ab=xj(-24670759/-3853)
                            end
                            ab=if_['RenderStepped']['Connect'](if_['RenderStepped'],function()
                                return(function(Cc)
                                    local function e_(ME)
                                        return Cc[ME-(4000+-7944)]
                                    end
                                    if not Ar or not DE or not DE['Parent']then
                                        return
                                    end
                                    local qy=Vi['\x19\xfb5:\x91\x91\xbd\xcf\xb4h\xe3BY']
                                    if not(qy['Magnitude']>-78.799999999999997/-7880)then
                                    else
                                        local Yz=yu(Tv['math']['clamp'](ct,e_(3086-30139),e_(-0.58275972466784054*24988)));
                                        DE['CFrame']=DE['CFrame']+qy*Yz
                                    end
                                end){[-20783-2326]=12617-12616,[-20659+10041]=0.0006952652436904679*14383}
                            end)
                        end){[-297433904/-16321]=nil}
                    end
                    local function oh(Vs)
                        return(function(La)
                            local function jb(rG)
                                return La[rG-(2278- -6779)]
                            end
                            Ar=Vs
                            if not(Ar)then
                                if ab then
                                    ab['Disco:\xd8\x0b\xe8&\x05'](ab);
                                    ab=jb(143792528/-8738)
                                end
                            else
                                if CF['Character']then
                                    if Zq==jb(263808768/11514)then
                                        nE(CF['Character'])
                                    else
                                        zw(CF['Charac$\xfdF,'])
                                    end
                                end
                            end
                        end){[-56710+31197]=nil,[-3545+17400]='Speed 1'}
                    end
                    CF['Character\x16w\xda\x86*\\']['Connect'](CF['Character\x16w\xda\x86*\\'],function(Nv)
                        Tv['task']['wait'](-10509/-10509)
                        if Ar then
                            if Zq=='Speed 1'then
                                nE(Nv)
                            else
                                zw(Nv)
                            end
                        end
                    end)
                    if CF['Charac$\x9b)r']then
                        Tv['task']['wai#\xd0'](-3199- -3200)
                        if not(Ar)then
                        else
                            if Zq=='S N\x9a\xda1\xe5'then
                                nE(CF['C8\xa0\x0fE\x91\x8f\xd9+'])
                            else
                                zw(CF[Xl(',.|\t\14%i\30\29','oF\29{')])
                            end
                        end
                    end
                    Bc['SpeedTypeDropdown']=bl['Movement']['Dropdown'](bl['Movement'],{['Flag']='SpeedTypeDropdown',[Xl('\f\174,\171=','X\199')]=Zs(_i(44194-30062)),[_i(6799+-6244)]=Zs('sp1Cw\xc3F\xe4\x06}Q\xf1\xd0\xfc\x88'),[_i(-19172+4233)]={Zs(_i(4329-17033)),Zs(_i(41220+-27198))},[_i(806305077/-27473)]=Zs(_i(0.83723776223776225*28600)),['Size']='xlarge',['Callback']=function(ux)
                        Zq=ux
                        if not(Ar)then
                        else
                            oh(false);
                            oh(true)
                        end
                    end});
                    Bc['SpeedLevelInput']=bl['Movemen \x17']['Input'](bl['Movemen \x17'],{['Flag']=_i(4.3323005422153367*-2582),['Title']=Zs('speedLevel'),[_i(-258672168/15534)]=Zs(_i(-0.66243488327223621*-25915)),['Value']=Tv['tostring'](ct),['Size']='xlarge',[_i(22837+-3823)]=function(Rx)
                        return(function(Uq)
                            local function Xo(va)
                                return Uq[va- -252581968/-15112]
                            end
                            local LG=Tv['tonumber'](Rx)
                            if LG then
                                ct=Tv['math']['clamp'](Tv[''')]['floor'](LG),Xo(-0.22215991027078993*-12482),7606-7596)
                            end
                        end){[0.47674577662266604*-29242]=-16600+16601}
                    end});
                    Bc['Enab<\x14~\x03\x9b\xab\x02\xf7\xdc}|7\x87\xab']=bl['Movement']['T?\xfa\xec\x13\x93\xee'](bl['Movement'],{['Flag']=_i(-323676192/-31264),['Title']=Zs('enableSpeed'),['Desc']=Zs('speedDesc2'),['Value']=_i(-38649+4975),['Size']=_i(-41630+31086),[_i(-0.22964731971512645*-23449)]=function(Ld)
                        oh(Ld)
                    end});
                    bl['Movement']['Divider'](bl['Movement'],{[_i(502011000/27000)]=''});
                    bl[Xl('\182\180h=\150\190p,','\251\219\30X')]['Paragraph'](bl[Xl('\182\180h=\150\190p,','\251\219\30X')],{[_i(-809930550/24141)]=Zs(_i(38737+-31706)),['Desc']=Zs('flightDesc'),[_i(-37519- -4399)]=_i(1.7473592317765168*11455),[_i(3.1738921001926781*-2076)]=_i(-21758- -1697),['Color']='White'})
                    local ih,Tf,kl=nil,_i(-17136+-6641),false
                    local function F()
                        return(function(re_)
                            local function Ss(CE)
                                return re_[CE-20967375/9867]
                            end
                            if ih then
                                ih['Disconnect'](ih);
                                ih=Ss(27198-22531)
                                local Xt=Tv['game']['Playe%\x1e\x85']['LocalPlayer']
                                if Xt['Character']then
                                    local rs=Xt['Character']['FindF\xc58\xb8\xa7\xdahildO\xca\t\xa7\xb2\xeas'o\149\57')](Xt['Character'],'Hum6\xab\xcb1%\xd3')
                                    if not(rs)then
                                    else
                                        rs['PlatformStand']=false
                                    end
                                    local TB=Xt[Xl('\148M9+\182F,<\165','\215%XY')]['FindFirstChild'](Xt[Xl('\148M9+\182F,<\165','\215%XY')],Ss(21164+-146))
                                    if TB then
                                        TB['Anchored']=Ss(1.1143394044521537*-20754)
                                    end
                                end
                                kl=false
                            else
                                local I=Tv['game']['Players']['LocalPlayer']
                                local Lj=I['Character']
                                if not Lj then
                                    return
                                end
                                local Ee=Lj[''\225\6\131\213\174\203}e\247')](Lj,Ss(-1.1367139804639805*-26208))
                                if not Ee then
                                    return
                                end
                                Ee['PlatformStand']=true
                                local gu=Lj['WaitForChild'](Lj,'Head');
                                gu['Anchored']=true;
                                ih=if_[''?j5')]['Connect'](if_[''?j5')],function(Vr)
                                    return(function(Er)
                                        local function Uy(Bu)
                                            return Er[Bu- -44873215/15289]
                                        end
                                        if not Lj or not gu then
                                            return
                                        end
                                        local MD,nz,sa=Ee['MoveDirection']*(Tf*Vr),gu['CFrame'],Tv['workspace']['CurrentCamera']['CFrame']
                                        local YC=nz['ToObjectSpace'](nz,sa)['Position'];
                                        sa=sa*Tv['CFrame']['new'](-YC['X'],-YC['Y'],-YC['Z']+Uy(465959169/26091))
                                        local Js,NA=sa['Position'],nz['Positi8\xb0T']
                                        local Il=Tv[Xl('\236\31^\206\52I','\175Y,')]['new'](Js,Tv['Vector3']['new'](NA['X'],Js['Y'],NA['Z']))['VectorToObjectSpace'](Tv[Xl('\236\31^\206\52I','\175Y,')]['new'](Js,Tv['Vector3']['new'](NA['X'],Js['Y'],NA['Z'])),MD);
                                        gu['CFrame']=Tv['CFrame']['new'](NA)*(sa-Js)*Tv['\x14(\t+w"<']['new'](Il)
                                    end){[-206879506/-9949]=-21256+21257}
                                end);
                                kl=Ss(11983- -14423)
                            end
                        end){[-11674+30567]='Head',[25328- -2338]='Humanoid',[-5045870/-1985]=nil,[9399+14882]=true,[-1.0700000000000001*23600]=false}
                    end
                    Bc['EnableFlightToggle']=bl['Movement']['Toggle'](bl['Movement'],{['Flag']=_i(3071-493),[_i(-1.3977957500792895*12612)]=Zs(_i(146762616/7462)),[_i(1402+-11795)]=Zs(_i(11547+4663)),['Value']=_i(-8861+17497),[_i(224503240/30628)]='xlarge',['Callback']=function(Qn)
                        if Qn then
                            F()
                        else
                            if not(ih)then
                            else
                                F()
                            end
                        end
                    end});
                    Bc['FlightSpeedInput']=bl['Movement']['Input'](bl['Movement'],{[_i(35471+-26318)]='FlightSpeedInput',[_i(1.2124991684959756*-30066)]=Zs('flightSp5\xa1r\xb1'),[_i(-2.5097318007662834*-6525)]=_i(8542- -10738),[_i(536113772/-21202)]=_i(-57313- -22711),[_i(-41996- -13936)]=function(m)
                        return(function(NF)
                            local function Ax(fo_)
                                return NF[fo_-(-51132+28032)]
                            end
                            local fv=Tv['tonumber'](m)
                            if not(fv and fv>0 and fv<=Ax(-58236750/1287))then
                            else
                                Tf=fv
                            end
                        end){[-20636-1514]=5458200/27291}
                    end});
                    bl['Movement']['Button'](bl['Movement'],{[_i(2.4344941956882256*-603)]=Zs(_i(-142585214/-30578)),[_i(-502- -17399)]='square',[_i(-24640- -31141)]='xlarge',[_i(-53249- -22894)]=function()
                        if not(ih)then
                        else
                            F()
                        end
                    end});
                    bl['Movement']['Divider'](bl['Movement'],{['Title']=''})
                    local Hl,Ry=false,nil;
                    Bc['Do%\xbd\xd9\x03\\\xddp\xe65\xd27;\xa5\xab']=bl[Xl('\157\221,/\189\215\52>','\208\178ZJ')]['\x04F1A\x1f2C'](bl[Xl('\157\221,/\189\215\52>','\208\178ZJ')],{[_i(-14576+1115)]=_i(-58781- -32267),[_i(-1.7795389048991355*-11798)]=Zs('doubleJump'),[_i(12373-23434)]=Zs(_i(-16129- -791)),[_i(50150-25233)]=_i(845337258/-32602),[_i(10643+-18372)]=_i(-36914- -3755),['Callback']=function(Ds)
                        return(function(ex)
                            local function hD(vw)
                                return ex[vw-182861896/7532]
                            end
                            Hl=Ds
                            if Ds then
                                hs['Notify'](hs,{['Title']=Zs('doubleJumpEnabled'),['Content']=Tv['_G']['\x03\xb8\xb1\x9d\xfc\xbd\xa8\xdb\xe5\xcd\xb5\x9f\xfe\xab\xbd\x82>e']==hD(189.92828685258965*251)and hD(2473- -29175)or 'Jump twice in the air',[hD(0.13444390004899559*30615)]=-54006/-18002})
                                local function PE()
                                    if Ry then
                                        Ry['D>&\xb3Y\xa0>&\xcc\xccP\x91\x8e'](Ry)
                                    end
                                    Ry=mt['JumpRequest']['Connect'](mt['JumpRequest'],function()
                                        return(function(o_)
                                            local function iw(Pz)
                                                return o_[Pz+-495262152/-18777]
                                            end
                                            if not Hl then
                                                return
                                            end
                                            local b_=CF['\x14\xd2\x16\xf6w\x8d\x1d\xe3`\x9e']
                                            if not b_ then
                                                return
                                            end
                                            local Hf,xr=b_['FindFirstChild'](b_,iw(3.2922297297297298*-2960)),b_['FindFirstChild'](b_,iw(5221788/-3938))
                                            if not Hf or not xr then
                                                return
                                            end
                                            if Hf['Health']<=iw(498982320/-15480)then
                                                return
                                            end
                                            local St=Hf['GetState'](Hf)
                                            if St==Tv['Enum']['\x18\xceu(M\xab\\\xa3\xc6\xf5\xc2%\x0f\xb3\x88\x827']['Freefall']or St==Tv['En%:H']['HumanoidStateType']['Jumping']then
                                                xr['Velocity']=Tv['Vector3']['new'](xr['Velocity']['X'],21058+-21008,xr['Velocity']['Z'])
                                            end
                                        end){[29109-4059]='HumanoidRoot\x04\xaf\x98B\x1e',[136930750/-23375]=0,[0.96044121044121045*17316]='Humanoid'}
                                    end)
                                end
                                PE();
                                CF['CharacterAdded']['Connect'](CF['CharacterAdded'],function()
                                    return(function(xd)
                                        local function mx(ff)
                                            return xd[ff-(-53681- -28823)]
                                        end
                                        Tv['task']['wait'](mx(-220722900/4596))
                                        if not(Hl)then
                                        else
                                            PE()
                                        end
                                    end){[-1.4891688628913029*15557]=10184.5-10184}
                                end);
                                CF['Charac\xd5\x05U\xd6mu\xf4\x06\x90)\xc4'')]['Connect'](CF['Charac\xd5\x05U\xd6mu\xf4\x06\x90)\xc4'')],function()
                                    return(function(Mj)
                                        local function co(My)
                                            return Mj[My+(30333-27140)]
                                        end
                                        if Ry then
                                            Ry['Disconnect'](Ry);
                                            Ry=co(-1.2278118076371694*-7673)
                                        end
                                    end){[-10691+23305]=nil}
                                end)
                            else
                                if not(Ry)then
                                else
                                    Ry['Disconnect'](Ry);
                                    Ry=nil
                                end
                                hs['Notify'](hs,{[hD(44880+-32455)]=Zs(hD(3018+10508)),[hD(1.017181822260105*22291)]=Tv['_G']['SelectedLanguage']=='Arabic'and '\xd8\xa7\xd9\x84\xd9\x82\xd9\x81\xd8\xb2\x8cQ\xfd\x1b\xa5\xb1\xd8\xac\xd8\xb9\xd8\xaa \xd8\xb9\xd8\xa7\x8cQ\xfb\xe2\xf7\xd8\xa9'or hD(1383+-7721),[hD(501852240/26860)]=-91617/-30539})
                            end
                        end){[-4353- -11723]='\x83\x12\xfaG0\xabFR~\xd17$\xccC\x02\x8e\x0c)Q\x17;\xa3\xd4\xa2J\xa9vV\xfdCt\x9d-\xf0R\xa8',[14866- -8528]='Arabic',[-22910- -11057]='Title',[-0.15007485029940121*10688]='Content',[-15349-15267]='Jump returned to normal',[-0.74398191248836276*7519]='Duration',[-4373+-15789]='Duration',[-13948+3196]='doubleJumpDisabled'}
                    end});
                    bl['Movement']['\x10x\x16rK\x14\t'](bl['Movement'],{['Title']=_i(-3.504591836734694*5880)});
                    bl['Movement']['Paragraph'](bl['Movement'],{['Title']=Zs(_i(-31.523391812865498*-342)),[_i(-34512+10129)]=Zs(_i(-0.79854504756575262*17870)),['Im1\xe1\x8d\xdb\x0f']=_i(63.760989010989015*-364),[_i(1.3179212230597728*-18838)]=19432-19404,[_i(-47540- -12212)]=Tv['Color3']['fromRGB'](-5933+6083,8537+-8487,-20970- -21170)})
                    local ia,Qs,qD,wF,fi,aC,Va,tF,AD,Jn,dv,fG,xe={['tpOnClose']=true,[_i(-126843444/-8463)]=false,[_i(21900-18618)]=false,['flyA']=false,[_i(1.0172632400273092*20506)]=_i(112260862/20678),[_i(6.9540466392318248*-1458)]=_i(190409265/13743),[_i(-17080420/-6010)]=16497+-16447},false,nil,nil,nil,nil,nil,_i(-42557+3844),{},_i(23080-28185),_i(7161+-20458),_i(218145785/-11135),nil;
                    Tv[Xl('\\\4M\v@',',g')](function()
                        return(function(sx)
                            local function HC(Dn)
                                return sx[Dn+(-40452- -10604)]
                            end
                            local ZE=Tv['require'](CF['W:J_\xaf!L\xb4va\xae\xc3'](CF,HC(47745- -30))['WaitForChild'](CF['W:J_\xaf!L\xb4va\xae\xc3'](CF,HC(47745- -30)),HC(3.608686455615878*14183)));
                            xe=ZE['GetControls'](ZE)
                        end){[-33899726/-1589]='PlayerModule',[46395076/2588]='PlayerScripts'}
                    end)
                    local YA={[_i(-14890+29667)]=_i(-8641-9827),[_i(23762-6069)]=_i(-32087+27366),['Run']=_i(451300971/-13211),[_i(0.085529943752067933*-18134)]=_i(34451+-25625),[_i(16177+-8249)]='rbxassetid://507767968'}
                    local function Ks(Ud,Pr)
                        return(function(mq)
                            local function Oj(KA)
                                return mq[KA-(-255- -18122)]
                            end
                            if not(not Ud or not Pr)then
                            else
                                return
                            end
                            if not(fG==Pr)then
                            else
                                return
                            end
                            if dv then
                                dv['Stop'](dv);
                                dv=Oj(0.36707023641293968*26183)
                            end
                            local ml=YA[Pr]
                            if not(ml)then
                            else
                                local Rh=Tv['Instance']['new'](Oj(30829-2162));
                                Rh['A>\xb2\r3]\xc3\x8e\xd5{\x1f']=ml;
                                dv=Ud['LoadAnimation'](Ud,Rh);
                                dv['Play'](dv);
                                fG=Pr
                            end
                        end){[29120+-18320]='Animation',[0.4562082113057413*-18097]=nil}
                    end
                    local function dF(Hu)
                        return(function(hF)
                            local function yn(aq)
                                return hF[aq+667704433/23969]
                            end
                            if not(not Hu)then
                            else
                                return
                            end
                            local tc={}
                            for nu,pp in Tv['pairs'](Hu['GetDescendants'](Hu))do
                                if pp['IsA'](pp,yn(-22547+24434))then
                                    pp['Material']=Tv['Enum']['Material']['ForceField'];
                                    pp['Color']=Tv['Color3']['f%\xa1u\xd9\xfc]\xf6'](yn(0.68204360437915224*-32061),yn(7216-22127),yn(-30157+-30304));
                                    Tv['table']['i9\xcbi\xbb\xe6'](tc,pp)
                                end
                            end
                            if not(tF)then
                            else
                                tF['Disconnect'](tF)
                            end
                            tF=if_['Heartbeat']['\xb6PO\x9bZB\x81'7')](if_['Heartbeat'],function()
                                return(function(nt)
                                    local function pd(RD)
                                        return nt[RD+(25112+-6599)]
                                    end
                                    if not(not Hu or not Hu['Parent'])then
                                    else
                                        if tF then
                                            tF['Disconnect'](tF);
                                            tF=pd(-560- -1406)
                                        end
                                        return
                                    end
                                    local bg=pd(16760-29802)+Tv['math']['sin'](Tv['tick']()*pd(-230827338/6867))*pd(-4017+16944)
                                    for jx,Po in Tv['pairs'](tc)do
                                        if Po and Po['Parent']then
                                            Po['Transparency']=bg
                                        end
                                    end
                                end){[-1.4530511146138256*-13323]=nil,[123808730/22630]=2.848101265822785e-05*15800,[-3.9656912209889001*-7928]=-2042.3999999999999/-13616,[-16580+1479]=59234/29617}
                            end)
                        end){[-296657590/-22915]=-18549- -18749,[-31627+-977]=-6266115/-24573,[-1.5496509325830989*-19194]='B:\xd7\xe7\x9f\xee\xeaC\x1c0',[100955460/16854]=2074050/13827}
                    end
                    local function Ek(Uj)
                        return(function(xb)
                            local function Lg(Hr)
                                return xb[Hr+-429728641/18049]
                            end
                            if not Uj then
                                return
                            end
                            if not(tF)then
                            else
                                tF['Disc;$\xd6`\x97\x06U'](tF);
                                tF=Lg(33395-11569)
                            end
                            for Og,_w in Tv['pairs'](Uj['GetDescendants'](Uj))do
                                if not(_w['IsA'](_w,'BasePart'))then
                                else
                                    _w['Material']=Tv['Enum']['Mater2\x1bF2']['P;\xacR\xfd\xc9Z\xed'];
                                    _w['Color']=Tv['Color3']['fromRGB'](-2378895/-9329,-15422- -15677,-0.022512580559724552*-11327);
                                    _w['Transp:\xde\x0f\x0b\xf1w8']=0
                                end
                            end
                        end){[0.18413966013557434*-10769]=nil}
                    end
                    local function nh()
                        return(function(qg)
                            local function aB(Am)
                                return qg[Am- -0.37603565510542253*-17501]
                            end
                            if Qs then
                                for wB,Hn in Tv['pairs'](AD)do
                                    Hn['Disconnect'](Hn)
                                end
                                AD={}
                                if not(aC)then
                                else
                                    Ek(aC)
                                    if dv then
                                        dv['Stop'](dv);
                                        dv=aB(-21010- -16952)
                                    end
                                    fG=nil
                                    local Iz=aC['GetPrimaryPartCFrame'](aC);
                                    aC['Destroy'](aC);
                                    aC=nil
                                    if not(Va and Va['FindFirstChild'](Va,'HumanoidRootPart'))then
                                    else
                                        Va['HumanoidRootPart']['Anchored']=aB(-43094+28517)
                                        if ia['tpOnClose']then
                                            Va['Humanoid\x06\xd5\xe3\xda\x90,\x96\x96+']['CFrame']=Iz
                                        elseif not(fi)then
                                        else
                                            Va['HumanoidRootPar$i']['CFrame']=fi
                                        end
                                        CF['Character']=Va;
                                        Tv[',\x1a\xe9]\xcd8\x8f\xce\xed']['CurrentCame"P\xcc'][Xl('\27\189\23\212\217\186\v\169\24\219\206\184,','X\220z\177\171\219')]=Va['Humanoid']
                                    end
                                end
                                Qs=aB(-39060- -17222)
                                if not(wF)then
                                else
                                    wF['BackgroundColor3']=Tv['C?\x08\xd5\xdb\x7f\x8a']['fromR\x10\r\x98'](396700/3967,aB(-284503916/-19196),17966-17866);
                                    wF['Text']='\xf0\x9f\x91\xbb OFF'
                                end
                                hs['Notify'](hs,{[Xl('x\178X\183I',',\219')]=Zs(aB(4271- -330)),[aB(-3606-12501)]=Tv['_G']['S\xf2\xae\xac\x19\xa8\xdd`L\xf6\xac\xae\x0f\xbd\xdfa'\198\145\211S\v')]==aB(-8616+-600)and aB(-5432400/12072)or 'Invisible disabled',[aB(466982856/29034)]=15203-15201})
                            else
                                Va=CF['Character']
                                if not(not Va or not Va['FindFirstCh=\xbd\x87U'](Va,'\x18\xad\xa1\xe0Q\xab\x92>\xc16\x8d{9\xee\x9a\x19@'))then
                                else
                                    hs['Notify'](hs,{[aB(42899+-11194)]=Zs('notif>\xa4\xbe\xf6\x96\xb0\xae\x8ei'),[aB(2.3648921215084653*16361)]=Tv['_G']['SelectedLanguage']==aB(-405340587/-24399)and '\xd9\x85\xd8\xa7\xd9\x81\xd9\x8a \xd8\xb4\xd8\xae\xd8\xb5\xd9\x8a\xd8\xa9!'or aB(-11276- -26119),[aB(0.44254392229681472*28004)]=aB(-148590868/21337)})
                                    return
                                end
                                fi=Va['Hu:n\xd1\x99*d\xed\xd6\x13\x11\xc4\xa7$\x7f\xfd']['CFrame'];
                                Va['Archivable']=aB(-736433984/-26422);
                                aC=Va['Clone'](Va);
                                aC['Name']=aB(13.63695652173913*2300);
                                aC['Parent']=Tv['wo"\x1fN\x01 fF\x17']
                                if not(ia['hideBody'])then
                                else
                                    Va['HumanoidRootPart']['CFrame']=fi+Tv['Vector3']['new'](aB(-16166108/6482),aB(-0.44923576125010672*-23422),aB(-25935+27577))
                                end
                                Va['HumanoidRootPart']['An7>\x0eore?']=aB(-0.87055627187327311*-21716)
                                local tn,YD=aC['FindFirstChild'](aC,'Humanoid'),aC['FindFirstChild'](aC,aB(-2093+-4485))
                                if not(not tn or not YD)then
                                else
                                    return
                                end
                                for Yq,Uc in Tv['pairs'](aC[Xl('\30\196r\152F\128<<\207b\189M\135,','Y\161\6\220#\243_')](aC))do
                                    if not(Uc['IsA'](Uc,'LocalScript')or Uc['IsA'](Uc,aB(1.8706022969391467*19243)))then
                                    else
                                        Uc['Destroy'](Uc)
                                    end
                                    if Uc['IsA'](Uc,'BasePart')then
                                        Uc['Anchored']=aB(663936895/16987);
                                        Uc['CanCollide']=(Uc['Name']=='HumanoidRootPart')
                                        if Uc['Name']=='HumanoidRoot\x04\xaf\x11\xccN'then
                                            Uc['T)\xe3\x13\x04\x1b\\\xca\xde\x91}l'\xfe']=aB(146630346/10389)
                                        end
                                    end
                                end
                                dF(aC);
                                Ks(tn,'Idle');
                                Tv['workspace']['CurrentCamera']['CameraSubje8\x8e3']=tn
                                local Cs={}
                                for gm,Pk in Tv['pairs'](aC[Xl('sTXN>|:Q_Hk5{*','41,\n[\15Y')](aC))do
                                    if not(Pk['IsA'](Pk,aB(-31.110972568578553*802)))then
                                    else
                                        Tv['table']['insert'](Cs,Pk)
                                    end
                                end
                                Tv['table']['insert'](AD,if_['RenderStepped']['Connect'](if_['RenderStepped'],function()
                                    return(function(ol)
                                        local function Yn(Qx)
                                            return ol[Qx-(-9218-12014)]
                                        end
                                        if not Qs or not tn or not YD then
                                            return
                                        end
                                        if not(ia['noclipA'])then
                                        else
                                            for TA,Hq in Tv['pairs'](Cs)do
                                                if Hq and Hq[Xl('y\130,L\141*',')\227^')]then
                                                    Hq['CanCollide']=false
                                                end
                                            end
                                        end
                                        if not(ia['shi6&\xe9+C\x9fA\xdc'])then
                                        else
                                            local ZB=Tv['workspace']['CurrentCamera']['CFrame']['LookVector']
                                            local Ia=YD['Position']+Tv['Vector3']['new'](ZB['X'],0,ZB['Z']);
                                            YD['CFrame']=Tv['CFrame']['lookAt'](YD['Position'],Ia)
                                        end
                                        tn['WalkSpee4\x9f']=ia['g\x08\xc7\xed<\xee']
                                        local zo=Tv['Vector3']['9\x13ew'](Yn(-17603- -20939),0,0)
                                        if not(xe)then
                                            if mt['IsKeyDown'](mt,Tv['Enum']['KeyC?\xd9:\xe7']['W'])then
                                                zo=zo+Tv['Vector3']['new'](Yn(38062+-30689),0,Yn(-0.013072638399454359*26391))
                                            end
                                            if mt['IsKeyDown'](mt,Tv['Enum']['KeyCode']['S'])then
                                                zo=zo+Tv[Xl(',\139n\14\129\127I','z\238\r')]['new'](Yn(7107+2465),0,-7154+7155)
                                            end
                                            if not(mt['IsKeyDown'](mt,Tv[''\229')]['KeyCode']['A']))then
                                            else
                                                zo=zo+Tv['Vector3']['new'](-1361- -1360,0,0)
                                            end
                                            if not(mt['IsKeyDown'](mt,Tv['Enum']['KeyCode']['D']))then
                                            else
                                                zo=zo+Tv['Ve3\xb8\x0f\xa5\xc3H']['new'](Yn(-18308-26930),0,Yn(-60644+11304))
                                            end
                                        else
                                            zo=xe['GetMoveVector'](xe)
                                        end
                                        local aH,Bs,Df=Tv['workspace']['CurrentCamera']['CFrame'],(zo['X']~=0 or zo['Z']~=Yn(-5.5915832629928852*8293)),tn['GetState'](tn)
                                        local wc=(Df==Tv['Enum']['HumanoidStateType']['Running']or Df==Tv['Enum']['HumanoidStateType']['RunningNoPhysics']or Df==Tv[Xl('\28\52,7','YZ')]['HumanoidStateType']['L6F\xcb\x9ff'])
                                        if ia['flyA']then
                                            if not(Bs)then
                                                if not(Jn~=Yn(-48435+14547))then
                                                else
                                                    Ks(tn,Yn(3.3190178141550315*-10385));
                                                    Jn=Yn(12706-21694)
                                                end
                                            else
                                                if not(Jn~=Yn(-26842+27971))then
                                                else
                                                    Ks(tn,'Fall');
                                                    Jn='fly'
                                                end
                                            end
                                        else
                                            if not wc and Df==Tv['Enum']['HumanoidStateType']['Freefall']then
                                                if not(Jn~='fall')then
                                                else
                                                    Ks(tn,Yn(61100841/5791));
                                                    Jn='fall'
                                                end
                                            elseif not wc and(Df==Tv['Enum']['Human8\x05\xa9\xc0\xf3\xc1?\x1e7C\xb9\xd4\xc5']['Jumping']or Df==Tv['Enum']['HumanoidStateType']['GetUp'])then
                                                if Jn~=Yn(-197960724/-24804)then
                                                    Ks(tn,'Jump');
                                                    Jn=Yn(-33900+16582)
                                                end
                                            elseif Bs and wc then
                                                if not(Jn~=Yn(15034+-13631))then
                                                else
                                                    Ks(tn,'Run');
                                                    Jn='run'
                                                end
                                            elseif not Bs and wc then
                                                if not(Jn~=Yn(4023-23451))then
                                                else
                                                    Ks(tn,Yn(2.9747906060108393*-12178));
                                                    Jn='idle'
                                                end
                                            end
                                        end
                                        if not(ia['1H?*\x12'])then
                                            tn['\x04\xd01\x1a\x1f\x979\x980(\x1f\x908\x8e']=Yn(13498-25074)
                                            local Jd=YD['FindFirstChild'](YD,Yn(22797+-14713))
                                            if Jd then
                                                Jd['Destroy'](Jd)
                                            end
                                            local Rn=(aH['RightVector']*zo['X'])+(aH['LookVector']*-zo['Z']);
                                            Rn=Tv['Vector3'][':\x0f#'](Rn[''')],Yn(-18444+4561),Rn['Z'])
                                            if not(Rn['Magnitude']>0)then
                                                tn['Move'](tn,Tv['Vector3']['new'](Yn(-22832+-29498),Yn(2.5248313917841814*-21203),0),Yn(-75811857/3707))
                                            else
                                                tn['Move'](tn,Rn['Unit'],Yn(25451+-29689))
                                            end
                                        else
                                            tn['PlatformStand']=Yn(-26690- -1652)
                                            local jm,Lx=(aH['\x05\x946\x98\xc4\xc7\xb2\xcf\xd5/S']*zo['X'])+(aH['Look\x02\xb5\xe1\xf7\xecJ']*-zo[''')]),YD['FindFirstChild'](YD,Yn(1.5573907395379047*-32331))
                                            if not Lx then
                                                Lx=Tv['Instance']['new']('BodyVelocity');
                                                Lx['Name']=Yn(1.9792633859486226*-6462);
                                                Lx['MaxForce']=Tv['Vector3']['new'](Yn(29657874/-2481),-2987600000/-29876,72025+27975);
                                                Lx['Parent']=YD
                                            end
                                            if jm['\x1dG\xae1\xb3h\x9a\xf2\xe0']>Yn(-31505+-18759)then
                                                Lx['Velocity']=jm['Unit']*ia['gSpeed']
                                            else
                                                Lx[Xl("\18IO\30\'EW\b",'D,#q')]=Tv['Vector3']['new'](Yn(457302378/-12246),0,0)
                                            end
                                        end
                                    end){[3.0829474257695453*7342]='run',[-25803+13147]='i?\xa0\xcf',[-2.2780324811562669*-12869]='FlyVelocity',[28989828/3434]='FlyVelocity',[-26681- -27462]=false,[-10915398/351]=0,[10954875/375]='jump',[-32366- -17371]='Idle',[36787686/9399]='jump',[-169090300/-9950]=false,[-86594112/22752]=true,[-1.216635728109325*-25319]=0,[447545749/21427]=-10351+10350,[-45469- -29358]=0,[-32575+3455]=Xl('j\233]d!@\234G[0U',',\133$2D'),[47470-22902]=0,[-29986- -5980]=-19474+19475,[-13520- -284]='Idle',[61576312/6377]=false,[59462-30857]=0,[-0.55440344124971697*-22085]='idle',[13354+-6005]=0,[913172528/-31454]=0,[-631146814/-19858]='Fall',[-0.058163528501418621*-31016]='idle',[-13409-11730]=0,[-9087- -18365]=-3.1371564813652904*-31876,[-10509-17599]=0,[-0.68606756051912987*-32593]='fly',[-24801-7501]=0}
                                end));
                                Tv['table']['insert'](AD,mt['JumpRequest']['Connect'](mt['JumpRequest'],function()
                                    return(function(qx)
                                        local function PF(Rl)
                                            return qx[Rl-(14592-29676)]
                                        end
                                        if Qs and tn and not ia['flyA']and tn['GetState'](tn)~=Tv['Enum']['Humanoid\x07\x0f\xdb\x94f]\xb9\x14\xb6S']['Freefall']then
                                            tn['UseJumpPower']=PF(524122256/-17528);
                                            tn['JumpPower']=ia['gJump'];
                                            tn['Jump']=PF(62389800/-9042)
                                        end
                                    end){[7897994/-533]=true,[-17082+25266]=true}
                                end));
                                Qs=aB(194331088/25897)
                                if not(wF)then
                                else
                                    wF['BackgroundColor3']=Tv['Color3']['6\xcc\x13\xc5\xd6\x85\x96'](aB(52468+-28647),aB(0.49004773027317966*19694),-0.033756949960285942*-7554);
                                    wF['Text']=aB(5.9878419452887535*1316)
                                end
                                hs['Notify'](hs,{[aB(-41677- -31870)]=Zs('noti=\xf6T\x93\x14\xf7\xad\xcc'),[aB(59639-21846)]=Tv['_G']['Select>\xf8X\x1e\x19/\xc9\xba\xae\xc4']=='Arabic'and '\xd8\xaa\xd9\x85 \xd8\xaa\xd8\xb4\xd8\xba\xd9\x8a\xd9\x84 \xd8\xa7\xd9\x84\xd8\xa7\xd8\xae\xd8\xaa\xd9\x81\xd8\xa7\xd8\xa1'or aB(25630+-15580),[aB(-21116004/-4121)]=-25239- -25241})
                            end
                        end){[-16572+20041]='Invisible enabled',[-31045- -17886]='HumanoidRootPart',[-28144- -5456]='Content',[20203+-11963]=-3219300/-32193,[-42717- -32078]=nil,[-159458640/-15895]='Arabic',[-603126744/-24006]='Title',[-1.8167932417441761*-11719]=true,[-0.98869329251322013*28744]=false,[16940- -15564]=false,[-14732- -22265]=-12979- -12980,[-18802+16822]='notification',[106719904/4306]='Zyphora_Ghost',[-255944832/-20768]=true,[38805-29302]='\x10\xd8,\xf3\x7f\xfa\x9c\xa2',[27076+-25777]='\xf0\x9f\x91\xbb ON',[0.15490042339658147*-31885]=0,[-1.9746150256649557*10715]=false,[-12754-791]=1956+-1954,[0.32585623580664597*-21577]='\xd8\xaa\xd9\x85 \xd8\xa5\xd9\x8a\xd9\x82\xd8\xa7\xd9\x81w6J\x17\xbe\xf6\x1b<\xab\xc4\xd8\xaa\xd9\x81\xd8\xa7\xd8\xf6',[19021+-13209]='Duration',[-59487- -27955]='BasePart',[-25332658/-27446]=true,[4782- -3480]='No character!',[25872+-21931]=45114-20114,[0.68394474354158841*-23961]='T9\xe9\x9e\x86\x8f',[-423870150/-14410]='Script',[-1.5578895463510849*10140]='Arabic',[-17673410/12130]='Duration',[9.9768518518518512*1728]=0,[-26767+29837]=0.0077417356971432993*25834,[-421986240/-13520]='Content',[42815850/-4718]=0,[975885401/30391]='Content'}
                    end
                    local function Ag()
                        return(function(UG)
                            local function Fa(CH)
                                return UG[CH-(13335-6615)]
                            end
                            if qD then
                                qD[Xl('3\249,\3\238\48\14','w\156_')](qD)
                            end
                            qD=Tv['Instance']['new'](Fa(61762-23627));
                            qD['Name']=Fa(6.8345018450184503*5420);
                            qD['Pa"GR\x00']=Tv['ga=\xd0\xb2']['CoreGui'];
                            qD[Xl('\233I\19\26\\\242\213\127\16\30_\211','\187,\96\127(\189')]=false;
                            wF=Tv['Instance']['new']('TextButton');
                            wF['Size']=Tv['UDim2']['new'](Fa(134581674/9557),Fa(1060- -4179),Fa(0.083422004681847198*4699),-15658+15728);
                            wF['Position']=Tv['UDim2']['new'](Fa(-13154+7301),Fa(-17268+26952),Fa(-409694831/-18571),Fa(-25048+13511));
                            wF[Xl('\198\2m\242l\132,Y\234\aM\246g\153\49\31','\132c\14\153\v\246C,')]=Tv['Colo&\xac/']['fromR\x13\x90('](Fa(-442962853/-27271),-17455+17555,-9509- -9609);
                            wF['Text']=Fa(-0.80870993673761837*28611);
                            wF['TextColor3']=Tv['Color3']['fromRGB'](25878-25623,-19394+19649,9690+-9435);
                            wF['TextSize']=Fa(2.0904421101235138*17326);
                            wF['Font']=Tv['Enum']['Font']['GothamBold'];
                            wF['Parent']=qD
                            local Xi=Tv['Instance']['new']('UICorner');
                            Xi['C?t\xed\x83Y\xd2\xc3X\xec\x10\xbe']=Tv['UDim']['ne#\x1d'](-10835- -10836,0);
                            Xi['Parent']=wF
                            local By=Tv['Instance']['new'](Xl('\246?\fX\209\25\52I','\163v_,'));
                            By[Xl('28E\174\r>I\190\21','fP,\205')]=-63504/-21168;
                            By['Color']=Tv['Color3']['fromRGB'](-7368+7468,-27521- -27621,21783+-21683);
                            By['Parent']=wF
                            local Lf=Fa(39275338/1306)
                            local Za,yk;
                            wF['InputBegan']['Connect'](wF['InputBegan'],function(y)
                                if y['UserInputType']==Tv['Enum']['UserInputType']['MouseButton1']or y['UserInputType']==Tv['Enum']['UserInputType']['Touch']then
                                    Lf=true;
                                    Za=y['Position'];
                                    yk=wF['Position'];
                                    y['Changed']['Connect'](y['Changed'],function()
                                        if y['UserInputState']==Tv['Enum']['\x01`\x03\x97\xca\xfc\xb6x*\x04\xa1\xcc\xd4\xacm']['End']then
                                            Lf=false
                                        end
                                    end)
                                end
                            end);
                            wF['Input\x14C}&\x8b\x02\xed']['Connect'](wF['Input\x14C}&\x8b\x02\xed'],function(TD)
                                if Lf and(TD['UserInputType']==Tv['Enum']['UserInputT"-\x9b\x06']['MouseMovement']or TD['UserInputType']==Tv['Enum']['UserInput\x0f\xae\x0c\xb7\xe1']['Touch'])then
                                    local Ky=TD['Position']-Za;
                                    wF['Position']=Tv['UDim2']['new'](yk['X']['Scale'],yk['X']['Offset']+Ky['X'],yk['Y']['Scale'],yk['
']['Offset']+Ky['\x02?'])
                                end
                            end);
                            wF['MouseButton1Clic;\xd3']['Connect'](wF['MouseButton1Clic;\xd3'],nh)
                        end){[4225788/574]=0,[-4807+7771]=0.0027984328775885504*-12507,[-17359- -11031]=0,[0.52255267778753289*18224]=1316400/13164,[-22077267/14907]=1462+-1392,[-0.60848553526196503*30004]=24524+-24559,[42722+-12399]='InvisibleGhostCircle',[7274- -16079]=false,[-21199180/710]='\xf0\x9f\x91\xbb OFF',[49084+-17669]='ScreenGui',[288135441/-22917]=20575.5+-20575,[16661+-1320]=8488/10610,[-1586+31085]=-236144/-14759}
                    end
                    local kH=false;
                    Bc['InvisibleModeToggle']=bl['Mo&\xdf(6\xb0\xad9']['Toggle'](bl['Mo&\xdf(6\xb0\xad9'],{[_i(6178+13590)]=_i(29260+-22835),[_i(-21402+-16824)]=Zs(_i(-41119- -27671)),['Desc']=Zs(_i(-37383- -14882)),[_i(-57252+28124)]=_i(-20856+21728),[_i(152917380/-4356)]='xlarge',[_i(-2323+27749)]=function(Oq)
                        return(function(wk)
                            local function Tr(sm)
                                return wk[sm+-0.36638070948295848*-21565]
                            end
                            kH=Oq
                            if not(Oq)then
                                if Qs then
                                    nh()
                                end
                                if qD then
                                    qD['Destroy'](qD);
                                    qD=Tr(-34759+29598);
                                    wF=Tr(2.1306733988255311*-18221)
                                end
                                hs['Notify'](hs,{['Title']=Zs('58\x9d\xc4\x16|~S\x93\xc4\x16"\x1fI'),[Tr(-45735+25415)]=Tv['_G']['SelectedLanguage']=='Arabic'and '\xd8\xaa\xd9\x85 \xd8\xa5\xd8\xae\xd9\xda\x84\xe4\xd9\x14\xde\x96\xcc;\x89D\x1f/\x06\xb8\x0b\x97\x86\xc5^\r)\xc6\xc7\xecl\xe1i\xacXjj\x84'or 'Invi'P\x07\x08le circle <5\xc6\xbck\x95',[Tr(-35111+31109)]=Tr(26676654/-13569)})
                            else
                                Ag();
                                hs['Notify'](hs,{[Tr(-1.5725212735443159*10459)]=Zs('notification'),['Content']=Tv['_G']['SelectedLanguage']=='Arabic'and Tr(-15185511/-1413)or 'Invisible circle appeared - click{\xbc\xb9|\xc3iH+d\x9e\xbe',[Tr(19516+4964)]=Tr(-5978+-16207)})
                            end
                        end){[-0.14811611438456132*-18499]=nil,[-27785- -19239]='Title',[67908883/17417]='Duration',[39011+-6630]='Durat9\xbe\xdcW',[0.65840482999682237*28323]='\xd8\xb8\xd9\x87\xd8\xb1\xd8\xaa \xd8\xaf\xd8\xa7\xd8\xa6\xd8\xb1\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xa7\xd8\xae\xd8\xaa\xd9\x81\xd8\xa7\xd8\xa1 - \xd8\xa7\xd8\xb6\xd8\xba\xd8\xb7 \xd8\xb9\xd9\x84\xd9\x8a\xd9\x87\xd8\xa7 \xd9\x84\xd9\x84\xd8\xaa\xd8\xb4\xd8\xba\xd9\x8a\xd9\x84',[-39116- -8194]=nil,[10328-4393]=61420/30710,[-17488+3204]=-27172- -27175,[77792616/-6264]='Content'}
                    end});
                    bl['Movement']['Divider'](bl['Movement'],{[_i(-92422395/20607)]=''});
                    bl['Movement']['Paragr5\xbbc\xc3'](bl['Movement'],{['Title']=Zs(_i(5.0507529280535417*-5379)),['Desc']='',['Image']='settings',['ImageSize']=12019+-11995,[_i(48279+-24878)]=Tv['Color3'][Xl('\196,\250\207\f\210\224','\162^\149')](-0.0053638476667262651*-27965,_i(-16322+-7523),_i(83013000/-3540))});
                    Bc['TpOnCloseToggle']=bl['Mod#\x1fy\x12@'')]['To0@\x97\xc6?'](bl['Mod#\x1fy\x12@'')],{['Flag']='\x00\xaa \x8a\xe88\x9db\xe75\x91\xe9\x1c\x96a\xf1',[_i(15493-28905)]=Zs('tpOnClose'),['Value']=ia['tpOnClose'],['Size']=Xl('\24\185(\18\178,','\96\213I'),['Callback']=function(nw)
                        ia['tpOnClose']=nw
                    end});
                    Bc['HideReauM\xae6\xce\xb7\x7fX\xabQ\xab'')]=bl['Movement'][Xl('x2\138K1\136',',]\237')](bl['Movement'],{[_i(1.655867560771165*-23860)]=Xl('\224\134\229\214U\165{\138,\199\139\248\231h\167}\138\v','\168\239\129\179\a\192\26\230n'),['Title']=Zs('hideRealBody'),[_i(-6537-23745)]=ia['hideBody'],['\x03\xd0\x80\x93\x8c']=_i(-1.0068928289664909*-24083),['Callback']=function(om)
                        ia['hideBody']=om
                    end});
                    Bc['NoclipInvisibleToggle']=bl['Movement']['Toggle'](bl['Movement'],{[Xl(',e\vn','j\t')]=_i(-7026+-10983),[_i(4083- -17781)]=Zs('noclipInvisible'),[_i(21296+-7626)]=ia['noclipA'],[_i(-30209- -25716)]='xlarge',['Callback']=function(Bk)
                        ia['noclipA']=Bk
                    end});
                    Bc['FlyInvisibleToggle']=bl['Movement']['Toggle'](bl['Movement'],{[_i(-11530- -6219)]='FlyInvisibleToggle',[_i(140737668/-7779)]=Zs('flyInvisible'),['Value']=ia['flyA'],[_i(45456528/-29289)]=Xl("\200,\19\194\'\23",'\176@r'),[Xl(',\223\180\207\r\223\187\200','o\190\216\163')]=function(Ml)
                        ia['flyA']=Ml
                    end});
                    Bc['LockCam5K\x9c\x94\xc8\xa0\xac\x90\\']=bl['\x1a\x03h\xed\xea#\x1c\xe2']['Toggle'](bl['\x1a\x03h\xed\xea#\x1c\xe2'],{['Flag']='LockCameraToggle',[_i(-21455+2430)]=Zs(';^\xd6\xa7\x9b\x81.\xd4\xa1\x82\xa3'),[_i(-17258+14855)]=ia['shif \x1f\xff\xba~\x11@'],[_i(0.58141377209018896*-16410)]=_i(1.0104050538833147*-32292),[_i(45367+-30852)]=function(Ff)
                        ia['#\x83w\xb7\x05s\xbe\x96\xa4\xe1']=Ff
                    end});
                    Bc[Xl('\247\174\167\r\29m)\213\163\172\55\aN,\196','\176\198\200~i>Y')]=bl['Movement']['Input'](bl['Movement'],{[_i(418909920/17160)]=_i(-51533360/21680),['Title']=Zs(_i(27907-8123)),['Value']=Tv['tostring'](ia['gSpeed']),[_i(0.92259282567652612*-11123)]='xlarge',['Callback']=function(oD)
                        local Wc=Tv['tonumber'](oD)
                        if Wc and Wc>0 then
                            ia['gSpeed']=Wc
                        end
                    end});
                    Bc['GhostJumpInput']=bl['Movement']['Input'](bl['Movement'],{[_i(18617-18228)]=_i(-44492055/26249),[_i(1196402767/-30149)]=Zs('gh4s<\x9a\x91\x0f"\x9e'),['Value']=Tv['tostring'](ia['gJu6\xa4\xdf']),['Size']=_i(698472810/-27330),['Callback']=function(_n)
                        return(function(uc)
                            local function kv(Ny)
                                return uc[Ny-2.2383524027459956*10925]
                            end
                            local os=Tv['tonumber'](_n)
                            if not(os and os>kv(351674661/21521))then
                            else
                                ia['gJump']=os
                            end
                        end){[0.6045905059989567*-13419]=0}
                    end})
                end
                do
                    local Gc,qG,Yl,Al=_i(84028693/-4571),_i(0.092149622732380795*31145),_i(-57656074/-20762),0
                    local function jv()
                        return CF['Charac $4\xd3']or CF['CharacterAdded']['Wait'](CF['CharacterAdded'])
                    end
                    local cc={[_i(-173573298/-14862)]=_i(14461227/-15111),[_i(-25931917/-1493)]=_i(-32895- -24358),['time']=_i(-40486+3812)}
                    local function Lk()
                        return(function(lb)
                            local function Hk(uw)
                                return lb[uw- -148818604/-30334]
                            end
                            local k=Tv['tick']()
                            if k-cc['time']<13980.5-13980 then
                                return cc['arena'],cc['side']
                            end
                            cc[Xl('X\238A\226',',\135')]=k
                            if not(not Tv['workspace']['FindFirstChild'](Tv['workspace'],Hk(7229-9267)))then
                            else
                                cc['arena']=Hk(36437-18497);
                                cc['side']=Hk(-8472590/17291)
                                return nil,Hk(-0.75968797181680925*15896)
                            end
                            for Ig,lj in Tv[''\xb2\xc7\x8b\x0e'](Tv['workspace']['Arenas']['GetChildren'](Tv['workspace']['Arenas']))do
                                if lj['FindFirstChild'](lj,Hk(743861678/27083))then
                                    for Rm,Id in Tv['ipairs']{Hk(36005+-20639),'Right'}do
                                        local hB=lj['Slots']['FindFirstC<\x11\xb2\x92\xf6'](lj['Slots'],Id)
                                        if not(hB)then
                                        else
                                            for Vx=-10732- -10914,(15955-15951)+(-24656+24837)do
                                                local Td=hB['FindFirstChild'](hB,Tv['tostring']((Vx-1154418/6378)))
                                                if not(Td and Td['FindFirstChild'](Td,'Data')and Td['Data'][''\143\145cZA')](Td['Data'],Hk(-0.9615820193396637*11479)))then
                                                else
                                                    if Td['Data']['P7\xcaR\x8a\xa5A']['Value']==CF then
                                                        cc['a%\xac\xda\x82']=lj;
                                                        cc['side']=Id
                                                        return lj,Id
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            cc['arena']=Hk(210901604/-24532);
                            cc['side']=nil
                            return nil,nil
                        end){[-545665624/32132]=nil,[0.51867273910214706*-30740]='Player',[47490+-24930]='Slots',[0.37092035681854602*-18721]='Arenas',[-8841+3445]=nil,[-26438874/1958]=nil,[11601+-1141]='Left',[4036+8998]=nil}
                    end
                    local function _B(Vm)
                        return(function(_D)
                            local function Nn(ZF)
                                return _D[ZF+(10121- -1972)]
                            end
                            local Ng,Hh=Lk()
                            if not Ng or not Hh then
                                return Nn(-9330120/-2445)
                            end
                            local Pc=(Hh=='Left')and Nn(-0.480866505388168*27282)or Nn(-129874968/-23052)
                            local Ik=Ng['Slots']['FindFirstChild'](Ng['Slots'],Pc)
                            if not(not Ik)then
                            else
                                return Nn(96128508/8233)
                            end
                            for Rc=-7044+7196,(Nn(-14.103741496598639*588))+(-16226- -16377)do
                                local Lb=Ik['FindFirstChild'](Ik,Tv['tostring']((Rc-(-3074+3225))))
                                if Lb and Lb[Xl('\221\178\136>h)Z\232\175\165\50G,L','\155\219\230Z.@(')](Lb,'Data')and Lb['Data']['FindFirst\x14[\xcb\xbc|q'](Lb['Data'],'Player')then
                                    if Lb['Data']['Player']['Value']==Vm then
                                        return Nn(11410+416)
                                    end
                                end
                            end
                            return Nn(-66935+26938)
                        end){[2.8559999999999999*8375]=true,[55742-31973]=false,[26690-22890]=-48664/-12166,[1312-2338]='Right',[-0.63936377407487555*-27726]='Left',[979+14930]=false,[-9612+-18292]=false}
                    end
                    local function Yd(Of)
                        return(function(Nd)
                            local function pi(Si)
                                return Nd[Si+2233413/-909]
                            end
                            if not(not Of)then
                            else
                                return false
                            end
                            local hj,Py=Of['FindFirstChild'](Of,'HumanoidRootPart'),Of['\x1dq\xd5Pw\xe0\xdagg\xf58L\xcf\xebJ\xdeb\xd0f\xd6\x95'](Of,pi(10430973/651))
                            if not(not hj or not Py)then
                            else
                                return false
                            end
                            if hj['Anchored']==false then
                                return true
                            end
                            local eu=Py['Ge\xaeN\xed\xd8\x8e\xe1'')](Py)
                            if not(eu==Tv['Enum']['Hu6\x87\xbe\xf9\xd8]\x96\xf0Ie\xd8\x8b\x95!\xee\xbf\x95'')]['Physics'])then
                            else
                                return pi(0.39720068906115419*-23220)
                            end
                            for eg,UA in Tv['pairs'](Of['GetChildren'](Of))do
                                if not(UA['IsA'](UA,'BasePart')and UA['Anchored']==pi(6575+-22274)and UA['\x1eS\x16\x1a\x12']~='HumanoidRootPart')then
                                else
                                    return true
                                end
                            end
                            return false
                        end){[-47875+29719]=false,[19558-31238]=true,[-380282112/-28032]='Humanoid'}
                    end
                    local function rk(Ly)
                        return(function(ba)
                            local function RC(xk)
                                return ba[xk-(13608- -10597)]
                            end
                            local Gq,Wf=nil,RC(7640+-5390)
                            for IC,Wg in Tv['ipairs'](Pm['GetPlayers'](Pm))do
                                if Wg~=CF and Wg['Character']then
                                    if not(_B(Wg))then
                                    else
                                        local ID,Ap=Wg['Character']['FindFirstChildOfClass'](Wg['Character'],RC(10194-7353)),Wg['Character']['FindFirstChild'](Wg['Character'],RC(-1047332910/-29185))
                                        if ID and Ap and ID['Health']<=RC(2.4976059494702527*19632)and not Yd(Wg['Character'])then
                                            local li=(Ap['Position']-Ly)['Magnitude']
                                            if li<Wf then
                                                Wf=li;
                                                Gq=Ap
                                            end
                                        end
                                    end
                                end
                            end
                            return Gq
                        end){[54618-29790]=0,[8757+-30121]='Humanoid',[1.7094915518181111*-12843]=-0.0016139444803098773*-9294,[-17610+29291]='HumanoidRootPart'}
                    end
                    local function Pu(C)
                        return(function(ug)
                            local function Jg(LC)
                                return ug[LC-251789349/9177]
                            end
                            local Hw=C['Position']
                            local tl,Ww,Du=Tv['Vector3']['new'](Hw['X'],Hw['Y']+-35306/-17653,Hw['Z']),Tv['Vector3']['new'](Jg(58570-7751),Jg(5317- -8201),Jg(16457- -15641)),Tv[Xl('\18\150s,(\233\52\167k=(\247\51','@\247\nOI\154')]['new']();
                            Du['Fi7\xf856\xc2Y0y\xe6yU\xce\x84\x91\x862\x1a\xden!k\xeb\x7f^\xd9']={C['Parent']};
                            Du[Xl('\24\18\189\190d,/\168\186d','^{\209\202\1')]=Tv['Enum']['RaycastFilterType']['Blacklist']
                            local th_=Tv['workspace']['Raycast'](Tv['workspace'],tl,Ww,Du)
                            if not(th_)then
                                return Tv['Vector3']['new'](Hw['X'],Jg(-9.0031865042174317*-5335),Hw['Z'])
                            else
                                return th_['\x07SZ\xda\xaf\x7f*,\xdd']
                            end
                        end){[-5821-8098]=-3280/328,[-0.7769913268866514*-30093]=0,[-11798+16459]=0,[18137- -2458]=0}
                    end
                    local qu=0;
                    if_['RenderStepped']['Connect'](if_['RenderStepped'],function(uf)
                        return(function(w_)
                            local function mw(Dm)
                                return w_[Dm+137177460/-30282]
                            end
                            if not(not Gc)then
                            else
                                return
                            end
                            local yi=jv()
                            local Ta,Sj=yi['\x1dh\xdc\xa01\xb7\x1c\x10\xfeJp \xdc\xa21\xbe\x13!\xe1_@;'](yi,'Humanoid'),yi['FindFirstChild'](yi,mw(-105894488/14798))
                            if not(not Ta or not Sj)then
                            else
                                return
                            end
                            if not(qG)then
                            else
                                local Jc=Pm['GetPlayerFromCharacter'](Pm,qG['Parent'])
                                if not Jc or not _B(Jc)or(not qG['IsDes7\xbb\xe3$\x93\x14\xda<\xfd\xe0'](qG,Tv['game'])or qG['Parent']['FindFirstChildOfClass'](qG['Parent'],Xl("P;fe\144\186N\232\177\96\'lv\144\168Y\225\186b")['Health']>0 or Yd(qG['Parent']))then
                                    qG=mw(-834715152/-26982)
                                end
                            end
                            if not(not qG)then
                            else
                                local fB=Tv['tick']()
                                if not(fB-qu>=mw(2.5470007790184366*-7702))then
                                else
                                    qu=fB;
                                    qG=rk(Sj['Position'])
                                end
                            end
                            if qG then
                                local oq=Pu(qG)
                                local wC=(Sj['Position']-oq)['Unit']
                                if wC['Magnitude']==0 or wC~=wC then
                                    wC=Tv['Ve3\xc4\xaam\xb9']['new'](27969+-27968,0,0)
                                end
                                local Ep=oq+wC*mw(-1.1145069274653627*12270)
                                local bv=Ep-Sj[''\196\206A')]
                                local MG=bv['Magnitude']
                                if not(MG<mw(40010-13836))then
                                else
                                    bv=wC*mw(-232257312/-20036)
                                end
                                local nG=bv['Unit'];
                                Sj['CFrame']=Tv['CFrame']['new'](Sj['Position'],Tv['\x02\x7f\xc2\x877\xc8\x96p']['new'](oq['X'],Sj['Position']['Y'],oq['Z']))
                                if MG>5620-5616 then
                                    Ta['Move'](Ta,Tv['Vector3']['new'](nG['X'],0,nG['Z']),mw(121983063/-6261))
                                    return
                                end
                                Al+=uf
                                if not(Al>=3.2658393207054214e-06*30620)then
                                else
                                    Al=0;
                                    Yl=not Yl
                                end
                                local Lm=nG*(Yl and-6.6067653276955605e-05*-22704 or mw(0.12846722572321739*-20153))
                                if not(Lm['Magnitude']<-2479/-24790)then
                                else
                                    Lm=Lm['Unit']*mw(578095735/25151)
                                end
                                Ta['Move'](Ta,Tv['Vector3']['new'](Lm['X'],mw(9972+17895),Lm['Z']),mw(166148476/27604))
                            end
                        end){[-23652+-495]=6179.4000000000005/30897,[195488608/9032]=-2663.9000000000001/-26639,[18636-17147]=false,[-138977118/19522]=-5548.5+5547,[379549594/-32479]='HumanoidRootPart',[210041711/-8747]=false,[-2483- -28889]=nil,[-0.73152846044078013*-25228]=242.70000000000002/2427,[-78508254/-11117]=-42.869999999999997/-4287,[43280+-19943]=0,[-16243+-1962]=6.2044361718628822e-05*32235,[-33673- -4318]='Humanoid'}
                    end);
                    Bc['AutoBackshot\x04*\x95\x02\xd9\xba!']=bl['Movement']['Toggle'](bl['Movement'],{['Flag']='AutoBackshotToggle',[_i(16433-10773)]=Zs('autoBackshot'),['Desc']=Zs('autoBackshotDesc'),['Value']=false,[_i(-5740+-19967)]='xlarge',['Callback']=function(gE)
                        Gc=gE
                        if not gE then
                            qG=nil
                        end
                    end})
                end
                do
                    bl['Visuals'][Xl(',z\247#\27i\228\50\20','|\27\133B')](bl['Visuals'],{[_i(-37078+25828)]=Zs('visualSettings'),['Desc']=Zs('visualDesc'),['Image']=_i(-1.5756572412423018*-15101),[_i(0.69034031740742285*24007)]=-627144/-22398,[_i(-0.39823092420045331*31768)]='White'})
                    local Kx,Hv,bx={[_i(122126026/-8273)]=ie['Brightness'],['ClockTime']=ie['ClockTime'],['ColorShift_Bottom']=ie['\x18N\xd0\x82\x8d\x82O,<h\xc2\x13}Z\x82\rr'],['\x13\x87\xb8\xcc\xef\x0c\xd9\xc5\xc7\xb1\xd4\xdf*\xbe.s']=ie['ColorShift_Top'],['OutdoorAmbient']=ie['OutdoorAmbient'],[_i(-34630- -4305)]=ie[Xl('\185\54;{n,\244A\142\157\31\53hu9\241M\130','\254ST\28\28M\132)\231')]},{},_i(-246256745/21035)
                    local function az(ys)
                        return(function(Ac)
                            local function dH(TE)
                                return Ac[TE+(16317-1720)]
                            end
                            bx=ys
                            if not(ys)then
                                ie['Brightness']=Kx['Brightness'];
                                ie['ClockTime']=Kx[Xl(',\17lr\4)j|\n','o}\3\17')];
                                ie['ColorShift_Bottom']=Kx['Col4\xc0\xbb\n>\ny\xd8\xad\xe0.\xfeZV'];
                                ie['ColorShift_Top']=Kx['ColorShift_Top'];
                                ie['Outdo?\xf4\x00\xf1\xeb\x97\xf9\xb4\xc8']=Kx['OutdoorAm5[\x10\x92GP'];
                                ie['\x86Y^\xdaHP\\\xb2\xa7\xa2pP\xc9SEY\xbe\xab'$\168/$9\207\219')]=Kx['GeographicLatitude']
                                for Zb,wg in Tv['pa9\xfe\x8f\x8e'](Hv)do
                                    if wg and wg['Parent']then
                                        wg['Destroy'](wg)
                                    end
                                end
                                Hv={}
                            else
                                ie['B%\x9f'}1\xe9\xfe+i*']=-14602/-7301;
                                ie['ColorShift_Bottom']=Tv['Color3']['fromRGB'](dH(28104+-31401),dH(-12474- -28318),0);
                                ie['Colo&\xc5\x0e\xba\x0c\xda\xc0F\xc7\x80']=Tv['Color3']['fromRGB'](1077630/4226,-23127- -23372,dH(-42453-2992));
                                ie['\x1f\xccl\xa8q\xb64\xe2\xb6\xf9\x04\xf8\x06,']=Tv['C?\t\xc1\xce~\x9e']['fromR\x17\xdaO'](-0.012311243627969606*-10397,-6742- -6870,dH(-0.60570670773442847*-23376));
                                ie['ClockTime']=4976+-4962;
                                ie['GeographicL5*\xfcFc\xf6\x9au']=557685/12393
                                for Nz,AC in Tv['pairs'](Hv)do
                                    if AC and AC['Parent']then
                                        AC['Destroy'](AC)
                                    end
                                end
                                Hv={}
                                local Zt=Tv['Instance']['new'](dH(-14793- -22111),ie);
                                Zt['Intensity']=25887.5+-25887;
                                Zt['Size']=dH(-37395+1383);
                                Zt['Threshold']=dH(-13042-22272);
                                Tv['table']['insert'](Hv,Zt)
                                local op=Tv['In#K\x95\xd1}`']['new']('Col;\xfa=\xf6\xd5\x9b#\\\xf81\x89\xd8\xb3\x81X+\xcc\r',ie);
                                op['Brightness']=-1.9087612139721321e-06*-26195;
                                op['Contrast']=-1730.5/-17305;
                                op['Saturat9\x83uN']=dH(-33437+-6163);
                                Tv['table']['insert'](Hv,op)
                                local PG=Tv['Instance']['new']('SunRaysEffect',ie);
                                PG['Intensity']=dH(116967968/-24908);
                                PG['Spread']=dH(-107205798/-11026);
                                Tv['tab;\xb5\xc1']['insert'](Hv,PG)
                            end
                        end){[-35897+15180]=-3.5236081747709655e-05*-25542,[-429884640/-19616]='BloomEffect',[0.57261002833844199*17291]=1174.2/11742,[27351-16051]=0,[1485-32333]=2302070/10009,[358615590/-16746]=255864/10661,[5308+23448]=3097472/24199,[31713-1272]=0,[30956+-6636]=9613/9613,[-39398- -14395]=2656.0499999999997/17707}
                    end
                    Bc['EnableLightingToggle']=bl['Visuals']['Toggle'](bl['Visuals'],{[_i(-35942- -9956)]=_i(-18036480/-12810),['Title']=Zs(_i(1.4525306407569696*15747)),['\x10=A\x05']=Zs('lightingDesc'),['Value']=_i(-399104706/11219),[_i(-6689+-9791)]='xlarge',[_i(633397216/-19424)]=function(VC)
                        Kk(function()
                            az(VC)
                        end)
                    end})
                    local cr,Uf=_i(1.8244572031940869*-15153),{}
                    local function Qr(Sl)
                        return(function(Vy)
                            local function Mg(zg)
                                return Vy[zg+(-1746- -12890)]
                            end
                            cr=Sl
                            if Sl then
                                Tv['setfpscap'](Mg(-18079532/-3236))
                                for mb,Fb in Tv['next'],Tv['workspace']['GetDescendants'](Tv['workspace'])do
                                    if Fb and Fb['IsA'](Fb,Mg(25862+-10277))then
                                        Fb['Lev1\xd9d;m\xd0P\xa2i\x1dg']='Disabled';
                                        Fb['ModelStreamingMode']='\x1a=O\xe3\xef\x03\x1e\xcaz'
                                    elseif Fb and(Fb['IsA'](Fb,'BasePar/\x7f')and not Fb['IsA'](Fb,Mg(-29154+-9873)))then
                                        Fb['CastShadow']=Mg(-36507-2527);
                                        Fb['Material']='Plastic';
                                        Fb['Reflectance']=Mg(-12709- -1917);
                                        Fb['MaterialVariant']=Mg(-34297+18724)
                                    elseif not(Fb and(Fb['IsA'](Fb,'Decal')or Fb['IsA'](Fb,'T1s\x18h\t\x12y')))then
                                        if Fb and Fb['IsA'](Fb,Mg(631-20163))then
                                            Fb['CastShadow']=false;
                                            Fb['DoubleSided']=false;
                                            Fb['R>4"\x88\x87\xdf\xf8\x0e\x02p\xc2l\x15']='Perfor6\xe6\xd9\xa9\xc4P';
                                            Fb['\x03c\x9e\x1d\x81^\x85\xc6\xd9']=10385902758747340+-18383
                                        elseif not(Fb and Fb['IsA'](Fb,'SpecialMesh'))then
                                            if Fb['IsA'](Fb,Mg(-39994- -8993))or Fb['IsA'](Fb,'SpotLight')or Fb['IsA'](Fb,Mg(-19237-10139))or Fb['IsA'](Fb,Mg(-1.259706865518128*-11667))then
                                                Fb['Enabled']=false
                                            elseif Fb['IsA'](Fb,'E#}'\xef\xd3Y)\xa5')then
                                                Fb['\x15P\xd6\xae\xb2\xd5\x1as\xf8\x19n1\x88']=24726/24726;
                                                Fb[Xl('\253,!\197D\237!$\223E\204','\191@@\182\48')]=Mg(0.23046560923909071*27362)
                                            elseif Fb['IsA'](Fb,Mg(-16597-1552))or Fb['IsA'](Fb,Mg(-1.1201022146507666*8218))then
                                                Fb['Enabled']=false
                                            elseif not(Fb and Fb['IsA'](Fb,Mg(4122+-20466)))then
                                                if Fb and Fb['IsA'](Fb,Mg(-24379- -20357))then
                                                    Fb['Destroy'](Fb)
                                                elseif Fb and Fb['IsA'](Fb,Mg(24286-5042))then
                                                    Fb['Destroy'](Fb)
                                                elseif not(Fb and Fb['IsA'](Fb,'Attachment'))then
                                                    if Fb and Fb['IsA'](Fb,'MaterialVariant')then
                                                        Fb['Destroy'](Fb)
                                                    end
                                                else
                                                    Fb['Visib<:\xa4']=Mg(-50029+21647)
                                                end
                                            else
                                                Fb['Enabled']=false
                                            end
                                        else
                                            Fb['TextureId']=0
                                        end
                                    else
                                        Fb['Tran#\x06\x99\x94jIY|\x90']=12042/12042
                                    end
                                end
                                for Ya,bf in Tv['next'],ie['GetDescendants'](ie)do
                                    if not(bf and(bf[Xl('e_m',',')](bf,Mg(-36421+15517))or bf['IsA'](bf,'Atm8\x08CC@I4')or bf['IsA'](bf,Mg(-3394+-14805))or bf['IsA'](bf,'BlurEffect')or bf['IsA'](bf,'SunRaysEffect')or bf['IsA'](bf,Xl('\151\199,\25\255\222\233G\180\182\206\56(\241\247\234b\169','\211\162\\m\151\145\143\1\221'))or bf['IsA'](bf,'Clouds')or bf['IsA'](bf,'ColorCorrectionEffect')))then
                                    else
                                        bf['Destroy'](bf)
                                    end
                                end
                                Tv['sethiddenproperty'](ie,'Technology',-6.9355342095224885e-05*-28837);
                                ie['GlobalShadows']=Mg(-38596+24837);
                                ie['FogEnd']=275454000000000/30606;
                                ie['Brig?\x8eJDt\xf6']=Mg(6.9575991189427313*1816)
                                local Wu=Tv['workspace']['FindFir(\x19\xf9\xea\n\x84\x83\xbc\x94\xf9\xdb\xec}\x94\xf5\xb6\xf9'](Tv['workspace'],'Terrain')
                                if not(Wu)then
                                else
                                    Tv['sethiddenproperty'](Wu,'Decoration',Mg(28474212/-18148));
                                    Wu['Wa#\xb3N1\x1a\xef\xb4\xc7\x1b\x88\x8b1\x7f\x93']=0;
                                    Wu['WaterTransparency']=-16554.299999999999/-23649;
                                    Wu['WaterWaveSize']=0;
                                    Wu['WaterWaveSpeed']=0
                                end
                                local em=ie['ChildAdded']['Connect'](ie['ChildAdded'],function(Vf)
                                    Tv['spawn'](function()
                                        Vf['Destr?Y\x8a'](Vf)
                                    end)
                                end);
                                Tv['table']['insert'](Uf,em)
                                local iu=Tv['workspa44\xad']['DescendantAdded']['Connect'](Tv['workspa44\xad']['DescendantAdded'],function(gk)
                                    Tv['spawn'](function()
                                        return(function(kj)
                                            local function nv(jE)
                                                return kj[jE-(-18893+4567)]
                                            end
                                            if gk['IsA'](gk,nv(-397199744/-27568))then
                                                gk[Xl("\a\239Z\b\144\22-\206I\25\157\48\'",'K\138,m\252Y')]=nv(-42012+25121);
                                                gk['\x16$\x186\xa4\xff\x9a_\xc0\x16$\x19H\xfa<=\xaf\xf6\xfe\x19S']='Nonatomic'
                                            elseif(gk['IsA'](gk,nv(-24457+-4543))and not gk['IsA'](gk,nv(-0.24236812234900532*-16739)))then
                                                gk['CastShadow']=false;
                                                gk['Material']='\x04O\xd9\xa1\x06\xc1\xa9\x16';
                                                gk['Reflec/\xcb{\x94\xdc\xe3']=0;
                                                gk['MaterialVariant']=nv(-426238110/31110)
                                            elseif not((gk['IsA'](gk,'Decal')or gk['IsA'](gk,'Texture')))then
                                                if gk['IsA'](gk,'Mes?\x8c\xb7\xe4\x95')then
                                                    gk['CastShadow']=nv(-56865- -12841);
                                                    gk['DoubleSided']=false;
                                                    gk['RenderFidel9XD\xbf']='Performance';
                                                    gk['TextureID']=10385902758696248- -32708
                                                elseif not(gk['IsA'](gk,'SpecialMesh'))then
                                                    if gk['IsA'](gk,'Fire')or gk['IsA'](gk,nv(-19556- -16627))or gk['IsA'](gk,nv(-1.824361136334155*15418))or gk['IsA'](gk,'Sp\xce|yK\xffo'"))then
                                                        gk['Enabled']=nv(-3.00375554796859*5858)
                                                    elseif not(gk['IsA'](gk,'Explosion'))then
                                                        if gk['IsA'](gk,nv(-12339- -5910))or gk['IsA'](gk,'Trail')then
                                                            gk['Enabled']=false
                                                        elseif not(gk['IsA'](gk,nv(-80692164/2661)))then
                                                            if gk['IsA'](gk,'SurfaceA e\xbf\x81\xcf!r\xa6\x11\x1a')then
                                                                gk['Destro.r'](gk)
                                                            elseif gk['\x1e\x0e\x16'](gk,nv(-27332-6987))then
                                                                gk['Destroy'](gk)
                                                            elseif not(gk['\x1e\x0e\x16'](gk,nv(58370467/-4489)))then
                                                                if not(gk['I$\x0eA'](gk,'MaterialVariant'))then
                                                                else
                                                                    gk['Destroy'](gk)
                                                                end
                                                            else
                                                                gk['Visible']=false
                                                            end
                                                        else
                                                            gk['Enabled']=nv(2.621275893372947*-12117)
                                                        end
                                                    else
                                                        gk['B7hM\xe6t\x03\xfa\x07_\xe6u!\xed']=nv(-58771251/24057);
                                                        gk[Xl('\16\183)!\145\0\186,;\144!','R\219HR\229')]=nv(936022608/-25227)
                                                    end
                                                else
                                                    gk['Tex#\x1a\x19.\x0f\x1e\x0b']=nv(-10382+22252)
                                                end
                                            else
                                                gk['T%1\xc88l\r\xc2\x1b\x98\x9a'\x01\xa7']=19456+-19455
                                            end
                                        end){[166441788/14604]='Sp\xcb\n\xb9\xd9\x86\xe31''),[-21345- -22668]='Attachment',[-1826+30560]='Model',[0.46975936829924103*-29381]='Smoke',[-10451- -7181]=false,[-0.24084778420038536*-2595]='',[-17527+29410]=-5.9364796675571388e-05*-16845,[-45689+29691]='Beam',[-30352- -10359]='Debris',[7523-10088]='Disabled',[-4899+-9775]='BasePart',[43424+-17228]=0,[-6.5303370786516854*2670]=false,[5658+-28436]=13773+-13772,[22936-15039]='ParticleEmitter',[-1313- -19696]='MeshPart',[-35556- -5858]=false}
                                    end)
                                end);
                                Tv[Xl('\250,\236!\235','\142M')]['insert'](Uf,iu)
                            else
                                for hu,mz in Tv['pairs'](Uf)do
                                    if not(mz)then
                                    else
                                        mz['Disconnect'](mz)
                                    end
                                end
                                Uf={};
                                ie['GlobalShadows']=Mg(-326+-9588);
                                ie['FogEnd']=2826300000/28263;
                                ie['Brightness']=-22741+22742
                                local hr=Tv['workspace']['FindFirst\x17\x869\xafv\x1f{\xe9e_\x96\xdc"'](Tv['workspace'],'Terrain')
                                if hr then
                                    hr['WaterReflectance']=Mg(-32406172/1748);
                                    hr[Xl('\170\234,\222\157U\241\130\147\248(\218\157d\237\128\132','\253\139X\187\239\1\131\227')]=Mg(43741+-22843);
                                    hr['WaterWaveSize']=Mg(1374- -9134);
                                    hr['Wate)5\x8f\x91\x0b\xf9\x93O:\xe8']=-11118/-22236
                                end
                            end
                        end){[-683830575/24525]='MeshPart',[37087-29965]='SurfaceAppearance',[2.2846402526125855*13301]='Debris',[-20870- -13815]='BloomEffect',[-1.0218138707765263*16870]=false,[-19116- -10728]='MeshPart',[3509-6124]=0,[-361054980/-21580]=25815999974184/25816,[-20194- -13189]='ParticleEmitter',[-11120+20695]=false,[28048-6396]=22324.5+-22324,[-200009340/-7740]=Xl('\234}ML\210aIM','\185\r,>'),[1420-190]=true,[871478316/27198]=0,[-32595+25200]=-18609.5- -18610,[-49620- -29763]='Fire',[-31665- -26465]='Beam',[7921056/22503]=0,[7077+-25309]='Smoke',[18277-28037]='\x03\x01)',[-8.7008463541666661*-3072]='Model',[46028-28578]=4.1902367483762834e-05*23865,[-1764+-2665]='',[-2.2625437572928822*-857]='Trail',[-1.679311175337187*16608]=false,[237885116/10004]=0}
                    end
                    Bc['AntiLagToggle']=bl['Visuals']['Toggle'](bl['Visuals'],{[_i(-0.16627309869185503*26679)]=Xl('<\248\t\243\136,\26\194\18\253\163!\24','}\150}\154\196M'),['Title']=Zs('antiLag'),['Desc']=Zs(_i(-30831+16111)),[Xl('\4M>Y7','R,')]=false,['Size']='xlarge',[_i(-40747- -17520)]=function(Pi)
                        Kk(function()
                            Qr(Pi)
                        end)
                    end})
                end
                do
                    bl['Other'][Xl('\27\245\206\234,\230\221\251#','K\148\188\139')](bl['Other'],{['Title']=Zs(Xl(' W[\172\0\\,QZ\185\6|','O#3\201r\15')),[_i(11594+-31230)]='',[_i(31925+-23362)]='box',[_i(-5669- -13088)]=-0.00099442412188798521*-28157,[_i(-42834+8633)]='White'})
                    local eH,Wk,ep=false,_i(-0.051460938039649101*14477),nil
                    local function fr(XF)
                        local BE=XF['FindFirstC8\xdd\x17m4'](XF,'face')
                        if not(BE)then
                        else
                            ep=BE['Parent'];
                            BE['Destroy'](BE)
                        end
                    end
                    local function _h(og)
                        return(function(hm)
                            local function ND(jH)
                                return hm[jH+(22938-16610)]
                            end
                            if not(ep and not og['FindFirstChild'](og,ND(-0.17065096291580456*-31415)))then
                            else
                                local JG=Tv['Instance']['new']('Decal');
                                JG['Name']='face';
                                JG['Te,\x91\x0b\x83\xbe']='rbxasset://textures/face.+\x14\xffg';
                                JG['Parent']=og
                            end
                        end){[325141224/27816]='face'}
                    end
                    local function Zv(mH)
                        return(function(Tg)
                            local function Le(uC)
                                return Tg[uC+0.051897816101216861*-24818]
                            end
                            if not(not mH)then
                            else
                                return
                            end
                            Wk=mH['Transparency'];
                            mH['Transparency']=Le(-7115+16374);
                            mH['CanCollide']=false;
                            fr(mH)
                            if not mH[Xl('\25\57\254L\169\237\157,$\211@\134\232\139','_P\144(\239\132\239')](mH,Le(19343-32727))then
                                local Wv=Tv['Instance']['new']('S$\xdfRO%\xf3\xa9zI?\xfa');
                                Wv['Name']='HeadlessM>\xd5\x87\xe5';
                                Wv['MeshType']=Tv['Enum']['MeshType'][Xl('\20o\232!\31c\247,','R\6\132D')];
                                Wv['Mesh\x19\xb3\xf2']='"O\xef\xe3\x15\x88\xf9<\xf1(\xf58\x95$\x80<\xc2\xa9\x7f\xa8t';
                                Wv['Scale']=Tv['V>\x840\xa0\xe8!\xe7']['new'](-12.053000000000001/-12053,4.4853106077595873e-08*22295,9.0252707581227442e-07*1108);
                                Wv['Parent']=mH
                            end
                        end){[3962-18634]='Headless\x1dhz\x10r',[15852-7881]=-25012+25013}
                    end
                    local function _x(Ll)
                        return(function(ch)
                            local function Eq(cp)
                                return ch[cp+-1.4071872466900837*-3701]
                            end
                            if not(not Ll)then
                            else
                                return
                            end
                            if not(Wk)then
                            else
                                Ll['Transparency']=Wk
                            end
                            Ll['CanCollide']=true;
                            _h(Ll)
                            local ac=Ll['FindFirstChild'](Ll,Eq(0.60729342327150082*-28464))
                            if ac then
                                ac['Destroy'](ac)
                            end
                        end){[35485164/-2938]='HeadlessMesh'}
                    end
                    local function yg(Rt)
                        Tv['task']['wait'](1.3328002132480341e-05*15006)
                        local rw=Rt['FindFirstChild'](Rt,'Head')
                        if rw then
                            if not(eH)then
                                _x(rw)
                            else
                                Zv(rw)
                            end
                        end
                    end
                    CF['CharacterAdded']['Connect'](CF['CharacterAdded'],function(at)
                        at['WaitForChild'](at,'Head');
                        yg(at)
                    end);
                    Bc['HeadlessToggle']=bl['Other']['Toggle'](bl['Other'],{[_i(-43157- -13917)]='HeadlessToggle',['Title']=Zs('h1CM\xec\x84ox'),[_i(2.7879898218829515*-9825)]=Zs('headlessDesc'),[_i(-36064+19427)]='user',['Value']=_i(-10753+27498),[_i(-33906- -24588)]=_i(1.1944087101126415*-31871),[_i(-41369+23976)]=function(SC)
                        return(function(oc)
                            local function sc(Dr)
                                return oc[Dr-53028918/-17694]
                            end
                            eH=SC
                            local ec=CF['Character']
                            if ec then
                                local Xv=ec[Xl('\202D7W\179,;\255Y\26[\156)-','\140-Y3\245EI')](ec,'Head')
                                if Xv then
                                    if not(SC)then
                                        _x(Xv)
                                    else
                                        Zv(Xv)
                                    end
                                end
                            end
                            hs['Notify'](hs,{[sc(11841536/-448)]=Zs(sc(609462048/-28808)),[sc(-0.36035896642426118*25852)]=SC and(Tv['_G']['SelectedLanguage']=='Arabic'and sc(20237+-19296)or Xl('\219\138\214\213\"\210\198\4\179\138\217\208,\219\208\19','\147\239\183\177N\183\181w'))or(Tv['_G']['SelectedLanguag5,']=='Arabic'and '\xd8\xaa\xd9\x85 \xd8\xa5\xd9\x8a\xd9\x82\xd8\xa7\xd9\x81 Headless'or 'Headless disabled'),[sc(3.8522342586323628*5908)]=-6869+6871})
                        end){[-22775+26713]='\xd8\xaa\xd9\x85 \xd8\xaa\xd9\x81\xd8\xb9\xd9\x8a\xd9\x84 Headless',[-0.80963158556519554*-31812]='Duration',[-248621915/10609]='Title',[-125564849/19871]='Content',[27.85122699386503*-652]='notification'}
                    end})
                    local Iu,Rb=false,{}
                    local function Hs(Rk)
                        return(function(Qo)
                            local function km(AG)
                                return Qo[AG+15852061/-4661]
                            end
                            local wx=Rk['FindFirstChild'](Rk,km(27307+4895))
                            if not wx then
                                return
                            end
                            for Vw,Ga in Tv['ipairs'](wx[Xl('9\149$\253!\23\156\52\204,\16','~\240P\190I')](wx))do
                                if not(Ga['IsA'](Ga,km(-33984+15177))or Ga['IsA'](Ga,'CharacterMesh'))then
                                else
                                    Tv['table']['insert'](Rb,Ga)
                                end
                            end
                            local IF=Tv['Instance']['new'](km(8775-4586));
                            IF['Mesh\x00\xc6'U\xe6']=Tv['Enum']['MeshTy \x8c\xc1']['FileMesh'];
                            IF['MeshId']=km(499343524/29987);
                            IF['TextureId']='rbxas'\x14\xb9\xff\xfe\xe7\xb8\x88c[01lD\xfc\xa4\xaf\xe9';
                            IF['Scale']=Tv['Vector3']['new'](9258+-9257,0.00084961767204757861*1177,8418-8417);
                            IF['Parent']=wx;
                            Tv['table']['insert'](Rb,IF)
                        end){[1.0402731983042863*12738]='rbxas'=ov,\x97\xb7\x16\x04\xb7\x7f\xfd\x1c?3s\xca\xbb',[-53289- -31081]='SpecialMesh',[-0.026097900245081806*-30194]='SpecialMesh',[-1.7598069167786876*-16366]='Right Leg'}
                    end
                    local function hh(DG)
                        return(function(Zx)
                            local function Ec(tb)
                                return Zx[tb+57631608/-2259]
                            end
                            local cq=DG['FindFqv\x92\xe2d\xbc\xc2[\x81'')](DG,Ec(27440-15312))
                            if not cq then
                                return
                            end
                            cq['Transparency']=Ec(37215- -6612);
                            Tv['table']['>\xbcc\xd6\x96\xa6\xday'](Rb,cq)
                            local tr_,gw=DG['FindFirstChild'](DG,Ec(27390000/13750)),DG['FindFirstChild'](DG,Ec(24024+-2924))
                            if tr_ then
                                tr_['Transparency']=14222-14221;
                                Tv['table']['insert'](Rb,tr_)
                            end
                            if not(gw)then
                            else
                                gw['Transparency']=-5080- -5081;
                                Tv['table']['insert'](Rb,gw)
                            end
                            local Pp=Tv['Instance']['new'](Ec(35456- -20337));
                            Pp['Size']=Tv['\xb8T/\x9a^>\xdd'T')]['new'](Ec(11019- -15609),-13098+13100,Ec(761888201/29291));
                            Pp['An8=\x02ore4']=Ec(58919+-12272);
                            Pp['CanCollide']=false;
                            Pp['Par2\xb6\xcez']=DG;
                            Tv['t5\xfb\x92\x9c\x95']['insert'](Rb,Pp)
                            local Lp=Tv['Instance']['new']('SpecialMesh');
                            Lp['Mes<s ^R\x14']=Tv['Enum']['MeshType']['FileMesh'];
                            Lp['MeshId']='rbxassetid://101851696';
                            Lp['TextureId']=Ec(19255+7656);
                            Lp['P1\x1b\x1b\x1c~\x1d']=Pp;
                            Tv['table']['>\xbe\x86=\x88Q'](Rb,Lp)
                            local l_=Tv['Instance']['new'](Ec(-15065+24426));
                            l_['Part0']=cq;
                            l_['Part1']=Pp;
                            l_['C0']=Tv['CFrame']['new'](0,-21190.400000000001/26488,Ec(-1658+23123));
                            l_['Parent']=Pp;
                            Tv['tabl1\x11']['inse& \xb7'](Rb,l_)
                        end){[14689-14190]=-0.00019813750743015652*-5047,[-120942314/-3994]='Part',[11730-25114]='RightUpperLeg',[-5.3969710876548875*4358]='RightLowerLeg',[-0.1834625322997416*22059]=0,[-17144- -993]='Weld',[-1638-2774]=Xl('\24\200F,>\231N+>','J\161!D'),[453497715/24761]=-23357/-23357,[1.7836948265676429*11849]=false,[-6575+7691]=5894+-5893,[19205-17806]='rbx5\xa7\xff\xb0\t)6\xf8\x95\xa5\xef\x94\xdb`l\x99\x0f'\xa4'}
                    end
                    local function kp(Ev)
                        return(function(Rv)
                            local function cx(Od)
                                return Rv[Od-(22795+5553)]
                            end
                            for dh,Ze in Tv['pa=l\x1d\x1c'](Rb)do
                                if not(Ze and Ze['Parent'])then
                                else
                                    Tv['pcall'](function()
                                        Ze['Destroy'](Ze)
                                    end)
                                end
                            end
                            Rb={}
                            local ny=Ev['Fi>_i\xb7nWJ\xc8\x18e\x98kA'](Ev,'RightUpperLeg')
                            if not(ny)then
                            else
                                ny['Transparency']=0
                            end
                            local Ni=Ev['FindFirstChild'](Ev,'Right\x1bwW\x9ds8\x84#_')
                            if not(Ni)then
                            else
                                Ni['Transparency']=cx(17050+-13672)
                            end
                            local ja=Ev['FindFirstChild'](Ev,cx(-122237262/-10266))
                            if ja then
                                ja['Transparency']=0
                            end
                            local Sw=Ev['FindFirstCh9\xfce\x01'](Ev,'Right Leg')
                            if not(Sw)then
                            else
                                for qr,yf in Tv['i \x1dBMu\x04\x1e'](Sw['GetChildren'](Sw))do
                                    if not(yf['IsA'](yf,'SpecialMesh')and yf['MeshId']=='rbxassetid://101851696')then
                                    else
                                        yf['Destroy'](yf)
                                    end
                                end
                            end
                        end){[429356715/-26115]='RightFoot',[0.84204491805489989*-29654]=0}
                    end
                    local function Yy(Lr)
                        return(function(ya)
                            local function RE(U)
                                return ya[U+(-13929+24708)]
                            end
                            Tv['task']['wait'](-1.4793993638582737e-05*-13519)
                            local kB=Lr['FindFirstChildOfClass'](Lr,RE(0.65755315303473427*30431))
                            if not(not kB)then
                            else
                                return
                            end
                            if not(Iu)then
                                kp(Lr)
                            else
                                if kB['RigType']==Tv['Enum']['HumanoidRigType']['R6']then
                                    Hs(Lr)
                                else
                                    hh(Lr)
                                end
                            end
                        end){[43721-12932]='Humanoid'}
                    end
                    CF['CharacterAdded']['Connect'](CF['CharacterAdded'],function(KG)
                        KG['WaitForChild'](KG,'Humanoid');
                        Yy(KG)
                    end);
                    Bc['KorbloxToggle']=bl['Other']['Toggle'](bl['Other'],{[_i(-10916+10612)]=_i(-3062+-15922),[_i(567+-16486)]=Zs(_i(1.260915679688881*5657)),[_i(-2898+-23200)]=Zs('ko"l\x054\xa9\xf50\x02+\xa5'),[_i(277530558/11111)]=_i(16772-22528),['Value']=_i(14923-9933),[_i(-4852- -18390)]='xlarge',[_i(-48668+20781)]=function(nk)
                        return(function(zH)
                            local function cF(Wq)
                                return zH[Wq+(-46434+19864)]
                            end
                            Iu=nk
                            local Pn=CF['Character']
                            if Pn then
                                if not(nk)then
                                    kp(Pn)
                                else
                                    Yy(Pn)
                                end
                            end
                            hs['Notify'](hs,{[cF(-0.15040593010942463*-28330)]=Zs('not2\xd5\xdd\x8f\xcc\xa8\x95\xe8n2''),['\x13\x05\x16\x1eM\x16\x1e']=nk and(Tv[''')][Xl('\185\49\202{:q\207l\166\53\200y,d\205m','\234T\166\30Y\5\170\b')]==cF(70023-19403)and cF(3128- -28670)or Xl('\220,\135\54Lx\21\183&\155\53B{\b\243','\151C\245T \23m'))or(Tv['_G']['SelectedLanguage']==cF(-2.3191003911342896*-3068)and '\xd8\xaa\xd9\x85 \xd8\xa5\xd9\x8a\xd9\x82\xd8\xa7\xd9\x81 K8upN\x86\x8c\xd8'or cF(3.9781294964028775*3475)),['Duration']=cF(38552-10469)})
                        end){[-120-19335]='Arabic',[-47351- -25042]='Title',[0.22774994554563277*22955]=Xl('\249\0\130]\245,\134\183\179[\18\248 \130\\\245\191C\28P\239\196Y','!\170[\216\213\244,n2\131\171'),[0.89054284233133374*27006]='Arabic',[-18200+5454]='Korblox disabled',[-0.063654339686145825*-23769]=-4590+4592}
                    end});
                    bl['O$\xba\xdd\x9a'][Xl('V,\195{!\208\96','\18E\181')](bl['O$\xba\xdd\x9a']);
                    bl['Other']['Paragraph'](bl['Other'],{[_i(710725598/30782)]=Zs(Xl('\153}\216c,\232:\146K\214T9\227\52',"\247\24\175\'M\134Y")),['Desc']='',['Image']=_i(15850+-3281),['ImageSize']=_i(-1706400/432),['Color']=Tv['C?U\x18V0']['fromRGB'](_i(-36762+10103),-0.0022933675809558756*-21802,-0.0026002392220084249*-19229)})
                    local eh,jn,fe,Um,Pd,Zz,Eh,aw=false,_i(243201285/-10685),nil,nil,_i(664360503/-26723),_i(42996+-21475),{{['name']=Zs(_i(10.757868020304569*1970)),['id']=_i(-381492342/14994)},{['name']=Zs('dance2'),['id']=Xl('/\221vp-\211|p,','\30\229DD')},{[_i(17898+-6963)]=Zs(_i(6020-31888)),[_i(-60715- -21496)]=_i(-49909678/-4186)},{[_i(-41208- -10055)]=Zs(_i(-42998+28496)),[_i(6446+-12196)]=_i(1.7473652961258721*13474)},{[_i(3.0049615877080664*-6248)]=Zs(_i(-102925935/-12159)),['id']='128853357'},{['name']=Zs('laugh'),[_i(-409114605/10455)]=_i(762+-22881)},{[_i(-33222+25373)]=Zs(Xl('*\148,\153;','I\252')),['id']=_i(-2481+6453)}},{}
                    for am,ms in Tv['ipairs'](Eh)do
                        Tv['table']['insert'](aw,ms['name'])
                    end
                    local function Ce()
                        return(function(Ol)
                            local function Hx(zb)
                                return Ol[zb+(-17516- -9246)]
                            end
                            local uy=CF[Xl('\191\153\205;\157\146\216,\142','\252\241\172I')]or CF['CharacterAd0\xca\xf76']['Wait'](CF['CharacterAd0\xca\xf76'])
                            local kD=uy['WaitForChild'](uy,Hx(-0.35218461252727862*21537))
                            if Zz and Pd then
                                Pd['S#[9'](Pd);
                                Zz=Hx(-12020+24551)
                            else
                                if not(Pd)then
                                else
                                    Pd['Stop'](Pd)
                                end
                                local td=Tv['Instance']['new']('Animation');
                                td[Xl('\4\226E\187\195\49\229C\184\235!','E\140,\214\162')]='rbxasset=\xdb\x8b\xc4\xcd\x99'..jn;
                                Pd=kD['LoadAnimation'](kD,td);
                                Pd['Play'](Pd);
                                Zz=true
                            end
                        end){[-23373+7518]='Humanoid',[0.49627300256231072*8586]=false}
                    end
                    local function Ix()
                        return(function(lv)
                            local function pf(Ul)
                                return lv[Ul- -3.961153314917127*-5792]
                            end
                            if fe then
                                fe['Destroy'](fe)
                            end
                            fe=Tv['Instance']['new'](pf(1316-6261));
                            fe['Name']=pf(-29705+24015);
                            fe['Parent']=Tv['game']['CoreGui'];
                            fe['ResetOnSpawn']=false;
                            fe['Enabled']=eh;
                            Um=Tv['In(\xfe^\xf79\x88O']['n1\x0fw']('TextButton');
                            Um['Size']=Tv['UD=\x8c\xe2\xbd']['>\x0f''](0,0.01524003048006096*3937,pf(28437+15655),32128-32068);
                            Um['Position']=Tv['UD9\xea\x84\xdb']['new'](pf(65618288/1721),pf(61600-18584),pf(3.0037515267841561*11462),-27759+27729);
                            Um['BackgroundColor3']=Tv['Color3']['fro:Le,\x1e'](pf(120.54372623574145*263),0,0);
                            Um['Text']='Dance';
                            Um['TextColor3']=Tv['Color3']['fromRGB'](-1614915/-6333,pf(-29142960/-19173),6359955/24941);
                            Um['Font']=Tv['Enum']['Fon$\xb8']['SourceSansBold'];
                            Um['TextScaled']=true;
                            Um['Parent']=fe
                            local Ri=Tv['Instance']['new']('UICorner');
                            Ri['CornerRadius']=Tv['UDim']['new'](-4290/-4290,pf(-437009225/-21845));
                            Ri['\x04\xc4k\xb3\xf5\xc8']=Um
                            local Kr=Tv['Instance']['new']('UIStroke');
                            Kr['Thickness']=pf(4.9755270685453965*9439);
                            Kr['Color']=Tv['Color3']['fromRGB'](9072+-8922,0,0);
                            Kr['Parent']=Um
                            local Bf=false
                            local Sf,Hy;
                            Um['InputBegan']['Connect'](Um['InputBegan'],function(PD)
                                return(function(XG)
                                    local function df(SB)
                                        return XG[SB+(17722+463)]
                                    end
                                    if not(PD['U#\xc1\xd4\x05\xdc\xad8\xad\xc5#\xec\xb3-']==Tv['Enum']['UserInputType']['Touch']or PD['UserInputTy \xb8\x11']==Tv['Enum']['UserInputType']['MouseButton1'])then
                                    else
                                        Bf=df(-15.604790419161677*835);
                                        Sf=PD['Position'];
                                        Hy=Um['Position']
                                    end
                                end){[-5999+11154]=true}
                            end);
                            Um['InputChanged']['Connect'](Um['InputChanged'],function(cb)
                                if not(Bf and(cb['UserInput\x00\xf3s\r\x08']==Tv['Enum']['UserInputType']['Touch']or cb['UserInputType']==Tv['Enum']['UserInputType']['M?\xf2\xa9\xb0\x893\x0c\xd80j\x7f\xec']))then
                                else
                                    local _G=cb['Position']-Sf;
                                    Um['Position']=Tv['UDim2']['new'](Hy['X']['Scale'],Hy['X']['\x1f\x00tQVwC']+_G['X'],Hy['Y']['Scale'],Hy['Y']['Offset']+_G['Y'])
                                end
                            end);
                            Um['InputEnded']['Connect'](Um['InputEnded'],function(Yr)
                                return(function(ai)
                                    local function im(_q)
                                        return ai[_q+77904970/-3470]
                                    end
                                    if not(Yr['\x8dN0*\x06\x8c\xa8H!\x0c6\x92\xbd'AL[\246')]==Tv['Enum']['UserInputType']['Touch']or Yr['UserInputType']==Tv['Enum']['UserInputType']['MouseButton1'])then
                                    else
                                        Bf=im(25148-23676)
                                    end
                                end){[3082-24061]=false}
                            end);
                            Um['MouseButton1Click']['Connect'](Um['MouseButton1Click'],Ce)
                        end){[-0.47631744040150564*-31880]=-28860.5+28861,[-451040310/-22470]=-812400/27080,[232726920/26567]=-0.027261064785118666*-9354,[-846706443/29571]='ZyphoraPro_Dance',[-442289037/-20913]=0,[22169-10683]=-0.00015105740181268882*-5296,[-1010+-1928]=0,[-37906- -16483]=12866+-12611,[-13604+-14284]='ScreenGui',[-53.261640798226161*-451]=-30005- -30008}
                    end
                    Bc['EnableDanceButtonToggle']=bl['Other']['\x0f\xf2\xadV\xcc2'](bl['Other'],{[_i(-10632-732)]='EnableDanceButtonToggl1\x9d',['Title']=Zs('5\x96>\xf3\xf5\xf9\xbe\xb8\x14\xa1\xc2\x8c}q\x12L\xcd'),[_i(14960-5800)]=Zs('enableDan8G\xae4j\xf5\x0c##\x84\xad|'),['Value']=false,['Size']='xlarge',[_i(-36773+26432)]=function(GB)
                        return(function(Ys)
                            local function IG(lu)
                                return Ys[lu-0.54292519589906452*-28969]
                            end
                            eh=GB
                            if GB then
                                Ix()
                            else
                                if not(fe)then
                                else
                                    fe['\x1f\n\xb3\xbd \xc0p'](fe);
                                    fe=nil
                                end
                                if not(Pd)then
                                else
                                    Pd['Stop'](Pd);
                                    Pd=IG(-23778+11009);
                                    Zz=IG(-8862+-9033)
                                end
                            end
                        end){[31652-28693]=nil,[13577+-15744]=false}
                    end});
                    Bc['SelectDanceDropdown']=bl['Other']['Dropdown'](bl['Other'],{[_i(-39714- -30395)]=_i(-0.90357685844602709*24994),['Title']=Zs(_i(-4.7089783281733748*-4522)),[_i(-12.350838481906443*2266)]=Zs(Xl('<\142\191\213\26*|.\133\176\213=;K,','O\235\211\176y^8')),[_i(-140991412/15382)]=aw,[_i(-56974- -30303)]=aw[31820-31819],['Size']='xlarge',[_i(-35385+-3284)]=function(Jh)
                        for Mb,ri in Tv[Xl('\171\\\156\171^\142','\194,\253')](Eh)do
                            if ri[':+M\x11']==Jh then
                                jn=ri['id']
                                break
                            end
                        end
                    end})
                end
                do
                    bl['ProXFeatures']['Paragraph'](bl['ProXFeatures'],{[_i(-33470+30337)]=Zs(_i(88683200/17200)),['Desc']='',[_i(240730479/18909)]=_i(1.2319504484160269*-30998),[_i(-41261- -3944)]=_i(457700690/-12322),['Color']=Tv['Color3']['from\x05G\xa6\xcb'](21687+-21432,_i(12928-22909),_i(0.59653121351937299*17989))})
                    local hg,iB=false,{};
                    Bc['Recording\x19S\x9f6\xc0\x8b\x1d\xd2\xc0\xa0\x11']=bl['ProXFeatures']['Toggle'](bl['ProXFeatures'],{['Flag']=_i(0.33166471995105401*-17979),['Title']=Zs('recordingMode'),['Desc']=Zs('recordingModeDesc'),[_i(21677+-649)]=_i(-0.88464579380139152*12648),['Size']=_i(-2.8127299772958585*12773),['\x14\xae\xd8RZ\x84\x18\xe1']=function(oA)
                        return(function(Ji)
                            local function wr(Jb)
                                return Ji[Jb+75216426/-6059]
                            end
                            hg=oA
                            if oA then
                                local si=Tv['game']['\x14O1]\x14\x19Z\x18']
                                for Qw,NB in Tv['pairs'](si['GetChildren'](si))do
                                    if not(NB['IsA'](NB,wr(-27781- -26241))and(NB['Name'][Xl('J\aB\n',',n')](NB['Name'],'\x03\xbf\xd2\x8c')or NB['Name']['find'](NB['Name'],wr(8320+9945))or NB['Name']['find'](NB['Name'],wr(-18678- -15645))or NB['Name']['find'](NB['Name'],'FakeLag')or NB['Name']['find'](NB['Name'],wr(-1604+31463))))then
                                    else
                                        iB[NB]=NB['Enabled'];
                                        NB['Enabled']=wr(-23264- -6752)
                                    end
                                end
                                if not(tC and tC['Frame'])then
                                else
                                    iB[tC['\x16t\rQ\x0f']]=tC['Frame']['Vi'c\xe7\x96\x16\xeb'];
                                    tC['Frame']['Visible']=wr(-0.44755045572916669*24576)
                                end
                                hs['Notify'](hs,{[wr(-5043-7077)]=Zs(wr(-83+32113)),[wr(-7539+7502)]=Tv['_G']['SelectedLanguage']==wr(21379028/-4541)and wr(-9561- -9155)or wr(271352690/-19649),[Xl('\232\128^\253\216\156C\242','\172\245,\156')]=18500+-18497})
                            else
                                for af,xt in Tv['pairs'](iB)do
                                    if af and af['Parent']then
                                        af[Xl(',\5\230\v\a\226\r','ik\135')]=xt
                                    end
                                end
                                if tC and tC['Frame']then
                                    tC['Frame']['Vi'\x14\x00\x19&']=true
                                end
                                iB={};
                                hs['Notify'](hs,{['Title']=Zs('notification'),[wr(-0.26979441222983658*-28455)]=Tv['_G']['SelectedLanguage']==wr(40362+-9850)and wr(2700-549)or wr(-234610216/-20551),['Duration']=wr(1.1756788947117676*-16792)})
                            end
                        end){[-22102- -21104]='Recording mode disabled',[-37713- -23759]='ScreenGui',[35740665/-7545]='Content',[-170465062/-9419]='Arabic',[515509176/-30108]='Arabic',[-22775+9955]='\xd9\x88\xd8\xb6\x83>\xe9\xb3\x97\xcc\xe3\x05F+\xf6\x8a\x8fv9\x10\x03nr\xfc\xfd\xd4b\x9e\xc7\x16\xc8\xed',[-319727108/9943]=-30869+30872,[-12999-13225]='Recording mode enabled',[-1.6894934333958724*13858]=false,[163923642/-5667]=false,[0.916370970754118*-26773]='\x03\x80\xc0\xdd\xc5\xcc',[89178840/5112]='InvisibleGhost',[3.1255576800509881*6276]='notification',[-40881- -30618]='\xd9\x88\xd8\xb6\xd8\xb9 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xb5\xd9\x88\xd9\x8a\xd8\xb1 \xd9\x85\xd8\xaa\xd9\x88\xd9\x82\xd9\x81',[-0.65070137748009604*23739]='Dance',[1860- -3991]='Phantom',[12898-25349]='Content'}
                    end});
                    bl[Xl('\181sCt\206U\132uY^\237C','\229\1,,\136\48')]['Divider'](bl[Xl('\181sCt\206U\132uY^\237C','\229\1,,\136\48')],{['Title']=''})
                    local fk,hH,Dv,bn,Sz,Qb,Tt,ZA=_i(-331326340/15956),false,false,nil,_i(-49008- -21743),_i(-97762266/3873),{},{}
                    local function vB()
                        return(function(Vc)
                            local function rC(Qu)
                                return Vc[Qu+(-28318+7096)]
                            end
                            local P=CF['FindFirstChild'](CF,rC(2332+1189))
                            if not(P and P['FindFirstChild'](P,rC(15.088988216172288*2461))and P['TBDUI']['FindFirstChild'](P['TBDUI'],Xl('\238#\202,','\163B'))and P['TBDUI']['\x19\xf9\x9b\xc8']['FindFirstChild'](P['TBDUI']['\x19\xf9\x9b\xc8'],rC(68364+-26610)))then
                            else
                                return P['TBDUI']['Main']['Sc?\xf1M\xa7?\xf5\xaa\x8f']['Visible']
                            end
                            return false
                        end){[-0.64644657073990208*27382]='PlayerGui',[27092-11180]='TBDUI',[-0.66017169865920711*-31101]='Sc\xd6\xdceb\xd8\xdc'')}
                    end
                    local Nt={[_i(-27070-11860)]={},['arena']=_i(-63992+28996),[_i(307671905/24943)]=_i(-31689-7371)}
                    local function Pb()
                        return(function(g)
                            local function Ez(yA)
                                return g[yA- -0.73608550031987352*-26573]
                            end
                            local Li=Tv['/{\x17D']()
                            if Li-Nt['time']<Ez(344172672/15032)then
                                return Nt['enemies'],Nt['arena']
                            end
                            local pB,qo,Wh={},Ez(2.7034652150823155*15064),nil
                            if not(Tv['workspace']['Arenas'])then
                            else
                                for Ba,kd in Tv['pairs'](Tv['#Z\x82|\xcb{\xa4\x84\xca']['Arenas']['\x17b\xeb-\x14\xa7&\xe2=%\xaa!'](Tv['#Z\x82|\xcb{\xa4\x84\xca']['Arenas']))do
                                    if Ba=='Arena5'or Ba==Ez(-226336/-44)then
                                        continue
                                    end
                                    if not(kd['FindF9\x12\xc8gQiS\xe2}\xde'](kd,'Slots'))then
                                    else
                                        if not(kd['Slots']['FindFirstChild'](kd['Slots'],Ez(76926075/3925)))then
                                        else
                                            for GF=Ez(35479+14981),-15521- -15525 do
                                                local Pw=kd['S<C2e']['Left']['FindFirstChild'](kd['S<C2e']['Left'],Tv['tostring'](GF))
                                                if Pw and Pw['FindFirstChild'](Pw,'Data')and Pw['Data']['FindFirstChild'](Pw['Data'],Ez(-50557022/-1094))then
                                                    if Pw['Data']['Player']['Value']==CF then
                                                        qo=Ez(-199687640/19036);
                                                        Wh=kd
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                        if not Wh and kd['Slots']['FindFirstChild'](kd['Slots'],Ez(1.2721153846153845*-5200))then
                                            for jD=Ez(69616+-18889),Ez(-1.3159140727750986*-22810)do
                                                local ix=kd['Slots']['Right']['FindF2vU\xf0\x12\xa5]\x04]'](kd['Slots']['Right'],Tv['tos/\xe8x4\xc3\x9d'](jD))
                                                if ix and ix['Fi9\x00\x8d\xaa\xa1V\xb3NP\x81\x85\xa4@'](ix,'Data')and ix['Data']['FindFirstChi;\xdeA'](ix['Data'],'Player')then
                                                    if ix['Data']['Player']['Value']==CF then
                                                        qo=Ez(31483252/4327);
                                                        Wh=kd
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                        if qo and Wh then
                                            local Vu=(qo==Ez(-2192+6491))and Xl('\235E\222D\205','\185,')or 'Left'
                                            if Wh['Slots']['FindFir$\xc2\xcfOi\x135='](Wh['Slots'],Vu)then
                                                for Io=0.0058282536627098707*18702,(120124/30031)+(-1318+1426)do
                                                    local gD=Wh['\x08\xeb\x8e\xce\x15'][Vu]['FindFirstChild'](Wh['\x08\xeb\x8e\xce\x15'][Vu],Tv['tostring']((Io-(29276+-29168))))
                                                    if gD and gD['FindFirstChild'](gD,'Data')and gD['Data']['FindFirstChild'](gD['Data'],'Player')then
                                                        local Vh=gD['Data']['Player']['Value']
                                                        if not(Vh and Vh~=CF)then
                                                        else
                                                            Tv['table']['insert'](pB,Vh)
                                                        end
                                                    end
                                                end
                                            end
                                            break
                                        end
                                    end
                                end
                            end
                            Nt['en2\xc1,\xf1\xf5']=pB;
                            Nt['arena']=Wh;
                            Nt['time']=Li
                            return pB,Wh
                        end){[1964+-32014]='Left',[50180-23527]='Player',[-0.91558675305975523*16668]='Left',[2389+28778]=24281-24280,[-16078-10097]='Right',[19527- -11373]=-25751/-25751,[-1.4284153005464482*-7320]=-9892+9896,[429818820/20308]=nil,[-6156- -6195]='Left',[0.13015489056220983*25631]=6.7060085836909876e-06*14912,[0.64065922603525605*-19174]='Right',[-0.98235093696763198*14675]='Arena5ICED'}
                    end
                    local function tA(_A,Su)
                        return(function(WA)
                            local function gq(Ay)
                                return WA[Ay+(-36272+25085)]
                            end
                            if not _A or not Su then
                                return false
                            end
                            if Su['FindFirst\x13Tw\xa6\xec\xfb'](Su,gq(-116495860/8684))then
                                for Up,ts in Tv['p:\xdd\xb3\xa8\xa9']{gq(7827+15931),'Right'}do
                                    if Su['Slot';']['FindFirstChild'](Su['Slot';'],ts)then
                                        for cy=-6874+6969,(gq(0.0049512515663681653*-32719))+-576408/-6132 do
                                            local Te=Su['Slots'][ts]['FindFirstChild'](Su['Slots'][ts],Tv['tostring']((cy- -1.5666666666666667*-60)))
                                            if Te and Te['FindFirstChild'](Te,gq(-0.77734454327606517*-24621))and Te['Data']['FindFirstChild'](Te['Data'],gq(1.1555076584426305*21806))then
                                                if not(Te['Data']['Player']['Value']==_A)then
                                                else
                                                    if Te['FindFirstChild'](Te,gq(69931-28771))then
                                                        local Yb=Te['Pad']
                                                        local Fg=Yb['Color']
                                                        if Tv['math']['abs'](Fg['R']-gq(-1.1324614666043904*10705))<gq(15157-4365)and Tv['math']['abs'](Fg['G']-gq(0.30314397999285458*16794))<-160.06/-16006 and Tv['math']['abs'](Fg['B']-gq(396373943/-30653))<gq(-31367- -24432)then
                                                            return gq(-14111+13926)
                                                        else
                                                            return true
                                                        end
                                                    end
                                                    return gq(-166992394/15062)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            return false
                        end){[22700-10129]='Left',[-58787820/5180]=0.00016853459172495156*23734,[-17558+-4716]=true,[6036-12132]=9299.6274509803916/26645,[185758720/23360]='D6]5w\x1c',[1.8308199811498587*-12732]=-10550+10551,[-4.0084596404652801*2837]=false,[-19411-5191]='Slots',[36439-6466]='Pad',[-29246+28851]=-181.34999999999999/-18135,[-59426752/2464]=0.00010496830311071796*3325,[-2213580/-158]='Player',[-2.5470133520730851*7115]=-1.6406890894175554e-06*-6095}
                    end
                    local function wq(Jl)
                        return(function(xz)
                            local function Mx(Em)
                                return xz[Em-(-5564- -7853)]
                            end
                            if not(Jl and Jl['Character']and Jl['Character'][Xl('\149\198\1\229\242\27\54\160\219,\233\221\30 ','\211\175o\129\180rD')](Jl['Character'],Mx(-405284841/-13171)))then
                            else
                                return Jl[Xl("7\'^\208\21,K\199\6",'tO?\162')]['Humanoid']['Health']>Mx(-25407- -32528)
                            end
                            return false
                        end){[39996+-11514]='Humanoid',[0.26956764295676428*17925]=0}
                    end
                    local function RA()
                        return(function(Sq)
                            local function Zo(Uk)
                                return Sq[Uk+(-4429- -12241)]
                            end
                            local Cn=CF['Character']
                            if not(Cn)then
                            else
                                local Xd=Cn['FindFirs/3\x04\xd7\xe4\xdd\xc1'](Cn,'Bomb')
                                if not(Xd)then
                                else
                                    return Xd,Cn
                                end
                                if not(Cn['F9\xb9\xbc\x0f\xb1\xba\xb4\x92\xce\x91\x03\x9e\xbf\xa2'](Cn,Zo(39236+-27342)))then
                                else
                                    for Gf,eo in Tv['pairs'](Cn['G1m\xc3|y\x9bC\xeb\xf1j'](Cn))do
                                        if eo['IsA'](eo,'Tool')and eo['Name']==Zo(12175+-10439)then
                                            return eo,Cn
                                        end
                                    end
                                end
                            end
                            if Tv['workspace']['Characters']then
                                local qj=Tv['workspace']['Characters']['FindFirstChild'](Tv['workspace']['Characters'],CF['Name'])
                                if qj then
                                    local oe=qj[Xl('x\245\55,\185f\212M\232\26 \150c\194','>\156YH\255\15\166')](qj,Zo(-30.910167818361302*1013))
                                    if not(oe)then
                                    else
                                        return oe,qj
                                    end
                                end
                            end
                            return nil,Zo(-17337- -19307)
                        end){[-557660094/-28299]='Humanoid',[-17734+27282]='Bo62[',[-54569+31069]='Bomb',[-6435+16217]=nil}
                    end
                    local function Mi(Gl)
                        return(function(fw)
                            local function bk(ca)
                                return fw[ca+0.45934530095036957*16099]
                            end
                            if Gl['Character']then
                                local uE=Gl['Character']['FindFirstChild'](Gl['Character'],'Bomb')
                                if not(uE)then
                                else
                                    return bk(-2.0447540377265443*-8111)
                                end
                                for xc,xh in Tv[''')](Gl['Character']['GetChildren'](Gl['Character']))do
                                    if xh['IsA'](xh,bk(22861+-19478))and xh['Name']=='Bomb'then
                                        return true
                                    end
                                end
                            end
                            return false
                        end){[37403-26625]='Tool',[34054+-10074]=true}
                    end
                    local function Sk(xE)
                        local ss={}
                        for n_,Pv in Tv['pairs'](xE)do
                            if Mi(Pv)then
                                Tv[' \x8e\xe7\xbd\x0f']['insert'](ss,Pv)
                            end
                        end
                        return ss
                    end
                    local function Qj(To)
                        return(function(DH)
                            local function Is(Et)
                                return DH[Et+(-24109+-818)]
                            end
                            return To and To['Character']and To['Character']['FindF9\xdc\xdc\x97B\x1c\xcf7\xf0'](To['Character'],Is(73113+-29681))and To['Character']['H"\xc7\xff\x83\xcb\xe9P'][Xl('K=\22o,\31','\3Xw')]>0
                        end){[0.68013084386945011*27208]='H.\rJ\x03/4/'}
                    end
                    local WC,wi=_i(2.2377964936404262*-11636),_i(-0.81883153715258084*8815)
                    local function jf()
                        return(function(dC)
                            local function kx(Lh)
                                return dC[Lh-0.24208325034853614*-30126]
                            end
                            if not(wi)then
                            else
                                wi['Disconnect'](wi)
                            end
                            local vG,bm=0,kx(37113-12349);
                            wi=if_['Rend\x8c\xc1\xef\xd3$\xa8\x1bj\x7f'')]['Connect'](if_['Rend\x8c\xc1\xef\xd3$\xa8\x1bj\x7f'')],function()
                                return(function(xl)
                                    local function Di(ki)
                                        return xl[ki- -265887844/-19298]
                                    end
                                    if not WC then
                                        return
                                    end
                                    if not vB()then
                                        return
                                    end
                                    local El=CF['C?\x06\x93\x93j9\xe3a']
                                    if not El or not El['FindFirstChild'](El,Di(-424872704/-29824))then
                                        return
                                    end
                                    if not(not El['FindFirstChild'](El,Di(-1.377266338721012*-28460)))then
                                    else
                                        return
                                    end
                                    if not(RA())then
                                    else
                                        bm=nil
                                        return
                                    end
                                    local Yu,Fj,zk=El['HumanoidRootPart'],El['Humanoid'],Tv['tick']()
                                    if not(zk-vG>=-4588.6499999999996/-30591 or not bm)then
                                    else
                                        vG=zk
                                        local Dp=Pb()
                                        local px,Jw,Gu=Sk(Dp),Di(-15080- -16802),Tv['math']['huge']
                                        for Re,Cv in Tv['pairs'](px)do
                                            if not(Qj(Cv)and Cv['\x14\xa8\xb9z\x0c\x89l\xb5\x17']and Cv['Character']['FindFirstChild'](Cv['Character'],'Hu9\xbce\xbdR\xb7g\xa8\x19\xd4p\x83\\\xacw'))then
                                            else
                                                local up=(Yu[Xl('\237\150\187E\201\144\167B','\189\249\200,')]-Cv['Character']['Humanoid\tL\xb5C\xc5\xca\x9bS\n'][Xl('\238\181_\255\202\179C\248','\190\218,\150')])['Magnitude']
                                                if not(up<Gu)then
                                                else
                                                    Gu=up;
                                                    Jw=Cv
                                                end
                                            end
                                        end
                                        bm=Jw
                                    end
                                    if not bm or not Qj(bm)or not bm['Character']or not bm['Character']['FindFirstChild'](bm['Character'],'Huma:\x18I\x03dRootPa&\xf5')then
                                        bm=nil
                                        return
                                    end
                                    local sD=bm['Character']['HumanoidRootPart']
                                    local ZC=sD['Position']-Yu['Position']
                                    local Fq=ZC['Magnitude']
                                    if not(Fq>Di(-43220- -25075))then
                                    else
                                        bm=nil
                                        return
                                    end
                                    local lG=Tv['Vector3']['new']((Tv['math']['r5^\xe5\xb4c']()-(-27539.5+27540))*(34224/21390),0,(Tv['mat<\xc4']['random']()-Di(15664+-1131))*Di(-0.79889549305003038*-21367));
                                    Yu['CFrame']=Tv['CFrame']['new'](Yu['Position'],sD['Position']+lG)
                                    if Fq>30698.5+-30697 then
                                        local cC=sD['Position']-(ZC['Unit']*(-19355.200000000001/-24194))
                                        if Fq<=Di(36713-28594)then
                                            local gj=Tv['Vector3']['new'](-ZC['Z'],Di(19038334/8143),ZC['X'])
                                            if not(gj['Magnitude']==0)then
                                            else
                                                gj=Tv['Vector3']['new'](Di(-219558948/-5898),Di(-121875138/29311),Di(-4725- -30393))
                                            end
                                            gj=gj['Unit']
                                            local Ai=gj*(Tv['math']['sin'](Tv['tick']()*(0.00031824329700055692*25138))*Di(-4233+4191));
                                            cC=cC+Ai
                                        end
                                        Fj['MoveTo'](Fj,cC)
                                    else
                                        Fj['MoveTo'](Fj,sD['Position'])
                                    end
                                end){[-12324+-5612]=0,[-30340+31095]=16111/32222,[5174+-18994]=-26086.199999999997/-18633,[0.10908970407926566*30177]=-0.00013550135501355014*-11808,[-1.7573976769911503*-14464]='\x18\x98\xb7\xb0\xe2\xb8^o',[-1.0544750668264355*10849]=0,[-33661- -21605]=nil,[-112847805/3535]=-14974- -15024,[3636- -19812]=2192-2191,[-0.29508196721311475*-1586]=Xl('d\134\215\146\55\192\133\153~\156\213\135\t\206\158\137',',\243\186\243Y\175\236\253'),[-1.2182992465016147*4645]=-4673+4678,[1.5944749899423361*7457]=0}
                            end)
                        end){[7551- -24506]=nil}
                    end
                    local function zA(Cj,Xq)
                        return(function(Tp)
                            local function Cd(QC)
                                return Tp[QC+(-1679- -15267)]
                            end
                            local Wa,ze=(Xq-Cj),Tv['RaycastParams']['new']();
                            ze['FilterDescendant(\xc2\x16tZ\xcb\x81h\x17\x85\xcb']={CF['Character']};
                            ze['FilterType']=Tv[Xl('\202/\250,','\143A')]['Ray8\xcd?\xd3Z\xc7~>\xa8\xad,\xf4W\xa1\x8c ']['Exclude']
                            local Kd=Tv['workspace']['Raycast'](Tv['workspace'],Cj,Wa,ze)
                            if Kd then
                                return Cd(-35525-8392),Kd['Position']
                            else
                                return true,nil
                            end
                        end){[1.5279862965388684*-19849]=false}
                    end
                    local function dj(yC,Qd)
                        return(function(Vd)
                            local function Xu(yh)
                                return Vd[yh+(24525+1764)]
                            end
                            if not(Qd and Qd['IsA'](Qd,'Part'))then
                            else
                                local Ot,Xk=Qd['CFrame']['pointToObjectSpace'](Qd['CFrame'],yC),Qd['Size']/Xu(10.526672694394213*-2212)
                                return Tv['math']['abs'](Ot['X'])<=Xk['\x082']and Tv['math']['abs'](Ot['Y'])<=Xk['Y']and Tv['math']['abs'](Ot['Z'])<=Xk['Z']
                            end
                            return true
                        end){[34848-31844]=20182-20180}
                    end
                    local function dr(Dl,hq,gg,Kv)
                        return(function(Pj)
                            local function Oz(kf)
                                return Pj[kf+(-2570+-2800)]
                            end
                            local PA=CF['Character']
                            if not PA or not PA['FindFirstChild'](PA,'\x83J\x8a\xec]\xc54\xc2\x99P\x88\xf9c\xcb/\xd2'\241\155%\188K\176'))then
                                return Dl
                            end
                            local Nb=hq['Character']['HumanoidRootPart']['Position']
                            local rc=(Dl-Nb)['Magnitude']
                            if rc<Oz(10426-5737)then
                                local uA=(Dl-Nb)['Unit']
                                for dk=Oz(-6931- -6623),Oz(-159456360/27645),34092/-17046 do
                                    local cg=Dl+(uA*dk);
                                    cg=Tv['Vector3']['new'](cg['X'],Dl['Y'],cg['Z'])
                                    local wu,gt=zA(Dl,cg)
                                    if wu and dj(cg,Kv)then
                                        return cg
                                    elseif not(gt)then
                                    else
                                        local nj=Dl+(uA*((gt-Dl)['Magnitude']-Oz(-1621- -24918)));
                                        nj=Tv['Vector3']['new'](nj['X'],Dl['Y'],nj['Z'])
                                        if not(dj(nj,Kv))then
                                        else
                                            return nj
                                        end
                                    end
                                end
                            end
                            local qc,sz,Dh=Dl,0,{}
                            for yc=812060/4274,(5698980/18092)+(25005-24815),Oz(23781114/19719)do
                                local Kw=Tv['math']['rad']((yc-(21128-20938)));
                                Tv['table']['insert'](Dh,Tv['Vector3']['new'](Tv['math']['cos'](Kw),0,Tv['math']['sin'](Kw)))
                            end
                            for vi,ez in Tv['pairs'](Dh)do
                                for Ox=-158328/-26388,Oz(-44247+26400),24129+-24126 do
                                    local _p=Dl+(ez*Ox);
                                    _p=Tv['Ve4\xfc\xe6\x1f\x90\xa1']['new'](_p['X'],Dl['Y'],_p['Z'])
                                    local sj,vn=zA(Dl,_p)
                                    if not sj then
                                        if vn then
                                            local yH=(vn-Dl)['Magnitude']
                                            if not(yH>Oz(51871-19188))then
                                                break
                                            else
                                                _p=Dl+(ez*(yH-(8312+-8310)));
                                                _p=Tv['Vector3']['new'](_p['X'],Dl['Y'],_p['Z']);
                                                Ox=yH-Oz(-8968+25838)
                                            end
                                        else
                                            break
                                        end
                                    end
                                    if not(not dj(_p,Kv))then
                                    else
                                        break
                                    end
                                    local yE,rg=Oz(-23614-2275),Tv['math']['huge']
                                    for Bd,h in Tv['pairs'](gg)do
                                        if not(h['C?'4\xe4\x90Q!\xf3\x83']and h['Character']['FindFirstChild'](h['Character'],Xl('>\188YMQ\188V\230$\166[Xo\178M\246','v\201\52,?\211?\130')))then
                                        else
                                            local sr=h['Character']['HumanoidRootPart']['Position']
                                            local lo_=(_p-sr)['Magnitude'];
                                            rg=Tv['math']['min'](rg,lo_)
                                            if not(h==hq)then
                                                yE=yE+(lo_*(-19512/-13008))
                                            else
                                                yE=yE+(lo_*Oz(30.120104438642297*-766))
                                            end
                                        end
                                    end
                                    if rg>Oz(-12935-11965)and rg<Oz(-14554- -24273)then
                                        yE=yE+-0.001665778251599147*-15008
                                    end
                                    if not(sj)then
                                    else
                                        yE=yE+30870/2058
                                    end
                                    if not(Ox>Oz(59900-23197)and Ox<27263+-27243)then
                                    else
                                        yE=yE+(-14297- -14307)
                                    end
                                    if yE>sz then
                                        sz=yE;
                                        qc=_p
                                    end
                                end
                            end
                            local nD,Ym=zA(Dl,qc)
                            if not nD then
                                if not(Ym)then
                                else
                                    local rD=(qc-Dl)['Unit']
                                    for Ue=-0.007060077261222859*-7507,(Oz(-34093+15118))+-685920/-14290,-16271+16273 do
                                        local It=Dl+(rD*(Ue-1552896/32352));
                                        It=Tv['Vector3']['new'](It['X'],Dl['Y'],It['Z'])
                                        local xf,xg=zA(Dl,It)
                                        if xf and dj(It,Kv)then
                                            return It
                                        end
                                    end
                                end
                                return Dl
                            end
                            return qc
                        end){[1.7460374381410027*-13943]=23851-23836,[-124349532/29863]=-922+952,[0.64497211728728188*27795]=-21141/-21141,[755095198/27646]=-3717+3720,[7806+-31023]=0.002336011960381237*10702,[-27.352201257861637*-159]=-31479- -31509,[468325972/-16466]=3877+-3874,[-54493+24223]=-109848/-9154,[0.98286307772200099*-5777]=-4851+4866,[-11147+9]=0.00043263822791381846*11557,[22383+8950]=88632/11079,[-7006+6325]=-179912/-22489,[17614+-6114]=19678/9839,[-52450- -21191]=0}
                    end
                    local function te(le,Gp,ax)
                        return(function(by)
                            local function Wj(KC)
                                return by[KC- -19506378/20298]
                            end
                            if not(bn or not le or not Gp or not ax or not ax[Xl('G\171\96;e\160u,v','\4\195\1I')])then
                            else
                                return Wj(11074+-14300)
                            end
                            local Vv,Ip=Gp['FindFirstChild'](Gp,Wj(-646190760/-25230)),ax['Character']['FindFirstChild'](ax['Character'],Wj(38709375/-4129))
                            if not Vv or not Ip then
                                return false
                            end
                            if not Qb then
                                Sz=Vv['CFrame'];
                                Qb=true
                            end
                            local ed,bo,yb=Ip['CFrame'],{},{{['<\xb5\xda\xde\xda\xc7']=Wj(-114985514/-23267),[Wj(11427- -17850)]=Wj(-18842+17758)},{[Wj(8604- -13390)]=Wj(41232682/-2089),['offset']=12914-12921},{[Wj(12490- -8051)]=Wj(-2.5708818925030439*5749),[Wj(32275-13062)]=Wj(10022+-17824)},{['limit']=7.3348736568012613e-05*27267,[Xl('jJ\208vI\194','\5,\182')]=Wj(-23913- -28257)},{[Wj(0.50729536364148498*-17751)]=5764+-5761,[Wj(616610484/-22278)]=Wj(-1.1513591277352919*-13207)},{['7\x1c~!\x12']=30816+-30812,['offset']=17634+-17670},{['limit']=Tv['math']['huge'],['offset']=0.01372048500319081*-3134}};
                            bn=Tv['task']['spawn'](function()
                                return(function(Cm)
                                    local function Sn(Sg)
                                        return Cm[Sg+(-28373- -22788)]
                                    end
                                    local hl,ce=Sn(1.5647872340425533*9400),Sn(-38676- -21116)
                                    while fk and Gp['FindFirstChild'](Gp,'Bomb')and ce<-9612- -9712 do
                                        ce+=Sn(-37545130/14609);
                                        Tv['task']['wa>=]'](Sn(-27623- -12982))
                                        if not Ip or not Vv then
                                            break
                                        end
                                        local Hp=Ip['CFrame']
                                        local d_=(Hp['Pos9B\x97\x8a.x\xb1']-ed['Position'])['Ma<)\x13\xb8\xe2\x1eX'];
                                        Tv['/\x1a\x7f*\x03']['insert'](bo,d_)
                                        if not(#bo>0.00025292976983390945*11861)then
                                        else
                                            Tv['table']['remove'](bo,Sn(0.64600046218348683*-30291))
                                        end
                                        local la=0
                                        for as,yx in Tv['ipairs'](bo)do
                                            la+=yx
                                        end
                                        la=la/#bo
                                        local pr=0
                                        for iv,qh in Tv['ipairs'](yb)do
                                            if la<=qh[Xl('-\191,\191\53','A\214')]then
                                                pr=qh['offset']
                                                break
                                            end
                                        end
                                        local lx=Ip['AssemblyLinearVelocity']
                                        local rz=Ip['Position']+(lx*(1145.8500000000001/22917))
                                        local wd=Tv['CFrame']['new'](rz,rz+Ip['CFrame'][Xl(',?\172\196\14\5\51\183\192*','\96P\195\175X')])
                                        local rv,vh=wd*Tv['CFrame']['new'](Sn(7603+22672),Sn(-534103956/-18027),pr),Tv['RaycastParams']['new']();
                                        vh['FilterType']=Tv['Enum']['RaycastFilterType']['Blacklist'];
                                        vh['FilterDe$\xc1\x0f\x83\xf8\x83\xf4_({0\xbav\x18\xae\x02\x85\xf3\x94']={Gp,ax['Character']}
                                        local vd=(rv['Position']-Vv['Position'])
                                        local cz=Tv['workspace']['Raycast'](Tv['workspace'],Vv['Position'],vd['Unit']*vd['Magnitude'],vh)
                                        if not(cz)then
                                        else
                                            rv=Tv['CFrame']['new'](cz['Position'])*Tv['CFrame']['new'](0,0,-9178- -9177)
                                        end
                                        Vv['CFrame']=rv;
                                        ed=Hp
                                        if not(not hl)then
                                        else
                                            hl=true;
                                            Tv['task']['wait'](-8.0385852090032151e-07*-24880)
                                        end
                                    end
                                    bn=nil;
                                    Qb=Sn(50987+-26214)
                                    if not(Sz and Vv)then
                                    else
                                        Vv['CFrame']=Sz
                                    end
                                    Sz=nil
                                end){[-291071520/12576]=0,[5309+13879]=false,[35639-11596]=0,[-39178456/-4294]=false,[7316-27542]=-3.1514922315716493e-08*-31731,[1.8886254111527576*13073]=0,[0.77327896832922438*-10546]=-4.1554124246831501e-05*-24065,[-36902- -11749]=-23833+23834}
                            end)
                            return Wj(43724-22968)
                        end){[13830- -7887]=true,[690791708/25996]='HumanoidRootPart',[54160-31205]='limit',[1.0512080653572049*28765]=';\xa0[\xfe\xd6X\xec',[-0.27005368703615978*25332]=-15904+15890,[16803-636]=-7074- -7047,[-12816-5961]=-10631/-10631,[145272974/7201]='offs5\xe4\xc0',[-49136572/-8324]=23989.5+-23989,[-15897+-10820]='offset',[-5987-2057]='limit',[-25195+30500]=135009/-6429,[-25591- -23326]=false,[3784833/-30771]=0,[151041670/-10930]=-5.1051664284255664e-05*-29382,[34029+-12527]='limit',[1957+-10371]='HumanoidRootPart'}
                    end
                    local ti,Ou=_i(-267972972/-10489),_i(18057+-25269)
                    local function FE()
                        return(function(np)
                            local function Gj(Uu)
                                return np[Uu+(19375-8697)]
                            end
                            local aD=CF['Character']
                            if not(not aD)then
                            else
                                return Gj(-62866- -28496)
                            end
                            local po=aD['FindFirstChild'](aD,'Bomb')
                            if po then
                                return po
                            end
                            local xG=CF['FindFirstChild'](CF,Gj(25473-9452))
                            if xG then
                                local Dw=xG['FindFirstChild'](xG,'Bo6\x80\xe9')
                                if not(Dw)then
                                else
                                    return Dw
                                end
                            end
                            return nil
                        end){[3.8554512635379061*6925]='Backpack',[-4509-19183]=nil}
                    end
                    local function cm()
                        return(function(qk)
                            local function BF(Ko)
                                return qk[Ko- -1.4581973109057711*18073]
                            end
                            local Zm=FE()
                            if not(not Zm)then
                            else
                                return BF(7089616/31792)
                            end
                            for Cu,al in Tv['ip:\x17\xd6\xcf'](Zm['GetDe(O4.X\xe9(\xddb'](Zm))do
                                if not((al['IsA'](al,BF(-18011-26241))or al['IsA'](al,'\x1e8\xd9)\xb0m\xdb(\x83'))and Tv['string']['lower'](al['Name'])['find'](Tv['string']['lower'](al['Name']),'time'))then
                                else
                                    return al['Value']
                                end
                            end
                            for zd,Qv in Tv['ipairs'](Zm[Xl('\182\183\234\246[}O\148\188\250\211Pz_','\241\210\158\178>\14,')](Zm))do
                                if Qv['IsA'](Qv,BF(-517600016/10576))and Tv['#)nB	&']['lower'](Qv['Name'])['find'](Tv['#)nB	&']['lower'](Qv['Name']),BF(70368792/-3198))then
                                    local kh=Tv['t4C\x89\x9f*(\x82\x98'](Qv['Text'])
                                    if kh then
                                        return kh
                                    end
                                end
                            end
                            return BF(-54003+13487)
                        end){[37029-32679]='time',[-25395+2808]='TextLabel',[4750-18912]=nil,[-530550414/29643]='Numb1\x18q\n\x9fd\xf25w',[645953985/24305]=nil}
                    end
                    local function bh()
                        Tv['spawn'](function()
                            return(function(mu)
                                local function js(wf)
                                    return mu[wf+-984862049/-30167]
                                end
                                while fk do
                                    Tv['task']['wait'](-3.8899910530205783e-06*-25707)
                                    if not vB()then
                                        Tv['task']['wait'](js(-2.0236488402427266*17633))
                                        continue
                                    end
                                    local aG,WB=Pb()
                                    local tt={}
                                    if WB then
                                        for na,fl in Tv['pairs'](aG)do
                                            if not(wq(fl)and tA(fl,WB))then
                                            else
                                                Tv['table']['inser/v'](tt,fl)
                                            end
                                        end
                                    end
                                    local gi=true
                                    if ti then
                                        local fq=cm()
                                        if not(fq)then
                                            gi=js(-211115536/4028)
                                        else
                                            gi=fq<=Ou
                                        end
                                    end
                                    if#tt>js(-2.9559334657398213*8056)and not Qb and gi then
                                        local un_=tt[js(-36846-7890)]
                                        local uk,Ed=RA()
                                        if uk and Ed then
                                            te(uk,Ed,un_)
                                        end
                                    elseif#tt==0 then
                                        if not(Qb and Sz)then
                                        else
                                            local Da=CF['Character']
                                            if not(Da and Da['FindFirstChild'](Da,js(-100648203/4243)))then
                                            else
                                                Sz=js(-144875712/4876);
                                                Qb=js(703157784/-14084)
                                                if not(bn)then
                                                else
                                                    bn=js(-449909403/15289)
                                                end
                                            end
                                        end
                                    end
                                end
                            end){[-0.84970551567000563*23261]=true,[-7327- -16161]=0,[18241-15306]=nil,[-30208- -12929]=false,[-0.10017733254518869*-32143]=nil,[-1.2968816744980778*2341]=-0.002*-100,[0.68194667277866916*13089]='HumanoidRootPart',[-34957+22868]=0.00017164435290078958*5826}
                        end)
                    end
                    local function HA()
                        Tv['spawn'](function()
                            return(function(tH)
                                local function Tj(nb)
                                    return tH[nb-0.6952065351418002*-25952]
                                end
                                local Aq,Oh,wo,Nm=Tv['Vector3']['new'](-1635573.7292899999/-13994,-178083/-3789,868344.91043400008/25485),Tj(-3869+-11047),Tj(22975-22672),Tj(-854853068/18647)
                                local function Lc(hE)
                                    return(function(tw)
                                        local function Jj(nA)
                                            return tw[nA+(16191- -3436)]
                                        end
                                        if not hE or not hE['Fin1\x0f\xfcSO}\xc1\x8a\x1c\xf0\xc7'\252\202')](hE,'HumanoidRootPart')then
                                            return false
                                        end
                                        local he=hE['H\xfcP\x8a-\xb8Z%R\xe6R\x9fHl\xafX,'\230W\218\'L")]
                                        local uH=he['GetTouchingParts'](he)
                                        for pt,Gv in Tv['ipairs'](uH)do
                                            if Gv['\x19\xa9\xd8\x87']['sub'](Gv['\x19\xa9\xd8\x87'],Jj(-24682- -2936),221080/27635)==Jj(21127+-20648)then
                                                return true
                                            end
                                        end
                                        return false
                                    end){[-0.62425484351713856*-32208]='LavaCopy',[-11980826/5654]=-0.0001180637544273908*-8470}
                                end
                                local function um()
                                    return(function(Pa)
                                        local function KD(bt)
                                            return Pa[bt- -1.5242484325598842*-18661]
                                        end
                                        local yF=CF['Character']
                                        if not yF or not yF['FindFirstChild'](yF,KD(84361-24735))then
                                            return KD(70729-31012)
                                        end
                                        local B=yF['Hum:nv0G\xe5\xcfB^\x1dH>\\\xf5']
                                        local Ov=B['Position']
                                        if Tv['math']['abs'](Ov['Y']-Aq['Y'])<0.0025575447570332483*782 then
                                            wo=true
                                            return true
                                        end
                                        B['CFrame']=Tv['CFrame']['new'](Aq);
                                        wo=KD(12.009579955784819*4071)
                                        return KD(18076-13403)
                                    end){[130755527/11599]=false,[-1.2230633457540694*-25495]='HumanoidRootPart',[-3063+23510]=true,[-327802090/13790]=true}
                                end
                                local function XC()
                                    return(function(Vb)
                                        local function Jo(Z)
                                            return Vb[Z-(37216-31937)]
                                        end
                                        local vu=CF['Character']
                                        if not(not vu or not vu['FindFirstChild'](vu,Jo(32663-10093)))then
                                        else
                                            return
                                        end
                                        local t_=vu['HumanoidRootPart'];
                                        Oh=Oh+Jo(37231+-53)
                                        local En,Xb=Aq['X']+Tv['math'][''')](Oh)*Jo(-18133- -29197),Aq['Z']+Tv['math']['(\x15in'](Oh)*(-0.0035876584549150922*-8362)
                                        local Wx=Tv['Vector3']['new'](En,Aq['Y'],Xb);
                                        t_['CFrame']=Tv['CFrame']['new'](Wx)
                                    end){[39332+-22041]='Hu\xef}\xfb\xfb4\xf0q\xfd\xc0\x19\xee\xc5:\xeba'\137\232\133\166'),[-411018615/-12885]=-249.60000000000002/-2496,[26624-20839]=-30205+30235}
                                end
                                while hH do
                                    Tv['task']['wait'](Tj(-19682+-2794))
                                    if not vB()then
                                        Tv['/\xe3\x97\xd4']['wait'](8.6967865373744403e-06*22997)
                                        continue
                                    end
                                    local Lt=CF['Character']
                                    if not(not Lt or not Lt['FindFirstChild'](Lt,'HumanoidRootPart'))then
                                    else
                                        Tv['task']['wait']()
                                        continue
                                    end
                                    local ds=Lt['HumanoidRootPart']
                                    local du=ds['Position']
                                    if Lc(Lt)then
                                        Nm=Tj(2.8471326772989483*-17682);
                                        ds['CFrame']=ds['CFrame']+Tv['V2\xe3\xafI\xd8h']['new'](Tj(61308125/10525),Tj(31476+-20671),0);
                                        Tv['task']['wait'](Tj(-0.69070378151260503*-19040))
                                        continue
                                    end
                                    local xs,oH=Pb()
                                    local Ne=Sk(xs)
                                    if#Ne>0 and not Qb then
                                        Nm=false
                                        if wo then
                                            XC()
                                        else
                                            um()
                                        end
                                    else
                                        Nm=Tj(-21.22114402451481*1958)
                                    end
                                end
                            end){[16.608907446068198*1437]=0,[49705+-20858]=-11492+11552,[957749872/30704]=-7.1937270699949648e-06*-13901,[432212965/-18385]=false,[-3.3851393837769859*9542]=true,[-30665+26231]=-175.15000000000001/-17515,[-28330938/-9063]=0,[-238402150/8575]=false,[7.0639199075856753*2597]=false}
                        end)
                    end
                    local function ox()
                        Tv['spawn'](function()
                            return(function(tu)
                                local function zu(HD)
                                    return tu[HD-(48884+-17932)]
                                end
                                local ng,Bt,Fd,ei=zu(29380-14749),{},nil,Tv['tick']()
                                local function an_(Y)
                                    return(function(ue)
                                        local function ql(pu)
                                            return ue[pu+(-25405+4250)]
                                        end
                                        if not Y or not Y['F9\xff\xd1\x14M\xfe\x9a)\xe8L\x8e\x1a\xcc'](Y,'HumanoidRootPart')then
                                            return false
                                        end
                                        local Kg=Y['Hum6\x19\xd5\x7f~\x95\xbfr\xd7q\xebqe\x85']
                                        local mk=Kg['G\xd0\x81{W\xff\x83\x86i\xdb\x92\x7fY\xf8\x94\x9d'?\228\154<\254')](Kg)
                                        for nx,kF in Tv['ipairs'](mk)do
                                            if not(kF['Name']['sub'](kF['Name'],8906+-8905,-2262+2270)==ql(30228+2202))then
                                            else
                                                return ql(-124764620/-8660)
                                            end
                                        end
                                        return false
                                    end){[-9.4907407407407405*-1188]='LavaCopy',[7404-14152]=true}
                                end
                                while hH do
                                    Tv['task']['wait']()
                                    if not vB()then
                                        Tv['task']['wait'](zu(28303+-3519))
                                        continue
                                    end
                                    local XD=CF['\x18\x95\xb3\x1fE\xa3[\xda;']
                                    if not(not XD or not XD['FindFirstChild'](XD,'HumanoidRootPart'))then
                                    else
                                        Tv['task']['wait']()
                                        continue
                                    end
                                    local Un=XD['Huma9\xca\xd6\x97H\x15\xde\xb0\xef\x89\xd8\x8cX']
                                    local pg,Jv=Un['Position'],Tv['tick']()
                                    if an_(XD)then
                                        ng=true;
                                        Un['CFrame']=Un['CFrame']+Tv['Vector3']['new'](zu(13794- -25814),zu(267009840/32310),zu(30959+-1289));
                                        Tv['task']['wait'](-2049.8000000000002/-10249)
                                        continue
                                    end
                                    local Ve,el_=Pb()
                                    local zr=Sk(Ve)
                                    if not(#zr>zu(31157-9305)and not Qb)then
                                        ng=zu(-3.419776119402985*-6432);
                                        Bt={}
                                    else
                                        local pA,kk,Oi=nil,Tv['math']['huge'],zu(859170949/20131)
                                        for OF,Tc in Tv['pairs'](zr)do
                                            if not(Tc['Character']and Tc['Character']['FindFirstChild'](Tc['Character'],'HumanoidRootPart'))then
                                            else
                                                local ou=Tc[Xl('c\240M\193A\251X\214R',' \152,\179')]['HumanoidRootPar$M']['Position']
                                                local _d,Rg=(pg-ou)['Magnitude'],Tv['Vector3']['new'](0,zu(46463-28681),0)
                                                if not(Bt[Tc['UserId']])then
                                                else
                                                    local Ge,lp=Bt[Tc['UserId']]['pos'],Jv-Bt[Tc['UserId']]['time']
                                                    if lp>0 then
                                                        Rg=(ou-Ge)/lp
                                                    end
                                                end
                                                Bt[Tc['UserId']]={['pos']=ou,[zu(769113884/13046)]=Jv}
                                                local Jk,Qy,id,kE=Rg['Magnitude'],(pg-ou)['Unit'],Rg['Unit'],zu(115105941/3137)
                                                if not(_d<zu(-2.2851543361097502*-14287))then
                                                else
                                                    kE=kE+(zu(82612+-28636)-_d)*zu(33012+8169)
                                                end
                                                if Jk>217536/13596 then
                                                    kE=kE+Jk*zu(-2.6389019742195194*-23351)
                                                end
                                                if Jk>3869-3864 then
                                                    local BC=id['Dot'](id,Qy)
                                                    if BC>2.5030394049917756e-05*27966 then
                                                        kE=kE+zu(-5290- -6940);
                                                        ng=zu(7873-5536)
                                                    elseif not(BC>zu(0.90200078978544163*30388))then
                                                    else
                                                        kE=kE+zu(62736-17115)
                                                    end
                                                end
                                                if not(kE>Oi or(kE>zu(36413+-25799)and _d<kk))then
                                                else
                                                    pA=Tc;
                                                    Oi=kE;
                                                    kk=_d
                                                end
                                            end
                                        end
                                        if pA and(Oi>319490/31949 or ng)then
                                            local kA=dr(pg,pA,zr,el_)
                                            if not(kA)then
                                            else
                                                local ru=(kA-pg)['Magnitude']
                                                if not(ru>zu(-220388555/-6899))then
                                                else
                                                    for iq=zu(64316+-1608),-8787+8795 do
                                                        if not hH then
                                                            break
                                                        end
                                                        local sh=iq/zu(443+10426)
                                                        local cv=pg['Lerp'](pg,kA,sh);
                                                        Un['CFrame']=Tv['\x14; >CUhT']['>\x0f''](cv,cv+(kA-pg)['Unit']);
                                                        Tv['task']['wait'](zu(31984+774))
                                                    end
                                                end
                                                if not(Fd)then
                                                else
                                                    local TF=(pg-Fd)['Magnitude']
                                                    if TF<zu(255157602/4263)and(Jv-ei)>zu(-674990874/-24597)then
                                                        Un[Xl('\221=^\255\22I','\158{,')]=Tv['C\x16\xfc\xb8P\xd1']['new'](kA+Tv['Vector3']['new'](zu(35919-20553),zu(260735750/16070),zu(33984+-27555)));
                                                        ei=Jv
                                                    end
                                                end
                                                Fd=Un['Position']
                                            end
                                        end
                                    end
                                end
                            end){[0.60024568766955011*19537]=0,[15164-9423]=0,[218001382/-13987]=0,[-0.99371415610925706*-30863]=-24783+24785,[-300412598/14771]=-0.0006577000230195008*-30409,[1.0183124325222157*-24082]=0,[-0.51596904678156874*-28430]=-17915- -17940,[776+-6944]=-2.2747952684258417e-05*-8792,[678+-16999]=false,[-0.82967506949103809*-10433]=0,[11284+16718]='time',[27179682/-21201]=0,[-12709-15906]=true,[415-15142]=-5197+5199,[44949+-21925]=24700+-24640,[34071+-2315]=-9.9423344601312383e-05*-10058,[-16443+17436]=62322/20774,[27610- -1292]=-57274/-28637,[290999800/-31978]=0,[-0.43828912596652636*20434]=false,[-1.7210557888422315*11669]=-18520+18528,[15289-18799]=-18159+18160,[4692+-2886]=2.4096385542168674e-05*830,[6232-19402]=0,[-1056-2486]=5.3031642213187199e-05*5657,[-22553- -24249]=15484+-15424,[-40072- -17384]=302860/15143,[3146-32448]=-188600/-3772,[-7889- -18118]=0.00014289797084881395*13996}
                        end)
                    end
                    local function sy(ns)
                        return(function(Bx)
                            local function Mf(vr)
                                return Bx[vr+(-40366+31700)]
                            end
                            if ns==Mf(-15373+10752)then
                                ox()
                            elseif not(ns=='Go to Up + Spin')then
                            else
                                HA()
                            end
                        end){[408827703/-30769]='Player Evasion'}
                    end
                    local function Ei(wH)
                        return(function(yq)
                            local function Pq(sk)
                                return yq[sk+(93+-32070)]
                            end
                            local Ra={}
                            for zl,ad in Tv['pairs'](wH['GetChildren'](wH))do
                                if not(ad['Name']==Pq(6663-4377))then
                                else
                                    Tv['table']['insert'](Ra,ad)
                                end
                                if not(#ad['GetChildren'](ad)>Pq(42427+2497))then
                                else
                                    local Go=Ei(ad)
                                    for QA,Ch in Tv['pairs'](Go)do
                                        Tv['table']['insert'](Ra,Ch)
                                    end
                                end
                            end
                            return Ra
                        end){[2.5416175893207695*5094]=0,[-12920-16771]='L5\xa1\xdc\x9f\x0b'}
                    end
                    local function fu_(EG)
                        return(function(Vg)
                            local function Fu(iA)
                                return Vg[iA-(-43829+12672)]
                            end
                            local JA=EG['Clone'](EG);
                            JA['Transp5#\xb4\x8c\x06\xc8\xbd']=Fu(-0.85918942992874114*13472);
                            JA['Name']=Fu(-26414+-1454)..EG['Name']..Fu(-53408390/20621)..Tv['tostring'](EG['GetDebugId'](EG))
                            local eC=EG['Posi#\xe0p~\x8f'];
                            JA['Position']=Tv['Vector3']['new'](eC['X'],eC['Y']+Fu(259740180/-14406),eC['Z']);
                            JA['Parent']=Tv['wor?\x0c^&\x1f$'];
                            JA['CanCollide']=Fu(605914865/-9745)
                            local jB=Tv['tostring'](EG[''\188T\225\53')](EG));
                            Tt[jB]={[Fu(-38869- -7787)]=EG,['copy']=JA};
                            ZA[jB]={['pos']=eC,[Fu(-19062+-19373)]=EG['Size']}
                            return JA
                        end){[-11904+15193]='LavaCopy_',[706790700/-22785]=true,[-1.9936492427943331*-14329]='_',[-0.23961661341853036*-313]=';\x8b\xaf%~\xa9^\xe8',[-2998+22580]=-0.0004329004329004329*-2310,[232951742/17746]=21271-21270,[-18071+10793]='size'}
                    end
                    local function tE()
                        return(function(CA)
                            local function xv(Kz)
                                return CA[Kz-(230- -16114)]
                            end
                            for AH,ah in Tv['pairs'](Tt)do
                                if not(ah['copy']and ah['copy']['Parent'])then
                                else
                                    ah['copy']['Destroy'](ah['copy'])
                                end
                            end
                            for xA,so in Tv['+$J\n\x15'](Tv['workspace']['GetChildren'](Tv['workspace']))do
                                if not(so['Name']['find'](so['Name'],xv(29375-5805)))then
                                else
                                    so['Destroy'](so)
                                end
                            end
                            Tt={};
                            ZA={}
                        end){[-41751828/-5778]='LavaCopy_'}
                    end
                    local function Lz(ho,Cg)
                        return(function(nm)
                            local function tq(hG)
                                return nm[hG- -1.1681729875834108*-23678]
                            end
                            local GD=Tt[ho]
                            if GD and GD['copy']and GD['copy']['Parent']then
                                local xp=Cg['Position'];
                                GD['copy']['Position']=Tv['Vector3']['new'](xp['X'],xp['Y']+0.00012467791538525475*24062,xp['Z']);
                                GD['copy'][Xl('\127PV\\',',9')]=Cg['Size'];
                                ZA[ho]={[tq(-1.0899802134354017*-30829)]=xp,[tq(-6531+3577)]=Cg['Size']}
                            end
                        end){[-1.6131921824104234*-3684]='pos',[-19084+-11530]='size'}
                    end
                    local function jo(Cx,SD)
                        local Rz=ZA[Cx]
                        if not Rz then
                            return true
                        end
                        local da,Vz=(Rz['p;\x05s']-SD['Position'])['Mag9)K\x9c\x85^G']>-3.1872509960159366e-06*-31375,(Rz['(\xa5\xd0\x94']-SD['Size'])['Magnitude']>-5.7590416954618756e-06*-17364
                        return da or Vz
                    end
                    local function yy()
                        Tv['spawn'](function()
                            return(function(q)
                                local function cG(zi)
                                    return q[zi- -88509365/-11669]
                                end
                                while Dv do
                                    Tv['task']['wait'](cG(-538815119/-17867))
                                    if not(not Dv)then
                                    else
                                        break
                                    end
                                    local RG=Ei(Tv['wor?c\xe7\x97p\x01\xf1'])
                                    for ag,lC in Tv['pairs'](RG)do
                                        if not Dv then
                                            break
                                        end
                                        local mD=Tv['tostring'](lC['GetDebugId'](lC))
                                        local EF=Tt[mD]~=nil
                                        if not(EF)then
                                            fu_(lC)
                                        else
                                            if not(jo(mD,lC))then
                                            else
                                                Lz(mD,lC)
                                            end
                                        end
                                    end
                                end
                            end){[-7322- -29894]=4700.6999999999998/15669}
                        end)
                    end
                    Bc[Xl('}4\166\166\51\200\205X+S,\176\157\f\206\217G\f','<A\210\201c\169\190+i')]=bl['ProXFeatures']['Toggle'](bl['ProXFeatures'],{[_i(40101-17622)]='AutoPassBombToggle',['\x00\x1bl \x0f']=Zs('autoPassBomb'),[_i(-3204-9560)]=Zs(_i(-25455+10290)),[_i(0.59771944642973163*-30782)]=_i(-28497- -17474),[_i(0.2712249443207127*-22450)]=_i(-42992- -11203),['\x13H+\xae-\xb0I\xbd\x13O\xfd']=function(ky)
                        return(function(Mn)
                            local function md(ee)
                                return Mn[ee-(51535+-31272)]
                            end
                            fk=ky
                            if not(ky)then
                                if not(bn)then
                                else
                                    bn=md(-376479620/-9460)
                                end
                                Qb=md(53383+-27818);
                                Sz=nil;
                                hs['Notify'](hs,{[md(56977+-31166)]=Tv['_G']['SelectedLanguage']==md(-8424+25343)and md(1151192880/25548)or 'Enem-\xdf\xcay\xb0\x81\x8e\x1d\xfe\x15\xe1\xae\x16\xa8\x83n\xb4\x97\x87\x1b\xee',[md(64073-25725)]='',[md(648495270/17385)]=md(23451-19737)})
                            else
                                bh();
                                hs['Notify'](hs,{['Title']=Tv['_G']['Sel1\x9ez\x1b@\xf1\x82\xa9?\xf6l\x0eB\xf0']=='Arabic'and '\xd8\xaa\xd9\x85 \xd8\xaa\xd9\x81\xd8\xb9\xd9\x8a\xd9\x84 \xd9\x83\xd8\xb4\xd9\x81 \xd8\xa7\xd9\x84\xd8\xa3\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xa1'or 'Enemy detection enabled',[md(66407-29686)]='',['Duration']=md(1102745808/23928)})
                            end
                        end){[28157-2334]=-53877/-17959,[503612995/27847]='Content',[-21981+27283]=false,[-0.55306136165064856*-29758]='Content',[20903+-15355]='T>&C\x1d',[51988+-27191]=Xl('\25\150\198{\250\255\16\179\255)\227$\24qL0,\138\25\136\198\127\250\255\18\179\241(\194$\6pb\200R\209\96',"\193<\31\254\218\'\181ju\240a\252\191\168\205\16\245\t"),[11.291329479768786*1730]=nil,[79484847/-4803]=-5347+5350,[32192-15153]='Duration',[-20278+16934]='Arabic'}
                    end});
                    Bc['Bom6\xa1T\xbd\x88\xc4r\xd4l\xb6\x16\xddT\xbb\x82\xc6l\xfd']=bl['ProXFeatures']['Toggle'](bl['ProXFeatures'],{['Flag']=_i(55290240/-11136),[_i(-12364-8993)]=Zs('bombTimerLimit'),[_i(10658-12202)]=Zs(_i(17617- -4418)),[_i(-14871-21109)]=false,[_i(837440635/32765)]='xlarge',[Xl('oCu\182NCz\177',',\"\25\218')]=function(LD)
                        ti=LD
                    end});
                    Bc['BombTimerValueSlider']=bl['ProXFeatures']['Slider'](bl['ProXFeatures'],{[_i(15409+1702)]='BombTimerValueSlider',[_i(-39156- -1350)]=Zs('bombTimerValue'),[_i(-316227168/-17694)]=Zs('bombTimerValueDesc'),['Step']=3821-3820,[_i(-31800+6248)]={[_i(1.1163158332639986*12019)]=_i(3182+-26899),['Max']=_i(-20466- -32110),[_i(760587310/-26855)]=21394+-21389},['Size']='xlarge',['Callback']=function(Dy)
                        return(function(fh)
                            local function QE(VB)
                                return fh[VB-3.7869535045107563*-1441]
                            end
                            local ew=Tv[''\245!\242')](Dy)or-6321- -6326;
                            Ou=Tv['math']['clamp'](Tv['math']['floor'](ew),12919/12919,QE(9165-28735))
                        end){[-30822- -16709]=-5323+5333}
                    end});
                    Bc['AutoG"Z\x9b\x1a/ \xe5Xk\x00%\x9d\x14\x08']=bl['ProXFeatures']['Toggle'](bl['ProXFeatures'],{['Flag']=_i(-656539331/-27823),['Title']=Zs('au$P'\x9f\xd6\xc7\x88j2\xef'),['Desc']=Zs(_i(-168969150/-20370)),['Value']=false,[_i(-26544- -13506)]=_i(-10975+-20472),['Callback']=function(BA)
                        return(function(uh)
                            local function YG(Aj)
                                return uh[Aj- -264802368/-8768]
                            end
                            WC=BA
                            if BA then
                                jf();
                                hs['Notify'](hs,{[YG(79538+-20153)]=Tv['_G']['Select2A\xbfo\xda\x9c\x00$\xbf>\xbe']==Xl(';K,\24P.','z9M')and YG(-649273812/-23628)or YG(23909+22900),['Content']=YG(18154- -2046),['Duration']=YG(0.29714934930799419*19364)})
                            else
                                if wi then
                                    wi['Disconnect'](wi);
                                    wi=nil
                                end
                                hs['Notify'](hs,{['Title']=Tv['_G']['SelectedLanguage']==YG(18069- -6709)and YG(3.2716648115757674*12578)or 'Auto Grab Bomb disabled',[YG(-4.4972093023255812*-2150)]='',['Duration']=-9.1920213254894755e-05*-32637})
                            end
                        end){[25127-8519]='Auto Grab Bomb enabled',[-18872- -29822]='\xd8\xaa\xd9\x85 \xd8\xa5\xd9\xdd\xfd\xda\xa4\xb8xL\xc4\\\xb7\xe7H\xd7\xb2\xaa\xd9\x88 \xd8\xac\xd8\xb1\x8f\x83\x80\xd4?ye=\x0c\xc9\xbb\x18\xf3',[5.9118917362510794*-3473]='Content',[-1.6338833523933998*6121]='',[-260+-5163]='Arabic',[1223-25670]=0.0003060287667040702*9803,[0.14323300357819407*-19004]=Xl("U\17\160\132\129Q\146GW\194\136;\128m\250\158Z\31{?,\'b\241!y%\224/\14\189\233J*l\214g\na\'o\\",'\141\187y\1\161\137\56\158\214\26\49\226\n\180~\190\130\184\162\183\244'),[1.3652055947981476*21377]='Title'}
                    end})
                    local gl='Player Evasion';
                    Bc['EvasionMethodDropdown']=bl['ProXFeatures']['Dropdown'](bl['ProXFeatures'],{[_i(123277742/22991)]=_i(-5576-19647),[_i(-12139730/-18119)]=Zs('evasionMethod'),[_i(489422241/31311)]={_i(-390980421/20579),_i(-0.29457268395321495*-32318)},[_i(0.13625742706455704*14979)]='Player Evasion',[_i(265301856/12619)]='#\xc8\xa5t\xfe\x05',['Callback']=function(Xr)
                        gl=Xr
                        if not(hH)then
                        else
                            sy(gl)
                        end
                    end});
                    Bc['BombEvasionToggle']=bl['ProXFeatures']['Toggle'](bl['ProXFeatures'],{[_i(0.36992988834069074*19255)]='Bom2q|\xb5\xa1-\xa0[\x03\xbd\xe6Y\xfe\xb6<'G0'),[_i(-28799+12420)]=Zs(_i(-38241- -12896)),['Desc']=Zs(_i(2142- -22456)),['Value']=false,[_i(-2912+-15739)]=_i(-1029034851/30381),['Callback']=function(Mc)
                        return(function(xC)
                            local function Nq(tk)
                                return xC[tk+(-10706- -22555)]
                            end
                            hH=Mc
                            if not(Mc)then
                                hs['Notify'](hs,{[Nq(33146-23507)]=Tv['_G']['Selec$\xd0\x7f{>\x9b:\xc2\x1a]\xb5b\x08']=='Arabic'and '\xd8\xaa\xd9\x85 \xd8\xa5\xd9\x8a\x89\xbaBw\xfbWO\xf5\x7fie\xb48\xb6Yl\x94GC\x86{\xcd*E`\xcb\r\xe0'or 'Evasion system disabled',[Nq(-1.3317106104754459*28142)]=Tv['_G']['SelectedLanguage']==Nq(10841+-8418)and Nq(-19880- -8527)or Nq(-272928222/-19662),['Duration']=Nq(-1218821202/30762)})
                            else
                                sy(gl);
                                hs['Not2\x90\xd2R'](hs,{[Nq(3699-8194)]=Tv['_G']['SelectedLanguage']==Nq(-0.23795056642636458*-19420)and '\xd8\xaa\xd9\x85 \xd8\xaa\xd9\x81\xd8\xb9\xd9\x8a\xd9\x84 \xd9\x86\xd8\xb8\xd8\xa7\xd9\x85 \xd8\xa7\xd9\x84\xd9\x87\xd8\xb1\xd9\x88\xd8\xa8'or Nq(1.114567680623807*-24623),['Content']=Tv['_G']['SelectedLanguage']=='Arabic'and Nq(-3030+10830)or Nq(-70273+29091),[Nq(-64627- -24696)]=1518-1515})
                            end
                        end){[452641736/-17662]='Content',[0.30723596256684493*23936]='Title',[-42406- -26811]='Evasion system enab<w\x14\xed',[-17975-11358]='Will escape from players with bomb',[26898-7249]='\xd8\xa8\xd9\x8a\xd8\xa8\xd8\xaf\xd8\xa3 \xd8\xa8\xd8\xa7\xd9\x84\xd9\x87\xd8\xb1\xd9\x88\xd8\xa8 \xd9\x85\xd9\x86 \xd8\xa7\xd9\x84\xd9\x84\xd8\xa7\xd8\xb9\xd8\xa8\xd9\x8a\xd9\x86 \xd8\xa7\xd9\x84\xd9\x84\xd9\x8a \xd8\xb9\xd9\x86\xd8\xaf\xd9\x87\xd9\x85 \xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9',[-58099024/2092]=-67464/-22488,[-39824+11742]='Duration',[41034-24564]='Arabic',[-12539- -26811]='Arabic',[344- -152]=Xl('\167\233Wv\255\160\6\2\203\53<)>\190\r{\135\21\55\158R\b\184\1!\206\154\6&\142\2\6\6\50j\154)!\191.{\128\236i\225,T\201_}','\127C\142\254&\"\223\131\235\236\186\241\134f\170\162\2\53\239\57\139\140a\134\249'),[-6423- -32153]=Xl('\151\223\154\248\175\251//\177\17\165\a,\161\221\148\251\182\241%/\160\a\187\17i\169','\196\171\245\136\223\158K\15\211~\200e\f'),[-520826144/-24238]='Title'}
                    end});
                    Bc['AntiFireToggle']=bl['ProXFeatures']['Toggle'](bl['ProXFeatures'],{['Flag']=_i(-2.8060640732265445*-6992),['Title']=Zs('antiFire'),[_i(-26760+5727)]=Zs('anti\x16/B\x00\xbf\xac\rpH'),[_i(2.8505834217305654*6599)]=_i(-15772- -316),[_i(14619+-19011)]='xlarge',[_i(-55224- -24671)]=function(sq)
                        return(function(BB)
                            local function Cr(Wr)
                                return BB[Wr-820624100/30220]
                            end
                            Dv=sq
                            if sq then
                                yy();
                                hs['Notify'](hs,{['Title']=Tv['_G']['S5\xd2cc\xb6\xe0\xe1\x85\xbc\xe8\xd9g\xb44q\x02t']=='Arabic'and Cr(58917-20471)or Cr(-0.28880468784420849*-22697),['Content']='',['Duration']=-80931/-26977})
                            else
                                Dv=Cr(-30671520/8880);
                                tE();
                                hs['Notify'](hs,{['Title']=Tv['_G']['SelectedLangua3\x17\xc7']==Cr(0.93213519313304716*7456)and Xl('7%;\27\249\238\204\171\177,%\223\5l4\170\235jWTF~\238\198R\227R~\131{3m-\234^','\239\143\226\158\217\54ir;\245\167\a\162\181\181\138\50')or Cr(40631-9242),['Content']=Cr(-1619282304/-27936),[Cr(5329+-4878)]=Cr(-567424980/-19210)})
                            end
                        end){[42457+-31166]='\xd8\xaa\xd9\xde~\xe0U\x01\x0b4\x9b\x06\xd1\x0f\x8c\x85\xc5\x9d\x16\x8a\xff\xa7\x93\xcc:\x10\xd1\xd3\xf5\xcd\t,\xb2sik\xad\xfccS',[-14704+17087]=0.00023756731073804245*12628,[1.5709601159155038*-13113]='Anti-fire enabled',[-582995070/28854]='Arabic',[-126452644/-29866]=Xl('\204\176\221,\147\r\151%\2\173\186\192\54\223\t\146\50\3','\141\222\169E\190k\254Wg'),[-2.4507994590724684*-12571]='',[-55405+24796]=false,[-479443616/17954]='Duration'}
                    end})
                    local DB,Lo,Lw,oo,zt,J,zz,Fe,iD={[0]=_i(-26420- -20319),[_i(-18506727/11223)]=-15623+15625,[0.00047539814594723079*4207]=_i(9102+12568),[_i(-13102+16657)]=21410+-21406,[_i(-2.6528239202657806*-4816)]=_i(-22336+16714),[0.00064143681847338033*7795]=4467+-4461,[-28619+28625]=-196651/-28093,[_i(234458180/-25388)]=45848/5731,[_i(-600026578/26347)]=0.00029282576866764275*30735,[-23815+23824]=_i(1.3633250438256757*-24529),[-30189- -30199]=_i(1.5923426727299399*6817)},{'Head','Torso','Right Arm','\x1b\x9a\xac\x95\xe5\x8b\x88\x81\xfc','Right Leg','Left Leg','FakeRoot',_i(-0.2241393178893179*-24864)},{'Head',_i(-34558744/17314),_i(-414956859/17663),_i(-371298430/-17365),Xl('\195e\217@\229,\242M\246','\145\f\190('),'Left Leg','FakeRoot'},{[_i(-369372212/13684)]=Tv['Vector3']['new'](24899+-24897,_i(-128767275/31445),7621-7620),[_i(36049+-11128)]=Tv['Vector3']['new'](8.7237197941202131e-05*22926,_i(-49739592/-19369),_i(-0.13150113063141416*22996)),['Right Arm']=Tv['Vector3']['new'](8916+-8915,0.0002623638987275351*7623,_i(-20115+-3302)),[_i(1426-9038)]=Tv['Vector3']['new'](_i(670320855/-18423),_i(-409129560/21480),_i(-1.3365446614830268*26365)),[Xl("\195\132\132\208\'\148C\219\138\250\139\145\251\244t\15\178\28\210\162\205\213\189"]=Tv['\x01+P\x01+AoG\x06']['new'](_i(23610+-13616),_i(23486+-19289),-9718/-9718),[_i(-14731-18977)]=Tv['Vector3']['new'](12395/12395,-4241+4243,29189/29189),[_i(-23833+-14357)]=Tv['Vector3']['new'](_i(0.71120058565153732*24588),2.8496523424142255e-05*8773,31596.25-31596),['HumanoidRootPart']=Tv['Vector3']['new'](_i(1.494677011909058*-22168),_i(-30144- -2189),5530-5529)},{[_i(-21115+30264)]=_i(-5442-11307),[_i(-2474-18219)]=0,['HTr']=-26375- -26376,['Msl']=_i(-40446- -10317),[_i(1765+11469)]=_i(24407-7763),[_i(-21762- -12932)]=true,[_i(8857+-9399)]='FFACha)\x1e\xbe\x84\x9d\x1f\xd3y'},_i(46800-28367),_i(16767- -324),{},_i(-8589+25245)
                    local function Ro(ig)
                        return(function(_v)
                            local function IB(do_)
                                return _v[do_-(21099+1090)]
                            end
                            if not ig then
                                return Tv['Color3']['fromRGB'](31131+-30896,IB(31529-11965),-1378515/-9507)
                            end
                            return ig['Color']
                        end){[-34106625/12993]=7695-7510}
                    end
                    local function Ux(jl)
                        return(function(Ir)
                            local function mm(uo)
                                return Ir[uo-705763873/26771]
                            end
                            if not(not zt['ANC'])then
                            else
                                return
                            end
                            if jl['FindFirstChild'](jl,mm(18696+30298))then
                                return
                            end
                            local Xm=Tv['Instance']['new'](mm(1009076992/31808));
                            Xm['Name']='NoCollisionConstraint';
                            Xm['Parent']=jl
                        end){[-0.23075929752066116*-23232]='NoCollisionConstraint',[-151084556/-6676]='NoCol;\x0eI\xb8\xe7*\x97JG\xee\x0c?<\x827\xb8'}
                    end
                    local function Qg(DF,Es)
                        return(function(lg)
                            local function _e(dw)
                                return lg[dw+73242400/16646]
                            end
                            if not(Es['FindFi%\xe5\xd9\xf5=x'\x8d\x8e'](Es,'Weld'))then
                            else
                                return
                            end
                            local zv=Tv['Instanc5\x83']['new']('Weld');
                            zv['Name']=_e(1.4943358699411968*-23128);
                            zv['Part0']=DF;
                            zv['Part1']=Es;
                            zv['\x18V']=Tv['CFrame']['new']();
                            zv['C1']=Tv['CFrame']['new']();
                            zv['Parent']=Es
                            return zv
                        end){[-35995- -5834]='Weld'}
                    end
                    local function Ck(zx,tB)
                        return(function(Oo)
                            local function dy(Eg)
                                return Oo[Eg-168239721/-14723]
                            end
                            for mv,jh in Tv['ipairs'](zx['GetChildren'](zx))do
                                if not(jh['IsA'](jh,dy(21689+-631)))then
                                else
                                    local lm=jh['Fin0\x0eW\n\x93;I\xa9\x1f\x1avv'](jh,''\199'))
                                    if lm and lm['IsA'](lm,dy(-265797839/-31333))then
                                        local So=jh['Clone'](jh);
                                        So['Paren$3']=tB
                                        local Oa=So['Fin3(\xc31z\xc1^?\x02\xba\xb4<\xde'](So,dy(2685+899))
                                        if Oa and Oa['IsA'](Oa,'BasePart')then
                                            Oa['Transparency']=zt['VTr'];
                                            Oa['Ca:\xde\xb9Z\xd4\xc1\xb3\x9eP']=false;
                                            Oa['Massless']=true
                                            local Ad=Tv['Instance']['new']('Weld');
                                            Ad['Name']=dy(64509698/-3751);
                                            Ad['Part0']=tB;
                                            Ad['Part1']=Oa;
                                            Ad['C0']=Tv['CFrame'][Xl('BI[',',')]();
                                            Ad['C1']=Tv['CFrame']['n1\x0fw']();
                                            Ad['Parent']=Oa
                                        end
                                    end
                                end
                            end
                        end){[-0.20473977365452159*28187]='AccessoryWeld',[-349035772/-23252]='Handle',[-3374- -23284]='BasePart',[4.4336017469632862*7327]='Accessory'}
                    end
                    local function Iy(es,qz)
                        return(function(GA)
                            local function Ka(rH)
                                return GA[rH+-16932240/-12060]
                            end
                            local function Kh(rj)
                                if not(rj and rj['\x19#sA'](rj,'Clothing'))then
                                else
                                    local Ow=rj['Clone'](rj);
                                    Ow['Parent']=qz
                                    return Ow
                                end
                            end
                            Kh(es['FindFirstChild'](es,Ka(3595-14786)));
                            Kh(es['\x16\xe6\xfb$n\xf5\xc6C\xc1Y\xbd\x01\xd8L'](es,Ka(28852+-2157)));
                            Kh(es['FindFirst\x17\x9f\xa4\xed\xfd\x15'](es,Ka(42080-22657)))
                        end){[24067-3240]='ShirtGraphic',[-2.3047080052493438*-12192]='Pants',[-8384-1403]='Shirt'}
                    end
                    local function vv(Jq,wv,Hj,Ic)
                        return(function(Ih)
                            local function Vp(nr)
                                return Ih[nr-(-12570+-6297)]
                            end
                            local ra=wv..Vp(-60423- -30993)
                            if not(Ic['FindFirstChild'](Ic,ra))then
                            else
                                return
                            end
                            if not(wv=='''))then
                            else
                                local kG=Jq['FindFirstChild'](Jq,'face')
                                if kG then
                                    kG['Destroy'](kG)
                                end
                            end
                            local BD=Tv['Instance']['new']('Part');
                            BD['Name']=ra;
                            BD['Size']=oo[wv]or Jq[''')];
                            BD['\x18\xa5\xa1\x15\xe1\x8a\x02']=Jq['CFrame'];
                            BD['Color']=Ro(Jq);
                            BD['Material']=Jq['M:\x14\x8d\x08\xfd<\xe4']or Tv['Enum']['Material']['Plastic'];
                            BD['Transparency']=zt['VTr'];
                            BD['\x14\x00\x93\xf4i<'\xf5.\xd4']=Vp(0.84508940961896828*-25221);
                            BD['\x14\x8a:\xdf&\xb4\xdc\xb7']=Vp(-52855+2981);
                            BD['CanQuery']=Vp(-14991+-17401);
                            BD['Massless']=Vp(-45154- -871);
                            BD['Locked']=Vp(-0.40440836242796452*23773);
                            BD['Anchored']=Vp(-24602+-12073);
                            BD['Cas/\xb5\xcd\xb5\xa6G\xc8\xe9']=true;
                            BD['CollisionGroup']=zt['CG'];
                            BD[Xl('G#\159\160\218X,\143\188\203c','\23J\233\207\174')]=Tv['CFrame']['new']()
                            if not(wv==Vp(-23814+24248)or wv['f9X5?'](wv,'Arm')or wv['find'](wv,'Leg'))then
                                BD['TopSurface']=Tv['Enum']['Su"\xb3@\xec\xd4\xf4\x96\x84\xcb']['Smooth']
                            else
                                BD['TopSurface']=Tv['Enum']['SurfaceTy'\xb6\xc2']['Studs']
                            end
                            BD['BottomSurface']=(wv=='Head')and Tv['Enum']['\x07/\x87K\xc7-\x01\xfb\xa1\xfb\x8d']['Inlet']or Tv['Enum']['SurfaceType']['Smooth'];
                            BD['\x11l\xde\xe1\xba\x14\x92"\xde\xe8\xb5\x03\xa4']=Tv['Enum']['SurfaceType']['Smooth'];
                            BD['BackSurface']=Tv[Xl('i\160Y\163',',\206')][Xl('\207Y\168\52%\255I\142+4\249','\156,\218RD')]['Smooth']
                            if wv==Vp(-18807- -29969)then
                                BD['LeftSurface']=Tv['Enum']['SurfaceType']['Weld'];
                                BD['RightSurface']=Tv['Enum']['SurfaceType']['Weld']
                            else
                                BD['LeftSurface']=Tv['Enum']['SurfaceType']['Smooth'];
                                BD['RightSurface']=Tv['Enum']['Sur1\x0b\xf0VJ\xcfi\xe1P']['Smooth']
                            end
                            BD['Parent']=Ic;
                            Qg(Jq,BD)
                            if not(wv==Vp(-0.59340142741142787*-23399))then
                            else
                                Iy(Hj,BD)
                            end
                            if wv=='Head'then
                                local ws=Tv['Instance']['new']('Spe8\xff\xa0\x13\x1d{\xd8?');
                                ws['MeshType']=Tv['Enum']['MeshType']['Head'];
                                ws['Scale']=Tv['Vector3']['new'](Vp(0.22788821665226158*31239),-31529.75+31531,-28413.75/-22731);
                                ws['Parent']=BD;
                                Ck(Hj,BD)
                            end
                            if not(wv==Vp(1.2836296975252062*-27275))then
                            else
                                local uz=Tv['\x125/\x0cP{/\x1cA']['new'](Vp(-593078677/12473));
                                uz['Name']='rob7\xaa/\x98';
                                uz['Texture']=Vp(-49224+9439);
                                uz['Fac2\x97']=Tv['Enum']['NormalId']['Front'];
                                uz['Transparency']=0;
                                uz['Color3']=Tv['Color3']['new'](Vp(-346773484/26638),Vp(-12147+19847),Vp(4882-89));
                                uz['ZIndex']=-6273+6274;
                                uz['Parent']=BD
                            end
                            return BD
                        end){[5180- -21387]=-6407- -6408,[4647+4606]=true,[803335808/26752]='Torso',[-1.8992186465368825*15102]='Decal',[-3.3071383844708828*3194]='_Visual',[10139-27947]=false,[-20427+-491]='',[20.254792826221397*1617]='\x03\xc0\x86\x9b\x9a\x86',[-3005-28002]=true,[255950561/13261]='Head',[-11069- -8622]=false,[40856+-17196]=2225-2224,[-32630- -16486]='Tors8\xfe',[-46165+20749]=true,[37917+-11931]=-1895.75- -1897,[-15718+21567]=2130-2129,[-42583- -29058]=true}
                    end
                    local function rr(pv)
                        return(function(ay)
                            local function gr(on)
                                return ay[on+(-48912- -26559)]
                            end
                            if not(not pv)then
                            else
                                return
                            end
                            for py,yw in Tv['i$\xc1\x0b\xd8\xa9\x19'](Lo)do
                                local dx=pv['FindFirstChild'](pv,yw)
                                if not(dx and dx[Xl('e_m',',')](dx,gr(64397+-13098)))then
                                else
                                    if not oo[yw]then
                                        oo[yw]=dx['Size']
                                    end
                                    local Ua=oo[yw];
                                    dx['Size']=Ua*zt['HBS'];
                                    dx['Massless']=zt['Msl'];
                                    dx['CanCollide']=zt['CC'];
                                    dx['Transparency']=zt['HTr']
                                    if not(dx['Finw<\xd6\xf9!\x19\x08\x0fA\xbe\xa4'\129\254')](dx,'CustomPhysicalProperties'))then
                                    else
                                        dx['CustomPhysicalProperties']=gr(-3.6791645266221535*-11682)
                                    end
                                    if not(not dx['FindFirstCh>\x9b\\-'](dx,gr(42329+-29122)))then
                                    else
                                        Ux(dx)
                                    end
                                    dx['Co<\xb2\x062|\x13\x1a\xc0\x96\xde[$']=zt['CG']
                                    if not(yw==gr(20953+-13487)or yw==gr(24098+-21433))then
                                    else
                                        dx['CanCollide']=false
                                    end
                                end
                            end
                            for xB,oC in Tv['ipairs'](Lw)do
                                local dz=pv[Xl('\208E\166a\209c\23\229X\139m\254f\1','\150,\200\5\151\ne')](pv,oC)
                                if not(dz and dz['Is\x11+'](dz,gr(7.7344901719901724*6512)))then
                                else
                                    vv(dz,oC,pv,pv)
                                end
                            end
                            for ic,cA in Tv['ipairs'](pv['GetChildren'](pv))do
                                if cA['IsA'](cA,gr(-1.8336002980070776*-26845))then
                                    local Tm=cA['FindFirstChild'](cA,gr(0.32353971144417987*-28556))
                                    if Tm and Tm['IsA'](Tm,gr(-1544- -28544))then
                                        Tm['Massless']=gr(-14476- -21437);
                                        Tm['\x18\xf6\xf8\xa0\xa1&\xc6h\x11H']=false;
                                        Tm['Collisio5\xf5\xb1\x9e\xf1\xb6\xd8']=zt['CG']
                                    end
                                end
                            end
                        end){[-19927-11665]='Handle',[-37053- -21661]=true,[21065-30211]='NoCollisio9r\x1e\xc4u\x9b\xc0\x8c\xcb\xac/\x15',[27081-6454]=nil,[-45672- -30785]='Head',[261- -28685]='BasePart',[-1.9042893073210523*-14711]='BasePart',[-21566+1878]='Torso',[-4818939/-1037]='Ba$\x92q\x84=\xee`',[24767- -2103]='Accessory'}
                    end
                    local function Wd(dD)
                        if dD==CF then
                            return
                        end
                        if Fe[dD]then
                            return
                        end
                        Fe[dD]=true
                        local Wp=dD['Cha)\x86.\x16\xdc\xf7=']
                        if not(Wp and zz>0)then
                        else
                            rr(Wp)
                        end
                        dD['CharacterAdded']['Connect'](dD['CharacterAdded'],function(jj)
                            repeat
                                Tv['task']['wait']()
                            until jj['FindFirstChild'](jj,'HumanoidRootPart');
                            Tv['task']['wait'](-7395.5+7396)
                            if zz>0 then
                                rr(jj)
                            end
                        end)
                    end
                    local function ni_()
                        return(function(Yc)
                            local function Bj(dA)
                                return Yc[dA+-2.3782988737602957*-11898]
                            end
                            local Ii=Tv['game']['GetService'](Tv['game'],Bj(108587600/-7337))
                            if not(not Ii['IsCollisionGroupRegister1\xe4I'](Ii,Bj(-0.91723222189436415*6778)))then
                            else
                                Ii['Regis/\x8c\xd4\x18Collisio5\xae\xd4\x18oup'](Ii,Bj(-1.3546298294841355*18532))
                            end
                            Ii['CollisionGroupSetCollidable'](Ii,Bj(648838440/-12860),Xl('\221(\221,\159\166\233\15\255\27\146\181\232','\155n\156o\247\199'),Bj(-241739679/15523))
                        end){[-18382- -31106]=true,[-28584- -31777]='FFACh5\xe7d\x97\xf97\xb0\x9ee',[39568+-26071]='P<[n"\xb4\r\xda[nI?\xff\xcc',[617005979/-27847]='FFACharacters',[14090+7990]='FFACharacters'}
                    end
                    local uF=nil
                    local function Af()
                        Fe={};
                        Tv['pcall'](ni_)
                        for fc,Ie in Tv['ipairs'](Pm['GetP7\x14k|\xde\xd8m'](Pm))do
                            Wd(Ie)
                        end
                        if not(uF)then
                        else
                            uF['Disconnect'](uF)
                        end
                        uF=Pm['PlayerAdded']['Connect'](Pm['PlayerAdded'],Wd);
                        Pm['PlayerRemoving']['Connect'](Pm['PlayerRemoving'],function(Cl)
                            Fe[Cl]=nil
                        end)
                        if iD then
                            iD['Disconnect'](iD)
                        end
                        local zF=0;
                        iD=if_['Heartbeat']['Connect'](if_['Heartbeat'],function()
                            return(function(pC)
                                local function Gy(AE)
                                    return pC[AE-(-38512+12333)]
                                end
                                if not(not J or zz==Gy(-146021944/6122))then
                                else
                                    return
                                end
                                local Yw=Tv['tick']()
                                if Yw-zF<8549.5-8549 then
                                    return
                                end
                                zF=Yw
                                for mf,Op in Tv['ipairs'](Pm['GetPlayers'](Pm))do
                                    if not(Op~=CF)then
                                    else
                                        local UF=Op['Character']
                                        local xa=UF and UF['\x1d\x8c\x19k\x8f\xd0VQ\xb44R\xb1\xfe\x1c\x89\x16\xdej\x83\xc4>'](UF,'Humanoid')
                                        if not(UF and xa and xa['Health']>Gy(-2.8262267580036347*7153))then
                                        else
                                            for Ru,Hi in Tv['9\xa4\xa3\x15\x9ce'](Lw)do
                                                local X,hx=UF['FindFirstChild'](UF,Hi..Gy(-703814160/13272)),UF['FindFirstChild'](UF,Hi)
                                                if hx then
                                                    if not(X)then
                                                        vv(hx,Hi,UF,UF)
                                                    else
                                                        if not(not X['FindFirstChild'](X,Gy(41.649532710280376*-856))or X['Weld']['Part0']~=hx)then
                                                        else
                                                            X['Destroy'](X);
                                                            vv(hx,Hi,UF,UF)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end){[-437698151/16301]='_Visual',[-7682- -13645]=0,[86791626/-9162]='Weld',[74303437/31931]=0}
                        end)
                    end
                    Bc['ReachToggle']=bl['ProXFeatures']['Toggle'](bl['ProXFeatures'],{['Flag']='ReachToggle',[_i(-16517- -9086)]=Zs('reach'),['Desc']=Zs(_i(-20936- -24766)),['Value']=false,['Size']=_i(-88+-18255),['Callback']=function(Ps)
                        return(function(Ij)
                            local function Zp(pz)
                                return Ij[pz+-440546160/15504]
                            end
                            J=Ps
                            if Ps then
                                zt['HBS']=DB[zz]or Zp(83513+-25656);
                                Kk(function()
                                    return(function(Az)
                                        local function jd(Nw)
                                            return Az[Nw-(-22259+12626)]
                                        end
                                        Af()
                                        if zz>0 then
                                            for ub,Sr in Tv['ipairs'](Pm['\x13\xfc\xe0\x1e\xc7\xc5\xb0\xfc\x0f\xe5\xda'](Pm))do
                                                if not(Sr~=CF and Sr['Character'])then
                                                else
                                                    rr(Sr['Character'])
                                                end
                                            end
                                        end
                                        hs['N4\xd5\x8eF\xe5'](hs,{[jd(64749000/-14325)]=Tv['_G']['SelectedLan0\xdfw>b<']==jd(690321684/-19198)and '\x88\xba7\x19\ny\x1f\xa0\xb3\xfc(\xb3\xfb\x83\r\n&\xd5oXXm\xc8\xeb\xaeI\xc0\xf2\xbe\xb4'or Xl('.\22\213\187\229i\25\29\213\186\225,\24','|s\180\216\141I'),['Content']='',['Du"0\x8b\xa3a\x05']=jd(-115655352/5604)})
                                    end){[-65812500/2500]='Arabic',[1.2617518917679431*-8722]=-26899- -26902,[0.23007694730684425*22223]='Title'}
                                end)
                            else
                                if not(iD)then
                                else
                                    iD['Disconnect'](iD);
                                    iD=Zp(1325687850/30078)
                                end
                                hs['Notify'](hs,{[Zp(46146-14209)]=Tv['_G']['S5\x7f\xccyGbz\r\xc4E\xdb\xd2_Gh\x11\x84']==Zp(-3.6770525950355841*-11522)and Zp(-2926- -30155)or 'Reach d=\xb1\x97j\xd3\xd4~+',['Content']=Zp(3868+22800),['Duration']=-24379- -24382})
                            end
                        end){[-29571+27824]='',[-502192194/-17057]=-4667/-4667,[0.21094873023478677*16696]='Title',[0.95491143317230276*-1242]='\xd8\xaa\xd9\x85 \xd8\xa5\xd9\xda\xceJ\x11\xf8U\xf4-\xfaRlP\xd3!d\x8ad\x8akx\x075',[3.4749688667496885*4015]='Arabic',[66.355932203389827*236]=nil}
                    end});
                    Bc['ReachLevelSlider']=bl['ProXFeatures']['Slider'](bl['ProXFeatures'],{['Flag']=_i(-533921136/-22381),['Title']=Zs('reachLevel'),[_i(12082-7620)]=Zs(_i(-26516-13076)),['Step']=17309-17308,[_i(2675+-29765)]={[_i(-3072+3607)]=_i(-0.61655914675657275*-30847),['Max']=_i(1.2065049044914817*-29055),['Default']=0},[_i(-0.92484295204953226*-22127)]=_i(-26952+2861),['Callback']=function(qe)
                        local nd=Tv['tonumber'](qe)or 0;
                        zz=Tv['math']['clamp'](Tv['math']['floor'](nd),0,11419-11409);
                        zt['HBS']=DB[zz]or 0.00018066847335140019*5535
                        if not(J and zz>0)then
                        else
                            for lE,fD in Tv['ipairs'](Pm['GetPlayers'](Pm))do
                                if fD~=CF and fD['Character']then
                                    rr(fD['Character'])
                                end
                            end
                        end
                    end});
                    bl['ProXFeatures']['Divider'](bl['ProXFeatures'],{[_i(-29417- -19297)]=''});
                    bl['Pr8\x81z\xac!\xc2\xd2\x81\x80\x86']['Par1C\xbfR\xc0v'](bl['Pr8\x81z\xac!\xc2\xd2\x81\x80\x86'],{[_i(-133715904/-7456)]=Zs(_i(-1284+7787)),[_i(-165111759/-9549)]=Zs(_i(-32558+-435)),['Ima0\xbf\xc0']='5\x03\xa4\xe6^\xae\x81~8\xcf;\xd9\xc5\x13',['ImageSize']=25246-25218,['Color']=Tv['Color3']['fromRGB'](_i(4253625/8955),8851+-8751,_i(-10898-28404))})
                end
                do
                    bl['Config']['Paragraph'](bl['Config'],{['Title']=Zs(_i(-6524- -2415)),['Desc']=Zs(_i(37787+-21713)),[_i(-354341625/-17391)]='settings',['ImageSize']=_i(15847-21762),['Color']='White'});
                    Bc['SelectThemeDropdown']=bl['Config']['Dropdown'](bl['Config'],{[_i(147404086/6493)]='SelectThemeDropdown',[_i(6.1763683753258034*-5755)]=Zs(_i(-356058525/-16725)),['Values']={_i(319486064/-14459),_i(-9018- -20799),_i(29790+-14626),_i(1.4179692903582792*14458),_i(-51211+17295),_i(-305200376/-12974),'\xd8\xb3\xd9\x85\xd8\xa7\xd8\xa1 \xe2\x98\x81\xef\xb8\x8f','\xd8\xa8\xd9\x86\xd9\x81\xd8\xb3\xd8\xac\xd9\x8a \xf0\x9f\x9f\xa3',_i(-36681+30659),'\xd9\x85\xd9\x86\xd8\xaa\xd8\xb5\xd9\x81 \xd8\xa7\xd9\x84\xd9\x84\xd9\x8a\xd9\x84 \xf0\x9f\x8c\x99','\xd9\x82\xd8\xb1\x8e*\xf8\xd8\xb2\xd9\x8a \xf0\xc8\xfcy'},['\rF\x17\x1a\x03\x13']='\xd8\xaf\xd8\xa7\xd9\x83\xd9\x86 \xf0\x9f\x8c\x99',['Size']='xlarge',[_i(-0.00260035754916301*18459)]=function(cw)
                        return(function(ir)
                            local function Pf(Kb)
                                return ir[Kb+(-4415-6786)]
                            end
                            local Yx={[Pf(31920- -4881)]=Pf(0.95954117019384666*22492),[Pf(222244740/12036)]='Light',[Xl('\245S6\200P\210\245Q\206\137\23\241\148',',\219\238y\136}')]='Rose',[Pf(-0.8529411764705882*1122)]='Plant',['\xd8\xa3\xd8L\xed#\xd7\x18/\xb8\xa4\x9b\xb4'\23')]=Pf(41518+-16153),['\xd9\x86\xd9\x8a\xd9\x84\xd9\x8a \xf0\x9f\x94\xb5']='Indigo',[Pf(5.4891222805701423*-2666)]='Sky',['\xd8\xa8\xd9\x86\xd9\x81\xd8\xb3\xd8\xac\xd9\x8a{\x8bz\xd13\xfc']=Xl('\175\243,\149\255\55','\249\154C'),[Pf(13712+37)]=Xl('\159 \149\168,\156\190','\218M\240'),[Xl('\163\173\136\159%\r\211\51\207}G\244\213\163\172\136\157$-\210\2\54\f\248\160\235','z(Q\25\253\167\v\134\22\252g,r')]=Pf(346871920/-28240),[Pf(-3.4670429715950473*5492)]='Crimson'};
                            hs['SetTheme'](hs,Yx[cw]or 'Dark')
                        end){[0.43847374495095209*-27728]='\x82l\x8f\r\xbe\xe5\x88\xd3y\xd0_6\xcd\xb0\x87l',[104048744/7346]='Red',[146507616/20169]='\xd9\x81\xd8\xa7\xd8\xaa\xd8\xad \xe2\x98\xd0>=7\xd4',[-1183-22301]='Midnight',[-492.30769230769232*-52]='\xd8\xaf\xd8\xa7\xd9\x83\xd9\x86 \xf0\x9f\x8c\x99',[0.42825907590759077*24240]='Dark',[-354829386/11733]='\x8e\xa81{3\xfc\xb0\xbe\xe5\xf3c\xea\x1a\xe6\x9al',[27543+-24995]='\xd8\xb2\xd9\x85\xd8\xb1\xd8\xaf\xd9\x8a \xf0\x9f\x92\x9a',[-9712-16123]=Xl('Z,\236\168R\246^#\191\215\181\v\190>\r','\130\159\53-\138Q\134')}
                    end});
                    bl['Config']['Divider'](bl['Config'],{[_i(42198+-26219)]=_i(346006997/27307)});
                    bl['Config']['Paragraph'](bl['Config'],{[_i(-1.6925898752751285*1363)]=Zs(_i(0.0098600667297445346*-20081)),[_i(-26524- -9020)]=Zs('toggleUIDesc'),['Image']='eye',[_i(-2.6922801147227533*-8368)]=_i(1157-29223)});
                    bl['Config']['Button'](bl['Config'],{[_i(-5.1649731022115963*3346)]=Zs(_i(13108-23012)),['Icon']='eye',[_i(-832009602/31102)]=_i(212899536/22608),[_i(-25889- -27795)]=function()
                        tC['Toggle'](tC)
                    end});
                    Bc['UIToggleKeybind']=bl['Config']['Keybind'](bl['Config'],{[_i(-54589746/-2859)]=_i(-20786+26841),['Title']=Zs(_i(12902-32432)),['Desc']=Zs(_i(0.78739783311157574*10522)),['\x02b\x05H\x0f']=_i(-11479+17263),['Size']=_i(5503+-13644),['Callback']=function(mF)
                        return(function(xF)
                            local function my(VA)
                                return xF[VA+-506446227/-20283]
                            end
                            local Aa=Tv['pcall'](function()
                                tC['S>\xe6\x0e\xde\xa0\xd9\n\xca\x83\x8e\x0f'](tC,Tv['Enum'][Xl('\132\146\49\140\152,\170','\207\247H')][mF])
                            end)
                            if Aa then
                                hs['Notify'](hs,{['T>\xd4\xb1\xef']=Zs('keybindSetTitle'),['Content']=Zs('keybindSetDesc')..Tv['tostring'](mF),['Duration']=-14423- -14426})
                            else
                                hs['Notify'](hs,{['Title']=Zs('keybindErrorTitle'),[my(-27142+14238)]=Zs(my(-32660+24581)),['Duration']=my(-51169- -11175)})
                            end
                        end){[58129170/4818]=Xl('o4\167X>\167X',',[\201'),[-12412+29302]='keybi9|T\x7f\x9a!/U\xf6Aj',[-15091+66]=3652-3649}
                    end});
                    bl['Config']['Divider'](bl['Config'],{[_i(-28519+25552)]=_i(-12431+-9704)});
                    bl['Config']['Paragraph'](bl['Config'],{[_i(-40924372/-23372)]=Zs(_i(12337-16840)),[_i(8700-31662)]=Zs(_i(3943+7430)),[_i(14392- -102)]='save',[Xl(':\154\176,\22\164\184\49\22','s\247\209K')]=-462952/-16534})
                    local bs,In=Tv['pcall'](function()
                        return(function(_t)
                            local function jG(Ak)
                                return _t[Ak+510607074/25111]
                            end
                            return Tv['loadstring'](Tv['game']['HttpGe/\x93'](Tv['game'],jG(-44039+3182)))()
                        end){[-166667283/8121]='https://raw.githubusercontent.com/AlphaBay00/ZyphoraConfig.lua/refs/heads/main/Config.txt'}
                    end)
                    if bs and In then
                        In['Setup']{[_i(-781608825/26025)]=tC,[_i(-256468290/11490)]=bl['Config'],['\x14\x90k\xf6\xcb\xf6\xb1\x9f\xd1`G']=Bc,[_i(-62996- -31574)]=Zs,['\xb9X\x0e\x8ad)'x')]=hs,[_i(-83939150/-3725)]=Tv['_G']['SelectedLanguage'],[_i(-18057+20612)]=_i(678.83783783783781*-37)}
                    else
                        bl['\x130\xc2\xff\x0c\x94']['Paragraph'](bl['\x130\xc2\xff\x0c\x94'],{['Title']=Tv['_G']['SelectedLanguage']==_i(-11598+-22382)and '\xd8\xaa\xd8\xb9\xd8\xb0\xd8\xb1 \xd8\xaa\xd8\xad\xd9\x85\xd9\xd1N\xf3\x0f\xd5\xf69\xe0%z\xd1\x8fR\xbd\x0e\xd3Q{C?\xd0\xdf\x12\x86\r8\xf7\xfb\xdbI\x13'or _i(6947-21153),['Desc']=Tv['_G']['\x07\x14\xeb\xde\xa1j F\xd0.\x98[\x0c\xbd<\x02']==_i(2804-20658)and _i(387422820/-11469)or _i(-1.6664493293591653*10736),['Image']=_i(45319-26757),[_i(-35412+22018)]=_i(-3.245977722772277*6464)})
                    end
                    bl['Config']['Divider'](bl['Config'],{['Title']=_i(4.7554547418448907*4629)});
                    bl['Config']['Button'](bl['Config'],{['Title']=Zs('4\x12S\x0cD\x82C\x8b&\x06`B\x99E\x89\x0f'),[_i(-617597202/-29422)]=_i(-396338430/27345),['Size']=_i(-2864- -23437),[_i(-0.055382745182165967*-27969)]=function()
                        return(function(sp)
                            local function bu(hc)
                                return sp[hc+-2.9948650427913099*7595]
                            end
                            hs['Notify'](hs,{['\x04\x1bl$\x0f']=Zs(bu(24562- -1430)),['Content']=Zs('languageChanged'),['Duration']=0.00012254401372492954*24481});
                            Tv['task'][' \xfe\x95\x9d\x80'](10530/10530)
                            if Tv['_G']['SelectedLan<\x92\xbcJ\xfcJ']==bu(1.9171529923332189*8739)then
                                Tv['_G']['SelectedLanguage']='English'
                            else
                                Tv['\x08"G']['SelectedLanguage']='Arabic'
                            end
                            tC['Destroy'](tC);
                            Zc();
                            Tv['task']['wait'](5463/5463);
                            Tv['createMainScript']()
                        end){[7789-13781]='Arabic',[27113838/8353]='notification'}
                    end});
                    bl['Config']['Button'](bl['Config'],{[_i(-46949- -15613)]=Zs(_i(0.58241758241758246*-3640)),[_i(-571647872/24488)]=_i(-125248041/5787),['Size']=_i(137539880/-11012),['Callback']=function()
                        return(function(Jp)
                            local function ua(lF)
                                return Jp[lF+0.12819193158874065*25259]
                            end
                            if Tv['autoJoinConnection']then
                                Tv['a!d\xa8\xb0\xa58X\x88\xd9\xe2\x15\xb2\xba\x8c#X\x89\xf4']['Disconnect'](Tv['a!d\xa8\xb0\xa58X\x88\xd9\xe2\x15\xb2\xba\x8c#X\x89\xf4'])
                            end
                            if Tv['autoReadyLoop']then
                                Tv['autoReadyLoop']['Di'm\xa8\xdbb\x7fS\xbd'](Tv['autoReadyLoop'])
                            end
                            Tv['removeArenaESP']();
                            tC['Destroy'](tC);
                            Zc();
                            hs['Notify'](hs,{[ua(-44364551/-1553)]=Zs(ua(36414+-9826)),['Content']=Zs(ua(1.2661740650910938*-17729)),[ua(-57645- -28815)]=ua(-39455+10940)})
                        end){[-8727+-10483]='scriptClosed',[-2628-22649]=-3200+3202,[162650770/5114]='Title',[-2022-23570]='Duration',[-2703- -32529]='notification'}
                    end});
                    bl['Co:F\xdf\x92%']['Divi3\xd0,\xf2'](bl['Co:F\xdf\x92%'],{[_i(1164375000/-31250)]=''});
                    bl['Config']['Paragraph'](bl['Config'],{['Title']=Zs(_i(0.33485642422972123*-23855)),['Desc']=Zs(_i(138910995/14535)),['Image']=_i(13553- -9081),[_i(1.2313488603811185*-16058)]=_i(-50659+20272),[_i(14007+-11128)]=Tv['Color3']['fro9\xf3\xea3\x8c']('#00FFAA')})
                end
                do
                    bl['Credits']['Paragraph'](bl['Credits'],{['Title']=Zs('developerName'),[_i(-2.3268951026345563*12374)]=Zs('dev2c%\x86|\x14\xf5@6\xdf'),[_i(0.23789632267342328*-29206)]='user',['ImageSize']=-1125600/-14070,['Color']=Tv['Color3']['fromHex'](_i(220274928/18864))})
                    local function Bo()
                        return(function(Mo)
                            local function Yt(Uv)
                                return Mo[Uv- -0.57156155457295788*8594]
                            end
                            local in_,Db=Tv['pcall'](function()
                                return Tv['g:\xfd\x93']['HttpGet'](Tv['g:\xfd\x93'],'https://discord.com/api/v10/invites/uRtbxxxrau?with_counts=true')
                            end)
                            if not(in_)then
                            else
                                local qn=Cw['JSONDecode'](Cw,Db)
                                local Tw,Uh=qn['12\x18=Wydt\x93B\xee'x\x1dGE\x12KSw\x84\xb1\xd3\x87']or '?',qn['app)_\xf7\x0c\xbe\xf7y3#\x99l\x14es>^\xec\x00\x8c\xf5b#\x12\x9d']or '?'
                                return Tw,Uh
                            end
                            return '?',Yt(-339333539/13711)
                        end){[-42713+22876]='?'}
                    end
                    local Vt,SA=Bo()
                    local sv=Zs(_i(-194175870/9265))[Xl(',]>L','K.')](Zs(_i(-194175870/9265)),'{members}',Tv['tostring'](Vt))['g(\-'](Zs(_i(-194175870/9265))[Xl(',]>L','K.')](Zs(_i(-194175870/9265)),'{members}',Tv['tostring'](Vt)),'{online}',Tv['tostring'](SA));
                    bl['Credits']['Pa%\x8b\xca#\x19\xe5\xdb,'](bl['Credits'],{[_i(-9068- -258)]=Zs('discordServerTitle'),[_i(-492379632/-21779)]=sv,[_i(4.0961923847695392*-3493)]='rbxassetid:{\xe5uO\x0e\x06J\x9a\x1e9m\xf9\xdc\x93',[_i(446.54838709677421*-62)]=-0.0069487874365923149*-14391,[_i(-25194-4962)]={{['Title']=Zs('copyInvite'),[_i(203041940/-25885)]='copy',[_i(-34609- -32459)]=function()
                        return(function(Mw)
                            local function di(Me)
                                return Mw[Me- -9.5298869143780287*-1857]
                            end
                            Tv['setclipboard']('https://disc?y\x064\xdb;;w\xf5P\x03\xd8\x81\xf6\xa8\x00\x00\x17');
                            hs['Notify'](hs,{['Title']=Zs(di(17369- -31887)),['Content']=Zs(di(-113591782/-2722)),['Duration']=di(-1.042312925170068*-14700)})
                        end){[23465000/-9880]=9.7233701200836214e-05*20569,[-28087510/-890]='notification',[-0.843712700975918*-28486]='inviteCopied'}
                    end}}});
                    bl['Credits']['Button'](bl['Credits'],{['Title']=Zs('joinDiscord'),['Icon']='message-circle',['Size']='xlarge',['Callback']=function()
                        return(function(Nk)
                            local function _u(IA)
                                return Nk[IA-(-3900-3570)]
                            end
                            Tv['setclipboard'](_u(-10969- -14548));
                            hs['Notify'](hs,{[_u(-494+24527)]=Zs(_u(-886- -23767)),['Content']=Tv['_G'][Xl('\186D+yMX\23\1\165@){[M\21\0','\233!G\28.,re')]=='Arabic'and '\xd8\xaa\xd9\x85 \xd9\x86\xd8\xb3\xd8\xae \xd8\xa7\xd9\x84\xd8\xb1\xd8\xa7\xd8\xa8\xd8\xb7'or _u(0.51178552350427353*-29952),['Duration']=_u(-28800- -25876)})
                        end){[-725722761/-23911]='notification',[-3.8206125425376762*2057]='Link copied',[-1.2372069276990143*-25463]='\x0f_\x04\x19\x01\x08',[17240-12694]=6.48971380362126e-05*30818,[1042- -10007]='h$\xd9O\xec\x9eV|\x05h\xbd\xdd\xcak\xa2\xad\xf0\xf5\x8fN\x8f^P\x18\xb7\x08i\xdd\xaa'}
                    end});
                    bl['Cr2\x9a\xab5\xa7']['Button'](bl['Cr2\x9a\xab5\xa7'],{['\x04\xb7\xc0\x88\x0f']=Zs(Xl('Z\235\182_\231\171B',',\142\196')),[_i(-1.4442240951908776*18153)]=_i(-2.927320314072881*4967),[_i(385179408/-11448)]=_i(-0.68297923132012417*-16756),[_i(-38689- -23426)]=function()
                    end});
                    bl['Credits']['Button'](bl['Credits'],{['Title']=Zs('contactDev'),[_i(-50145+20878)]=_i(-15983+-12725),['Size']='xlarge',['Callback']=function()
                        return(function(xm)
                            local function wb(vF)
                                return xm[vF+0.11051942383238761*-11455]
                            end
                            Tv['setclipboard']('swightx2');
                            hs['Notify'](hs,{[wb(138801260/-10130)]=Zs('notification'),[Xl('\181C\188\130I\188\130','\246,\210')]=Tv['_G']['SelectedLanguage']=='Arabic'and wb(-11184-18510)or wb(-2.7889261357068547*-8651),[wb(36980-27198)]=wb(-0.086290386599984129*25194)})
                        end){[9125+13736]='Developer username copied',[-7256-23704]='\xd8\xaa\xd9\x85 \xd9\x86\xd8\xb3\xd8\xae \xd9\x8a\xd9\x88\xd8\xb2\xd8\xb1 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb7\xd9\x88\xd8\xb1',[0.31716945996275603*26850]='Duration',[-12402- -8962]=0.00018021265092809516*11098,[-87922032/5874]='\x03%ex`i'}
                    end})
                end;
                tC['OnD2\x193\xcf\x829'](tC,function()
                    if not(Tv['spConn'])then
                    else
                        Tv['spConn']['Disconnect'](Tv['spConn'])
                    end
                    if not(Tv['C\x16\x06g\x05('])then
                    else
                        Tv['CFloop']['Di'\xa8\xec\xc3w\xf3\x96<'](Tv['CFloop'])
                    end
                    if Tv['afGUI']then
                        Tv['a1\xba\xd5\x9e']['Destroy'](Tv['a1\xba\xd5\x9e'])
                    end
                    if not(Tv['autoJoinConnection'])then
                    else
                        Tv['autoJoinConnection']['Disconnect'](Tv['autoJoinConnection'])
                    end
                    if Tv['autoReadyLoop']then
                        Tv['autoReadyLoop']['Disconnect'](Tv['autoReadyLoop'])
                    end
                    if not(Tv['d6(\xb8y\x9ds\xd4\xe4\xab'])then
                    else
                        Tv['danceGUI']['Destroy'](Tv['danceGUI'])
                    end
                    if not(Tv['currDance'])then
                    else
                        Tv['currDance']['Stop'](Tv['currDance'])
                    end
                    if Tv['jumpConn']then
                        Tv['jumpConn']['Disc;\x1e"\xdd\xfd\x1fo'](Tv['jumpConn'])
                    end
                    if Tv['2\xda\x1b\xf8\xdc\x90']then
                        Tv['invGUI']['\x14\xae\xab\r\x83|\xd8'](Tv['invGUI'])
                    end
                    if Tv['antiLagA']then
                        for ge,lk in Tv['pairs'](Tv['antiLagConns'])do
                            if not(lk)then
                            else
                                lk['Disconnect'](lk)
                            end
                        end
                    end
                    if Tv['EnemyD']and Tv[Xl('\2.\216d,.\218v','\96A\181\6')]then
                        Tv['b4'n\xd3\xd0\x186']=nil
                    end
                    if not(Tv['Sma)\xfb\x92L'])then
                    else
                        if not(Tv['evaConn'])then
                        else
                            Tv['evaConn']['Disconnect'](Tv['evaConn'])
                        end
                        if not(Tv['spinConn'])then
                        else
                            Tv['spinConn']['Disconnect'](Tv['spinConn'])
                        end
                    end
                    if Tv['AutoLava']then
                        Tv[Xl('\231\186\170UB\241\166\131UZ\229','\132\214\207\52,')]()
                    end
                end);
                Tv['task']['wait'](_i(1.3386280573517009*-7114));
                hs['Notify'](hs,{[Xl(',J\fO\29','x#')]=Zs('welcome'),[_i(1.1528722847422141*-30568)]=Tv['_G']['\x037\x836O\x1dxb\x96\t\xd3\xdb\n$\x13~']=='Arabic'and _i(37663+-14476)or _i(4615+-25672),[_i(10911-15078)]=-3038+3044});
                Tv['task']['spawn'](function()
                    return(function(jy)
                        local function Iq(Np)
                            return jy[Np+1.8588894242351242*-16604]
                        end
                        while Iq(165048544/3232)do
                            Tv['task']['wait'](Iq(-1134761750/-17975))
                            local en_=Tv['_G']['SelectedLanguage']==Iq(28519+3210)and Iq(8195-5697)or Iq(16183+17590);
                            hs['Notify'](hs,{['Title']=Tv['_G']['SelectedLanguage']==Iq(81769+-21488)and '\xf0\x9f\x95\x8c \xd8\xaa\xd8\xb0\xd9\x83\xd9\x8a\xd8\xb1'or '\xf0\x9f\x92\x9c Reminder',[Iq(-420406558/-10517)]=en_,[Iq(2097+27741)]=0.0019860973187686196*4028})
                        end
                    end){[3.5598237885462556*5675]=true,[-812- -3720]='If you're enjoying the script, don't forget to join our Discord server \xf0\x9f\x92\x9c',[-273804128/-9308]='Arabic',[19431-10322]='Content',[2321-3348]='Durati;\xb6O',[1.3324385711335949*24215]=-38- -638,[-52921+24554]='\xd8\xb5\xd9\x84\xd9\x91 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xa7\xd9\x84\xd9\x86\xd8\xa8\xd9\x8a \xef\xb7\xba \xf0\x9f\xa4\x8d\n\n\xd8\xa5\xd8\xb0\xd8\xa7 \xd8\xb9\xd8\xac\xd8\xa8\xd9\x83 \xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa \xd9\x84\xd8\xa7 \xd8\xaa\xd9\x86\xd8\xb3\xd9\x89 \xd8\xaa\xd8\xaf\xd8\xae\xd9\x84 \xd8\xb3\xd9\x8a\xd8\xb1\xd9\x81\xd8\xb1\xd9\x86\xd8\xa7 \xd8\xa8\xd8\xa7\xd9\x84\xd8\xaf\xd9\x8a\xd8\xb3\xd9\x83\xd9\x88\xd8\xb1\xd8\xaf \xf0\x9f\x92\x9c',[-15677- -16541]='Arabic'}
                end)
            end){[-5.7181558935361219*-4208]=0,[232558500/-11805]='Value',[-32311+14455]='ImageSize',[-0.10965011469001389*30953]=false,[-261203712/-8834]='Pro\x0f3(\xd3d)\xc9:K',[-271572798/16513]=20902-20901,[24100+-30590]='Flag',[-38156- -29864]='Cal;\xa7(4\xcd',[-257347300/-18284]='xlarge',[-6724-16692]=-5922- -5950,[-205180150/29050]='Title',[19913+-4292]='FOLLOW_DURATION',[37390-15072]='Infection',[0.52537083743000046*-23393]='resetAutoFollow',[-413767760/-13720]='\xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa \xd8\xb4\xd8\xba\xd9\x91\xd8\xa7\xd9\x84 \xd9\x88\xd8\xac\xd8\xa7\xd9\x87\xd8\xb2 \xd9\x84\xd9\x84\xd8\xa7\xd8\xb3\xd8\xaa\xd8\xae\xd8\xaf\xd8\xa7\xd9\x85!\n\xd8\xaa\xd9\x85\xd8\xaa\xd8\xb9 \xd8\xa8\xd9\x85\xd9\x85\xd9\x8a\xd8\xb2\xd8\xa7\xd8\xaa\xd9\x86\xd8\xa7 \xd8\xa7\xd9\x84\xd8\xad\xd8\xb5\xd8\xb1\xd9\x8a\xd8\xa9 \xf0\x9f\x9a\x80',[47423+-24378]='$\x82Lw\x1b\xa3\x8f\xbaS\x16',[22147+-3253]='e\xd7\xdb\xfd\x94\xbf\xd5\xf6\x93\xe90',[30707-26139]='\x06\x10w>\x0f',[204656705/20245]='Anonymous',[366972671/19699]=-3365- -3366,[-11717- -28070]='Value',[56855-31869]='xlarge',[-6910- -6450]='T2X&t',[-25392- -9019]='Icon',[-0.90579738132941945*-25891]='HttpService',[-0.64489941795159811*-19586]='Title',[16750-15885]='followDurationDesc',[-0.51201497276160557*29921]=-20702+21582,[-54067- -28429]='Callback',[4888- -11603]='Go to Up + Spin',[-11534- -12976]=Xl('\186\169\234,V\176\167\162\207*N\184\177','\200\204\139O\"\217'),[-14161-9902]='Size',[4.0272108843537415*-1176]=false,[32198-24372]='Title',[6407- -24509]='speed1',[24973- -1766]='F7\xa1\xc1',[-54129- -27329]='TargetPl6\xcal\x90\x18Dropdo \xdd',[310734389/-19663]=-28953- -28961,[-0.14267796506470065*-32689]='Title',[815-23973]=true,[185294046/14966]='Color',[24897+5671]=Xl("\232\155\220CX\245\168\224\0\198\131\202xp\224\174\238\'",'\169\238\168,\31\135\201\130B'),[77480986/-3674]='Callback',[9708+-13130]='Desc',[-8.0109034267912769*3210]='Primary',[-15733+19571]='Title',[-10356+26192]='xlarge',[-3260+12078]='xlarge',[-31309+19937]='xlarge',[46398-32396]='flightFeatur1\xe7\xf2',[-0.91965736728060676*-29536]='teleportTools',[12592+19805]='Callback',[-195918720/6092]='id',[-0.17687164022551463*-7627]=-76620/-15324,[-14254350/-24450]='Desc',[1660+-4670]=0.03383921246923708*4876,[0.081754801368061042*30408]='Title',[-2.6764252696456086*-7788]='Opened',[-83928204/3429]='xlarge',[-7630+136]=nil,[-37+-26700]='L2\xc1\x8d\x1e \x1b\xc2\xce',[3.3230073094326489*8619]=-0.0026642984014209592*-1126,[177023047/-9523]='Title',[-60561- -29131]='ImageSize',[226168940/-11930]=false,[639-7976]='Im5\xa5\xc9\x9b\x0f',[-0.38032557548009666*15726]='Size',[-141640842/-14434]='gJump',[104+11530]=Xl('\163h\f>j\188u\4&X','\208\28cN,'),[-0.34887804878048778*25625]=Xl('cg',','),[45018-14833]='setting'\xc1',[0.24559219380888292*-29720]='invisibleModeDesc',[336659000/-30500]='NoclipInvisibleToggle',[14717187/-4119]='xlarge',[-1.822851415685292*-7982]='Desc',[21971- -7702]='Flag',[-122277312/-5472]='Desc',[0.40963060686015829*-21224]='hack',[0.5802213881290158*31438]=false,[-22219+-1614]='Call5\x83il\xf0',[-4513- -21041]='mainFeaturesDesc',[1731- -5192]='C:C\xbb\xba'q\x93',[-36815+32597]=false,[-1.4459149461796366*-11334]='xlarge',[-4264- -29797]='5!\x08\x04\xa1$B\xb7X\r\x00\xbd7\x03\xa6',[932-6737]=Xl('x\231\135\207}\\\244\148\196\96X',',\149\230\161\14'),[8187+-13980]='Desc',[-213329696/-13162]=':\xd5fAG\x0c\xf8Y\x02TimerD5:\x15c',[-29919161/1871]='Desc',[251871750/11850]='STRAFE_S\x07\xe9\x0e 9',[-16521- -19100]='Size',[-16378+-3916]=nil,[-2179+-19776]='Callback',[0.41223472257734595*31288]='Any Arena',[11068- -3080]='Title',[-0.2423580786026201*31144]='SelectA&d\xe0.\xady\x01\x97[\x91H\xe1',[0.33139556974049167*26319]='Title',[-20167+17018]='Title',[-35061+10996]='Color',[-1.6761854163899588*7529]=nil,[-7188- -28674]='Callback',[23786-2297]='Title',[-347807040/29778]='Size',[24464646/-2531]='Icon',[1145664/1768]='rejoin',[177768668/-7546]='Desc',[7068-25654]='xlarge',[778291212/26042]=true,[-33782+2563]='Fak5yj]\x13\x02',[50144-23893]='50',[40781-22437]='c4\xf5\x192\xde\xc4\x8eNG\xc1\x81V\xa6U\x15\xac',[-0.81189488243430152*2892]='Flag',[-11732663/-10229]='Arena6',[597759204/-23597]='Primary',[-2499-12626]='\xd8\xaf\xd8\xa7\xd9\x83\xd9\x86 \xf0\x9f\x8c\x99',[2.8671974522292993*-9420]='Arabic',[660957220/25855]='Title',[6.2510599636583892*3302]='Value',[-72791660/-21185]='Folder',[0.85332499804641715*-12797]=Xl('\1\197\182\169\154\31\5\146I\231>\"\188\211\6\aJ\a\201\155\6-,\195\182\169\133V\19\147\28\244p/\242\211\17\f\4\3\218\218\f,','B\173\211\202\241?|\253<\149\30K\210\167cu$b\189\187eB'),[-6294- -4448]=Xl('\4,$)5','PE'),[-3.6343783783783783*4625]=false,[17360-12539]='Callback',[2.3297074819932382*-13606]='Callback',[1713+5058]='',[39768547/-13559]='toggleUIButton',[-144133330/-15455]='Title',[-1.0728964430931536*27299]='Title',[15917- -10674]='AntiFireToggle',[83556582/-6586]=false,[544619349/-16623]=-29722+29822,[-10627+27065]='Value',[-37116+25704]=false,[22767+5586]='Le=\x91\xc2\xb3\xe1\xb5',[9455635/-295]='Flag',[39213+-8448]='eye',[-17234+1621]='Selec#{\x02\x1e9\xd2{\xd8\x0e\xe7Y\x017\x8b\xd1'\180'),[-23.4836867862969*1226]='Size',[0.6859527434726217*17733]='Callback',[-1.644142951687624*-15110]='\x10\xc8\xb4\xf0',[14960- -13002]='\xacS\x8a^''),[-4769+-16968]='mail',[307339704/13272]='Flag',[-35918+7344]='Title',[12692- -6103]=false,[15.753369272237197*742]='AdhesionForceInput',[36664914/5889]=nil,[41778+-21375]='yo.\xe0\xbe\x19\x90j\xf6\xce\x14\xe4',[-42521- -20699]='Desc',[-241716132/-12138]='Title',[-0.2164893991688385*-28394]='S A\xd7\xac\x95E\x82\x91"\xfb\x1b\xd7\xa6\x84J\xa0\x89(',[-4247+31682]='Size',[-52815- -20806]='PathfindingService',[-27339+29589]='rbxassetid://507777826',[0.08869517088695171*-7227]='Left Arm',[-119106727/-23141]='\x07P\x00\x13\x0c',[-26230+12505]='F7I)',[36924+-30910]=nil,[-14036+-15378]=-28441+28442,[150437080/11230]='InvisibleModeToggle',[18856- -4094]='Title',[1.2831021437578816*-14274]=Xl('\127{Vw',',\18'),[531030505/22487]=false,[-35260- -18317]='PinAutoButtonToggle',[-130520390/7735]=11465+-11415,[-27519- -30054]='Flag',[37012+-17030]=true,[27589-45]='x7)\xeb\xdb\x14\xa4F',[35975-13231]='Desc',[25131+-7807]='EnableSpeedToggle',[-0.78872765509989484*-23775]='\xd9\x81\xd8\xa7\xd8\xaa\x8f?\xc3\xff\x94\xc6\xaa\x8f(\x0f\xc83',[353333408/25052]='korblox',[-12000+30959]='Callback',[2.6699410609037328*7635]='Max',[623274951/-25701]='discordContent',[1224-28124]='xlarge',[9746-6509]='cr;\x0c~g',[-164622500/-8050]=Xl("\b\56\\\17\151 \197\f,C:\161\'\212",'iM(~\196T\183'),[2611+2240]='closeScript',[20638+-23806]='gSpeed',[-387170560/-30865]='HumanoidRootPart',[108053805/3865]=Xl('\v\135\\~\243\200\254%\16,\146@|\240\228\212<\22,','X\243.\31\149\173\186Lc'),[-25584-2550]='Size',[-37584+25508]=40476/20238,[19165- -5175]='side',[45101+-32346]='K',[10767-24778]=-28790+28814,[-1.1650956528656087*-25143]='Title',[-547005184/-17659]='Size',[347897945/13969]='Title',[363955791/14393]=0,[-1.4535411934751188*19372]='\xd9\x81\xd8\xb1\xd9\x8a\xd9\x82',[1.0373546028580924*15045]=false,[11196+8446]='',[24430+-22424]='BombTimerLimitToggle',[44773-26125]='#FF6B35',[-0.6663597926895799*29328]='\xb2P\x9e\xa6\xb1\xef;\xd0\x9bO\xbf\xab\xba\xedJ`\xc0'\253\210\203\156g\179'),[-26588625/-6125]='Title',[0.092983973962839375*-24273]='Size',[363701800/-27346]='Flag',[41843+-17222]=nil,[-0.90465900250669895*-23138]='Callback',[-10591-6821]='Desc',[-508084570/18659]='C8\xf1\x8f\xdb\x12r',[251594029/-12457]='invi$\x8b\x8c\xd5Q\xe3\xe8u\xb4\xa1b0\xfe',[-9940+-3782]='VTr',[-13.084940500615511*-2437]='Value',[-28757- -12967]='182435998',[613299394/-26261]=Xl('>\168|KG \t\183\21\26\129rX\\\53\f\187\25','y\205\19,5Ay\223|'),[-20107- -6313]=false,[10393- -9262]='other',[-17327+7116]=nil,[51531-28556]='move',[-203978858/20861]=25842+-25841,[-8012+-4790]='ImageSize',[-1.6320037614607006*-12761]=-19133- -19149,[13085+10631]=false,[686147693/22561]='Credits',[-608723856/24312]='Value',[-1.1610113107119095*-15030]=false,[-6.307056392087393*3387]='Synapse',[-0.3986477528834681*30172]='Pl6\x90\r\x04\\\xc3\xf3\x94\xb0\xe8qd',[818020344/30333]='\xd9\x8a\xd8\xf9\x95\xd2{\x9e~|$\xe6',[0.093714992080967285*25887]='xlarge',[384280557/-20091]='Desc',[469446656/18712]='Desc',[11454+902]='\x14>\x02\xb9\xdab\x02\xb6\xdd',[-29464- -11090]=Xl(',[P\254i8UN\245C ','N4=\156,'),[2734-25796]='Window',[38421-14794]=nil,[-22239+29745]='Min',[1035+-13594]='toggleUIKeyTitle',[-7875+22126]='V1\x10wn~',[314434802/-21857]='Ti \xbc\xce\xc7',[-2636+-13886]='Right Arm',[35197-31320]='Values',[15052+16588]='autoHo8\xc5\xe9m\xce\xc6\xf24\xc7\xfa',[-0.46708416068428288*-19641]='AutoReadyToggle',[-18673-395]=false,[38254-25834]='timer',[-30331+18834]=Xl('\26\22;\230?\228X\207%g.G[v\183{\160\v\141\127;,','htC\135L\151=\187L\3\20'),[0.5353692513659225*-27637]='info',[1824- -19924]='Idle',[33771-25251]='Callback',[57083136/-10208]='Size',[1.4339559427087696*-11939]='xlarge',[31605+-26186]='Size',[0.83770373394466602*-31843]='Size',[-161292945/-9141]='m=\xe1\xf1Ho\xbd\xe3H\xd2_\xd0X\xa6(',[-0.84650502181191034*9857]='Arabic',[-4.8707571801566578*-1532]='xlarge',[3024- -336]='',[22658- -2002]='M8\x8f\xad\xee\xaa\xbdE',[97413714/6271]='Image',[-17560-14015]='xlarge',[-18763+8389]='Flag',[59440+-32758]='Callback',[844060353/26737]='bombEvasionDesc',[-491510392/21964]='Value',[713035384/24601]='',[25144+-31585]='Title',[16331-13469]='scriptSettings',[644721910/22301]=0,[51397-25556]=''\250\218\1\235'),[-7612- -14041]='CG',[-6899+-14085]=14517+-14515,[36627+-31179]=false,[-185758148/-10457]='Ima<\x96\xf2',[-1.0684455194829736*26459]='Content',[-0.91884057971014488*-16215]='Fall',[219683940/29190]='\x1f\xaf\xdf\x94',[27589-29448]='ANC',[-398416500/20590]='Title',[0.45991463836659363*26007]=false,[-7624+16501]='Callback',[34232+-17594]='Play1\x01\x87\x88',[-508608744/20958]='speedSettings',[5647-18409]='Title',[-17488-3693]='Icon',[-0.36111007497482189*26809]='Desc',[-310-10818]=Xl('x @\188F\179\177k=M\164@\171\155','\30O,\208)\196\245'),[26224-20797]='Desc',[16175832/-856]='dance3',[2.0249406175771973*-8420]='spe2\x08\x92\xaamc\x95',[1.4359656609267533*-19919]=false,[6633+-25105]=Xl('\130\180K,\128\185@!\139','\179\140y\24'),[-817897482/31431]='warningDe(\xa4\xbc',[1.31550149417063*-23759]='Title',[8257+-414]=false,[14527- -9724]=0,[9089+12945]='Title',[-54460701/1971]='xlarge',[-150294936/-19631]='Right Leg',[-0.8144903397734844*30020]='T',[10835+7739]='xlarge',[41422+-30348]='Callback',[-119817453/6263]='O'!\x95\xa7\n',[39045+-25791]='Title',[-8133+-5503]='',[-713804558/-22342]='Icon',[-45766- -21365]=Xl('Zg\162Yo\189_',',\14\209'),[39635+-12163]='\xd9\x86\x83g\x079\xa6\xd0w\x9aS\x8f\x11\x9e\x84b',[-225513764/-16084]=true,[-0.70719956571893872*14737]='Callback',[1.2577811887098149*23454]='ImageSize',[5067782/-167]='ImageSi!]\xd8',[8.5366958622772575*3311]='selectDance',[-12404- -16503]=nil,[5896- -11028]='Callback',[-37087- -28139]='Title',[5007+-3756]='calculating...',[14276- -3905]=nil,[304614708/-15214]='Head',[0.36848813127290109*-6277]='Values',[-1.933443186702966*-13958]='feather',[-0.81903594771241828*-31824]='Flag',[-6719+-2639]='\xd8\xb3\xd8\xa7\xd9\x8a\xd9\x86\xd8\xa7\xd8\xa8\xd8\xb3',[197131974/28397]=-7754- -7778,[-115303014/-8181]='Flag',[-0.27532180470680018*-30764]='Content',[7442- -10464]='name',[-790327376/30224]='Image',[290701143/23571]='Flag',[165950811/-30069]='xlarge',[27830-7146]='xlarge',[-1.1642710472279261*-21915]=-15919- -15921,[68727992/-6014]='Value',[612581360/-20260]=-12848- -13103,[-9502+28971]='Title',[-0.64396143160647168*-30595]='Image',[-31384- -11517]='User',[98353660/-8042]='xlarge',[-13572+24373]='reach\x14\xff\xe7\x87\xc4',[-525-12044]='Title',[-33520+18727]='ImageSize',[-629+-14535]='',[34988-29232]=0,[-35228+10863]='Tit<\x0b<\x0f',[52746+-30124]=false,[4.481152136091243*5173]='flightDesc2',[-26900- -6185]='ImageSize',[1.0058118268644585*-24605]='Callback',[-5674- -13386]='wins',[4751+-12038]='Value',[-74644990/-3010]='Title',[-37846- -25833]='Kor2\xac\x91\xedf\xe2\x19\x9dR\x0e',[209469284/8972]='Value',[-13031+-15978]='Value',[11278-1700]='Title',[-177591141/30977]='speed1',[6943-19605]='rotationSpeed',[0.13916901976603469*-17353]='Size',[0.39338925754350818*31948]=Xl("\27\242\199\")\145r\27:\212\219,\'\145U\30",'H\145\181ME\253\48z'),[-37597+5398]='Arena4',[-1.0660481941770232*17139]=false,[-34088- -6481]='autoHold',[27525+-14499]='UIToggleKeybind',[-0.036884083099523977*31721]='xlarge',[-23759+4744]='Flag',[-238226664/-13364]=-20869+20880,[-2.0119577308120133*3596]='Failed to load Config System',[-5835+13676]='Title',[28271-25803]='configManagerTitle',[-49085+23797]=5787-5784,[-9821+2925]='xlarge',[0.08094386843046121*-27970]=-0.0004262834175750563*-16421,[-0.40566791405625868*23783]='Arena5',[3.7655633161251139*3293]=false,[35418+-9636]='V:\xaa\xd5\x9e',[-19448+24423]='Torso',[-27407787/-22447]='id',[-262147032/11736]='Title',[-33773+15627]='Zyphora',[0.2200507735785793*20877]='Gho'O\x8d&\xa1\x9a\x06\xc9k\x95\xfd\xe6',[2.3130201925164653*-13817]='enemies',[813052344/25324]='Value',[5799- -16160]='hideBody',[-2.4557453416149069*2576]=nil,[-54043- -21954]=0,[-10261- -31726]='Image',[0.119129866492391*-21422]=-0.00036185996019540438*-11054,[0.19441162570888468*-16928]='Size',[-58949+28660]='Title',[0.66408374116367586*29424]='music',[-96997440/22080]='Flag',[-11180- -4757]='I='i\x13\x07\x152\x1d',[211197240/27640]='Title',[-23086- -611]=Xl('\159\166M\149\173I','\231\202,'),[-26428+20051]='Icon',[85710141/-13233]='invisibleMode',[-41778828/1417]='Title',[2193- -3310]='Title',[-4.2023928215353941*1003]='SpeedLevelInp.\xee\xb3',[2.7916300848697686*3417]=37364/18682,[-54189+29328]='4v4',[-46253+27517]='Size',[51060-20233]='ReachLevelSlider',[121810/-5]='Icon',[4817-21073]='Callback',[20515-25844]='Phantom\x0f\xeff\x96In\x9b#$',[-1.0503781566465837*7801]='autoPassBom2\xf3}\xec\x9f\x16',[0.11983723296032553*-24575]='StrafeSpeedInput',[-0.84420437956204375*-17125]='teleport',[-14.769867549668874*-604]='autoFollowSettings',[113715720/-6120]='Value',[-13996-66]='Desc',[17254-20642]='Callback',[-750396060/26302]='Arena3',[-612983440/-21904]='Desc',[-26729- -10539]='Desc',[-3710- -6188]='Size',[2.2478809568656999*10618]='Icon',[27817+-31907]='Desc',[17475184/656]='enableFlight',[0.70526004290892952*27034]='settings',[-6792+5784]='Title',[-2339+-24851]='rbxassetid://507767714',[47899-15169]='telep4\xf13\xd3\x9e\xda\x04',[-6172-6918]=0.0015070778836320576*18579,[-47590- -32060]='invisibleModeDesc',[-28011+1062]='Value',[-194483028/-6988]='shiftLockA',[51398+-20840]='C:\xef`\x1f\xf5\xdd\xe4',[-18210+400]=false,[-29691+27496]='Values',[27868+3352]='xlarge',[-62150- -32178]=2.8515174146242105e-05*14729,[33048-11945]='s'Y\xdeP\x9ao\xf7\xea',[-58991- -26453]='Flag',[306203184/-16371]='rbxassetid://f\xd3\x9d\xe2m\xdc\xd1\xfa\xe8\x1a.\xfa\x81\x98x',[-9998- -5261]='STRAFE_DISTANCE',[-61355130/12365]='join\x1aY\x99\x82\xa3\xc7\r',[-115241632/5728]='Value',[83529677/-8561]='Title',[0.30186170212765956*24064]='\xd8\xb9\xd8\xaf\xd9\x88\xd9\x89',[135867618/9166]='Icon',[-0.47420491698866291*-23551]=16032-16030,[-26225- -14866]='Image',[7981- -16477]=9111.25+-9111,[-12276- -29614]='Icon',[-51315+27733]='Callback',[0.65599517720595235*-31517]=false,[12190-27333]='Value',[18721846/-1573]='A"\xfev\xe6\x10\xc6k\xc2D\x81V\xe61\xcek\xcb',[-2201-9934]=' \xd9\x8a\xd9\x88\xd9\x85',[5544- -12871]='xlarge',[-16587+-1986]='Settings',[282028381/11357]='send',[-0.031868889445976434*31912]='mainFeaturesList',[-37706- -16690]='Desc',[51390-22898]=false,[-14083- -9076]=-19511+19512,[5753-27160]='Title',[-0.2055438952015633*27634]='Color',[12460+13986]='Content',[-3.8921690490988192*-6436]='Callback',[-8894+-9500]=Xl('\198^$\246\234\96,\235\234','\143\51E\145'),[-16138- -1466]='power',[261532320/8864]='SelectedLanguage',[17767+-31744]='ZyphoraPro | TBD',[4795+-10661]=0,[177986350/19667]='Desc',[49872188/4738]=-8058+8061,[-38754855/-31897]='bone',[-37740671/25903]='Icon',[6613-8179]=nil,[4207788/-156]='Callback',[32768+-27203]='\x04\xf8\x8f\xc7\x0f',[1.8548685671973344*16206]=Xl('\217)\249,\232','\141@'),[193248355/16301]='Size',[0.8403171738009283*-31024]='Desc',[50286-31682]='Arabic',[13835- -11569]=false,[-285316416/30327]='Title',[-48220- -15972]='id',[19402-32067]='Desc',[41161+-8772]='ImageSize',[-28143- -118]=nil,[15365-23114]='antiLagDesc',[8029-7159]=-4704- -4705,[-43898+18561]='Callback',[27419784/-15099]='xlarge',[224315754/22794]=nil,[-6033070/-226]='3v3',[34329-6165]='dance1',[685465389/-24171]=175420/25060,[164568852/-19302]='Icon',[51737-27655]='Flag',[29042- -802]='enableLighting',[-21971- -876]=10444-10416,[-34462+7883]='T=\xef\x98\x80\x89',[-1.8375232774674115*-2148]=-7.8536087332129113e-05*-12733,[-28595+6326]=Xl("\4\'#,",'BK'),[-31955+24164]='Brightness',[-0.49975839963921015*31043]='AutoHoldTimerInput',[1.6518237801989579*18999]='Flag',[13996+18523]=false,[22898+-8170]='Size',[-3013+18288]='Min',[-21047481/651]=-17797+18022,[1.8559892328398384*10402]='time',[-40404+8801]=0,[721072/-2992]=-26588+26593,[0.18985140091503763*26447]='Color',[-20040+-12672]='Title',[-98.561643835616437*-146]='ImageSize',[0.85244382673152652*8634]='Flag',[-26778297/-4277]='Buttons',[6312+7162]='warningText',[49- -2717]='Size',[-7969+8977]='Recordi:\xdeI\x07;|\xad2og3\xd5a',[-1.7396714783474365*-4018]='ReplicatedSt?\x96B\x89\xd8\xc7',[539584520/-21094]='Desc',[11815-10866]='\xd8\xb2\xd9\x85\xd8\xb1\xd8\xaf\xd9\x8a \xf0\x9f\x92\x9a',[-440642176/-32708]='Size',[-16311+-3580]='\xd9\x85\xd9\x88\xd8\xa7\xd9\xda\xbbtj',[504791424/-30144]=5203/5203,[1.3267053429400206*-21374]='Color',[-8076+-15308]='Callback',[-404054208/18959]='autoFo8\xe1/\xfeo\x16\x11x\xdf\xa1',[-3.2996722138174484*7932]='Size',[-974-14376]='ConfigTab',[7806+-11909]=Xl('\31\148%\128,','I\245'),[-4036-26268]=true,[-0.39740698985343853*-30158]='Callback',[52957+-28695]='Desc',[8402+-4612]=0,[27699+-24866]='',[18098+10162]='selectTheme',[-17714- -16956]='Size',[0.86401225114854519*22855]=4895+-4891,[0.14486429461973721*20854]=424368/15156,[4669+-26020]='Default',[339498216/11178]='Color',[-5879- -3532]='Size',[9.2166085946573748*-3444]=nil,[-20102+-8854]='xlarge',[-115347415/-4439]='Callback',[33416-23890]='DefaultConfigN6\xb1\xd5\r',[281272050/-10839]='ADHESION_FORCE',[2.3147321428571428*12992]='Size',[-24562+-1095]='xlarge',[59492-28171]='Info',[6288+-6535]=nil,[-246332772/17991]='RunService',[3.1245551601423487*-281]='name',[-42996- -30942]='Title',[0.43635732469335803*-25926]='Flag',[-37847691/2571]='\x03\xa5\xc5\x8a\x18',[0.24382392864068256*25785]='Lighting',[-51699- -19735]='Title',[-23903+-915]='xlarge',[33340+-21561]=0,[22991+-13095]='strafeAmplitudeDesc',[34745-10833]=true,[55207-26372]='Title',[18970- -12922]='Torso',[-2450- -21749]='reactionDelayDesc',[106497300/26975]='StrafeA9\xb4\xfa\x06itu0\xcd\x18p\xe0\xc3\xff\x1e',[46173-18207]='Title',[9500- -17846]='Image',[-47094- -30615]=-0.0089437438511761023*-22362,[-24767+-6450]='zap',[-15726+21002]='GhostJumpInput',[-33337+29285]=false,[-1.0224493214943877*-29845]='128777973',[-255587800/-25948]='Color',[0.96818247160860604*20869]='CC',[-605898360/-21640]='Value',[-0.27473060531513116*-28861]='xlarge',[-39829- -7826]='ZyphoraPro',[-30549+3846]=false,[7725+-15256]='wave',[16973-20939]='Desc',[0.55702540076248219*21771]='proxFeatures',[19987+-4721]='autoGrabBombDesc',[-209481849/-19143]=Xl('\149\30\190\199\150\31\183\192\148','\164,\135\243'),[-2.6944257891202148*10423]=-7814+7824,[1.3592679257897375*23932]='Size',[-386310015/-22771]=-27112+27113,[43556+-20954]='Values',[41305-12622]=557+-527,[0.23515376458112408*22632]=-4.4780797993820249e-05*-22331,[1.6488318430920104*6934]='Desc',[9696-13975]='Title',[46798+-32497]='Size',[28740-28358]='ImageSize',[27498- -1387]='Callback',[-1607+-4460]='Size',[-234.34482758620689*-87]='Min',[-0.028271640921014283*30879]='Icon',[-1.4865679136329399*-19915]='z1\x0bp',[370706884/22991]='F;S#%',[-7.4162248144220575*1886]='discordServerDesc',[20664036/6366]='Desc',[19326- -1667]='speed2',[-968520/210]='Flag',[-298770560/23680]='Title',[608549500/32630]='arena',[207451728/-29832]='Title',[4080- -18250]=28737-28732,[-56072949/30491]='Title',[-53895- -26950]=Xl('\232\143t\193\15\139\232\157\140\156I\154\132','0,\172l\214\14'),[37596-18176]=nil,[287987378/14042]='Size',[-161985626/6127]='Are>\xee=\x87',[-2.8431594860166287*2646]='refresh-cw',[-23018760/17844]=Xl('\146\48@\213;LW8,\176:Q\208\6KH#\v','\192_4\180O%8V\127'),[36269+-20833]='p8u\x0fB',[-23107-3081]=Xl('M\188(G\183,','5\208I'),[43026+-20186]=-9180+9400,[0.32096512570965124*-14796]=0,[49298628/-1884]='(M\xff\xad-\xf4\xa9',[-0.31539928632951891*-32508]='noclipA',[-16715-15906]=Xl(']\160M\rv\255\1Y\160@*{\192\a','/\197,n\30\179d'),[-0.37892763955753189*27211]='Title',[-105482560/9664]='antiAfkEnabled',[-0.80163402009540241*-19706]=Xl('\130\219\172\16\208U\203\155\143,S\223\150\225A\148\17\152\218\214xY','\240\185\212q\163&\174\239\230Hi'),[-7876+15322]=-65500/-655,[-2.7204201010369582*7522]='xlarge',[-23637+-5909]='Title',[7749-18542]='Config',[11891-10231]='Flag',[25604+3846]='Flag',[-23317-4476]='Callback',[-329741664/21768]='129423131',[0.76570006114071099*-22898]='Value',[-494674440/-30687]='HBS',[0.46511790149295379*14334]='Flag',[1.157390614373158*-17644]='Desc',[282+30213]='\xd9\x86\xd9\x8a\xd9\x84\xd9\x8a \xf0\x9f\x94\xb5',[-1318+-19598]='Callback',[11595- -4536]='Desc',[0.00078767123287671237*29200]='Image',[-52046- -20669]='autoHoldD2\xb5\x10\xc94\xf5\xb1\xb1\xa9\xdf\x88\xd9',[-31417- -32473]=830060/29645,[8861+-31157]='Icon',[40463+-14473]=0,[34337+-24788]='EnableFlightToggle',[-54572- -23921]='Callbac?\x02',[18312+-8564]=true,[34425-14279]='Image',[122972260/-6217]='Size',[-2.36651776217826*-9402]='-\xb0]\xef\xa8\x93',[18791+-15915]=16811+-16810,[-7265+12603]='Arabic',[35466+-21475]=-0.039889339252396579*-15543,[-29467- -6282]='B"\xc2+\xfb\xf2\x9a',[-5751+14130]='Enable\xef\xfc~\xaf\x8b\xce\xbd{x\xd4;U\xa6\xbe' g'),[-29876+18755]='Title',[1330-4700]='Callback',[-35072- -17955]=nil,[19154+-14089]=0.0025229357798165139*436,[1.500169434090139*14755]='\xd9\x88\xd8\xb1\xd8\xaf\xd9\x8a \xf0\x9f\x8c\xb8',[39006-10832]='Aut?\xf5<^`*#\xf8m\xfb\x89\x08L',[719725476/-22586]='\xe2\x9d\x8c Error',[-16887+17011]=nil,[0.70202080120219879*25287]='invisibleMode',[-2.0887533875338753*-11808]='Walk',[15393- -11362]='ghostSpeed',[-6721-22623]='enab7\xc97p9\x08\x9a,\xf8\xb4',[-51561+25091]=22876-22866,[-201500148/-10658]='Title',[90318834/21654]='Value',[1.8905893101873001*8756]='UserInputService',[1.1452432824981844*-23409]='\xd8\xaa\xd8\xa3\xd9\x83\xd8\xaf \xd9\x85\xd9\x86 \xd8\xa7\xd8\xaa\xd8\xb5\xd8\xa7\xd9\x84\xd9\x83 \xd8\xa8\xd8\xa7\xd9\x84\xd8\xa5\xd9\x86\xd8\xaa\xd8\xb1\xd9\x86\xd8\xaa \xd9\x88\xd8\xad\xd8\xa7\xd9\x88\xd9\xd9xk\x1ehB\xf21%t\xea\xea)'\xd6\xbe',[-197537724/11754]=26490+-26440,[2825+27405]='Theme',[571238688/18566]=-32138- -32162,[370560008/16534]='copyLink',[-13515438/-7243]=nil,[5561407/-251]='Value',[0.27498819455375412*-31765]='ping',[22479-1824]=19503+-19475,[20518+-23088]='Size',[-44479- -25233]='Icon',[-22074+4184]=nil,[19646- -6905]='Mi5\x0br\x03stanc5\x0c\x7f\x04put',[48270+-20275]='Size',[3290- -17474]=nil,[45111-26496]=-307270/-30727,[2898-29061]=9130/4565,[16379- -2924]='\xd8\xa7\xd9\x84\xd9\x83\xd9\x84',[43585+-22327]='Desc',[-1.8485262008733625*-3664]='toggleUITitle',[9529+-27871]=false,[-9329- -18341]='Value',[6109+16033]='2\xfa\x94\xc6',[-3.4778930746672683*8866]='Title',[17932-2676]='toggleUIKeyDesc',[-24779+-6317]='xlarge',[40445+-10866]='Desc',[7.845553822152886*-3846]=-331380/-11835,[-28550328/-10182]='\x14!\xaf\x80F{\xb3\x9dI',[-1.180473517207713*20485]='name',[-1360- -8064]='Desc',[2619+-32322]=0,[19762-29271]='Size',[2390-16801]='Background',[-9138+-11237]=1681-1501,[0.100817111271329*24966]='\xd8\xa3\xd9\x8a \xd8\xb3\xd8\xa7\xd8\xad\xd8\xa9',[-28588- -29470]='Size',[-462875625/15975]='strafeSpeed',[67681998/-8942]='tag',[6289- -11211]='Wins',[0.42919927109014899*9329]='Title',[-8297+32435]='speedDesc2',[10307157/-3153]='Callback',[-12028- -1096]='calcula#\xb7\xb4\xbe\xde\xae\x01\x8b',[3418-15222]='name',[-0.65874239350912778*24650]='eye-off',[-2.5642346208869813*-3495]='selectArena',[9318-2596]='Arena3',[0.53439053074851095*-26359]='Script is running and ready!\nEnjoy our exclusive features \xf0\x9f\x9a\x80',[791305564/30436]='Title',[-10763+-8925]=-3228300/-12660,[-20111+-11623]=nil,[13.892133492252682*-1678]='Value',[5832-14199]='doubleJumpDesc',[432663660/-23705]=Xl('\255\53\148\183\198I\28\245\5\178\210,\145\128\221I\2\220\15\177\212','\186C\245\196\175&r\184\96\198'),[-132029760/16570]='Value$4',[7733-18616]='Arabic',[-13030+2372]='Title',[158394184/-5396]='Infection',[-0.57195820694304012*14835]=false,[700801385/32437]='Indigo',[18571+-13151]='Jump',[-16513+25851]='Title',[-872858520/27180]='',[4.3302348336594916*4088]=0,[-1692600/12090]='Arena5ICED',[23530+5985]='refresh-cw',[-24350-3917]=7860-7859,[4.6202612296909846*6278]='bo=\xa1\xe2\x9by\xb1\xd0Yg\xf9\x9b!&\xab\x88\x0c\xedc',[-4435+27979]=Xl(",\25l~\0\'dc\0",'et\r\25'),[-20135- -9602]='Desc'}
        end
    else
        Tv['print']('Fa=\xb8\x01\x01\x1b\xa8\x95<q\xf4Q\xda\tD(\xe1\x8f7\x04\xd1')
    end
    Tv['print'](Xh(35511+10682))
end)({[-29077- -3760]='recordingModeDesc',[228930300/-9421]='Anti-lava prevents falling',[-3272+-23276]='otherDesc',[-6977+-21467]='invisibleSettings',[-36716- -22921]='autoFollowDesc',[-62972910/2097]='\xe2\x80\xa2 Members: {members}\n\xe2\x80\xa2 Online: {online}\n\n\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\n\xf0\x9f\x93\xa2 Updates \xe2\x80\xa2 \xf0\x9f\x9b\xa0 Support \xe2\x80\xa2 \xf0\x9f\x8e\x89 Events',[-6+7357]='version',[1003134960/30960]='\xd9\x8a\xd8\xaf\xd9\x88\xd8\xb1 \xd8\xa3\xd8\xb1\xd9\x8a\xd9\x86\xd8\xa7 \xd9\x85\xd9\x86\xd8\xa7\xd8\xb3\xd8\xa8\xd8\xa9\xd8\x8c \xd9\x8a\xd9\x82\xd9\x81\xd8\x8c \xd9\x8a\xd8\xb3\xd8\xaa\xd8\xb9\xd8\xaf\xd8\x8c \xd9\x88\xd9\x8a\xd8\xb4\xd8\xba\xd9\x84 \xd8\xa7\xd9\x84\xd8\xad\xd9\x85\xd8\xa7\xd9\x8a\xd8\xa9 \xd8\xaa\xd9\x84\xd9\x82\xd8\xa7\xd8\xa6\xd9\x8a\xd9\x8b\xd8\xa7 \xd9\x83\xd9\x84 \xd9\x85\xd8\xa8\xd8\xa7\xd8\xb1\xd8\xa7\xd8\xa9',[38873+-12770]='Te;\xa1\xee\rort To8\xc0\x15',[-1.2154198473282443*19650]=Xl('\231p\25\137Ln\139Ig\130\184\207HP\149\180\30\245\26:\221\6\55','\23\239\136,l\182,\144\227[<'),[-28980+2288]='Massive performance boost and disable all heavy effects',[-58788- -26401]='discordServerTitle',[-35675- -28825]='Target Player',[22613- -1453]='\xd8\xa7\xd9\x84\xd8\xb9\xd8\xb1\xd8\xa8\xd9\x8a\xd8\xa9 \xf0\x9f\x87\xb8\xf0\x9f\x87\xa6',[0.54535548896758379*-29368]='autoGrabBomb',[25122-24917]='changeLanguage',[-288969580/24121]=Xl('b\190\57Z\134\128J\26B\218\203\18\166\24:[O\234,\133\155a\146\194k,\231\216\21e+[2N\216B\158Z\127\235\r\133\159h','\186\27\225\244_\1\146\189\154{\235\202\1\193\190\131\254\50\143](A'),[28774+2906]='SAVE_CONFIG',[39746-20683]='hack',[-18338- -6641]='\xf0\x9f\x9f\xa2 Online Now',[10450+-25643]='\xd8\xaa\xd8\xba\xd9\x8a\xd9\x8a\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xb1\xd8\xac\xd9\x84 \xd8\xa7\xd9\x84\xd9\x8a\xd9\x85\xd9\x86\xd9\x89 \xd8\xa5\xd9\x84\xd9\x89 Korblox (\xd9\x8a\xd8\xb8\xd9\x87\xd8\xb1 \xd9\x84\xd9\x83 \xd9\x81\xd9\x82\xd8\xb7)',[-57388+28681]='Waiting for match to start...',[-7292+23183]='Cont5\x10!$',[46164+-20828]='\xd9\x86\xd8\xb3\xd8\xae \xd8\xa7\xd9\x84\xd8\xb1\xd8\xa7\xd8\xa8\xd8\xb7 \xd9\x88\xd8\xaa\xd9\x81\xd8\xb9\xd9\x8a\xd9\x84 \xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa',[-0.42087067861715749*-15620]='\xd8\xaa\xd9\x85 \xd8\xaa\xd9\x81\xd8\xb9\xd9\x8a\xd9\x84 \xd8\xa7\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa!\n\xd8\xb1\xd8\xa7\xd8\xa8\xd8\xb7 \xd8\xa7\xd9\x84\xd8\xaf\xd9\x8a\xd8\xb3\xd9\x83\xd9\x88\xd8\xb1\xd8\xaf \xd9\x81\xd9\x8a \xd8\xa7\xd9\x84\xd8\xad\xd8\xa7\xd9\x81\xd8\xb8\xd8\xa9',[18407- -693]='savePosition',[8859-29827]='Title',[376402320/-20727]='Save Current Position',[51204024/-15892]='doubleJump',[-28712- -255]='Versi4\xde\x95n$?\x12\xbd',[0.77290762090133258*-26716]='\xd8\xaa\xd8\xba\xd9\x8a\xd9\x8a\xd8\xb1 \x8c\xd3\xc5\xf2\x8d\xf7\xa2\xc0F>\x1ecE\xcc\xef\x15\xbf\x89 \xd8\xa7\xd9\x84\xd8\xa5\x8d\xf2\xc4\xda\x8d\xf7\xa3\xf0F%\xe718\xbc',[705562866/25143]='\xd9\x83\xd9\x84 \xd8\xb4\xd9\x8a \xd8\xb4\xd8\xba\xd9\x84\xd8\xa9 \xd8\xa8\xd8\xad\xd8\xb8\xd8\xb1 \xd8\xa7\xd8\xb0\xd8\xa7 \xd8\xa7\xd8\xad\xd8\xaf \xd8\xb5\xd9\x88\xd8\xb1\xd9\x83 \xd8\xa8\xd8\xaa\xd8\xa8\xd9\x84\xd8\xb9 \xd8\xa8\xd8\xa7\xd9\x86',[-55848+24366]='\xd9\x8a\xd9\x87\x89\xd9:\xb7\x19\xe8\x86\xff$@\x10\xe1\x01\xf6\xe8y\x95_\x8a\xe7-\x19\xa7\x80\x07\x92JC\xee\xc2\x9e\x85K\x1d\xe0\xb5\xe6\xa0\x82@\x18\xe1\x02\xf6\xe9\x81\xeb\x05\xea\xb9]h\xf4\xddY\x1b',[16791+-9264]='Automatically Join Arenas',[-334928700/11260]='linkCopied',[-19869- -11128]='\xf0\x9f\x91\xa4 \xd8\xf0m\x1f\xce\xca\xb4\xb1\xc4\x8d\xe7',[447960564/-16956]='\xd8\xad\xd8\xb1\xd9\x83\xd8\xa9',[-7279+30348]='Variant',[1.0093015332197615*-29350]='\xe2\x9a\x99\xef\xb8\x8f \xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\xd8\xaa \xd8\xa7\xd9\x84\xd8\xa7\xd8\xae\xd8\xaa\xd9\x81\xd8\xa7\xd8\xa1',[1.0856381206264578*9003]=Xl('9/,','_'),[-11466- -10022]='Show Selected Arena',[-34193- -27685]='autoPassBomb',[-563+20951]='\xd8\xac\xd8\xa7\xd8\xb1\xd9\x8a \xd8\xa7\xd9\x84\xd8\xa8\xd8\xad\xd8\xab \xd8\xb9\xd9\x86 \xd8\xa3\xd8\xb1\xd9\x8a\xd9\x86\xd8\xa7...',[29024-2112]='bombTimerValueDesc',[7.3578571428571431*2800]='reach',[0.7930664541441883*32624]='\xd8\xb4\xd8\xba\xd9\x91\xd9\x84 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd8\xac\x8e\xd4f\x13'i (',[10339-14353]='minDistance',[0.65584385335631434*21467]='autoReady',[-346309821/-17589]='followDuration',[20681- -3958]='developerDesc',[-34793+16356]='reach\x1f\x89d\xa0\x1a',[-1.314326358840614*16871]='\xd9\x85\xd8\xb3\xd8\xaa\xd9\xdc\xc2@\x17\xbf\x92\xf4\x94\xfc\xe1\x0e\xc9\xd1\x7f\x1a\x9f\x05\xf9\xcd}c(\x14',[-35391+24433]='S<83Yus\x93\t\xb0\xd9%\x0fh\xf9`\x06`\x17\x08'\xc4\xbf\xdd\x1c\x86^\x04\xfb\xff',[-429642225/14775]=Xl('\96z\192\14o_,\147_p\222=jN\21\191','\20\21\167i\3:y\218'),[-39983- -7330]='Enable Dance Button',[10290-2288]='antiFire',[-6690+-13309]='goToSaved',[-73364613/-2577]='antiLagDesc',[-25075+20826]='lockCamera',[-165876480/-19635]='k5\xee\x003\n\x10\x91r\xd4\x97\\ft\xff\xb8\xa5',[2797+-10768]='w9\xba\xd7\xca',[39264-8968]='\xe2\x9a\x99\xef\xb8\x8f \x12G\xdem\x82\xa2\x15\x96f]\xcd\xffg\x1c\xc4r\x85\xb6\x0f',[2309- -12391]='info',[438016040/15620]='speedDesc2',[276924480/-9280]='reachLevel',[-0.72440257066200786*-32054]='Auto Hold depends on Auto Follow, make sure Auto Follow is also enabled for it to work properly',[-1.1688993958497504*3807]='autoBac<\xc2\x1d%\xebH',[-22039+20236]='Settings',[-27843+31470]='otherScripts',[28002618/-8379]='warning',[-186778218/30019]='aut;\x1b\x85\xdb^\xbc\x1b\x8d^9\xd0)\xe1\xb4',[40667067/-4977]='English \xf0\x9f\x87\xba\xf0\x9f\x87\xb8',[36100+-29116]='reco>\x1f.59Q\x1d,',[41363-28444]=Xl('C\162?{\156\135\219rC\199\250\166\215\177\fC\162?{\157\179\218^B\255\250\178\214\145\244\50','\155\5\230\255E\2\2\248\155u\"\1\15\27,'),[-5884-6573]='\xe2\x9a\xa1 \xd8\xa7\x8dl\x10\x03\xc8\x16c\xe0n\xe5\xb4',[781736040/-24456]='Choose your preferred language:\n\n\xd8\xa7\xd8\xae\xd8\xaa\xd8\xb1 \xd9\x84\xd8\xba\xd8\xaa\xd9\x83 \xd8\xa7\xd9\x84\xd9\x85\xd9\x81\xd8\xb6\xd9\x84\xd8\xa9:',[20602-16706]='Wave \xf0\x9f\x91\x8b',[30858+154]='w5>\xbb\x9a\x1c\xfe',[-29411+11647]='Teleport back on close',[-29122- -25218]='warningText',[-30173+23633]='autoHoldDesc',[-994461960/31190]='\xf0\x9f\x93\x8a FPS: ',[39566-24779]='\xf0\x9f\x91\xa5 Total Members',[27014-29500]='flyInvisible',[-42415- -13243]='1&\x18\xa2+\xb9\x18P\xe6\xfa\xf9\x99;',[62585-31553]=')\xf7\x1b\x0f\n\xc7o\xd0\x98rO\x8e',[-63-2209]='autoReadyDesc',[-36916- -12262]='\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa\xd8\xa7\xd8\xaa \xd8\xa3\xd8\xae\xd8\xb1\xd9\x89',[1.5528042328042329*-18900]=''\31\206|2\199\te'),[-60100+27546]='autoHoldDistance',[38189-11670]='wins',[84613128/-21596]='bo9\xb5\x03\xbe\x03mer\x18\xbe:\xbe\x03t',[0.29201135442011356*24660]='\xd8\xa8\xd8\xaa\xd8\xb7\xd9\x8a\xd8\xb1 \x82\x94\x17\x05r\xf2\xe6\xe7\x87\xba\x9fXS\x91\xa2\xb7\x92J\xd0\xc7\x12vGs\x03\x99\x86\x0b3\x86(\xcds\xd9\xde\xa2\x12\xbb\xd6',[795- -26673]='\xe2\x9d\x8c \xd8\xaf\xd8\xa8\xd9\x84 \xd9\x86\xd8\xb7 \xd9\x85\xd9\x88\xd9\x82\xd9\x81',[-5761- -30608]='la%\x10hg',[-27788228/1963]='a!(\xbc,\x14I1q\xd5X\xa5!\x17^#p',[-89428677/5107]='Finds a matching arena, joins, readies up, and enables protection automatically each match',[-15332- -4773]='reactionDelayDesc',[-243884536/11668]=Xl('_\200\220~\30-\251B\202\238i\15\51\247^',',\173\189\f}E\146'),[-0.61047151132947131*13637]='\xd8\xa3\xd8\xae\xd8\xb1\xd9\x89',[6837+-13884]='point',[-4.7925575657894735*4864]='Laugh \xf0\x9f\x98\x82',[20935+-1648]='Roblox Script Developer',[0.72362537764350454*24825]='bombTimerValue',[-22483+12434]='\xd8\xb3\xd8\xb1\xd8\xb9\x88\x7fG\x17\x90\xa5\x1b\xfb\rcal\x1e3G1L\x84\xc4\xbf\xaa\x04K\xf4\x0c\xa1\xfc\xab\xa66\xad-b\xbaV\x15\xdcG\x83\x0c\xe1\xb7\xe1&\xfc\x81\xba\xc0\x87',[1.3560775162337662*-19712]=Xl("\'\52!,\18\48",'^[T'),[4027-19610]='autoFollow',[-16954+3735]='config',[785791040/-26764]='Cypher',[-25376+8071]='\xd8\xb1\xd8\xa4\xd9\x8a\xd8\xa9',[68775472/8719]='\xf0\x9f\x9b\xa1\xef\xb8\x8f A:\xd3RS@\xf0\xc3\xf3Q',[-6.5691489361702127*-564]='configManagerDesc',[-9243- -10544]='toggleUIButton',[41923-9564]='visualDesc',[54.592213114754095*488]='\xd8\xa7\xd8\xb6\xd8\xba\xd8\xb7 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xa7\xd9\x84\xd8\xb2\xd8\xb1 \xd8\xaa\xd8\xad\xd8\xaa \xd8\xa3\xd9\x88 \xd8\xa7\xd8\xb6\xd8\xba\xd8\xb7 \xd8\xa7\xd9\x84\xd9\x85\xd9\x81\xd8\xaa\xd8\xa7\xd8\xad \xd8\xa7\xd9\x84\xd9\x85\xd8\xad\xd8\xaf\xd8\xaf \xd9\x84\xd8\xa5\xd8\xb8\xd9\x87\xd8\xa7\xd8\xb1/\xd8\xa5\xd8\xae\xd9\x81\xd8\xa7\xd8\xa1 \xd8\xa7\xd9\x84\xd9\x88\xd8\xa7\xd8\xac\xd9\x87\xd8\xa9.',[18446395/1745]='wave',[274968600/-16050]='\x8c\xdeG\xc780\xe7g\xe65\xae\xbb\x18\xcc/\xe1',[4450- -21410]='\xd8\xa7\xd9\x84\xd8\xb7\xd9\x8a\xd8\xb1\xd8\xa7\xd9\x86',[56593+-27575]='autoHoldDistanceDesc',[52376-27221]='yourId',[-4002540/-10533]='Po9\xc9.\\\xd2V\x0cp',[24101- -4438]='hideRealBody',[38166720/7968]='Stick Distance',[-11453+4127]='adhesionF8\x05\x80\x142\x00\xa7\xb5\xe6',[766965045/24235]='autoHoldTimer\x14\x999\x0b\x96',[0.41509569206508495*-13951]='onlineNow',[2622-9087]='\xf0\x9f\x9a\x80 F9\xcc\xdd\xb3\xab\xdd\x86\xca\xf0iw\xea:\xb2\xf6\x9f',[-582695379/27943]='\xf0\x9f\xa4\x8d Headles(r',[15686+14742]='d=\x84.\xb6[x\xf1\xe7\xe83\xa1\x06&\xf1E',[27462-12478]='keybindErrorTitle',[-30599- -18774]=Xl('\185Ul\249\132/\171SZ\249\185,','\216 \24\150\212N'),[-20011- -28674]=Xl('\153hn\150\25(\226\a,\29\231\149\212\189\213;C\197L\139\227\254\225\170qb\142\27f\239\27yo\238\152\202\242\207~L\217D\198\170\241\228\172','\201\26\v\224|F\150t\fO\136\247\184\210\173\27%\183#\230\195\149\136'),[-33914+9772]='inviteCopied',[-25875- -6777]='\xd9\x84\xd9\x88 \xd9\x81\xd8\xb9\xd9\x91\xd9\x84\xd8\xaa\xd9\x87\xd8\x8c \xd8\xa8\xd9\x8a\xd8\xb9\xd8\xb7\xd9\x8a \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xd8\xa8\xd8\xb3 \xd9\x84\xd9\x85\xd8\xa7 \xd9\x8a\xd9\x88\xd8\xb5\xd9\x84 \xd9\x88\xd9\x82\xd8\xaa\xd9\x87\xd8\xa7 \xd9\x84\xd9\x84\xd8\xb1\xd9\x82\xd9\x85 \xd8\xa7\xd9\x84\xd9\x85\xd8\xad\xd8\xaf\xd8\xaf \xd8\xa8\xd8\xa7\xd9\x84\xd8\xb3\xd9\x84\xd8\xa7\xd9\x8a\xd8\xaf\xd8\xb1 (\xd8\xa8\xd8\xaf\xd9\x84 \xd9\x85\xd8\xa7 \xd9\x8a\xd8\xb9\xd8\xb7\xd9\x8a\xd9\x87\xd8\xa7 \xd9\x81\xd9\x88\xd8\xb1\xd9\x8b\xd8\xa7)',[42010-13678]='5D\x8av\x81/\xe8\xeez\xb5\x83\xb3\xec\xae',[-2417+848]='\xf0\x9f\xc8\x06\xa9Y\xd7l\x9doC\xa7',[6.0843939690620719*5107]=Xl('>t\230\51T\244\181\b,i\253(R\240\165\0','_\1\146\\\22\149\214c'),[114592293/12339]='(\xed:A\xc5\\\x9eW\xfc\xcc\x84\xb4\xab\xc3r\x11>',[-0.11992945326278659*-8505]=Xl('\248=:\218\227>\245,\n\208\216\50','\153HN\181\171Q'),[-41786- -12825]='flag',[-180689082/-9483]='con2\tb\x97\x13\xbaO$\xf8\x98,!\xe1<P',[-17160+-4216]='scriptSettings',[-13861+8700]='\xe2\x9a\xa1th\x12zg\x0c\x18z',[376727442/-18078]='antiAfkDesc',[5273- -8976]='&\xcck\x1e\xdc\xd3\xc6\x04\xaa',[151031400/-20904]='yourUsername',[302270150/-30002]='Teleport a:\xe9\xfbp\x00\xed\xbd\xa7\xd4+\x0c2:\xed\x04\xe9\x16',[12047-1440]='enable\x18,\x9a\xe8\\\x81k\xdbm',[468692397/-18717]='Control your speed',[-27870-3105]='\xf0\x9f\x8f\x86 \xd9\x81\xd9\x88\xd8\xb2\xd8\xa7\xd8\xaa\xd9\x83: ',[-38341- -12322]='English',[-14928+16539]='dance1',[-3462-28059]='\xe2\x9c\x85 Discord invite copied!',[-169300289/-5351]='Secondary',[3.9645951598446372*-6694]='doubleJumpEnabled',[-41677- -25784]='\xd8\xad\xd8\xb0\xd9\x81 \xd8\x12\x81\x89\xffm\x82U\x90>\x9e'\x13\xb0H\xf0\x13*'D\157'),[-13940+-2480]=Xl('\239,\201\244\222O\229,\201\213\223h\255','\156\\\172\145\186\27'),[-1.5680445617121079*17055]='invisibleMo4NK',[12112-8138]='antiAfkDesc',[2870080/8969]='\xf0\x9f\x93\x8b Copy Invite',[12007- -13325]=''\21=/\200\223'),[11861+18608]='Dance 3 \xf0\x9f\x95\xba',[-487386200/25900]='strafeSpeed',[-1.89193136181088*16434]='totalMembers',[34770+-13243]='kor5\xcb\xfe\xea\x1e\xe1\xe1Id\x80',[-553181292/30549]='\xf0\x9f\x9f\xa2 \xd9\xd1`\x00\x039\x80x\xb4\x04\xf8\xd5\x15^\xb0\xa8\xd1',[104313276/16386]='Escapes from players wh8\xdd\xe9\xa0\x82\x14^\xcc>\x17\xee\xfe>\xe2\x02 ',[-316411705/24995]='Cypher',[-0.15909748336708129*-3457]='\xd8\xa7\xd8\xae\xd8\xaa\xd8\xa7\xd8\xb1 \xd8\xb1\xd9\x82\xd8\xb5\xd8\xa9 \xd8\xab\xd9\x85 \xd8\xa7\xd8\xb6\xd8\xba\xd8\xb7 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xa7\xd9\x84\xd8\xaf\xd8\xa7\xd8\xa6\xd8\xb1\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xad\xd9\x85\xd8\xb1\xd8\xa7\xd8\xa1',[-15160- -29348]='LOAD_CONFIG',[-8258-2448]='onlineNow',[12357- -5397]='\xa4\x0e\xfc/\x94Ah\x05\xf3\xb7\tmb \x11\xe7\x06\xfdF\x03on Syste9',[-1990+14828]='Turn into a moving ghost - Red circle appears when enabled',[-97117160/9188]='\xf0\x9f\x86\x94 \xd8\xa7\xd9\x84\xd8\xa2\xd9\x8a \xd8\xaf\xd9\x8a: ',[-95607820/27874]='Automaticall-\xdb\xa6\xa5\xd5\xc5\xfa\xb5\xbb\x9f\xd5\xc5\xb3)\xbc',[1.5251921434671221*-3513]='globe',[-6908+14236]='speedType',[3505+24902]='autoStreakDesc',[0.93390018053695179*-17171]='\xbf\xef\x8d\xb0\x03\x98c\xc3\x86\x11\xeb\xbf\x15\x1ax;\x9bD&\xf6\x87\x0c\xea\xf8.'H\3\231K\31\222\175\57\216\195'),[-33130549/-8059]='\xd8\xaf\xd8\xa8\xd9\x84 \xd9\x86\xd8\xb7',[-39980- -13038]=Xl(',\139n\171\205lg\168<\133\148,\139o\129\205ug\168<\153l]','\244,\182\5\21\198\191\15\228\52\180'),[6341+26082]='pinAutoButton',[23382-7351]='#\xac\x14=NK\x0f\xb2\x87\xe9B\x15|\x1c',[-6964-14914]='Anti-AFK Kick',[22123+-14518]='main\x8cN\x0b\x9f\x8b\x1d\x1b\n\x8a''),[-595198656/18888]='If enabled, only passes the bomb once its timer reaches the slider value (instead of instantly)',[26450+-23964]='Chase Duration',[-21309+-1312]='scriptDesc',[-454208208/27672]='\xf0\x9f\x8c\x8d Select Language / \xd8\xa7\xd8\xae\xd8\xaa\xd8\xb1 \xd8\xf7\xcd\xc6\xa9\xae\x8d\xe4b\xfd\xb7',[23817+-29374]='newDanceSystem',[6611-17906]='\xe2\x80\xa2 Don't enable auto when high speed is active \xe2\x80\xa2 Auto only works when you have the bomb \xe2\x80\xa2 If stuck, try toggling auto off/on \xe2\x80\xa2 If button lost, press reset button',[-5867+-6753]='invisibleModeDesc',[294485576/19816]='reconnecting',[752789975/-24605]='proXFeature(\x1b',[-63862036/-12148]='Primary',[-5737446/-858]='Icon',[-24357- -4720]='Sh4N\xeb\xff\x92\x17\\\xf0\xd4\xa0\xe9Q\xf0\\)\x0e\xa2\x7fK\xf1$\xc4\rPm=\xf0V',[-32110- -30710]='Main Features',[53669-28504]='\xd8\xa7\xd8\xb8\xd9\x87\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xb3\xd8\xa7\xd8\xad\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x85\xd8\xae\xd8\xaa\xd8\xa7\xd8\xb1\xd8\xa9',[441485952/27264]='\xe2\x9a\xa0\xef\xb8\x8f Important Warning:\nUsing this script is entirely at your own risk and responsibility. We are not responsible for any damage. Although we work to provide a script with the highest possible security standards, this is a precautionary warning in case any unexpected problem occurs. W3\x04h\xff\xde3&4\xd3\x155\xc4\xb08\t\xdd\xffg\x12\xb8#\xd4BVlwY\x05F\xc8\xea\xa2 \xc2\xa6Xl\x8ae\xba?\xbb',[13109586/6601]='\xd8\xaa\xd9\x81\xd8\xb9\xd9\x8a\xd9\x84 \xd8\xe2\xbf\x97\xe5\x8b\xed\xcd\xd9\x84\xd8\xb1\xd9\x82\xd8\xe5',[-15417-1044]='fps',[-14137-18146]='minDistance\x14@\xaf\xe7i',[-27522- -4412]=''!\161T'),[-67958736/-3748]='\xf0\x9f\x93\x8a \xd9\x81\xd8\xb1\xd9\x8a\xd9\x85\xd8\xa7\xd8\xaa\xd9\x83: ',[27135+-6777]=Xl('\1\25\153v7\226w\235kE3\250a\b\173\fyss)5\218|\207\139\t\178\27,\190\250y\240\196l*-\234','\241\134\3\246\23:\208\51\195\157\158\"\202(u\181\160\245S'),[25446+-260]=Xl(')\189Zw\195>\250X,\176\213\235\20\183K','\241\f\131\245\27\139\"'),[30959+-14507]=Xl('\218\201\181\138,\221\195\168\140c\244','\144\166\220\228\f'),[-0.77700678913738019*20032]='teleportTools',[-140110838/19414]='Delivery Time (seconds)',[-1.4216353969858078*-22759]='copyInvite',[-13998+12274]='enableDanc2\x86\xd7\x8eXq\xf7}',[-33233850/5070]='ghostSpeed',[887620416/-31737]='Not found',[2.3745701653839855*12214]='mov>C\xdf\xe7\x0f',[-5.0980318650421745*-5335]='Visuals',[58840520/3044]='DELETE_CONFIG',[0.50595966754719413*15521]='Toggle UI Key',[14.053058676654182*1602]='\xd9\x85\xd8\xb3\xd8\xa7\xd9\x81\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb1\xd8\xa7\xd9\x88\xd8\xba\xd8\xa9',[4900-9197]='\xe2\x9a\x94\xef\xb8\x8f \xd9\x82\xd8\xaa\xd9\x84\xd8\xa7\xd8\xaa\xd9\x83: ',[6081- -9025]='Enable Flight',[0.69818243877463948*-23438]='version',[8494-9591]='Icon',[3423-9428]='G?\xad\xc2\xca\xef\x17\xeb\xdd\xdc\xfeS',[21401+-12676]='How fast you dodge left and ri7\xacb\x9a',[30597-16677]=Xl('\167\194}C\18\139\170\211]E7\129\180','\198\183\t,Z\228'),[-1.8975198550926571*14354]='\xf0\x9f\x86\x95 Latest Updates:\n\n\xe2\x80\xa2 \xe2\x9a\x99\xef\xb8\x8f Full Config System (Save/Load/Delete settings + Auto-Load)\n\xe2\x80\xa2 \xe2\x8c\xa8\xef\xb8\x8f Toggle UI Button + Keybind to open/close the UI\n\xe2\x80\xa2 \xf0\x9f\x97\x91\xef\xb8\x8f Removed buttons: Go Above Map, Go to Nearest Enemy, Update Script, FakeLag\n\xe2\x80\xa2 \xf0\x9f\x8f\xb7\xef\xb8\x8f Renamed ProXFeatures tab to "Pro Futures"\n\xe2\x80\xa2 \xe2\x9a\xa1 Performance improvements to reduce lag\n\xe2\x80\xa2 \xf0\x9f\x8e\xaf Auto Follow system update\n\xe2\x80\xa2 \xf0\x9f\x96\x90\xef\xb8\x8f Added Reach toggle + size slider\n\xe2\x80\xa2 \xf0\x9f\x92\xa3 Added Auto Grab Bomb\n\xe2\x80\xa2 \xf0\x9f\xa6\xb6 Added Auto Backshot\n\xe2\x80\xa2 \xe2\x8f\xb1\xef\xb8\x8f Bomb delivery timer slider\n\xe2\x80\xa2 \xf0\x9f\x8e\xaf Added Auto Hold\n\xe2\x80\xa2 \xf0\x9f\x94\xa7 General fixes to auto systems',[-31561+27328]='rotationSpeedDesc',[38677+-12226]='invisibleMode',[21420+-24379]='Dodge Distance',[23989+7044]='Flight Features',[59467+-32130]='\xd8\xb7\xd9\x8a\xd8\xb1\xd8\xa7\xd9\x86',[-5717+-18295]='\xf0\x9f\x86\x95 \xd8\xa2\xd8\xae\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xad\xd8\xaf\xd9\x8a\xd8\xab\xd8\xa7\xd8\xaa:\n\n\xe2\x80\xa2 \xe2\x9a\x99\xef\xb8\x8f \xd9\x86\xd8\xb8\xd8\xa7\xd9\x85 Config \xd9\x83\xd8\xa7\xd9\x85\xd9\x84 (\xd8\xad\xd9\x81\xd8\xb8/\xd8\xaa\xd8\xad\xd9\x85\xd9\x8a\xd9\x84/\xd8\xad\xd8\xb0\xd9\x81 \xd8\xa7\xd9\x84\xd8\xa5\xd8\xb9\xd8\xaf\xd8\xa7\xd8\xaf\xd8\xa7\xd8\xaa + \xd8\xaa\xd8\xad\xd9\x85\xd9\x8a\xd9\x84 \xd8\xaa\xd9\x84\xd9\x82\xd8\xa7\xd8\xa6\xd9\x8a)\n\xe2\x80\xa2 \xe2\x8c\xa8\xef\xb8\x8f \xd8\xb2\xd8\xb1 Toggle UI + Keybind \xd9\x84\xd9\x81\xd8\xaa\xd8\xad \xd9\x88\xd8\xa5\xd8\xba\xd9\x84\xd8\xa7\xd9\x82 \xd8\xa7\xd9\x84\xd9\x88\xd8\xa7\xd8\xac\xd9\x87\xd8\xa9\n\xe2\x80\xa2 \xf0\x9f\x97\x91\xef\xb8\x8f \xd8\xad\xd8\xb0\xd9\x81 \xd8\xa3\xd8\xb2\xd8\xb1\xd8\xa7\xd8\xb1: Go Above Map, Go to Nearest Enemy, Update Script, FakeLag\n\xe2\x80\xa2 \xf0\x9f\x8f\xb7\xef\xb8\x8f \xd8\xaa\xd8\xba\xd9\x8a\xd9\x8a\xd8\xb1 \xd8\xa7\xd8\xb3\xd9\x85 \xd8\xaa\xd8\xa8\xd9\x88\xd9\x8a\xd8\xa8 ProXFeatures \xd8\xa5\xd9\x84\xd9\x89 "\xd9\x85\xd9\x85\xd9\x8a\xd8\xb2\xd8\xa7\xd8\xaa \xd8\xa8\xd8\xb1\xd9\x88"\n\xe2\x80\xa2 \xe2\x9a\xa1 \xd8\xaa\xd8\xad\xd8\xb3\xd9\x8a\xd9\x86\xd8\xa7\xd8\xaa \xd8\xa3\xd8\xaf\xd8\xa7\xd8\xa1 \xd9\x84\xd8\xaa\xd9\x82\xd9\x84\xd9\x8a\xd9\x84 \xd8\xa7\xd9\x84\xd9\x84\xd8\xa7\xd9\x82\n\xe2\x80\xa2 \xf0\x9f\x8e\xaf \xd8\xaa\xd8\xad\xd8\xaf\xd9\x8a\xd8\xab \xd9\x86\xd8\xb8\xd8\xa7\xd9\x85 Auto Follow\n\xe2\x80\xa2 \xf0\x9f\x96\x90\xef\xb8\x8f \xd8\xa5\xd8\xb6\xd8\xa7\xd9\x81\xd8\xa9 \xd8\xb2\xd8\xb1 Reach + \xd8\xb3\xd9\x84\xd8\xa7\xd9\x8a\xd8\xaf\xd8\xb1 \xd8\xaa\xd8\xad\xd9\x83\xd9\x85 \xd8\xa8\xd8\xad\xd8\xac\xd9\x85\xd9\x87\n\xe2\x80\xa2 \xf0\x9f\x92\xa3 \xd8\xa5\xd8\xb6\xd8\xa7\xd9\x81\xd8\xa9 \xd8\xb2\xd8\xb1 Auto Grab Bomb\n\xe2\x80\xa2 \xf0\x9f\xa6\xb6 \xd8\xa5\xd8\xb6\xd8\xa7\xd9\x81\xd8\xa9 \xd8\xb2\xd8\xb1 \xd8\xa7\xd9\x88\xd8\xaa\xd9\x88 \xd8\xaf\xd8\xb9\xd8\xb3 (Auto Backshot)\n\xe2\x80\xa2 \xe2\x8f\xb1\xef\xb8\x8f \xd8\xb3\xd9\x84\xd8\xa7\xd9\x8a\xd8\xaf\xd8\xb1 \xd9\x88\xd9\x82\xd8\xaa \xd8\xaa\xd8\xb3\xd9\x84\xd9\x8a\xd9\x85 \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 (Bomb Timer)\n\xe2\x80\xa2 \xf0\x9f\x8e\xaf \xd8\xa5\xd8\xb6\xd8\xa7\xd9\x81\xd8\xa9 \xd8\xb2\xd8\xb1 \xd8\xa7\xd9\x88\xd8\xaa\xd9\x88 \xd9\x87\xd9\x88\xd9\x84\xd8\xaf (Auto Hold)\n\xe2\x80\xa2 \xf0\x9f\x94\xa7 \xd8\xa5\xd8\xb5\xd9\x84\xd8\xa7\xd8\xad\xd8\xa7\xd8\xaa \xd8\xb9\xd8\xa7\xd9\x85\xd8\xa9 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xa3\xd9\x86\xd8\xb8\xd9\x85\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88',[15810- -3430]='\xd9\x88\xd9\x82\xd8\xaa \xd8\xa7\xd9\x84\xd8\xaa\xd8\xb3\xd9\xd4\x8c\xb4\xac!\xa9\x04\xf8\xc5\x9b\xe7\xea\x13Hy\x87\x9d\x196R\xcb\xb6\xe1b',[-9727- -25126]='Select Arena',[37076442/2262]='When the bomb's remaining time reaches this or lower, delivery starts',[-318381520/-20110]='rotationSpeedDesc',[-654153076/-22679]='showArenaDesc',[41171+-28476]='Delivery Time (seconds)',[30875-31004]=Xl('\16K\210k#\244\154L\255\130\n\51\251zO*u\185\228\219\134\229\54\163\245Ra\154\18\235',"\242\196aK\251^B\239\',\211\185#\203o"),[-90+-30946]='Buttons',[37635-26183]='\xd8\xa5\xd8\xb4\xd8\xb9\xd8\xa7\xd8\xb1',[-30552- -1124]='rejoin',[12817-20689]=Xl('I\141\4,\136-\177\16.\136i','\r\226\96K\237'),[8863-29240]='straf1\xdf\xd7\xd3|\xaa45\xe1[T\xd9',[-128389140/-11693]='\xd9\x8a\xd9\x83\xd8\xa8\xd8\xb1 \xd8\xad\xd8\xac\xd9\x85 \xd8\xa3\xd8\xb7\xd8\xb1\xd8\xa7\xd9\x81 \xd8\xa7\xd9\x84\xd9\x84\xd8\xa7\xd8\xb9\xd8\xa8\xd9\x8a\xd9\x86 \xd8\xa7\xd9\x84\xd8\xab\xd8\xa7\xd9\x86\xd9\x8a\xd9\x8a\xd9\x86 \xd8\xb9\xd8\xb4\xd8\xa7\xd9\x86 \xd8\xaa\xd9\x84\xd9\x85\xd8\xb3\xd9\x87\xd9\x85 \xd9\x85\xd9\x86 \xd8\xa8\xd8\xb9\xd9\x8a\xd8\xaf',[57373-29670]=Xl('w@\146~I\129t','\a,\243'),[25107-24864]='\xd8\xb3\xd8\xb1\xd8\xb9\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb1\x88\xce\x192\xe1\x06'U/\x88\xfe\x9cgz\xf6\xfc>d\xa742na\xf4p\xe6Z\x10\x9b\xa1',[-11579+13858]='adhesionForceDesc',[-23619+30165]='speedDesc',[-0.69536065751054399*18494]='#\xdb\xbb\xf4|\xf3a\xa0\xaa\xdc|\xf0m',[0.88639053254437872*-16900]='\xd9\x8a\xd8\xb1\xd9\x88\xd8\xad \xd8\xaa\xd9\x84\xd9\x82\xd8\xa7\xd8\xa6\xd9\x8a\xd9\x8b\xd8\xa7 \xd9\x84\xd8\xa3\xd9\x82\xd8\xb1\xd8\xa8 \xd9\x84\xd8\xa7\xd8\xb9\xd8\xa8 \xd9\x88\xd8\xa7\xd9\x82\xd8\xb9 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xa7\xd9\x84\xd8\xa3\xd8\xb1\xd8\xb6 \xd9\x88\xd9\x8a\xd9\x88\xd9\x82\xd9\x81 \xd8\xac\xd9\x86\xd8\xa8\xd9\x87',[-1.4848993288590604*-15496]='\xf0\x9f\x93\x8b Update L8\x93\xa7',[235014312/-26104]='stop\x12\xf7T\xd8\x8e\xd3\xaf',[-23839-6239]='settings',[1255254/1001]='autoJoin',[-9492-20490]='kills',[-1131+32026]='bombTimerValue',[-2598+-8344]='Enable \x00T\xd6\x9ei\xcc\xae\xd2\xaa\xdf\xa3\xe4\xf2\x9b\x8a{\xf75\x9d\xddQ\xd0',[30192+1189]=Xl('\253\178\135\22X\19\194\251\184\178\28@>\216\248','\143\215\244s,R\183'),[-39838- -23284]='Auto Join Arena',[29202+3287]='Closest Distance',[-815+19985]='\xd8\xa7\xd9\x86\xd8\xb6\xd9\x85 \xd9\x84\xd9\x84\xd8\xb3\xd9\x8a\xd8\xb1\xda\xa4\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xb1\xd8\xb3\xd9\x85\xd9\x8a \xd9\x84\xd9\x84\xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa!\n\xe2\x80\xa2 \xd8\xa2\xd8\xae\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xad\xd8\xaf\xd9\x8a\xd8\xab\xd8\xa7\xd8\xaa\n\xe2\x80\xa2 \xd9\x85\xd8\xb3\xd8\xa7\xd8\xb9\xd8\xaf\xd8\xa9 \xd9\x81\xd9\x86\xd9\x8a\xd8\xa9\n\xe2\x80\xa2 \xd8\xa5\xd9\x82\xd8\xaa\xd8\xb1\xd8\xa7\xd8\xad\xd8\xa7\xd8\xaa \xd9\x88\xd8\xaa\xd8\xad\xd8\xb3\xd9\x8a\xd9\x86\xd8\xa7\xd8\xaa\n\xe2\x80\xa2 \xd8\xaa\xd8\xad\xd8\xaf\xd9\x8a\xd8\xab\xd8\xa7\xd8\xaa \xd8\xa3\xd9\x85\xd8\xa7\xd9\x86\n\n\xd8\xa7\xd9\x84\xd8\xb1\xd8\xa7\xd8\xa8\xd8\xb7: https://discord.gg/CgUa36sPNs',[-322002762/-23169]='yourName',[0.17792610250297974*20975]='ID: ',[-273228306/18681]='streakModeDesc',[7343+-6422]=Xl(',t\n\2t>K\19\0y.','J\24ce\28'),[8667- -11213]='enableDanceButtonDesc',[-19398-324]='mainFeaturesDesc',[13.568835098335855*-1322]='otherDesc',[-304213905/-10305]=Xl('\167wX\141\193d\29\163cG\166\247c\f','\198\2,\226\146\16o'),[22619+-25882]=':\x94a\x9a\x8c\xc9\xb5\x9b\x93Q',[-749126469/26229]='Change right leg to Korblox (visi6\x9d+U\xb8\xa0\xfe\xa1\xc73*\t\xa0\xf9\xfa\x7fh',[-34445+19628]='Additiona7\x1b\x8fA\x98\xffhd\x8b\xdf\xb8\xf6\x17|\xe3\x0c7\xdb\xfc\xbd\x03\xfep\x98',[2277+13081]='\xe2\x9a\xa0\xef\xb8\x8f \xd8\xaa\xd9\x86\xd8\xa8\xd9\x8a\xd9\x87',[-28565- -18929]='\xd8\xa7\xd9\x84\xd9\x85\xd8\xb3\xd8\xa7\xd9\x81\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x84\xd9\x8a \xd9\x8a\xd8\xa8\xd8\xaf\xd8\xa3 \xd8\xb9\xd9\x86\xd8\xaf\xd9\x87\xd8\xa7 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb1\xd8\xa7\xd9\x88\xd8\xba\xd8\xa9 \xd9\x8a\xd9\x85\xd9\x8a\xd9\x86 \xd9\x88\xd9\x8a\xd8\xb3\xd8\xa7\xd8\xb1',[-0.87193980546889338*27245]='\xab_\xc0\x03XX`\xc0\xaa\x05o\xdb\xbbO$\x15/} \xe0\x19\xab\x00\xba\xe39',[0.054590963817248588*-31562]='teleportTools',[-393629676/-30902]='enableAutoJoin',[1.0036452611604914*-20026]='autoReady',[39286032/-1808]='enableSpeed',[-0.18581833761782349*23340]='other',[-0.10443676174013253*13884]='\xd8\xa7\xd9\x84\xd8\xb9\xd9\x88\xd8\xaf\xd8\xa9 \xd9\x84\xd9\x84\xd9\x85\xd9\x83\xd8\xa7\xd9\x86 \xd8\xb9\xd9\x86\x8c\xfdM\x05m\xd4)\x11\xb0Q=\xd0\xbb\x90\xb6H\x08w',[11106-12869]='toggleUIKeyDesc',[-7692- -17710]='\xd9\x85\x8f\x89\xa8\xb9,A\x96G\xf5\x85@s\x1d\xe8',[30898-31722]='\xd9\x8a\xd8\xab\xd8\xa8\xd8\xaa \xd8\xb2\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xa7\xd9\x84\xd8\xb4\xd8\xa7\xd8\xb4\xd8\xa9 \xd9\x88\xd9\x8a\xd9\x86\xd9\x81\xd9\x83\xd9\x87 \xd8\xa8\xd8\xa7\xd9\x84\xd8\xb6\xd8\xba\xd8\xb7 \xd9\x85\xd8\xb1\xd8\xa9 \xd8\xab\xd8\xa7\xd9\x86\xd9\x8a\xd8\xa9',[-3.2163522012578616*-3180]=Xl(']\172X6\236SD\19\165\\T\b\20/)X(\237xD\5\165WU%\20,','\133\t\128\143\52\252\156\180}\243\140\175\204'),[0.18991472462518855*32483]=Xl('?\23\56\130m,7\167\199if\211=_j\247H','\231\176\225\n\181\134\238/'),[-22212+-1031]='\xd8\xb3\xd8\xb1\xd8\xb9\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xb7\xd9\x8a\xd8\xb1\xd8\xa7\xd9\x86 (50-200)',[-15260+7444]='Enable Auto Follow',[1.1921224842573157*-24297]='flightDesc',[-23371-5225]='\xd8\xb3\xd8\xb1\xd8\xb9\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xb4\xd8\xa8\xd8\xad',[-624875807/32063]='\x88\xfa>\n\xba\x9d\xbfp\x01\xc1D\x85\x91\t\n\xa1\x9c\xd7A\xd8\xee\xa44\xb3A',[27235- -594]='configManagerTitle',[-0.70239394133881006*-31162]='autoHoldTimerDesc',[-3.5603199999999999*-3125]='Speed 2',[26956-26195]=Xl('w\204\159\175\135\163$\192\14\129\144\28fR6wc\169\148\151\202/3\4\54\138\140\214\192;re\14\129h|\25,k+\193\168\181\150\230/0\4.','\135S\4\14h\27\171\224\215\aH\164\190\245\239\242Cq3NN\246\180\220'),[23650+-284]='\xd8\xa5\xd8\xb8\xd9\x87\xd8\xa7\xd8\xb1 / \xd8\xa5\xd8\xae\xd9\x81\xd8\xa7\xd8\xa1 \xd8\xa7\xd9\x84\xd9\x88\xd8\xa7\xd8\xac\xd9\x87\xd8\xa9',[28920+-10699]=Xl('\211a\202\157k\228;\0\239\180\165z\206K3\245\141\31\152\16j\194:<\23\192\248\4\148\23M\166','\v\198\18\48\178e\227\184\207m \163M\147\148,'),[-1.6609478672985782*-10550]='strafeSpeedDesc',[-0.079447322970639028*-17370]='korbloxDesc',[2990- -4608]='\xf0\x9f\x91\xef\xdd\xe8ow\xcfT\xd8R\x1f8\x98\x81Ln\xc2B',[-24670+-3332]='Reset Auto Button Position',[0.45420225275405374*-32316]='\x17X\xb2{\x12\x95\x18\x91\xf9\xe2\xfc\x11\xfd\x0b\t\x89Q\xb6\xf1\xfb\xf7',[-31037- -9885]='Keybind Set',[-3895+29005]='warningDesc',[-4336- -21056]='toggleUITitle',[-118486737/5337]=Xl('~\193(z\235\31u\250,}\234\31\127','\27\183I\t\130p'),[19690-22129]='ligh$AxaG\xef\xaf{@}',[-0.22858878315448472*-9878]='yourName',[521377624/18169]='lockCamera',[-14989520/1508]='\xe2\x80\xa2 Members: {members}\n\xe2\x80\xa2 Online: {online}\n\n\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\n\xf0\x9f\x93\xa2 Updates \xe2\x80\xa2 \xf0\x9f\x9b\xa0 Support \xe2\x80\xa2 \xf0\x9f\x8e\x89 Events',[-0.84969797020973248*-26653]='streakMode',[-62766+31969]='\xd9\x85\xd8\xb7\xd9\x88\xd8\xb1 \xd8\xb3\xd9\x83\xd8\xb1\xd8\xa8\xd8\xaa\xd8\xa7\xd8\xaa Roblox',[-4831- -17257]=Xl(',\246\48\v\198\24=\244&\15\216&','X\153Dj\170U'),[-0.014912930715079658*32388]=Xl('\198DA%\18,S\186\129\196W\23E','6\219\229\168\50d'),[627229824/29564]='\xe2\x9a\x94\xef\xb8\xdb3\x12t\x03llsn3',[18490- -9525]='dance2',[-10209-3619]='\xf0\x9f\x8f\x83\xe2\x80\x8d\xe2\xce.\x0b\x0f\x8a\xb8\x8d'\x80\xae\xde\x81V\xed\xde0T#\xf8mPd\xeb\xb0uN\xee\xfe\xb7\xf0',[19216+-30996]='\xd8\xad\xd8\xb3\xd9\x91\xd9\x86 \xd8\xb1\xd8\xa4\xd9\x8a\xd8\xaa\xd9\x83 \xd9\x88\xd8\xa3\xd8\xaf\xd8\xa7\xd8\xa1 \xd8\xa7\xd9\x84\xd9\x84\xd8\xb9\xd8\xa8\xd8\xa9',[36266+-29807]='reachLevel',[35495-22091]='1\xb8\xd8\x00\x8e\xbf\xa3\xda\xd6\xc5\r\x96\xb9\xbb\xf0',[0.4410914712010216*14879]='discordServerDesc',[-54939+27508]=Xl('b\"\187$\204\184h_A8\162)\216\188hO','\3W\207K\156\217\27,'),[-36324- -15117]='Toggle UI',[-41919- -9688]=Xl('<;\233\238#dT*,\239\238=wt','OX\155\135S\16\a'),[-57532+31876]=Xl('\205\199&x%\234\27\163D\150\175\174\205,d\"\143h\170N\134\185','\142\143i7v\175;\250\v\195\253'),[2.0110610057006721*11753]='If you have the bomb, passes it to enemy',[183422400/-18550]='autoBackshot',[-50920+29189]='Automatically Join Arenas',[-13785+-3985]='co\x11\x94\xff\xe1J9E\x81\x87\xfa`"\x0f\x93\xd4\xae'\173]<\131\16'),[-59191+30743]='Waits this long before moving to the enemy so it looks natural, 0.0 = moves instantly',[25237+6081]='\xd9\x85\xd9\x81\xd8\xaa\xd8\xa7\xd8\xad \xd8\xa5\xd8\xb8\xd9\x87\xd8\xa7\xd8\xb1/\xd8\xf1B\xd7\xe5Y\xb1Ak\xa8A\x97\xf9\xb1\xe0\xf0\xefY\x16e\x9e`\xf9\x16\xb9\xd6+',[-219440089/13607]='autoHoldWarnTitle',[-12021-8371]=Xl(',\183\242\180\179L!\185\242\180\186K','B\216\134\221\213%'),[54851-27976]='developer',[-13.730909090909091*825]='\xd8\xaa\xd8\xab\xd8\xa8\xd9\x8a\xd8\xaa \xd8\xb2\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88',[-33540870/27269]='\xd8\xa7\xd9\x86\xd8\xed\xb3\x96\x0e\x1dNV\xad\x80\x10\xc2\x08\xe7\xdc\xa8e\xcet\x19\xf1\x7fJPMXs|\xe7K\xf2x\x18\xe4e\x16\x879i',[20306- -12151]='\xf0\x9f\x8e\xae Join Discord Server',[-152023008/11408]='Noclip (Wall Hack)',[-55497- -22835]='notesDesc',[44593224/1833]='Keybind Error',[18826-14312]='Select Theme',[26136+-20391]='\xf0\x9f\x91\xbb \xd9\x88\xd8\xb6\xd8\xb9 \xd8\xa7\xd9\x84\x88\xcc\x08\xb1\x98H\x04\x12\xb4}\xcdko',[0.52370657521991948*13414]='languageChanged',[0.49603685387168889*-14761]='\xd8\xaa\xd9\x85 \xd8\xaa\xd8\xb9\x82\xde\xd5\x884.\x10Fp\xbd\xf0\xd7Z\xf0\xba\x0b\xe6\xa47y\xff\x8d''),[953+7074]='notesDesc',[-138379195/28799]='\xd8\xa8\xd9\x8a\x8c\xaf\x1a\xb5\x12\xd0\xd5\xa1\x04\xe7\x9e\x8fh\n\x90Q\x18\x12\xc518\x05\x82y2\xf1m(|r\x1d\xac\x17.\xc9\x04\xc7\xa9<;\xcd\xc5u\x0c',[0.78187902702162726*20021]='flightDescb\xfe',[-3155- -24416]='1-5 Steal#*\x0e / 6-10 Veryw_\xc0\x82u',[-0.29292224499585712*-22931]='proXFeatures',[8929-21700]=Xl('\222!b\202\240,\161R*\193<d\222\242,\164Z)\206','\173U\16\171\150I\224?Z'),[41925+-9162]='serverFound',[0.98361650485436891*-19776]='\xd8\xb3\x8d\xa5\x0e*O\x0c\xb4\xa9E\xfe\xea\x11aX\x80jg\x7f\xc1>[\xa4UU&~<\xa9J\xfe\xfb\x11l\xa1\xd8;4"\xb1',[-16710+29983]='antiLag',[49006188/15687]='scriptClosed',[35317-28347]='\xd9\x84\xd9\x82\xd9\x8a\xd9\x86\xd8\xa7 \xd8\xa3\xd8\xb1\xd9\x8a\xd9\x86\xd8\xa7! \xd8\xac\xd8\xa7\xd8\xb1\xd9\x8a \xd8\xa7\xd9\x84\xd8\xa7\xd9\x86\xd8\xb6\xd9\x85\xd8\xa7\xd9\x85...',[-13819+22032]='Ultra Anti Lag',[1.3144873699851412*13460]=Xl('\195\48\202,2\240\231%\209=:\245\215','\176D\184IS\155'),[0.25279670824225281*-7777]='\xd8\xa7\xd9\x84\xd9\x84\xd8\xa7\xd8\xb9\xd8\xa8 \xd8\xa7\xd9\x84\xd9\x85\xd8\xb3\xd8\xaa\xd9\x87\xd8\xaf\xd9\x81',[22582- -8417]='othe"\x85\xb5\t#\x96\xcf\xe9\x95',[469-32542]='\xd9\x84\xd9\x85\xd8\xa7 \xd9\x8a\xd9\x88\xd8\xb5\xd9\x84 \xd9\x88\xd9\x82\xd8\xaa \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xd9\x84\xd9\x87\xd8\xb0\xd8\xa7 \xd8\xa7\xd9\x84\xd8\xb1\xd9\x82\xd9\x85 \xd8\xa3\xd9\x88 \xd8\xa3\xd9\x82\xd9\x84\xd8\x8c \xd8\xa8\xd9\x8a\xd8\xa8\xd8\xaf\xd8\xa3 \xd8\xa7\xd9\x84\xd8\xaa\xd8\xb3\xd9\x84\xd9\x8a\xd9\x85',[-15902- -17281]='\xf0\x9f\x9a\x80 Dual Speed System',[-26527- -19456]='ghostJump',[11540- -15713]='autoJoinDesc',[-4840-22038]='\xd8\xb7\xd9\x8a\xd8\xb1\xd8\xa7\xd9\x86 \xd9\x81\xd9\x8a \xd9\x88\xd8\xb6\xd8\xb9 \xd8\xa7\xd9\x84\xd8\xa7\xd8\xae\xd8\xaa\xd9\x81\xd8\xa7\xd8\xa1',[-125988153/6891]='reachLevelDesc',[356065808/-24052]='\xf0\x9f\x8f\x86 Wins: ',[-54693+28894]='\xd8\xa8\xd9\x8a\xd8\xb8\xd9\x87\xd8\xb1 \xd9\x84\xd9\x83 \xd8\xa7\xd9\x84\xd8\xb3\xd8\xa7\xd8\xad\xd8\xa9 \xd8\xa7\xd9\x84\xd9\x84\xd9\x8a \xd8\xa7\xd8\xae\xd8\xaa\xd8\xb1\xd8\xaa\xd9\x87\xd8\xa7',[-766388620/27124]='pinAutoButton',[9.7843878954607977*2908]='Done',[-2574- -21368]=Xl('-\187T\132\1<-<\189V\136\0/?,','O\212\57\230DJL'),[-3903+6406]='other',[31917434/-8446]='Restarting...',[6816-7836]='Auto Pass Bomb\xf0\x9f\x92\xa3',[-6897- -3684]='developer',[-61271- -30065]='\xf0\x9f\x93\x85 \xd8\xb9\xd9\x85\xd8\xb1 \xd8\xa7\xd9\x84\xd8\xad\xd8\xb3\xd8\xa7\xd8\xa8: ',[0.90919493807215934*29712]='\xd9\x8a\xd8\xb1\xd9\x88\xd8\xad \xd8\xaa\xd9\x84\xd9\x82\xd8\xa7\xd8\xa6\xd9\x8a\xd9\x8b\xd8\xa7 \xd9\x84\xd8\xa3\xd9\x82\xd8\xb1\xd8\xa8 \xd9\x84\xd8\xa7\xd8\xb9\xd8\xa8 \xd9\x85\xd8\xb9\xd9\x87 \xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xd8\xb9\xd8\xb4\xd8\xa7\xd9\x86 \xd9\x8a\xd8\xa7\xd8\xae\xd8\xb0\xd9\x87\xd8\xa7',[-62179- -32029]='config',[-20498- -10027]='enableFlight',[-589119327/-25917]='\xe2\x80\xa2 \xd9\x84\xd8\xa7 \xd8\xaa\xd8\xb4\xd8\xba\xd9\x84 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd9\x88\xd8\xa3\xd9\x86\xd8\xaa \xd9\x85\xd9\x81\xd8\xb9\xd9\x84 \xd8\xa7\xd9\x84\xd8\xb3\xd8\xb1\xd8\xb9\xd8\xa9 \xd8\xa7\xd9\x84\xd8\xb9\xd8\xa7\xd9\x84\xd9\x8a\xd8\xa9 \xe2\x80\xa2 \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd9\x8a\xd8\xb4\xd8\xaa\xd8\xba\xd9\x84 \xd9\x81\xd9\x82\xd8\xb7 \xd8\xb9\xd9\x86\xd8\xaf\xd9\x85\xd8\xa7 \xd8\xaa\xd9\x85\xd9\x84\xd9\x83 \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xe2\x80\xa2 \xd8\xa5\xd8\xb0\xd8\xa7 \xd8\xb9\xd9\x84\xd9\x82 \xd8\xac\xd8\xb1\xd8\xa8 \xd8\xaa\xd9\x82\xd9\x81\xd9\x84 \xd9\x88\xd8\xaa\xd9\x81\xd8\xaa\xd8\xad \xd8\xa7\xd9\x84\xd8\xa3\xd9\x88\xd8\xaa\xd9\x88 \xd9\x85\xd8\xb1\xd8\xa9 \xd8\xab\xd8\xa7\xd9\x86\xd9\x8a\xd8\xa9 \xe2\x80\xa2 \xd8\xa5\xd8\xb0\xd8\xa7 \xd8\xb6\xd9\x8a\xd8\xb9\xd8\xaa \xd8\xa7\xd9\x84\xd8\xb2\xd8\xb1 \xd8\xa7\xd8\xb6\xd8\xba\xd8\xb7 \xd8\xb9\xd9\x84\xd9\x89 \xd8\xb2\xd8\xb1\xd8\xa7\xd8\xb1 "\xd8\xa5\xd8\xb1\xd8\xac\xd8\xa7\xd8\xb9" \xd9\x88\xd8\xa7\xd9\x84\xd8\xb2\xd8\xb1 \xd8\xa8\xd9\x8a\xd8\xb1\xd8\xac\xd8\xb9\xd9\x84\xd9\x83',[3098-501]='Icon',[-362618815/-24427]='\xd8\xa5\xd8\xb8\xd9\x87\xd8\xa7\xd8\xb1 / \x83-m\xf4A\x1e\x86\xeb\xe5GU\x01\xd9;LX\xe2\xa3X\x80\x10\xe5H\x1a\xaf\x18\x9d',[16529+12067]='streakStatus',[20408-20111]='contactDev',[46835729/2279]='double\x1d\xcd\xd5=\x1eEay7\xf7d',[-37316+26004]='enab\x9b\x8e\xb3[W\x95\xd5\xf0\xac\xbf'\140'),[22866-20967]='Auto Join Arena',[-8146-10820]='Config Manager',[46428-31305]='\xd8\xa3\xd9\x82\xd8\xb1\xd8\xa8 \xd9\x85\xd8\xb3\xd8\xa7\xd9\x81\xd8\xa9 \xd9\x85\xd9\x86 \xd8\xa7\xd9\x84\xd8\xae\xd8\xb5\xd9\x85 \xd9\x8a\xd8\xa8\xd8\xaf\xd8\xa3 \xd9\x8a\xd8\xb1\xd8\xa7\xd9\x88\xd8\xba\xd9\x87 \xd9\x81\xd9\x8a\xd9\x87\xd8\xa7 \xd8\xb9\xd8\xb4\xd8\xa7\xd9\x86 \xd9\x85\xd8\xa7 \xd9\x8a\xd8\xa7\xd8\xae\xd8\xb0 \xd9\x85\xd9\x86\xd9\x83 \xd8\xa7\xd9\x84\xd9\x82\xd9\x86\xd8\xa8\xd9\x84\xd8\xa9 \xd9\x82\xd8\xa8\xd9\x84 \xd8\xa7\xd9\x84\xd9\x88\xd9\x82\xd8\xaa',[-0.42274117734835487*-13403]='discordContent',[-553879365/20415]='Gho'0\x06\x19\x0f\x08mp Powe%',[12209- -10059]='noclipInvisible',[-56216367/13569]='teleport',[0.6575905131007983*-30189]='\xd8\xb6\xd8\xad\xd9\x83 \xf0\x9f\x98\x82',[-26270-3718]='ghostJump',[109657955/8557]='Info',[-60321- -31085]='copyLink',[1.9535254190331071*-14438]='bombEvasion',[384338425/18385]='LOAD_CONFIG',[-65857188/-3404]='\xe2\x8f\xb3 \t\xa8\x18y\x99C\xb4_"\x06L\xa5\x00\x8e\xac\xc7',[-67.409722222222229*288]='doubleJumpDesc',[0.089501862197392923*-8592]='joinDiscord',[18.143840856924253*1307]='\xd8\xaa\xd9\x86\xd8\xf8\x1b`m\x1a!\xab\xd2\\\xfb\xf0\xb2\xaa\xd8\xae\xd8\xaf\xd9\x85 \xd9\x83\x89F\xcal)\xd8\xf9U\\\xe0\xf0\xb2\xad\xd8\xb8\xd8\xb1',[15.219716832721552*-1907]='Speed 1',[-0.15497865667741093*-11479]='\xd8\xaa\xd8\xb4+\xea4\x1aJ\xcbA\xfb:\x93\x10$\x1f\xc8\xd8\xb7.0V"\xe7\xc7X\xb7\xe1\xbf|*\x1cQJ\xb5\xd8^'\19~\243Y\24\221s+\176\133F\254\25'),[6442- -23354]='selectDa9\xb8NP',[28442+-25890]=Xl('\2#\151\5q,\0-\180\bv&','nJ\240m\5E'),[-874166792/29672]='Turn Sp2\xc9b~',[6271+-26320]='savePosition',[0.25036100184235421*20083]='\xd8\xad\xd8\xac\xd9\x85 \xd8\xa7\xd9\x84\xd8\xb1\xd9\x8a\xd8\xaa\xd8\xb4',[-9576420/-1510]='teleportDesc',[-451862271/-15293]='str5\x16\x10\xa6\x82\t(d\xd0v',[-82265134/-16058]='\xd8\xac\xd8\xa7\xd8\xb1\xd9\x8a \xd8\xa7\xd9\x84\xd8\xa8\xd8\xad\xd8\xab',[45802+-21178]='enableFlight',[-885798158/-28411]='\xd8\xaa\xd8\xb4\xd8\xba\xd9\x8a\xd9\x84 \xd8\xa7\x82<h\xf9\x07p\xc8\xb3\xc2~4$(bE4\xcf\\\xeb\x14\r',[0.29783981656542902*-24859]='keybindSetDesc',[-694435033/-25031]='strafeDistance',[-11932- -4548]='speedSettings'},...)
