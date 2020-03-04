# Cellular JS


A Javascript frontend framework with States oriented MVP - Model View Presenter) implementation.


## Cons

- A lot...
- More documentation needed (You're welcome)
- There is no type-system (yet, maybe some day, did I hear "patreon"..?)


## Pro

- Powered by `Google Closure Compiler`
- No `npm`,`yarn`, etc.
- No `nodejs` blackhole.
![NPM blackhole](https://img.devrant.com/devrant/rant/r_760537_vKvzh.jpg)
- *Low learning curve*.
- *Beginners are doing well*.
- Agile prototype for experienced developers.


## Dependencies

1. Google Closure Compiler (`$HOME/bin/closure-compiler.jar`)

2. Graphviz (dot language) - `sudo apt-get install graphviz`

3. Python 3 (for local HTTP Server)


## How to use

### Install dependencies first.

### Create your workspace
```
git clone --depth=1 https://github.com/afsec/cellular-js
cd cellular-js

```

### Create the required first state (InitialState) and move to `./src/js/states/` folder.

```
./new-state.sh InitialState
mv -v initialstate ./src/js/states/
./build.sh

```

### Check your project (http://localhost:8000) with `Developer Tools`

![Browser with Developer Tools](/docs/05-browser-developer-tools.png?raw=true)


### Check Your Debug artifacts at  `./tmp/` folder

#### Callgraph (image)
```
xdg-open xdg-open ./tmp/callgraph.svg
```
![Basic Callgraph](/docs/06-basic-callgraph.png?raw=true)



#### Tree view
```
./tmp/
├── callgraph.dot (Callgraph source code)
├── callgraph.svg (Callgraph image)
├── main-compiled.js (Artifact)
├── main-compiler.js (Javascript merged to generate callgraph to be compiled)
└── main-debug.js (Javascript merged to generate callgraph)

```


## Workflows

![MVP Basic Rules](/docs/01-mvp-basic-roles.png?raw=true)

---

![MVP Separation of Concerns](/docs/02-mvp-separation-of-concerns.png?raw=true)

---

![MVP State Cell Composition](/docs/03-state-cell-comp.png?raw=true)

---

![MVP State Data Travel Rules](/docs/04-state-data-travel.png?raw=true)

---





## TODO

- [ ] An useful CRUD Example

- [ ] More documentation

- [ ] Merge script into one executable (maybe Rust)
