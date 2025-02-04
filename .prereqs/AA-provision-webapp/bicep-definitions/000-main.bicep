targetScope = 'subscription'

var solutionName = 'eureka'
var location = 'centralus'
param envNickname string // Taken care of in .bicepparams files

@minLength(1)
@sys.description('Pick something that will help you ensure that your URL is unique -- maybe your name followed by the current date')
param urlUniqueifier string

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: '${solutionName}-rg-${envNickname}'
  location: location
}
