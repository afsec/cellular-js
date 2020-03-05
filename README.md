# Cellular JS


A Javascript [micro-frontends](https://micro-frontends.org/) framework with States oriented MVP - Model View Presenter) implementation.

![Micro Frontend](https://micro-frontends.org/ressources/screen/three-teams.png)

## Cons

- A lot...
- More documentation needed (You're welcome)
- There is no type-system (Yet. Maybe some day.)


## Pro
- Work beautifully with micro-frontends
- Now you can have a *Live Debug on a TV*, so you can track segfaults at real time (I know, it's useless. But, it's cool!). Try it!
- Powered by `Google Closure Compiler`
- No `npm`,`yarn`, etc.
- No `nodejs` blackhole.
![NPM blackhole](https://img.devrant.com/devrant/rant/r_760537_vKvzh.jpg)
- *Low learning curve*.
- *Beginners are doing well*.
- Agile prototyping for experienced developers.
- A state can't be broken by another state execution. So, that means no segmentation faults. But, be cautious about usage footprint: CPU, Memory and DOM reentrance.


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

### Create the required (InitialState) and move to `./src/js/states/` folder.

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
xdg-open ./tmp/callgraph.svg
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


---

## Create your own project

### 1. Make your first state (Cell)


```
./new-state.sh ShowPage
mv -v showpage ./src/js/states/
./build.sh
```
CAUTION: Don't use the `state` in you state name.


### 2. Call your current state(ShowPage) from previous state(InitialState)

`vi ./src/js/states/initialstate/presenter.js`

#### Before
```js
const stateInitialStatePresenter = () => {
    debug(`stateInitialStatePresenter()`)
    const model = stateInitialStateModel()
    const view = stateInitialStateView(model)
    // AddEvenListener, innerHTML or Call Another State.
}
```


#### After
```js
const stateInitialStatePresenter = () => {
    debug(`stateInitialStatePresenter()`)
    const model = stateInitialStateModel()
    const view = stateInitialStateView(model)
    // AddEvenListener, innerHTML or Call Another State.
    stateShowPage()
}
```

#### 3. Check your project (http://localhost:8000) with `Developer Tools` again

![Browser with Developer Tools 1s state](/docs/07-first-state.png?raw=true)


#### 4. Check your Callgraph (image) again
```
xdg-open ./tmp/callgraph.svg
```
![Basic Callgraph](/docs/08-first-state-callgraph.png?raw=true)


### How to generate Production artifacts tree

Use `./build.sh -p` for **production code** generation (no debug messages).


### Deploy

**Distribution folder:** `./dist/htdocs/pages/`

`tree  ./dist/htdocs/pages/`
```
./dist/htdocs/pages/
├── css
│   ├── style.1583309824.css
│   └── uikit.min.css
├── favicon.ico
├── index.html
└── js
    ├── main.1583309824.js
    ├── uikit-icons.min.js
    └── uikit.min.js

2 directories, 7 files
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

- [ ] Make an useful CRUD Example

- [ ] Make a tutorial to show you some Proof of Concept about **UI focused State Oriented Programming**, or simply *"Cell (MVP powered)"*

- [ ] More documentation

- [ ] Merge script into one executable (maybe Rust)


## Thanks to
- Michael Geers(@naltatis) Micro Frontends (https://micro-frontends.org/)
- Elm lang (State Communication inspiration)
- Actor Model
- Kevlin Henney talks
- Joe Armstrong talks
- Robert "Uncle Bob" Martin talks
- Google Closure Compiler
