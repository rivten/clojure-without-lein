build:
    mkdir -p build
    CLASSPATH=/usr/share/clojure/libexec/clojure-tools-1.11.1.1165.jar:.:build java -Dclojure.compile.path=build clojure.lang.Compile t

clean:
    rm -rf build

run:
    CLASSPATH=/usr/share/clojure/libexec/clojure-tools-1.11.1.1165.jar:build java t

jar: build
    unzip -u /usr/share/clojure/libexec/clojure-tools-1.11.1.1165.jar -d build
    mkdir -p build/META-INF
    cp MANIFEST.MF build/META-INF
    cd build && jar -c --file=t.jar --main-class=t *

run-jar: jar
    java -jar build/t.jar "from a place without lein"
