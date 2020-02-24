#!/usr/bin/awk -f

BEGIN {
    inside_function = 0;
    func_name = "";
    edge_style = "";

    print("digraph callgraph {");
    print("  node [ shape=box; style=filled ];");
    print("  subgraph cluster_0 {");
    print("    node [shape=box;style=filled];");
    print("    label = \"Legend\";");
    print("    View [color=green];");
    print("    Model [color=saddlebrown];");
    print("    Presenter [color=blue];");
    print("    State [color=red];");
    print("  }");

}

/^const state.*\(.* =\> {/ {
    inside_function = 1;
    func_name = $2;

    if (func_name ~ /.*Presenter.*/) {
        print(func_name,"[ fillcolor = blue ];");
    } else if (func_name ~ /.*Model.*/) {
        print(func_name,"[ fillcolor = saddlebrown ];");
    } else if (func_name ~ /.*View.*/) {
        print(func_name,"[ fillcolor = green ];");
    } else if (func_name ~ /.*stateInitialState.*/) {
        print(func_name,"[ fillcolor = grey ];");
    } else {
        print(func_name,"[ fillcolor = red ];");
    }

}

/state.*\(/ {

    # Truths:


    # - A Model cannot call a state: model -> state (NO)

    # - A View cannot call a Model: view -> model (NO)
    # - A View cannot call a Presenter: view -> presenter (NO)
    # - A View cannot call a state: view -> state (NO)
    # - A Presenter cannot call a foreign function, except another state: presenter -> presenter (NO) | presenter -> state (Ok)

    if ((inside_function) && !match($0,/=\>/) && !match($0,/debug\(/) && !match($0,/\/\//) ) {
        gsub(/\(.*\)/, "", $0);
        gsub(/\ \ /, "", $0);
        gsub(/await\ /, "", $0);

        # check if func_name is NOT a state
        # it did not to call an ...
        
        # - A Model cannot call a Model: model -> model (NO)
        if ((func_name ~ /.*Model.*/) && ($0 ~ /.*Model.*/)) {
            edge_style = "[style=dashed; color=red;]";
        # - A Model cannot call a View: model -> view (NO)
        } else if ((func_name ~ /.*Model.*/) && ($0 ~ /.*View.*/)) {
            edge_style = "[style=dashed; color=red;]";
        # - A Model cannot call a Presenter: model -> presenter (NO)
        } else if ((func_name ~ /.*Model.*/) && ($0 ~ /.*Presenter.*/)) {
            edge_style = "[style=dashed; color=red;]";
        # - A Model cannot call a Presenter: model -> state (NO)
        } else if ((func_name ~ /.*Model.*/) && ($0 ~ /^state.*/) && (!match($0,/.*Model.*/)) && (!match($0,/.*View.*/)) && (!match($0,/.*Presenter.*/))) {
            edge_style = "[style=dashed; color=red;]";
        # - A Presenter cannot call a Presenter: presenter -> presenter (NO)
        } else if ((func_name ~ /.*Presenter.*/) && ($0 ~ /.*Presenter.*/)) {
            edge_style = "[style=dashed; color=red;]";
        } else {
            edge_style = "";
        }

        if ($0 ~ /=/) {
            split($0, line, "=");
            print("  ", func_name, "->"line[2], edge_style";");
        } else {
            #print(func_name, "->"line[2])
            print("  ", func_name, "->", $0, edge_style";");
        }
    }

}

/^}/ {
    if (inside_function) {

        inside_function = 0;
        func_name = "";
    }
}

END {
    print("}");
}
