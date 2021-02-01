# Takes the JSDoc output of a single source file
# Transformed document is available at tmp/metadata/*.meta.json

def dist_path:
  (.meta.path + "/" + .meta.filename)
  | ltrimstr("/workspace/dev/src")
  | "./" + ltrimstr("/");

def transform_doclet: {
  kind,
  name,
  location: dist_path
};

{ namespace: map(select(.kind == "namespace"))[0].name
, exports: (map(select(.access == "public") | transform_doclet)
           | reduce .[] as $x ({}; (. + {($x.name): $x})))
}