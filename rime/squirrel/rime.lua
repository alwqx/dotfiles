-- refer https://github.com/hchunhui/librime-lua/blob/master/sample/lua/date.lua

-- 翻译器：自动转换日期时间
function date_translator(input, seg)
   if (input == "date") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "日期"))
   end
end

--[[
time_translator: 将 `time` 翻译为当前时间
--]]

local function time_translator(input, seg)
   if (input == "time") then
      yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " 时间"))
   end
end