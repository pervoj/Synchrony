sources = [
  'provider.vala',
  'provider-controller.vala',
  'remote.vala',
  'remote-controller.vala',
  'application.vala',
#  'window.vala',
]


# blueprints_src = [
#   'window.blp',
# ]


dependencies = [
  dependency('libadwaita-1', version: '>= 1.0'),
]


# blueprints_ui = []
# blueprints_vala = []
# foreach b : blueprints_src
# 	blueprints_ui += b.replace('.blp', '.ui')
# 	blueprints_vala += b + '.vala'
# endforeach


# blueprints = custom_target('blueprints',
#   input: blueprints_src,
#   output: blueprints_ui,
#   command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTDIR@', '@CURRENT_SOURCE_DIR@', '@INPUT@']
# )


# sources += custom_target('blueprints_hack',
# 	input: blueprints,
# 	output: blueprints_vala,
# 	command: [find_program('touch'), '@OUTPUT@']
# )


sources += configure_file(
  input: 'constants.vala.in',
  output: 'constants.vala',
  configuration: config_data
)


sources += gnome.compile_resources('resources',
  configure_file(
    input: '@0@.gresource.xml.in'.format(meson.project_name()),
    output: '@0@.gresource.xml'.format(meson.project_name()),
    configuration: config_data
  ),
  c_name: meson.project_name(),
#   dependencies: blueprints
)


executable(meson.project_name(), sources,
  vala_args: [
    '--target-glib=2.50',
    '--gresourcesdir=src/',
  ],
  dependencies: dependencies,
  install: true,
)
