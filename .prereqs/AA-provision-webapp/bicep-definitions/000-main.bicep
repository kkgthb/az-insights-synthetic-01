targetScope = 'subscription'

var solutionName = 'eureka'
var location = 'centralus'
param envNickname string // Taken care of in .bicepparams files

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: '${solutionName}-rg-${envNickname}'
  location: location
}
