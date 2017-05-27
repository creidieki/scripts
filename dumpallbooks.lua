local utils=require('utils')

print("DUMPING BOOKS")
for k,v in pairs(df.global.world.buildings.other.TABLE) do
   badindices={}
   for y, x in pairs(v.contained_items) do
      if x.use_mode == 0 then
         book = x.item
         if not book.flags.in_job then
            table.insert(badindices, y)
         end
      end
   end
   -- printall(badindices)
   -- print()
   -- printall(v.contained_items)
   -- print("--")
   for j = #badindices, 1, -1 do
      i = badindices[j]
      -- print(i)
      book = v.contained_items[i].item
      -- print("***")
      -- printall(book)
      book.flags.on_ground = true
      len = #dfhack.maps.getTileBlock(book.pos).items
      dfhack.maps.getTileBlock(book.pos).items:insert('#', book.id)
      for w, v in ipairs(book.general_refs) do
         if v._type == df.general_ref_building_holderst then
            book.general_refs:erase(w)
            break
         else
         end
      end
      print("Erasing item "..i.." of table "..v.id)
      v.contained_items:erase(i)
      -- TODO: CANCEL copy_written if timer>0 but no unit_id
      -- look through locations for libraries. check
      -- nope. doesn't work. copy_written doesn't know it's no longer
      -- in process. try going through scribeinfo structures and check
      -- if things have unit_id -1 but when you go to the item it's
      -- in a copy_written job. if so, delete the activity link from the
      -- item and set the item's in_job flag to false.

      -- and maybe set scribeinfo.anon_1 to 0 every time?
      
      -- book.flags.on_ground = true
      -- len = #dfhack.maps.getTileBlock(book.pos).items
      -- dfhack.maps.getTileBlock(book.pos).items:insert('#', book.id)
      -- for w, v in ipairs(book.general_refs) do
      --    if v._type == df.general_ref_building_holderst then
      --       book.general_refs:erase(w)
      --       break
      --    else
      --    end
   end
end

-- for i=#v.contained_items,2,-1
-- -- for i=2,#v.contained_items do
-- --    v.contained_items:erase(1)
-- -- end
-- end

if #df.global.world.world_data.active_site >= 1 then
   for k,v in ipairs(df.global.world.world_data.active_site[0].buildings) do
      if v._type == df.abstract_building_libraryst then
         print(k.." is a library.")
         if v.scribeinfo then
            print(k.." has scribe jobs.")
            for n,job in ipairs(v.scribeinfo.scribejobs) do
               item=df.item.find(job.item_id)
               badref=-1
               for m,activ in ipairs(item.general_refs) do
                  if activ._type == df.general_ref_activity_eventst then
                     activ = utils.binsearch(df.global.world.activities.all, activ.activity_id, "id")
                     event = activ.events[0]
                     if event._type == df.activity_event_copy_written_contentst then
                        if job.unit_id == -1 then
                           badref=m
                           item.flags.in_job = false
                           printall(event)
                        end
                     end
                  end
               end
               if badref ~= -1 then
                  item.general_refs:erase(badref)
               end
               -- printall(item.general_refs)
               -- print(k.." job number "..n.." uses item # "..item)
            end
         end
      end
   end
end