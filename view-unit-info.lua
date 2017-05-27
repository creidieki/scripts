researchNames = {}
for i=0,14 do
   researchNames[i] = {}
-- researchNames[0] = {}
-- researchNames[4] = {}
-- researchNames[12] = {}
end

researchNames[0][0] = "formal reasoning"
researchNames[0][1] = "deductive reasoning"
researchNames[0][2] = "syllogistic logic"
researchNames[0][3] = "hypothetical syllogisms"
researchNames[0][4] = "propositional logic"
researchNames[0][5] = "dialectic reasoning"
researchNames[0][6] = "analogical inference"
researchNames[0][7] = "medical ethics"
researchNames[0][8] = "individual value"
researchNames[0][9] = "state consequentialism"
researchNames[0][10] = "truth"
researchNames[0][11] = "perception"
researchNames[0][12] = "justification"
researchNames[0][13] = "belief"
researchNames[0][14] = "existence"
researchNames[0][15] = "time"
researchNames[0][16] = "mind/body duality"
researchNames[0][17] = "objects and their properties"
researchNames[0][18] = "wholes and parts"
researchNames[0][19] = "the metaphysics of events"
researchNames[0][20] = "the metaphysics of processes"
researchNames[0][21] = "the metaphysics of causation"
researchNames[0][22] = "military ethics"
researchNames[0][23] = "ethics in interpersonal conduct"
researchNames[0][24] = "law"
researchNames[0][25] = "education"
researchNames[0][26] = "grammar"
researchNames[0][27] = "etymology"
researchNames[0][28] = "diplomacy"
researchNames[0][29] = "forms of government"
researchNames[0][30] = "economic policy"
researchNames[0][31] = "social welfare"
researchNames[1][0] = "inductive reasoning"
researchNames[1][1] = "direct inference"
researchNames[1][2] = "the nature of beauty"
researchNames[1][2] = "the dictionary"
researchNames[2][1] = "proof by contradiction"
researchNames[2][2] = "a notation for zero"
researchNames[2][3] = "a notation for negative numbers"
researchNames[2][4] = "notations for large numbers"
researchNames[2][5] = "positional notation"
researchNames[2][6] = "the geometry of basic objects"
researchNames[2][7] = "the method of exhaustion"
researchNames[2][8] = "similar and congruent triangles"
researchNames[2][9] = "the geometric mean theorem"
researchNames[2][10] = "isosceles_base_angles_equal"
researchNames[2][11] = "inscribed_triangle_on_diameter_is_right"
researchNames[2][12] = "the pythagorean theorem"
researchNames[2][13] = "3 digit pythagorean triples"
researchNames[2][14] = "4 digit pythagorean triples"
researchNames[2][15] = "the existence of incommensurable ratios"
researchNames[2][16] = "axiomatic reasoning"
researchNames[2][17] = "unique prime factorization"
researchNames[2][18] = "an algorithm for computing gcd"
researchNames[2][19] = "a formula for the volume of a pyramid"
researchNames[2][20] = "a formula for the volume of a code"
researchNames[2][21] = "a formula for the volume of a sphere"
researchNames[2][22] = "a 4-digit approximation to pi"
researchNames[2][23] = "an algorithm for division"
researchNames[2][24] = "a table of chord values"
researchNames[2][25] = "calculating the area of a triangle from its side lengths"
researchNames[2][26] = "calculating the area of a circle"
researchNames[2][27] = "a 6-digit approximation to pi"
researchNames[2][28] = "conic sections"
researchNames[2][29] = "the chinese remainder algorithm"
researchNames[2][30] = "the area enclosed by a line and a parabola"
researchNames[2][31] = "the sieve algorithm for primes"
researchNames[6][0] = "dissection"
researchNames[6][1] = "anatomy"
researchNames[6][2] = "comparative anatomy"
researchNames[6][3] = "physical features"
researchNames[6][4] = "migration patterns"
researchNames[6][5] = "reproductive behavior"
researchNames[6][6] = "foraging"
researchNames[6][7] = "the food chain"
researchNames[6][8] = "social behavior"
researchNames[6][9] = "diseases"
researchNames[6][10] = "climactic adaptation"
researchNames[6][11] = "embriological development"
researchNames[6][12] = "the struggle for existence"
researchNames[4][3] = "personal interviews"
researchNames[12][0] = "shadow clocks"
researchNames[12][1] = "water clocks"
researchNames[12][2] = "conical water clocks"
researchNames[12][7] = "the theory of the pulley"
researchNames[12][8] = "the pulley"
researchNames[12][9] = "the theory of the screw"
researchNames[12][10] = "the screw"
researchNames[12][11] = "the theory of wheel and axle"
researchNames[12][12] = "the windlass"
researchNames[12][13] = "the theory of the wedge"
researchNames[12][14] = "the theory of the lever"
researchNames[12][15] = "the lever"

function researchPointsToProgress(rp)
   if rp == 0 then
      return "has just begun"
   elseif rp < 10000 then
      return "is just getting started"
   elseif rp < 30000 then
      return "is starting to make progress"
   elseif rp < 60000 then
      return "is partway there"
   elseif rp < 80000 then
      return "is making good progress"
   else return "is close to a discovery"
   end
end

function getPronoun(u)
   if u.sex == 0 then
      return "She"
   else
      return "He"
   end
end

function findTrue(field)
   for i=0,31 do
      if field[i] then
         return i
      end
   end
   return nil
end

function getName(cat, goal)
   if researchNames[cat] and researchNames[cat][goal] then
      return researchNames[cat][goal]
   end
   return "something"
end

function MakeNewFormattedString(text)
   str = df.new('char', string.len(text))
   str2 = df.new('char', string.len(text))
   for i = 1,string.len(text) do
      str[i-1] = string.byte(text, i)
      str2[i-1] = string.byte('G')
   end
   return {new=true, text=str, format=str2, return_val=-1}
end

function dfhack.onStateChange.unit_info (code)
   if code == SC_VIEWSCREEN_CHANGED and dfhack.isWorldLoaded() then
      local scr = dfhack.gui.getCurViewscreen()
      if scr._type == df.viewscreen_textviewerst and scr.parent and scr.parent._type == df.viewscreen_unitst then
         unit = scr.parent.unit
         hist = df.global.world.history.figures[unit.hist_figure_id+1]
         -- print(unit.hist_figure_id)
         -- printall(hist)
         -- printall(hist.info.secret)
         know = hist.info.secret.knowledge
         if know then
            printall(know)
            cat = know.knowledge_goal_category
            goal = findTrue(know.knowledge_goal)
            -- print("GOAL: ", cat, goal)
            if goal then
               scr.formatted_text:insert('#', MakeNewFormattedString(getPronoun(unit).." is researching "..getName(cat, goal)..", and "..researchPointsToProgress(know.research_points).."."))
            end
            -- print(findTrue(know.knowledge_goal))
            -- print(know.knowledge_goal)
            -- printall(know.knowledge_goal)
            -- print(tonumber(know.knowledge_goal))
            -- if researchNames[know.knowledge_goal_category] and researchNames[know.knowledge_goal_category][know.knowlege_goal
            -- if know.knowledge_goal_category == 4 and know.knowledge_goal[3] then
            --    scr.formatted_text:insert('#', MakeNewFormattedString("He is researching the pulley."))
            -- end
         end
      end
      -- print(scr)
      -- AddUsesString(scr, "WOOOOOOOO A DWARF")
      -- if scr._type == df.viewscreen_itemst then
      -- end
   end
end