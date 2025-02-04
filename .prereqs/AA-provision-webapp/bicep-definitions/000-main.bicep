targetScope = 'subscription'

var solutionName = 'eureka'
var location = 'centralus'
param envNickname string // Taken care of in .bicepparams files

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: '${solutionName}-rg-${envNickname}'
  location: location
}

module sw './500-availabilitytest.bicep' = {
  name: '${solutionName}-ai-and-wt-${envNickname}'
  scope: resourceGroup(rg.name)
  params: {
    aiName: '${solutionName}-ai-${envNickname}'
    wtName: '${solutionName}-wt-${envNickname}'
    location: location
  }
}
