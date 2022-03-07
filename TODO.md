Sinopsys
--------

```
 $ cd /path/to/project
 $ proj here # adds project with its origin url into projects registry

 $ proj # shows projects list and makes possible to clone project
```

When project is added, its file looks like this:

```yaml
directory: devel/kaineer/projname
repo: git@github.com:kaineer/projname.git
tags:
  - git
  - vim
```

One may add another tags to project's file and config
tags actions file.

Tags actions file
-----------------

```yaml
git:
  actions:
    clone: "git clone ${repo} ${directory}"

vim:
  actions:
    edit: "cd ${directory} && vim ."

node:
  collect: "cat package.json | jq '.scripts | keys() | join(\"\n\")'"
  run: "pnpm run ${name}"
```
