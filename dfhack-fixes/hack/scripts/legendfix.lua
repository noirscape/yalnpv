local figs = df.global.world.history.figures

for i=0,#figs-1,1 do
   local v = figs[i]
   if v.id<0 then
      print(v.id..' '..v.name.first_name..' '..v.name.language)
      v.name.language = 0
   end
end
