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

## Create your own states

### 1. Make your first state (`ShowPage`)


```sh
make state NAME="ShowPage"
make
```
**CAUTION:** Don't use word `state` in your state name.


#### 2. Insert default caller's name ("Home" in this specific case) inside `showpage/state.js` on `AccessControlList` JS array.

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
        "Home"
    ]
```


### 3. Call your current state(ShowPage) from previous state(Home)

`vi ./src/js/states/home/presenter.js`

#### Before
```js
const stateHomePresenter = (message) => {
    debug(`stateHomePresenter()`)
    const model = stateHomeModel(message)
    const view = stateHomeView(model)
    // AddEvenListener, innerHTML or Call Another State.
}
```


#### After
```js
const stateHomePresenter = (message) => {
    debug(`stateHomePresenter()`)
    const model = stateHomeModel(message)
    const view = stateHomeView(model)
    // AddEvenListener, innerHTML or Call Another State.
    const someData = "Some Data"
    stateShowPage(currentState, someData)
}
```

#### 4. Check your project (http://localhost:8000) with `Developer Tools` again

![Browser with Developer Tools 1s state](/docs/07-first-state.png?raw=true)


#### 5. Check your Callgraph (image) again
```
xdg-open ./tmp/callgraph.svg
```
![Basic Callgraph](/docs/08-first-state-callgraph.png?raw=true)


### How to generate Production artifacts tree

Use `make release` for **production code** generation (no debug messages).


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

## Aditional make commands

- `make debug` to generate **debuging code**.
- `make clean` to clean temporary files.
- `make version` to show Cellular JS version.

## TODO

- [X] An useful CRUD Example
- [X] More documentation
- [X] *Actor model* features: **Message Passing** and **Access Control List**
- [X] Browser Extension support (Closure Compiler with `-O SIMPLE_OPTIMIZATIONS`)
- [X] Desktop Application support (Closure Compiler with `-O SIMPLE_OPTIMIZATIONS`)
- [X] Mobile Application support (Closure Compiler with `-O SIMPLE_OPTIMIZATIONS`)
- [X] GNU Make build system implemented
- [X] `debug()` now supports log level ['INFO', 'WARNING' and 'ERROR']
- [X] WaitForElement improvements
- [X] React-like inspired `Routing System` (`routes.js`)
- [X] `Routing System` 404 page (`states/404/`)
- [X] `Routing System` History
- [X] `Routing System` Core states (`states/core`)
- [X] `Routing System` base template (`states/core/basetemplate/`)
- [X] Group states using folders (`states/{some_folder}/{state_folder_A}, states/{some_folder}/{state_folder_B}`, `states/{another_folder}/state_folder_C`)
- [ ] Merge script into one executable (maybe Rust)
- [ ] A type-system implementation



## Acknowledgements
- Michael Geers(@naltatis) Micro Frontends (https://micro-frontends.org/)
- Elm lang (Inspiration for Inter-State Communication)
- Actor Model
- Kevlin Henney talks
- Joe Armstrong talks
- Robert "Uncle Bob" Martin talks
- Google Closure Compiler
- @JADSN (https://github.com/JADSN) by request and test of several features, including: `debug()` log level, and `Routing System`.
