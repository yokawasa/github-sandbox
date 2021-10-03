# git-sandbox

<!-- TOC -->

- [git-sandbox](#git-sandbox)
  - [git reflog and reset](#git-reflog-and-reset)
  - [git subtree](#git-subtree)

<!-- /TOC -->

## git reflog and reset

You can return to a certain position by selecting the position you want to return to with `git reset --hard`

First, you can check relogs with `git reflog`. Reflogs track when Git refs were updated in the local repository

```
git reflog

f338aec HEAD@{1}: commit: +debug info
704d250 HEAD@{2}: commit: fix Makefile
26c455b HEAD@{3}: commit: remove docker.io from default image
6f9f32b HEAD@{4}: commit: update helm version from 3.0.3 to 3.7.0
90bd4b9 HEAD@{5}: commit: add kustomize as prerequistes for steps that needs kustomize
c3febff HEAD@{6}: commit: updated
2d859c1 HEAD@{7}: commit: update go dependencies
dba6e55 HEAD@{8}: commit: add helm update and download prometheus-community/kube-prometheus-stack
10aac95 HEAD@{9}: commit: fix bug on kind-start
7790fd6 HEAD@{10}: commit: upgrade golang:1.12.5 to 1.16
3c6a28a HEAD@{11}: commit: switch kind --loglevel (deprecated) to -v
1819347 HEAD@{12}: commit: switch kind --loglevel (deprecated) to -v
1b34224 HEAD@{13}: commit: upgrade go 1.12 -> 1.13
985f6d5 HEAD@{14}: commit: update kind script
a5718b5 HEAD@{15}: commit: update helm installation script
8c1b663 HEAD@{16}: commit: fix bug
3e5bab6 HEAD@{17}: commit: version up
03e12e7 HEAD@{18}: commit: Update target kubernetes versions
8f80a43 HEAD@{19}: commit: update description
674b41c HEAD@{20}: commit: update .gitignore
9e68a91 HEAD@{21}: commit: update
a05a3c0 HEAD@{22}: commit: fix lint
3bb73b7 HEAD@{23}: commit: update api
5e30cf4 HEAD@{24}: commit: update base crd with controller-gen v0.4.1
aa843b6 HEAD@{25}: commit: remove resource-type-patch as it's already included in base crd
e087df8 HEAD@{26}: commit: remove golint from golangci linter list
314e686 (origin/master, origin/HEAD, master) HEAD@{27}: checkout: moving from master to support-latest-k8s
314e686 (origin/master, origin/HEAD, master) HEAD@{28}: clone: from github.com:yokawasa/k8s-cronjob-prescaler.git
```

You can return the history with `reset --hard` by specifying `HEAD @ {n}` at the position you want to return to.
In this case, let's return to `HEAD @ {2}` before add debug info

```bash
git reset --hard HEAD@{2}

HEAD is now at 704d250 fix Makefile
```

In this case, you need to add `-f (--force)` to push as your current branch is behind its remote counterpart.

```bash
git push origin <feature-branch> -f
```

> TIPS
> git push assumes that the remote can capture the local as a fast-forward merge. When fast-forward merge isn't possible, you need to push with `-f (--force)`
> See [this](https://qiita.com/vsanna/items/451b42f886c599a16a55) to understand `fast-forward`

REFERENCES

- [git reflog | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/rewriting-history/git-reflog)
- [git rebase | Atlassian Git Tutorial](https://www.atlassian.com/ja/git/tutorials/rewriting-history/git-rebase)

## git subtree

Suppose you have a repository that you want to take it as a subtree. 

Add the it as remote repository

```bash
SUBTREE_NAME=hoge
git remote add $SUBTREE_NAME git@github.com:yokawasa/hoge.git
```

Then, add the remote repository as subtree (named `hoge`)
```
git subtree add --prefix=${SUBTREE_NAME} --squash ${SUBTREE_NAME} master
```

Then, suppose there are some changes made in parent repository, you want to reflect the change of the parent repo into the destination (child)

```bash
# git subtree pull --prefix=<子のpullしたいディレクトリ名> --squash <外部リポジトリ名> <pull先ブランチ名>
# git subtree pull --prefix=<destination-dir> --squash <remote-repo-name> <branch-name-to-pull>
# - <destination-dir> : dir name that you add with `git subtree add`
# - <remote-repo-name>: repo name that you add with `git remote add`
# - <branch-name-to-pull>:  the branch name to pull in parenet repo

SUBTREE_NAME=hoge
git subtree pull --prefix=${SUBTREE_NAME} --squash ${SUBTREE_NAME} master
```
