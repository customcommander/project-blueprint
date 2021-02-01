# collect all tmp/metadata/*.meta.json
# nest all exports under their own namespace.
# result is available at tmp/exports.json

reduce .[] as {$namespace, $exports} ({};
  ($namespace | ltrimstr("/") | split("/")) as $path
  | setpath($path; getpath($path) + ($exports | map_values(.location)))
)
