phalanx = Team.create name: 'Phalanx'
mannite = Team.create name: 'Mannite'

['Attack on Titan', 'Take out the trash', 'Destroy the enemy'].each do |desc|
  phalanx.tasks.create description: desc
end

['Organize mutant party', 'Invite mutants'].each do |desc|
  mannite.tasks.create description: desc
end

%w(Cyclops Angel Beast Phoenix).each do |name|
  phalanx.mutants.create name: name
end

%w(Mimic Changeling Havok Petra).each do |name|
  mannite.mutants.create name: name
end
