synchrony_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

synchrony_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
]

synchrony_sources += gnome.compile_resources('synchrony-resources',
  'synchrony.gresource.xml',
  c_name: 'synchrony'
)

executable('synchrony', synchrony_sources,
  vala_args: '--target-glib=2.50',  dependencies: synchrony_deps,
  install: true,
)
