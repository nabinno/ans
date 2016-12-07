# Ans

Prototype of a rails-like CLI for ansible projects to add in bootstrapping a playbook.

## Installation
Install both ansible and ans globally.

```
pip install ansible
bash -c "$(curl -fsSL https://raw.github.com/nabinno/ans/master/install.sh)"
exec -l $SHELL
```

## Usage
```
ans help
```

### Base instructions
```sh
ans generate :project/:host_group/:book
ans run :project/:host_group/:book [-e :environment]
ans test :project/:host_group/:book [-e :environment]
ans ls
```

### How to change projects directory from `~/.ans/projects`
```sh
echo 'export ANS_PROJECTS_PATH="$HOME/other_projects_directory"' >> ~/.your_profile
```

## Available dynamic inventory
- GCE

---

## LICENSE

MIT

## EPILOGUE

>     A whale!
>     Down it goes, and more, and more
>     Up goes its tail!
>
>     -Buson Yosa
