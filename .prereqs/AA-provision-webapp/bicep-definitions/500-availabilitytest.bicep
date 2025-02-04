targetScope = 'resourceGroup'

param aiName string
param wtName string
param location string

resource ai 'Microsoft.Insights/components@2020-02-02' = {
  name: aiName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Request_Source: 'rest'
  }
}

resource availabilityTest 'Microsoft.Insights/webtests@2022-06-15' = {
  name: wtName
  location: location
  kind: 'standard'
  tags: {
    'hidden-link:${ai.id}': 'Resource'
  }
  properties: {
    Enabled: true
    Frequency: 300
    Timeout: 120
    Kind: 'standard'
    RetryEnabled: true
    Locations: [
      {
        Id: 'emea-au-syd-edge'
      }
      {
        Id: 'us-ca-sjc-azr'
      }
    ]
    Request: {
      RequestUrl: 'https://yesno.wtf/api'
      HttpVerb: 'GET'
      ParseDependentRequests: false
    }
    ValidationRules: {
      ExpectedHttpStatusCode: 200
      SSLCheck: true
      SSLCertRemainingLifetimeCheck: 7
    }
    Name: wtName
    SyntheticMonitorId: wtName
  }
}
