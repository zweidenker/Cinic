baselines
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
		self neoJson: spec.
      spec
        package: 'Cinic-Core' with: [ spec requires: #('NeoJSON') ].
      spec
        group: 'default' with: #('Cinic-Core' ) ]