build:
    mkdir -p build
    CLASSPATH=/usr/share/clojure/libexec/clojure-tools-1.11.1.1165.jar:.:build java -Dclojure.compile.path=build clojure.lang.Compile t

clean:
    rm -rf build

run:
    CLASSPATH=/usr/share/clojure/libexec/clojure-tools-1.11.1.1165.jar:build java t

jar: build
    unzip -u /usr/share/clojure/libexec/clojure-tools-1.11.1.1165.jar -d build
    rm -rf build/cljs build/cognitect build/com build/javax build/licences build/META-INF build/mozilla build/org build/clojure/test build/clojure/tools build/clojure/repl build/about.html build/cognitect_aws_http.edn build/COPYRIGHT build/data_readers.clj build/LICENCE build/plugin.xml build/scratch.clj build/licences
    mkdir -p build/META-INF
    cp MANIFEST.MF build/META-INF
    cd build && jar -c --file=t.jar --main-class=t $(find . -name '*.class') clojure/version.properties

run-jar: jar
    java -jar build/t.jar "from a place without lein"
