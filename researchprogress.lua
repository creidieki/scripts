print(("%8s %25s %8s %20s %8s"):format("Unit Id", "Name", "GoalCat", "Research Points", "Ponders"))
for k,v in ipairs(df.global.world.units.active) do
   if v and v.hist_figure_id ~= -1 then
      fig = df.global.world.history.figures[v.hist_figure_id+1]
      if fig.info.secret and fig.info.secret.knowledge then
         know = fig.info.secret.knowledge
         print(("%8d %25s %8d %20d %8d"):format(fig.id, dfhack.TranslateName(dfhack.units.getVisibleName(v)), know.knowledge_goal_category, know.research_points, know.times_pondered))
      end
   end
end
