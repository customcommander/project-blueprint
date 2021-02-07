# Takes the JSDoc output of a single source file
# Transformed document is available at tmp/metadata/*.meta.json

def dist_path:
  (.meta.path + "/" + .meta.filename)
  | ltrimstr("/workspace/dev/src")
  | "./" + ltrimstr("/");

def transform_params: map({
  name,
  type: (.type.names | join(", ")),
  description,
  optional: (.optional == true)
});

def transform_doclet: {
  kind,
  name,
  location: dist_path,
  description,
  examples,
  params: (if .params then .params | transform_params else null end),
  returns: (.returns | map(.type.names[]) | join(" | ")),
  deprecated
};

(map(select(.kind == "namespace"))[0] | .name // "/") as $ns

| { namespace: $ns
  , exports: (map(select(.access == "public") | transform_doclet)
           | reduce .[] as $x ({}; (. + { ($x.name): ({namespace: $ns} + $x) })))
  }