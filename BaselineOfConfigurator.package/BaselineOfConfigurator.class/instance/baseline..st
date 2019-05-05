baselines
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
		self neoJson: spec.
      spec
        package: 'Configurator' with: [ spec requires: #('NeoJSON') ].
      spec
        group: 'default' with: #('Configurator' ) ]