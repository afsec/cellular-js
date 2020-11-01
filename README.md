# Cellular JS


A Javascript framework implementation of **UI Focused State Oriented Architecture** grounded by MVP (Model View Presenter), with [micro-frontends](https://micro-frontends.org/) support.


## Sample WebApp
https://github.com/afsec/cellular-js-example-app


## Visual concept
![Single Page App states](/docs/00-states-example.png?raw=true)



## Features
- Works beautifully with **micro-frontends**;
- Tiny artifacts ( Ex: [Sample WebApp](https://github.com/afsec/cellular-js-example-app) < `50KBytes` );
- Now you can have a *Live Debug on a TV*, so you can track segfaults at real time (I know, it's useless. But, it's cool!). Try it;
- Powered by `Google Closure Compiler`;
- No `npm`,`yarn`, etc;
- No `node_modules` blackhole;
![NPM blackhole](https://img.devrant.com/devrant/rant/r_760537_vKvzh.jpg)
- *Low learning curve*;
- *Beginners are doing well*;
- Agile prototyping for experienced developers;
- A state can't be broken by another state execution. So, that means no segmentation faults. But, be cautious about usage footprint: CPU, Memory and DOM reentrance.


## Dependencies

1. Google Closure Compiler (`$HOME/bin/closure-compiler.jar`)

2. Graphviz (dot language) - `sudo apt-get install graphviz`

3. Python 3 (for local HTTP Server)


## Getting Started

### Install dependencies first.

### Create your workspace
```sh
git clone --depth=1 https://github.com/afsec/cellular-js
cd cellular-js
```

### Create the required (InitialState) and

```sh
./new-state.sh InitialState
```

#### Insert function caller name ("main" in this specific case) inside `initialstate/state.js` `AccessControlList` JS array.

##### Before

```js
// ACL: Insert HERE all allowed senders.
    const AccessControlList = [
        ""
    ]
```

##### After

```js
// ACL: Insert HERE all allowed senders.
    const AccessControlList = [
        "main"
    ]
```

### Move state to `./src/js/states/` folder and build your project.

```sh
mv -v initialstate ./src/js/states/
./build.sh
```

### Check your project (http://localhost:8000) with `Developer Tools`

![Browser with Developer Tools](/docs/05-browser-developer-tools.png?raw=true)


### Check Your Debug artifacts at  `./tmp/` folder

#### Callgraph (image)
```sh
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

### 1. Make your first state (`ShowPage`)


```sh
./new-state.sh ShowPage
mv -v showpage ./src/js/states/
./build.sh
```
CAUTION: Don't use `state` in you state name.


### 2. Call your current state(ShowPage) from previous state(InitialState)

`vi ./src/js/states/initialstate/presenter.js`

#### Before
```js
const stateInitialStatePresenter = (message) => {
    debug(`stateInitialStatePresenter()`)
    const model = stateInitialStateModel(message)
    const view = stateInitialStateView(model)
    // AddEvenListener, innerHTML or Call Another State.
}
```


#### After
```js
const stateInitialStatePresenter = (message) => {
    debug(`stateInitialStatePresenter()`)
    const model = stateInitialStateModel(message)
    const view = stateInitialStateView(model)
    // AddEvenListener, innerHTML or Call Another State.
    const someData = "Some Data"
    stateShowPage(currentState, someData)
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

## How to Debug source code

### VIDEO: Click bellow to play
[![Debugging source code](https://img.youtube.com/vi/Chq3iwTgbJQ/0.jpg)](https://www.youtube.com/watch?v=Chq3iwTgbJQ)




## TODO

- [X] An useful CRUD Example
- [X] More documentation
- [X] *Actor model* features: **Message Passing** and **Access Control List**
- [ ] Desktop Application support (Multi-Plartform)
- [ ] Mobile Application support (Multi-Plartform)
- [ ] Merge script into one executable (maybe Rust)
- [ ] A type-system implementation



## Thanks to
- Michael Geers(@naltatis) Micro Frontends (https://micro-frontends.org/)
- Elm lang (Inspiration for Inter-State Communication)
- Actor Model
- Kevlin Henney talks
- Joe Armstrong talks
- Robert "Uncle Bob" Martin talks
- Google Closure Compiler
